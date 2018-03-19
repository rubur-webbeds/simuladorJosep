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
   winner: Player;

   -------PRIVATE METHODS---------

   --READ A POSITIVE INTEGER FROM KEYBOARD
   procedure readInt(pass: out Positive) is
   begin

      pass := Integer'Value(Get_Line);

   end readInt;

   --CREATES A QUEUE FROM A TEXT FILE THAT CONTAINS PLAYER NAMES
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
   procedure murderPlayers(q: in out queue; passades: in Positive; winner: out Player) is

      i: Natural := 0;
      pla: Player;

   begin

      while not is_last_item(q) and i <= passades loop
         pla := get_first(q);
         add(q, pla);
         delete_first(q);
         i := i + 1;
      end loop;

      winner := get_first(q);

   end murderPlayers;

   ---------MAIN----------

begin

   Open(pla_file, In_File, "Jugadors.txt");
   createQueueFromFile(pla_queue, pla_file);

   Put("Passades: ");
   readInt(passades);

   murderPlayers(pla_queue, passades, winner);

   Put_Line("Guanyador/a: " & winner.Name);

exception

   when Constraint_Error => Put_Line("'Passades' must be greater than 0");
   when overflow => Put_Line("ERROR: MAIN MEMORY OVERFLOW");
   when bad_use => Put_Line("QUEUE 'q' IT'S EMPTY");

end Simuladorjosep;

