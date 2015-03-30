with text_io;
use text_io;
procedure hello is

task foo;
task body foo is
begin
New_Line;
Put("In foo");
New_Line;
end foo;

begin 

put("Hello World");
New_Line;

end hello;