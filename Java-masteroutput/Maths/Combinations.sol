pragma solidity 0.7.5;

//package Maths


/**
 * @see <a href="https://en.wikipedia.org/wiki/Combination">Combination</a>
 */

contract Combinations
{
	/**
 * Calculate of factorial
 *
 * @param n the number
 * @return factorial of given number
 */

	function factorial(int32 n) public returns(int64)
	{
			if(n < 0)
			{
			}
			return n == 0 || n == 1 ? 1 : n * factorial(n - 1);
	}

	/**
 * Calculate combinations
 *
 * @param n first number
 * @param k second number
 * @return combinations of given {@code n} and {@code k}
 */

	function combinations(int32 n, int32 k) public returns(int64)
	{
			return factorial(n) / ();
	}

}

library Combinations_Library
{
	function main(string[] memory args) public
	{
	}

	/**
 * Calculate of factorial
 *
 * @param n the number
 * @return factorial of given number
 */

	function factorial(int32 n) public returns(int64)
	{
			if(n < 0)
			{
			}
			return n == 0 || n == 1 ? 1 : n * factorial(n - 1);
	}

	/**
 * Calculate combinations
 *
 * @param n first number
 * @param k second number
 * @return combinations of given {@code n} and {@code k}
 */

	function combinations(int32 n, int32 k) public returns(int64)
	{
			return factorial(n) / ();
	}

}

