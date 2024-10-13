pragma solidity 0.7.5;

//package Maths


contract FactorialRecursion
{
	/**
 * Recursive FactorialRecursion Method
 *
 * @param n The number to factorial
 * @return The factorial of the number
 */

	function factorial(int32 n) public returns(int64)
	{
			if(n < 0)
			{
			}
			return n == 0 || n == 1 ? 1 : n * factorial(n - 1);
	}

}

library FactorialRecursion_Library
{
	/* Driver Code */

	function main(string[] memory args) public
	{
	}

	/**
 * Recursive FactorialRecursion Method
 *
 * @param n The number to factorial
 * @return The factorial of the number
 */

	function factorial(int32 n) public returns(int64)
	{
			if(n < 0)
			{
			}
			return n == 0 || n == 1 ? 1 : n * factorial(n - 1);
	}

}

