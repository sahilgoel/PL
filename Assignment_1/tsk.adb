with text_io;
with ada.integer_text_io;
use text_io;
use ada.integer_text_io;

procedure tsk is

task one is
	entry O;
end one;

task two is
	entry T;
end two;

task body one is
	begin
	
	accept O do
	new_line;
	put("ONE");
	two.T; 
	end;
	
end;

task body two is
	begin
	
	accept T do
	new_line;
	put("TWO");
	tsk; 
	end;
	
end;

begin
	one.O;
end;


