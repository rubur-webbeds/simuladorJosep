package body dqueue_pointers is

   procedure empty(q: out queue) is
   begin
      
      q.first := null; q.last := null;
      
   end empty;
   
   procedure add(q: in out queue; x: in elem) is
      
      new_cell: cell;
      
   begin
      
      new_cell = new cell'(x, null);
      
      q.last.next := new_cell;
      q.last := new_cell;
      
   end add;
   
   procedure delete_first(q: in out queue) is
   begin
      
      q.first := q.first.next;
      
   end delete_first;
   
   function get_first(q: in queue) return elem is
   begin
      
      return q.first.e;
      
   end get_first;
   
   function is_empty(q: in queue) return boolean is
   begin
      return null;
   end is_empty;
   
   
end dqueue_pointers;
