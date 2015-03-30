package quick is
 subtype nrange is integer range 0..1000;
 type arr is array (0..30) of nrange;
 procedure quicksort(a: in out arr);
 
end quick;
