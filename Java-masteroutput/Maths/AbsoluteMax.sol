pragma solidity 0.7.5;

//package Maths


import "java/util/Arrays.sol";

/**
 * description:
 *
 * <p>absMax([0, 5, 1, 11]) = 11, absMax([3 , -10, -2]) = -10
 */

contract AbsoluteMax
{
}

library AbsoluteMax_Library
{
	function main(string[] memory args) public
	{
			System.out.println("absMax(" + Arrays.toString(numbers) + ") = " + absMax(numbers));
	}

	/**
 * get the value, return the absolute max value
 *
 * @param numbers contains elements
 * @return the absolute max value
 */

	function absMax(int32[] memory numbers) public returns(int32)
	{
			int32 absMaxValue = int32(numbers[uint256(0)]);
			for(int32 i = int32(1); i < length; ++i;)
			{
					if(Math.abs(numbers[uint256(i)]) > Math.abs(absMaxValue))
					{
							absMaxValue = numbers[uint256(i)];
					}
			}
			return absMaxValue;
	}

}

