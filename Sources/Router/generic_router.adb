--
--  Framework: Uwe R. Zimmer, Australia, 2015
--

with Exceptions; use Exceptions;
with Ada.Text_IO; use Ada.Text_IO;
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
         Modifyer : Natural := 1;
         Temp_Status : Router_Status;
         Stored : array (1 .. Positive (Router_Range'Last)) of Boolean := (others => False);
         Already_Have : Natural := 1;
      begin
         My_Status.Md (Modifyer) := Natural (Task_Id);
         Modifyer := Modifyer + 1;
         Stored (Positive (Task_Id)) := True;
         for index in 1 .. Port_List'Length loop
            My_Status.Tb (Positive (Task_Id), Positive (Port_List (index).Id)) := 1;
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
                  Send_Flood : array (1 .. Port_List'Length) of Send_Status;
               begin
                  if Already_Have = Positive (Router_Range'Last) then
                     Already_Have := Already_Have + 1;
                  end if;
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
                     if Already_Have = Positive (Router_Range'Last)
                     then
                        begin
                           if Task_Id = 1 then
                              for i in 1 .. My_Status.Tb'Length (1) loop
                                 Put (Integer'Image (i));
                                 for j in 1 .. My_Status.Tb'Length (2) loop
                                    Put (Integer'Image (My_Status.Tb (i, j)));
                                 end loop;
                                 New_Line;
                              end loop;
                              New_Line;
                           end if;
                        end;
                     end if;
                  end loop;
               end;
            end loop;
         end;
      end;

   exception
      when Exception_Id : others => Show_Exception (Exception_Id);
   end Router_Task;

end Generic_Router;
