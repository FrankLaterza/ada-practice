-- File: generic_queue.adb
package body Generic_Queue is
   function Create return Queue is
   begin
      return (others => <>);
   end Create;

   procedure Enqueue(Q : in out Queue; Element : in Element_Type) is
   begin
      if Q.Count = Max_Size then
         raise Queue_Full;
      end if;

      Q.Elements(Q.Rear) := Element;
      Q.Rear := Q.Rear + 1;
      if Q.Rear > Max_Size then
         Q.Rear := 1;
      end if;
      Q.Count := Q.Count + 1;
   end Enqueue;

   procedure Dequeue(Q : in out Queue; Element : out Element_Type) is
   begin
      if Q.Count = 0 then
         raise Queue_Empty;
      end if;

      Element := Q.Elements(Q.Front);
      Q.Front := Q.Front + 1;
      if Q.Front > Max_Size then
         Q.Front := 1;
      end if;
      Q.Count := Q.Count - 1;
   end Dequeue;

   function Is_Empty(Q : in Queue) return Boolean is
   begin
      return Q.Count = 0;
   end Is_Empty;

   function Is_Full(Q : in Queue) return Boolean is
   begin
      return Q.Count = Max_Size;
   end Is_Full;
end Generic_Queue;