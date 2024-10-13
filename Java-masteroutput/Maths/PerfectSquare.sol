pragma solidity 0.7.5;

//package Maths


/**
 * https://en.wikipedia.org/wiki/Perfect_square
 */

contract PerfectSquare
{
	/**
 * Check if a number is perfect square number
 *
 * @param number the number to be checked
 * @return <tt>true</tt> if {@code number} is perfect square, otherwise <tt>false</tt>
 */

	function isPerfectSquare(int32 number) public returns(bool)
	{
			int32 sqrt = int32(int32(Math.sqrt(number)));
			return sqrt * sqrt == number;
	}

}

library PerfectSquare_Library
{
	function main(string[] memory args) public
	{
	}

	/**
 * Check if a number is perfect square number
 *
 * @param number the number to be checked
 * @return <tt>true</tt> if {@code number} is perfect square, otherwise <tt>false</tt>
 */

	function isPerfectSquare(int32 number) public returns(bool)
	{
			int32 sqrt = int32(int32(Math.sqrt(number)));
			return sqrt * sqrt == number;
	}

}

