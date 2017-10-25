--
--  Framework: Uwe R. Zimmer, Australia, 2015
--

with Exceptions; use Exceptions;

package body Generic_Router is

   task body Router_Task is

      Connected_Routers : Ids_To_Links;

   begin
      accept Configure (Links : Ids_To_Links) do
         Connected_Routers := Links;
      end Configure;

      declare
         Port_List : constant Connected_Router_Ports := To_Router_Ports (Task_Id, Connected_Routers);
      begin

         --  Replace the following accept with the code of your router
         -- (and place this accept somewhere more apporpriate)

         accept Shutdown;
      end;

   exception
      when Exception_Id : others => Show_Exception (Exception_Id);
   end Router_Task;

end Generic_Router;
