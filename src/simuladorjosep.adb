with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with dqueue_pointers;

procedure Simuladorjosep is

   --We will operate with players
   type Player is record
      Name: Unbounded_String;
   end record;

   package PlayersQueue is new dqueue_pointers(elem => Player); use PlayersQueue;

   passades: Positive;
   pla_file: File_Type;
   pla_queue: queue;

   --READ A POSITIVE FROM KEYBOARD
   procedure readInt(pass: out Positive) is
   begin
      pass := Integer'Value(Get_Line);

   exception
      when Constraint_Error => Put_Line("'Passades' must be greater than 0");
   end readInt;

   --CREATES A QUEUE FROM A TEXT FILE THAT CONTAINS PLAYERS
   procedure createQueueFromFile(q: out queue; file: in File_Type) is
      new_player: Player;
   begin
      empty(q);
      while not End_Of_File(file) loop
         Get_Line(file, new_player.Name);
         add(q, new_player);
      end loop;
   end createQueueFromFile;

   --LET'S PLAY ;)
   procedure murderPlayers(q: in out queue; passades: in Positive) is
   begin
      null;
   end murderPlayers;

begin

   Open(pla_file, In_File, "Jugadors.txt");

   Put("Passades: ");
   readInt(passades);

   createQueueFromFile(pla_queue, pla_file);

   murderPlayers(pla_queue, passades);

end Simuladorjosep;

