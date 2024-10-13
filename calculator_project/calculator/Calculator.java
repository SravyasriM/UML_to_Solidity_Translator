package calculator;

import calculator.addition.Addition;
import calculator.substraction.Substraction;
import calculator.multiplication.*;
import calculator.division.Division;



public class Calculator {	
	 public void calculate()
	 {
	   int a = 5;
	   int b = 2;
	   int c = Addition.add(a, b);
	   int d = Substraction.subtract(a, b);
	   int e = Multiplication.multiply(a, b);
	   int f = Division.divide(a, b);
	   int g = MultiplicationLoop.multiply(a, b);
	   int h = c+d+e+f+g;
	   Addition ad = new Addition();
	   int j = ad.add(a, 5);
	   int xyz;
	 }
}

class MiniCalc{
	public void fun()
	{
		Calculator cal = new Calculator();
		cal.calculate();
	}
}
