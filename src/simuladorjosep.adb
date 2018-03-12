with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Simuladorjosep is

   passades: Positive;

   procedure llegirInt(pass: out Positive) is
   begin

      pass := Integer'Value(Get_Line);

   end llegirInt;

begin

   Put("Passades: ");
   llegirInt(passades);

exception
   when Constraint_Error => Put_Line("'Passades' must be greater than 0");

end Simuladorjosep;

