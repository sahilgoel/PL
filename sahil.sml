Control.Print.printDepth := 100;
Control.Print.printLength := 100;

fun partition1 x [] l1 = l1
 | partition1 x (y::ys) l1  = if (y<x) then (partition1 x (ys) (y::l1)) else partition1 (x) (ys) l1 ;

fun partition2 x [] l1 = l1
 | partition2 x (y::ys) l1  = if (y>=x) then (partition2 x (ys) (y::l1)) else partition2 (x) (ys) l1 ;

fun intPartitionSort [] = []  | intPartitionSort (x::xs) = if xs=[] then x::[] else (intPartitionSort (partition1 x xs [])) @ ((x::[]) @ (intPartitionSort (partition2 x xs [])));

datatype 'a tree = leaf of 'a
| node of 'a tree list;


fun partition1g (op <) x [] l1 = l1
 | partition1g (op <) x (y::ys) l1  = if y < x then (partition1g (op <) x (ys) (y::l1)) else (partition1g (op <) x ys l1) ;


fun partition2g (op <) x [] l1 = l1
 | partition2g (op <) x (y::ys) l1  = if not(y < x) then (partition2g (op <) x (ys) (y::l1)) else (partition2g (op <) x ys l1) ;

 fun partitionSort (op <) [] = []
| partitionSort (op <) (x::xs) = if xs=[] then x::[] else (partitionSort (op <) (partition1g (op <) x xs [])) @ ((x::[]) @ (partitionSort (op <) (partition2g (op <) x xs [])));


fun sortTree (op <) (leaf l) = leaf (partitionSort (op <) l)
 | sortTree (op <) (node l) = node (map (sortTree (op <)) l);

 fun merge (op <) l1 [] = l1
 | merge (op <) [] l2 = l2
 | merge (op <) (x::xs) (y::ys) = if (x<y) then (x::(merge (op <) xs (y::ys))) else (y ::(merge (op <) (x::xs) ys));

(*fun myfold (op <) [] =[]
 | myfold (op <) (x::xs) = (merge (op <)) x (myfold (op <) xs);

 fun mergeTree (op <) (leaf l) = partitionSort (op <) l
 |   mergeTree (op <) (node l) =  (myfold (op <) (map (mergeTree (op <)) l));
*)

 (*
fun mergeTree (op <) (leaf l) = partitionSort (op <) l
 |   mergeTree (op <) (node l) =  (foldr (fn (a,b) => merge (op <) a b) [] (map (mergeTree (op <)) l));
*)

fun conv (leaf l) = l;

 fun mergeTree (op <) (leaf l) = conv (sortTree (op <) (leaf l))
 |   mergeTree (op <) (node l) =  (foldr (fn (a,b) => merge (op <) a b) [] (map (mergeTree (op <)) l));




 
