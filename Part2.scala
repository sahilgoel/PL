class OInt(n : Int) extends Ordered[OInt] {
  var x: Int = n;
  def compare(that: OInt):Int = if (this.x < that.x) return -1 else if (this.x==that.x) return 0 else return 1;
  override def toString = x + ""; 
}
abstract class OTree[T <: Ordered[T]] extends Ordered[OTree[T]] 
case class ONode[T <: Ordered[T]](l1: List[OTree[T]]) extends OTree[T] {
def compare(obj: OTree[T]):Int  = 
obj match {
case ONode(l2 : List[OTree[T]]) => if ((l1.head).compare(l2.head) == 0) { if (l1.tail.isEmpty && l2.tail.isEmpty) return 0 else if (l1.tail.isEmpty && !l2.tail.isEmpty) return -1 else if (!l1.tail.isEmpty && l2.tail.isEmpty) return 1 else return ONode(l1.tail).compare(ONode(l2.tail)) } else return (l1.head).compare(l2.head) ;
case _ => 1;
}
}
case class OLeaf[T <: Ordered[T]](v:T) extends OTree[T] { def compare(obj: OTree[T]):Int = 
obj match {
case OLeaf(other_v) => v.compare(other_v);
case ONode(other) => -1;
case _ => 1;
}
}

object Part2{
	println(new OInt(5));
def compareTrees[T <: Ordered[T]](obj1: OTree[T], obj2: OTree[T]) {
if(obj1.compare(obj2) == -1)
println("Less");
else if(obj1.compare(obj2) == 1)
println("Greater");
else
println("Equal")
} 

 def test() {

    val tree1 = ONode(List(OLeaf(new OInt(6))))

    val tree2 = ONode(List(OLeaf(new OInt(3)),
			   OLeaf(new OInt(4)), 
			   ONode(List(OLeaf(new OInt(5)))), 
			   ONode(List(OLeaf(new OInt(6)), 
				      OLeaf(new OInt(7))))));

    val treeTree1: OTree[OTree[OInt]] = 
      ONode(List(OLeaf(OLeaf(new OInt(1)))))

    val treeTree2: OTree[OTree[OInt]] = 
      ONode(List(OLeaf(OLeaf(new OInt(1))),
		 OLeaf(ONode(List(OLeaf(new OInt(2)), 
				  OLeaf(new OInt(2)))))))


    print("tree1: ")
    println(tree1)
    print("tree2: ")
    println(tree2)
    print("treeTree1: ")
    println(treeTree1)
    print("treeTree2: ")
    println(treeTree2)
    print("Comparing tree1 and tree2: ")
    compareTrees(tree1, tree2)
    print("Comparing tree2 and tree2: ")
    compareTrees(tree2, tree2)
    print("Comparing tree2 and tree1: ")
    compareTrees(tree2, tree1)
    print("Comparing treeTree1 and treeTree2: ")
    compareTrees(treeTree1, treeTree2)
    print("Comparing treeTree2 and treeTree2: ")
    compareTrees(treeTree2, treeTree2)
    print("Comparing treeTree2 and treeTree1: ")
    compareTrees(treeTree2, treeTree1)
  }



def main(args: Array[String]) { 
test();
}


}



