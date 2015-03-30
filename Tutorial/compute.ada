with Ada.Text_IO,Ada.Integer_Text_IO;
use Ada.Text_IO,Ada.Integer_Text_IO;

procedure F is
task one;
task body one is
X: integer :=6;
begin
for i in 1..10 loop
put(X+i);
end loop;
end one;

begin 
for J in 90..99 loop
put(J);
end loop;

end;