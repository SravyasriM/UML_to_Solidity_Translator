pragma solidity 0.7.5;

//package Maths


import "java/util/Random.sol";

contract MaxValue
{
	/**
 * Returns the greater of two {@code int} values. That is, the result is the argument closer to
 * the value of {@link Integer#MAX_VALUE}. If the arguments have the same value, the result is
 * that same value.
 *
 * @param a an argument.
 * @param b another argument.
 * @return the larger of {@code a} and {@code b}.
 */

	function max(int32 a, int32 b) public returns(int32)
	{
			return a >= b ? a : b;
	}

}

library MaxValue_Library
{
	/**
 * Driver Code
 */

	function main(string[] memory args) public
	{
			Random rand;
			/* test 100 times using rand numbers */

			for(int32 i = int32(1); i <= 100; ++i;)
			{
					/* generate number from -50 to 49 */

					int32 a = int32(rand.nextInt(100) - 50);
					int32 b = int32(rand.nextInt(100) - 50);
			}
	}

	/**
 * Returns the greater of two {@code int} values. That is, the result is the argument closer to
 * the value of {@link Integer#MAX_VALUE}. If the arguments have the same value, the result is
 * that same value.
 *
 * @param a an argument.
 * @param b another argument.
 * @return the larger of {@code a} and {@code b}.
 */

	function max(int32 a, int32 b) public returns(int32)
	{
			return a >= b ? a : b;
	}

}

