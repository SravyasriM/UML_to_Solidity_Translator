pragma solidity 0.7.5;

//package Maths


/**
 * https://en.wikipedia.org/wiki/Lucas_number
 */

contract LucasSeries
{
	/**
 * Calculate nth number of lucas series(2, 1, 3, 4, 7, 11, 18, 29, 47, 76, 123, ....) using
 * recursion
 *
 * @param n nth
 * @return nth number of lucas series
 */

	function lucasSeries(int32 n) public returns(int32)
	{
			return n == 1 ? 2 : n == 2 ? 1 : lucasSeries(n - 1) + lucasSeries(n - 2);
	}

	/**
 * Calculate nth number of lucas series(2, 1, 3, 4, 7, 11, 18, 29, 47, 76, 123, ....) using
 * iteration
 *
 * @param n nth
 * @return nth number of lucas series
 */

	function lucasSeriesIteration(int32 n) public returns(int32)
	{
			int32 previous = int32(2);
			int32 current = int32(1);
			for(int32 i = int32(1); i < n; i++;)
			{
					int32 next = int32(previous + current);
					previous = current;
					current = next;
			}
			return previous;
	}

}

library LucasSeries_Library
{
	function main(string[] memory args) public
	{
	}

	/**
 * Calculate nth number of lucas series(2, 1, 3, 4, 7, 11, 18, 29, 47, 76, 123, ....) using
 * recursion
 *
 * @param n nth
 * @return nth number of lucas series
 */

	function lucasSeries(int32 n) public returns(int32)
	{
			return n == 1 ? 2 : n == 2 ? 1 : lucasSeries(n - 1) + lucasSeries(n - 2);
	}

	/**
 * Calculate nth number of lucas series(2, 1, 3, 4, 7, 11, 18, 29, 47, 76, 123, ....) using
 * iteration
 *
 * @param n nth
 * @return nth number of lucas series
 */

	function lucasSeriesIteration(int32 n) public returns(int32)
	{
			int32 previous = int32(2);
			int32 current = int32(1);
			for(int32 i = int32(1); i < n; i++;)
			{
					int32 next = int32(previous + current);
					previous = current;
					current = next;
			}
			return previous;
	}

}

