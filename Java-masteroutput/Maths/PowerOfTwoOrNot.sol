pragma solidity 0.7.5;

//package Maths


/**
 * A utility to check if a given number is power of two or not. For example 8,16 etc.
 */

contract PowerOfTwoOrNot
{
	/**
 * Checks whether given number is power of two or not.
 *
 * @param number the number to check
 * @return {@code true} if given number is power of two, otherwise {@code false}
 */

	function checkIfPowerOfTwoOrNot(int32 number) public returns(bool)
	{
			return number != 0 && ((number & (number - 1)) == 0);
	}

}

library PowerOfTwoOrNot_Library
{
	function main(string[] memory args) public
	{
	}

	/**
 * Checks whether given number is power of two or not.
 *
 * @param number the number to check
 * @return {@code true} if given number is power of two, otherwise {@code false}
 */

	function checkIfPowerOfTwoOrNot(int32 number) public returns(bool)
	{
			return number != 0 && ((number & (number - 1)) == 0);
	}

}

