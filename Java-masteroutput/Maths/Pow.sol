pragma solidity 0.7.5;

//package Maths


// POWER (exponentials) Examples (a^b)

contract Pow
{
	/**
 * Returns the value of the first argument raised to the power of the second argument
 *
 * @param a the base.
 * @param b the exponent.
 * @return the value {@code a}<sup>{@code b}</sup>.
 */

	function pow(int32 a, int32 b) public returns(int64)
	{
			int64 result = int64(1);
			for(int32 i = int32(1); i <= b; i++;)
			{
					result *= a;
			}
			return result;
	}

}

library Pow_Library
{
	function main(string[] memory args) public
	{
	}

	/**
 * Returns the value of the first argument raised to the power of the second argument
 *
 * @param a the base.
 * @param b the exponent.
 * @return the value {@code a}<sup>{@code b}</sup>.
 */

	function pow(int32 a, int32 b) public returns(int64)
	{
			int64 result = int64(1);
			for(int32 i = int32(1); i <= b; i++;)
			{
					result *= a;
			}
			return result;
	}

}

