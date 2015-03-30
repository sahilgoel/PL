with ada.text_io;
use ada.text_io;
with ada.integer_text_io;
use ada.integer_text_io;

package body quick is
 

task qsort is
	entry Q (a : in out arr ; n : in integer ; l : in integer);
	end qsort;

task body qsort is
	med : integer;
	i,j : integer;
	flag : integer;
	temp,medindex : integer;
	an : arr ;
	nn : integer ;
	ln : integer;
	
	

	begin
	flag:=0;
	accept Q (a : in out arr ; n: in integer ; l : in integer) do
	
	an :=a;
	nn := n;
	ln := l;
	
	--calculating median--------------------------------------------------------------------------

	new_line;
	if(l=n) then
	return;
	end if;


	if((a(l)<=a(n-1) and a(l)>=a((n-1)/2)) or (a(l)>=a(n-1) and a(l)<=a((n-1)/2))) then
	med:=a(l);
	medindex:=l;
	end if;
	
	if((a(n-1)<=a(l) and a(n-1)>=a((n-1)/2)) or (a(n-1)<=a((n-1)/2) and a(n-1)>=a(l))) then
	med:=a(n-1);
	medindex:=n-1;
	flag:=1;
	end if;
	
	if((a((n-1)/2)<=a(l) and a((n-1)/2)>=a(n-1)) or (a((n-1)/2)>=a(l) and a((n-1)/2)<=a(n-1))) then
    med:=a((n-1)/2);
    medindex:=(n-1)/2;
	end if;

	if(l=n-1) then
		
		if(a(l)<a(n-1)) then
		med:=a(l);
		medindex:=l;
		else
		med:=a(n-1);
		medindex:=n-1;
		end if;

	end if;
	put(med);
	new_line;

	-- median is now stored in med------------------------------------------------------------------
	new_line;
	i := l;
	j := n-1;
	while(i<j) loop
			while(a(i)<med) loop
				i:=i+1;
			end loop;
			while(a(j)>med) loop
				j:=j-1;
			end loop;
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
			i:=i+1;
			j:=j-1;
			end if;
            
			for k in 0..n-1 loop
				put(a(k));
				put(" ");
			end loop;

			new_line;
	end loop ;
	temp:=a(i-flag);
	a(i-flag):=a(medindex);
	a(medindex):=temp;

	for k in 0..n-1 loop
				put(a(k));
				put(" ");
	end loop;
	
	
	new_line;
	qsort.Q(an,i-flag,ln);
	qsort.Q(an,nn,i-flag+1);
	end ;

	
end qsort;

 procedure quicksort(a : in out arr) is
  begin
    new_line;
    --put(a'length);
    new_line;
    qsort.Q(a => a, n=>a'length, l => 0);

  end;
end quick;
