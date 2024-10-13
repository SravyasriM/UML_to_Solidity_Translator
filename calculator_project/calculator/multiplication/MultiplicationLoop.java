package calculator.multiplication;

public class MultiplicationLoop {
	
	public static int multiply(int a,int b)
    {
   	  int ans=0;
   	  for(int i=0;i<b;i++)ans+=a;
   	  return ans;
    }
}
