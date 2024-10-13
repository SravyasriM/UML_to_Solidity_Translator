pragma solidity 0.7.5;

//package Maths


import "java/util/Random.sol";

contract AbsoluteValue
{
	/**
 * If value is less than zero, make value positive.
 *
 * @param value a number
 * @return the absolute value of a number
 */

	function absVal(int32 value) public returns(int32)
	{
			return value < 0 ? -value; : value
	}

}

library AbsoluteValue_Library
{
	function main(string[] memory args) public
	{
			Random random;
			/* test 1000 random numbers */

			for(int32 i = int32(1); i <= 1000; ++i;)
			{
					int32 randomNumber = int32(random.nextInt());
			}
	}

	/**
 * If value is less than zero, make value positive.
 *
 * @param value a number
 * @return the absolute value of a number
 */

	function absVal(int32 value) public returns(int32)
	{
			return value < 0 ? -value; : value
	}

}

