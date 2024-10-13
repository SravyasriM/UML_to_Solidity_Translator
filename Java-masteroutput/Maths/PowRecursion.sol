pragma solidity 0.7.5;

//package Maths


contract PowRecursion
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
			return b == 0 ? 1 : a * pow(a, b - 1);
	}

}

library PowRecursion_Library
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
			return b == 0 ? 1 : a * pow(a, b - 1);
	}

}

