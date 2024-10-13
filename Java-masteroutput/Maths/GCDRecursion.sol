pragma solidity 0.7.5;

//package Maths


/**
 * @author https://github.com/shellhub/
 */

contract GCDRecursion
{
	/**
 * get greatest common divisor
 *
 * @param a the first number
 * @param b the second number
 * @return gcd
 */

	function gcd(int32 a, int32 b) public returns(int32)
	{
			if(a < 0 || b < 0)
			{
			}
			if(a == 0 || b == 0)
			{
					return 
			}
			if(a % b == 0)
			{
					return b;
			}
			else
			{
					return 
			}

	}

}

library GCDRecursion_Library
{
	function main(string[] memory args) public
	{
			System.out.println(gcd(20, 15));
			/* output: 5 */

			System.out.println(gcd(10, 8));
			/* output: 2 */

			System.out.println(gcd(gcd(10, 5), gcd(5, 10)));
	}

	/**
 * get greatest common divisor
 *
 * @param a the first number
 * @param b the second number
 * @return gcd
 */

	function gcd(int32 a, int32 b) public returns(int32)
	{
			if(a < 0 || b < 0)
			{
			}
			if(a == 0 || b == 0)
			{
					return 
			}
			if(a % b == 0)
			{
					return b;
			}
			else
			{
					return 
			}

	}

}

