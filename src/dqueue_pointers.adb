package body dqueue_pointers is

   procedure empty(q: out queue) is
   begin
      
      q.first := q.last := null;
      
   end empty;
   
   procedure add(q: in out queue; x: in elem) is
   begin
      
   end add;
   
   
end dqueue_pointers;
