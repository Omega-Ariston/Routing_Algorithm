--
--  Framework: Uwe R. Zimmer, Australia, 2015
--

with Exceptions; use Exceptions;
with Ada.Containers.Multiway_Trees;
with Ada.Text_IO; use Ada.Text_IO;
-- with Ada.Task_Identification; use Ada.Task_Identification;
with Ada.Real_Time; use Ada.Real_Time;

package body Generic_Router is

   task body Router_Task is

      Connected_Routers : Ids_To_Links;

   begin
      accept Configure (Links : Ids_To_Links) do
         Connected_Routers := Links;
      end Configure;

      declare
         Port_List : constant Connected_Router_Ports := To_Router_Ports (Task_Id, Connected_Routers);
         My_Status : Router_Status;
         Id : constant Positive := Positive (Task_Id);
         Modifyer : Natural := 1;
         Temp_Status : Router_Status;
         Now : constant Time := Clock;
         Stored : array (1 .. Positive (Router_Range'Last)) of Boolean := (others => False);
         Already_Have : Natural := 1;
         package Trees is new Ada.Containers.Multiway_Trees (Positive); use Trees;
         Local_Tree : Trees.Tree;
         Pointer : Trees.Cursor := Local_Tree.Root;
      begin
         My_Status.Md (Modifyer) := Id;
         Modifyer := Modifyer + 1;
         Stored (Id) := True;
         for index in 1 .. Port_List'Length loop
            My_Status.Tb (Id, Positive (Port_List (index).Id)) := 1;
         end loop;
         declare
            task type Send_Status is
               entry Send (index : Positive);
            end Send_Status;

            task body Send_Status is
            begin
               declare
                  To : Positive;
               begin
                  accept Send (index : Positive) do
                     To := index;
                  end Send;
                  Port_List (To).Link.all.Receive_Status (My_Status);
               end;
            end Send_Status;

         begin
            loop
               declare
               begin
                  select
                     accept Send_Message (Message : in Messages_Client) do
                        Put_Line ("Task:" & Integer'Image (Id) & Duration'Image (To_Duration (Clock - Now)));
                     end Send_Message;
                  or
                     delay 0.0025;
                  end select;
                  select
                     accept Shutdown  do
                        null;
                     end Shutdown;
                  declare
                     Send_Flood : array (1 .. Port_List'Length) of Send_Status;
                  begin
                     for i in 1 .. Send_Flood'Length loop
                        Send_Flood (i).Send (i);
                     end loop;

                     for i in 1 .. Port_List'Length loop
                        accept Receive_Status (Status : Router_Status) do
                           Temp_Status := Status;
                        end Receive_Status;
                        for j in 1 .. Temp_Status.Md'Length loop
                           exit when Temp_Status.Md (j) = 0;
                           if Stored (Temp_Status.Md (j)) = False then
                              My_Status.Md (Modifyer) := Temp_Status.Md (j);
                              Modifyer := Modifyer + 1;
                              for index in 1 .. My_Status.Tb'Length (2) loop
                                 My_Status.Tb (Temp_Status.Md (j), index) := Temp_Status.Tb (Temp_Status.Md (j), index);
                              end loop;
                              Stored (Temp_Status.Md (j)) := True;
                              Already_Have := Already_Have + 1;
                           end if;
                        end loop;
                        ----------------------------------------------------
                        if Already_Have = Positive (Router_Range'Last)
                          and then Integer (Child_Count (Local_Tree.Root)) = 0
                        then
                           declare
                              work_queue : array (1 .. Positive (Router_Range'Last)) of Natural := (others => 0);
                              work_index : Positive := 1;
                              temp_index : Positive := work_index + 1;
                           begin
                              work_queue (1) := Id;
                              Local_Tree.Append_Child (Pointer, Id);
                              loop
                                 Pointer := Find (Local_Tree, work_queue (work_index));
                                 loop
                                    for i in 1 .. Positive (Router_Range'Last) loop
                                       if My_Status.Tb (work_queue (work_index), i) = 1
                                         and then Contains (Local_Tree, i) = False
                                       then
                                          Local_Tree.Append_Child (Pointer, i);
                                          work_queue (temp_index) := i;
                                          temp_index := temp_index + 1;
                                       end if;
                                    end loop;
                                    work_index := work_index + 1;
                                    exit when Has_Element (Next_Sibling (Pointer)) = False;
                                    Pointer := Next_Sibling (Pointer);
                                 end loop;
                                 exit when work_index > work_queue'Length;
                              end loop;
                              Pointer := First_Child (Local_Tree.Root);
                           end;
                        end if;
                        -----------------------------------------------------
                     end loop;
                  end;
               end;
            end loop;
         end;
      end;

   exception
      when Exception_Id : others => Show_Exception (Exception_Id);
   end Router_Task;

end Generic_Router;
