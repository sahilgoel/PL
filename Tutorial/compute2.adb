with Ada.Text_IO,Ada.Integer_Text_IO;
use Ada.Text_IO,Ada.Integer_Text_IO;

procedure F is
task one is
entry E;
end one;

task body one is
X: integer :=6;
begin
for i in 1..10 loop
accept E do
put(X+i);
put(X+i+20);
end;
end loop;
end one;

begin 
for J in 90..99 loop
one.E;
put(J);
end loop;

end;