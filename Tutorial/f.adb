with Ada.Text_IO,Ada.Integer_Text_IO;
use Ada.Text_IO,Ada.Integer_Text_IO;

Procedure F is
task One is
	Entry E;
end One;
	task body One is
	X: integer:=6;
	begin
	for I in 1..10 loop
		accept E do
		put(x+I);
		put(2*x+I);
		end;
	end loop;
	end one;

	begin
	for j in 90..100 loop
	One.E;
		put(J);
	end loop;
end F;


