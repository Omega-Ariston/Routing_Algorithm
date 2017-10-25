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
         Router_Table : array (1 .. Positive (Router_Range'Last), 1 .. Positive (Router_Range'Last)) of Natural := (others => (others => Natural (Router_Range'Last + 1)));
         My_Status : Router_Status;
         Temp_Status : Router_Status;
         Stored : array (1 .. Positive (Router_Range'Last)) of Boolean := (others => False);
      begin
         My_Status.Sender := Positive (Task_Id);
         Stored (Positive (Task_Id)) := True;
         for index in 1 .. Port_List'Length loop
            My_Status.Neighbour (index) := Positive (Port_List (index).Id);
         end loop;
         declare
            task type Send_Status is
               entry Send (index : Positive);
            end Send_Status;

            Flood : array (1 .. Port_List'Length) of Send_Status;
            task body Send_Status is
            begin
               declare
                  To : Positive;
               begin
                  accept Send (index : Positive) do
                     To := index;
                     if index < Port_List'Length then
                        Flood (index + 1).Send (index + 1);
                     end if;
                  end Send;
                  Port_List (To).Link.all.Send_Status.Send (My_Status);
               end;
            end Send_Status;
         begin
            Flood (1).Send (1);
            loop
               accept Receive_Status (Status : Router_Status) do
                  Temp_Status := Status;
               end Receive_Status;
               if Stored (Temp_Status.Sender) = False then
                  if (Integer (Task_Id)) = 1 then
                     Put_Line ("test");
                  end if;
                  for index in 1 .. Temp_Status.Neighbour'Length loop
                     if Temp_Status.Neighbour (index) /= 0 then
                        Router_Table (Temp_Status.Sender, Temp_Status.Neighbour (index)) := 1;
                     end if;
                  end loop;
                  Stored (Temp_Status.Sender) := True;
                  declare
                     task type Resend_Status is
                        entry Send (index : Positive);
                     end Resend_Status;

                     Flood2 : array (1 .. Port_List'Length) of Resend_Status;
                     task body Resend_Status is
                     begin
                        declare
                           To : Positive;
                        begin
                           accept Send (index : Positive) do
                              To := index;
                              if index < Port_List'Length then
                                 Flood2 (index + 1).Send (index + 1);
                              end if;
                           end Send;
                           Port_List (To).Link.all.Receive_Status (Temp_Status);
                        end;
                     end Resend_Status;
                  begin
                     Flood2 (1).Send (1);
                     if Integer (Task_Id) = 1 then
                        for i in 1 .. Router_Table'Length (1) loop
                           Put (Integer'Image (i));
                           for j in 1 .. Router_Table'Length (2) loop
                              Put (Integer'Image (Router_Table (i, j)));
                           end loop;
                           New_Line;
                        end loop;
                     end if;
                  end;
               end if;
            end loop;
         end;
      end;

   exception
      when Exception_Id : others => Show_Exception (Exception_Id);
   end Router_Task;

end Generic_Router;
