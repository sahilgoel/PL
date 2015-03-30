with ada.text_io;
use ada.text_io;
with ada.integer_text_io;
use ada.integer_text_io;

package body quick is


function partition(a: in out arr ; l : in integer ; n : in integer) return integer;

function partition(a: in out arr ; l : in integer ; n : in integer ) return integer is
	med : integer;
	i,j,part : integer;
	temp : integer;
	
begin


	
	if(l=n) then
	return -1;
	end if;


	if((a(l)<=a(n) and a(l)>=a((n-l)/2)) or (a(l)>=a(n) and a(l)<=a((n-l)/2))) then
	med:=a(l);
	end if;
	
	if((a(n)<=a(l) and a(n)>=a((n-l)/2)) or (a(n)<=a((n-l)/2) and a(n)>=a(l))) then
	med:=a(n);
	end if;
	
	if((a((n-l)/2)<=a(l) and a((n-l)/2)>=a(n)) or (a((n-l)/2)>=a(l) and a((n-l)/2)<=a(n))) then
    med:=a((n-l)/2);
	end if;

	if(l=n-1) then
		
		if(a(l)<a(n-1)) then
		med:=a(l);
		else
		med:=a(n-1);
		end if;
	end if;

	i := l;
	j := n;
	
	while(i<j) loop
			while(a(i)<med) loop
				i:=i+1;
			end loop;
			while(a(j)>med) loop
				j:=j-1;
			end loop;
			
			--new_line;
			if(i<j) then

			temp:=a(i);
			a(i):=a(j);
			a(j):=temp;
			end if;
            
			
			--new_line;
	end loop ;

	part:=j;
return part;
end partition;



 procedure quicksort(a : in out arr ; l : in integer ; n : in integer) is
  p : integer;

--------------------------------------------------------------------------------------------------------
procedure quicksort_2(a : in out arr; l : in integer ; n : in integer ; p : in integer) is				--|	
																										--|
			task one;																					--|
			task two;																					--|
																										--|
			task body one is																			--|
			begin																						--|
			if(p>l and p>=0) then																		--|
			quicksort(a,l,p-1);																			--|
			end if;																						--|
			end;																						--|
																										--|
			task body two is																			--|
			begin																						--|	
			if(n>p+1 and p>=0) then																		--|	
			quicksort(a,p+1,n);																			--|
			end if;																						--|
			end;																						--|
																										--|
																										--|
																										--|
			begin																						--|
    		return;																						--|
			end quicksort_2;																			--|
																										--|
---------------------------------------------------------------------------------------------------------
  begin
    p := partition(a,l,n);
    quicksort_2(a, l, n ,p);
  end quicksort;

end quick;
