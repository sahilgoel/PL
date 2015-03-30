with Ada.Text_IO,Ada.Integer_Text_IO;
use Ada.Text_IO,Ada.Integer_Text_IO;

procedure Sumf is

C : Integer := 4;
D : Integer := 5;

function Sum(A,B : in out Integer) return Integer is
Total : Integer := A;
begin
Total := Total + B;
A:=A+10;
B:=B+1;
return Total;
end Sum;

begin
put(Sum(C,D));
Put(C);
Put(D);
end;