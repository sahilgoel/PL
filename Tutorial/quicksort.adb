with ada.text_io;
use ada.text_io;
with ada.integer_text_io;
use ada.integer_text_io;

package body quick is


 function partition(a: in out arr ; l : in integer ; n : in integer) return integer;

function partition(a: in out arr ; l : in integer ; n : in integer ) return integer is
med : integer;
	i,j,part : integer;
	flag : integer;
	temp,medindex : integer;
	
begin


	
	if(l=n-1) then
	return -1;
	end if;


	if((a(l)<=a(n-1) and a(l)>=a((n-l)/2)) or (a(l)>=a(n-1) and a(l)<=a((n-l)/2))) then
	med:=a(l);
	medindex:=l;
	end if;
	
	if((a(n-1)<=a(l) and a(n-1)>=a((n-l)/2)) or (a(n-1)<=a((n-l)/2) and a(n-1)>=a(l))) then
	med:=a(n-1);
	medindex:=n-1;
	flag:=1;
	end if;
	
	if((a((n-l)/2)<=a(l) and a((n-l)/2)>=a(n-1)) or (a((n-l)/2)>=a(l) and a((n-l)/2)<=a(n-1))) then
    med:=a((n-l)/2);
    medindex:=(n-l)/2;
	end if;

	if(l=n-2) then
		
		if(a(l)<a(n-1)) then
		med:=a(l);
		medindex:=l;
		else
		med:=a(n-1);
		medindex:=n-1;
		end if;

	end if;

	i := l;
	j := n-1;
	
	while(i<j) loop
			while(a(i)<=med) loop
				i:=i+1;
			end loop;
			while(a(j)>med) loop
				j:=j-1;
			end loop;
			
			--new_line;
			if(i<j) then

				if(a(i)=med) then
				medindex:=j;
				end if;
				if(a(j)=med) then
				medindex:=i;
				end if;

			temp:=a(i);
			a(i):=a(j);
			a(j):=temp;
			end if;
            

			--new_line;
	end loop ;

	part:=i-1;
	new_line;

	
return part;

end partition;





 procedure quicksort(a : in out arr ; l : in integer ; n : in integer) is
  p : integer;
  i : integer;

procedure quicksort_2(a : in out arr; l : in integer ; n : in integer) is
			
			begin
			put("in procedure 2");
			end;



  begin
    p := partition(a,l,n);
    new_line;
     
	if(p>l and p>=0) then


	new_line;
	
    quicksort(a,l,p+1);
    new_line;
    end if;


    if(n>p+2 and p>=0) then

  

    quicksort(a,p+1,n);
    new_line;
    end if;

    return;
  end;


 
end quick;
