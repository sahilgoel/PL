with text_io;
with ada.integer_text_io;
with quick;
use quick;
use text_io;
use ada.integer_text_io;

procedure assignmentmain is
n:integer:=6;
a: arr;

task print is
entry P ;

end print;

task sort is
entry S;
end sort;

task sum is
entry SU;
end sum;


task body print is
	
	begin
		accept P do
		for i in 0..n-1 loop
		put(a(i));
		put(" ");
		end loop;
		sort.S;
		new_line;

		for i in 0..n-1 loop
		put(a(i));
		put(" ");
		end loop;
		
		new_line;
		put("Next step: SUM");
		new_line;
		sum.SU;
		new_line;
		new_line;
		
		end;
        
		
	end print;

task body sort is
	
	begin
		accept S do
		quicksort(a,0,a'length);
		end;
end sort;


task body sum is
	sums : integer :=0;
	isum : integer :=0;
	begin
		accept SU do
    		for isum in 0..a'length - 1 loop
    		sums:=sums+a(isum);
    		end loop;
  		put("sum is "); put(sums); new_line;
  		end;

		
end sum;




begin
	
	for i in 0..n-1 loop
	get(a(i));
	end loop;
	print.P;

    
end assignmentmain;
