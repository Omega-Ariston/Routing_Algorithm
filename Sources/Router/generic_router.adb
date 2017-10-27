--
--  Framework: Uwe R. Zimmer, Australia, 2015
--

with Exceptions; use Exceptions;
with Ada.Containers.Multiway_Trees;
-- with Ada.Text_IO; use Ada.Text_IO;
-- with Ada.Task_Identification; use Ada.Task_Identification;
-- with Ada.Real_Time; use Ada.Real_Time;

package body Generic_Router is

   task body Router_Task is

      Connected_Routers : Ids_To_Links;

   begin
      accept Configure (Links : Ids_To_Links) do
         Connected_Routers := Links;
      end Configure;
      declare
         Port_List : constant Connected_Router_Ports := To_Router_Ports (Task_Id, Connected_Routers);
         My_Status : Heart_Beat;
         Id : constant Positive := Positive (Task_Id);
         Modifyer : Natural := 1;
         Stored : array (1 .. Positive (Router_Range'Last)) of Boolean := (others => False);
         Already_Have : Natural := 1;
         package Trees is new Ada.Containers.Multiway_Trees (Positive); use Trees;
         Local_Tree : Trees.Tree;
         Pointer : Trees.Cursor := Local_Tree.Root;
         Mail : Messages_Mailbox;
         Packets : array (1 .. Port_List'Length) of Heart_Beat;
         Received : array (1 .. Port_List'Length) of Boolean := (others => False);
         Sent : array (1 .. Port_List'Length) of Boolean := (others => False);
         Go : Boolean;
      begin
         -----------------------------------------------------------------------
         My_Status.Md (Modifyer) := Id;
         Modifyer := Modifyer + 1;
         Stored (Id) := True;
         for index in 1 .. Port_List'Length loop
            My_Status.Tb (Id, Positive (Port_List (index).Id)) := 1;
         end loop;
         for index in 1 .. Port_List'Length loop
            Packets (index).Md := My_Status.Md;
            Packets (index).Tb := My_Status.Tb;
         end loop;
         declare
            task type Send_Status is
               entry Send (index : Positive);
            end Send_Status;
            task body Send_Status is
               To : Positive;
            begin
               accept Send (index : Positive) do
                  To := index;
                  Packets (index).Md := My_Status.Md;
                  Packets (index).Tb := My_Status.Tb;
                  Packets (index).Last := Router_Range (Id);
               end Send;
               Port_List (To).Link.all.Receive_Packet (Packets (To));
               Packets (To).Courier := False;
               Sent (To) := True;
               --   if Packets (To).Courier then
               --    Put_Line ("Number" & Integer'Image (Id) & " Sent to" & Integer'Image (Integer (Port_List (To).Id)) & " for" & Integer'Image (Integer (Packets (To).Origin)) & " To" & Integer'Image (Integer (Packets (To).Destination)));
               -- end if;
            end Send_Status;

         begin
            loop
               exit when Shutdown'Count > 0;
               begin
                  Sent := (others => False);
                  ------------------------------------------------------------
                  declare
                     task Sending;
                     task body Sending is
                        New_Send_Packets : array (1 .. Port_List'Length) of Send_Status;
                     begin
                        for i in 1 .. New_Send_Packets'Length loop
                           New_Send_Packets (i).Send (i);
                        end loop;
                     end Sending;
                     ------------------------------------------------------------
                  begin
                     if Send_Message'Count > 0 then
                        accept Send_Message (Message : in Messages_Client) do
                           Pointer := Find (Local_Tree, Integer (Message.Destination));
                           loop
                              exit when Element (Parent (Pointer)) = Id;
                              Pointer := Parent (Pointer);
                           end loop;
                           for i in 1 .. Port_List'Length loop
                              Packets (i).Hop_Counter := 0;
                              if Port_List (i).Id = Router_Range (Element (Pointer)) then
                                 Packets (i).Next := Router_Range (Element (Pointer));
                                 Packets (i).Origin := Router_Range (Id);
                                 Packets (i).The_Message := Message.The_Message;
                                 Packets (i).Destination := Message.Destination;
                                 Packets (i).Courier := True;
                              end if;
                           end loop;
                        end Send_Message;
                     end if;
                     --------------------------------------------------------------------
                     if Receive_Message'Count > 0 then
                        begin
                           accept Receive_Message (Message : out Messages_Mailbox) do
                              Message.Sender := Mail.Sender;
                              Message.The_Message := Mail.The_Message;
                              Message.Hop_Counter := Mail.Hop_Counter;
                --              Put_Line ("Number" & Integer'Image (Id) & " Received from" & Integer'Image (Integer (Mail.Sender)) & " Hop:" & Integer'Image (Mail.Hop_Counter));
                           end Receive_Message;
                        exception
                           when Exception_Id : others => Show_Exception (Exception_Id);
                  --            Put_Line ("Error" & Positive'Image (Id));
                        end;
                     end if;
                     -------------------------------------------------------
                     Received := (others => False);
                     loop
                        Go := True;
                        for i in 1 .. Received'Length loop
                           if Received (i) = False then
                              Go := False;
                           end if;
                        end loop;
                        exit when Go;
                        accept Receive_Packet (Packet : Heart_Beat) do
                           for i in 1 .. Port_List'Length loop
                              if Port_List (i).Id = Packet.Last then
                                 if Received (i) then
                                    requeue Receive_Packet;
                                 else
                                    Received (i) := True;
                                 end if;
                              end if;
                           end loop;
                           if Packet.Courier then
                              if Positive (Packet.Destination) = Id then
                                 Mail.Sender := Packet.Origin;
                                 Mail.The_Message := Packet.The_Message;
                                 Mail.Hop_Counter := Packet.Hop_Counter + 1;
                              else
                --                 Put_Line ("Number" & Integer'Image (Id) & " Transfering for" & Integer'Image (Integer (Packet.Origin)) & " To" & Integer'Image (Integer (Packet.Destination)));
                                 Pointer := Find (Local_Tree, Integer (Packet.Destination));
                                 loop
                                    exit when Element (Parent (Pointer)) = Id;
                                    Pointer := Parent (Pointer);
                                 end loop;
                                 for i in 1 .. Port_List'Length loop
                                    if Port_List (i).Id = Router_Range (Element (Pointer)) then
                                       loop
                                          exit when Sent (i);
                                       end loop;
                                       Packets (i).Next := Router_Range (Element (Pointer));
                                       Packets (i).Origin := Packet.Origin;
                                       Packets (i).The_Message := Packet.The_Message;
                                       Packets (i).Destination := Packet.Destination;
                                       Packets (i).Hop_Counter := Packet.Hop_Counter + 1;
                                       Packets (i).Courier := True;
                                    end if;
                                 end loop;
                              end if;
                           end if;
                           ------------------------------------------------------
                           for j in 1 .. Packet.Md'Length loop
                              exit when Packet.Md (j) = 0;
                              if Stored (Packet.Md (j)) = False then
                                 My_Status.Md (Modifyer) := Packet.Md (j);
                                 Modifyer := Modifyer + 1;
                                 for index in 1 .. My_Status.Tb'Length (2) loop
                                    My_Status.Tb (Packet.Md (j), index) := Packet.Tb (Packet.Md (j), index);
                                 end loop;
                                 Stored (Packet.Md (j)) := True;
                                 Already_Have := Already_Have + 1;
                              end if;
                           end loop;

                           for i in 1 .. Port_List'Length loop
                              Packets (i).Md := My_Status.Md;
                              Packets (i).Tb := My_Status.Tb;
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
                        end Receive_Packet;
                        -----------------------------------------------------
                     end loop;
                     --      Put_Line (Positive'Image (Id) & " age is" & Natural'Image (My_Status.Age) & " gained");
                  end;
               end;
            end loop;
            accept Shutdown;
         end;
      end;

   exception
      when Exception_Id : others => Show_Exception (Exception_Id);
   end Router_Task;

end Generic_Router;
