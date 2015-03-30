with text_io;
with stack;
with ada.integer_text_io;

  use text_io;
  use ada.integer_text_io;
  use stack;

procedure main is



  x,y,z:integer;

begin
  put("Enter number of pushes > ");
  get(x);
  put("Enter number of pops > ");
  get(y);
  for i in 1..x loop
    push(i);
  end loop;
  for i in 1..y loop
    z := pop;
    put(z);
    new_line;
  end loop;
exception
   when stack_overflow =>
        put("Stack has overflowed"); new_line;
   when stack_underflow =>
        put("Stack has underflowed"); new_line;
end main;
