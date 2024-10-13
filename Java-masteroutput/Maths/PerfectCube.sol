pragma solidity 0.7.5;

//package Maths


/**
 * https://en.wikipedia.org/wiki/Cube_(algebra)
 */

contract PerfectCube
{
	/**
 * Check if a number is perfect cube or not
 *
 * @param number number to check
 * @return {@code true} if {@code number} is perfect cube, otherwise {@code false}
 */

	function isPerfectCube(int32 number) public returns(bool)
	{
			int32 a = int32(int32(Math.pow(number, 1 / 3)));
			return a * a * a == number;
	}

}

library PerfectCube_Library
{
	function main(string[] memory args) public
	{
	}

	/**
 * Check if a number is perfect cube or not
 *
 * @param number number to check
 * @return {@code true} if {@code number} is perfect cube, otherwise {@code false}
 */

	function isPerfectCube(int32 number) public returns(bool)
	{
			int32 a = int32(int32(Math.pow(number, 1 / 3)));
			return a * a * a == number;
	}

}

