-- File: generic_queue.ads
generic
   type Element_Type is private;
   Max_Size : in Positive;
package Generic_Queue is
   Queue_Full : exception;
   Queue_Empty : exception;

   type Queue_Array is array (1 .. Max_Size) of Element_Type;

   type Queue is record
      Elements : Queue_Array;
      Front    : Integer := 1;
      Rear     : Integer := 1;
      Count    : Integer := 0;
   end record;

   function Create return Queue;

   procedure Enqueue(Q : in out Queue; Element : in Element_Type);

   procedure Dequeue(Q : in out Queue; Element : out Element_Type);

   function Is_Empty(Q : in Queue) return Boolean;

   function Is_Full(Q : in Queue) return Boolean;
end Generic_Queue;