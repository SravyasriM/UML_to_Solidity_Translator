pragma solidity 0.7.5;

//package Maths


/**
 * This is Euclid's algorithm which is used to find the greatest common denominator Overide function
 * name gcd
 *
 * @author Oskar Enmalm 3/10/17
 */

contract GCD
{
	/**
 * get greatest common divisor
 *
 * @param num1 the first number
 * @param num2 the second number
 * @return gcd
 */

	function gcd(int32 num1, int32 num2) public returns(int32)
	{
			if(num1 < 0 || num2 < 0)
			{
			}
			if(num1 == 0 || num2 == 0)
			{
					return 
			}
			while(num1 % num2 != 0)
			{
					int32 remainder = int32(num1 % num2);
					num1 = num2;
					num2 = remainder;

			}
			return num2;
	}

}

library GCD_Library
{
	/**
 * get greatest common divisor
 *
 * @param num1 the first number
 * @param num2 the second number
 * @return gcd
 */

	function gcd(int32 num1, int32 num2) public returns(int32)
	{
			if(num1 < 0 || num2 < 0)
			{
			}
			if(num1 == 0 || num2 == 0)
			{
					return 
			}
			while(num1 % num2 != 0)
			{
					int32 remainder = int32(num1 % num2);
					num1 = num2;
					num2 = remainder;

			}
			return num2;
	}

	/**
 * get greatest common divisor in array
 *
 * @param number contains number
 * @return gcd
 */

	function gcd(int32[] memory number) public returns(int32)
	{
			int32 result = int32(number[uint256(0)]);
			for(int32 i = int32(1); i < number.length; i++;)
			{
				// call gcd function (input two value)

				result = gcd(result, number[uint256(i)]);			}
			return result;
	}

	function main(string[] memory args) public
	{
			// => 4

			System.out.println(gcd(myIntArray));
			// => 8

			System.out.printf("gcd(40,24)=%d gcd(24,40)=%d%n", gcd(40, 24), gcd(24, 40));
	}

}

