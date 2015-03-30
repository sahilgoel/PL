  with Ada.Text_IO,Ada.Integer_Text_IO;
   use Ada.Text_IO,Ada.Integer_Text_IO;

procedure OneInt is
 Index : INTEGER;

begin

Index := 23;
Put("Value of index is");
Put(Index);
New_Line;

Index := Index+23;

Put("Value of index is");
Put(Index);

end OneInt;



-- Result of execution

-- Good form can aid in understanding a program,
-- and bad form can make a program unreadable.

