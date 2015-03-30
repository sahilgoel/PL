with text_io;
with ada.integer_text_io;
with quick;
use quick;
use text_io;
use ada.integer_text_io;

procedure assignment1 is
	
	a : arr;
	n: Integer :=30;
	flag : integer :=0;
	sum : integer :=0;
    type che is array(0..1000) of integer;
    chec : che := (others => 0);
procedure assignment1_2 is
	
	task print is
	entry P;
	end print;
    
	task sort is
	entry S;
	end sort;

	task adder is
	entry R;
	end adder;


	task body print is
	begin
	put("Initial array is");
	new_line;
	for i in 0..n-1 loop
	put(a(i),5);
	end loop;
	sort.S;
	accept P do
	new_line;
	new_line;
	put("Sorted array is ");
	new_line;
	for i in 0..n-1 loop
	put(a(i),5);
	end loop;
	end;

	accept P do
	new_line;
	new_line;
	put("Sum is ");
    put(sum);
    end;



	end;

	task body sort is
	begin
		accept S do
		quicksort(a,0,a'length-1);
		end;
		print.P;
		adder.R;
	end;

	task body adder is
	begin
	accept R do
        for i in 0..n-1 loop
		sum := sum + a(i);
        end loop;
    end;
    print.P;
    end;

begin
	return;
end;



begin
	
	for i in 0..n-1 loop
	get(a(i));
	

	if(chec(a(i))=1) then
	new_line;
	put("Sorry you have repeated one element, please enter distinct inputs next time");
	flag:=1;
	exit;
	else
	chec(a(i)):=1;
	end if;

	end loop;


    if(flag=0) then
	assignment1_2;
	end if;

    
end assignment1;
