import java.util.ArrayList;


@SuppressWarnings({ "rawtypes", "serial" })
class ComparableList<T extends ComparableList> extends ArrayList implements Comparable
{
	@Override
	public int compareTo(Object o) {
		int length1=this.size();
		ComparableList temp=(ComparableList) o;
		int length2=temp.size();
		int res=0,min=length1;
		
		if(length2<length1) 
			min=length2;
		
	    for(int i=0;i<min;i++)
	    {
	    	T o1=(T) this.get(i);
	    	T o2=(T) temp.get(i);
	    	if(o1.compareTo(o2) < 0)
			{	
			res=-1;
			break;
			}
            else if(o1.compareTo(o2) > 0)
			{	
			res=1;
			break;
			}
			
			if(length1!=length2 && res==0)
			{
				if(length1<length2)
					res=-1;
				else
					res=1;
			}
	    }
	    return res;
	
	}
	
	@SuppressWarnings("unchecked")
	public void populate(Object[] o)
	{
		int len=o.length;
		for(int i=0;i<len;i++)
		{
			this.add(o[i]);
		}
	}
			
}

@SuppressWarnings({ "rawtypes", "serial" })
class A extends ComparableList
{
	Integer i;
	
	A(){
		
	}
	
	A(Integer i)
	{
		this.i=i;
	}
	
	@Override
	public int compareTo(Object o)
	{
	
		int i2;
		if(o.getClass()==B.class)
		{
			i2=((B) o).x + ((B) o).y;
		}
		else
		{
			i2=((A) o).i;
		}
		
		if(this.i < i2)
			return -1;
		else if(this.i > i2)
			return 1;
		else
			return 0;	
	}
	
	@Override
	public String toString() {
		return "A<"+this.i+">";
	}
}

@SuppressWarnings("serial")
class B extends A 
{
	Integer x,y;
	
	B(Integer x) {
		this.x=x;
		this.y=0;
	}
	
	B(Integer x, Integer y) {
		this.x=x;
		this.y=y;
	}
	
	
	@Override
	public int compareTo(Object o)
	{
		int x1,y1,x2,y2;
		
		x1=this.x;
		y1=this.y;
		
		if(o.getClass()==A.class)
			{
				x2=((A) o).i;
				y2=0;
			}
		else
			{
				x2=((B) o).x;
				y2=((B) o).y;
			}
		
		if(x1+y1 <  x2 + y2)
		{
			return -1;
		}
		else if(x1+y1 > x2+y2)
		{
			return 1;
		}
		else
			return 0;	
	}
	
	@Override
	public String toString() {
		return ("B<"+this.x + ","+this.y + ">");
	}
	
}


public class Part1 {

	public static void main(String[] args) {
	      test();
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static <T extends ComparableList> void addtoCList(T z,ComparableList L)
	{
		System.out.println("Adding " + z);
		L.add(z);
	}
	
	 static void test() {
		    ComparableList<A> c1 = new ComparableList<A>();
			ComparableList<A> c2 = new ComparableList<A>();
			for(int i = 0; i < 10; i++) {
			    addtoCList(new A(i), c1);
			    addtoCList(new A(i), c2);
			}
			addtoCList(new A(12), c1);
			addtoCList(new B(6,6), c2);
			
			addtoCList(new B(7,11), c1);
			addtoCList(new A(13), c2);

			System.out.print("c1: ");
			System.out.println(c1);
			
			System.out.print("c2: ");
			System.out.println(c2);

			switch (c1.compareTo(c2)) {
			case -1: 
			    System.out.println("c1 < c2");
			    break;
			case 0:
			    System.out.println("c1 = c2");
			    break;
			case 1:
			    System.out.println("c1 > c2");
			    break;
			default:
			    System.out.println("Uh Oh");
			    break;
			}

		    }
	
	
}
