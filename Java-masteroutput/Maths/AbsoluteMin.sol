pragma solidity 0.7.5;

//package Maths


import "java/util/Arrays.sol";

/**
 * description:
 *
 * <p>absMin([0, 5, 1, 11]) = 0, absMin([3 , -10, -2]) = -2
 */

contract AbsoluteMin
{
}

library AbsoluteMin_Library
{
	function main(string[] memory args) public
	{
			System.out.println("absMin(" + Arrays.toString(numbers) + ") = " + absMin(numbers));
	}

	/**
 * get the value, returns the absolute min value min
 *
 * @param numbers contains elements
 * @return the absolute min value
 */

	function absMin(int32[] memory numbers) public returns(int32)
	{
			int32 absMinValue = int32(numbers[uint256(0)]);
			for(int32 i = int32(1); i < length; ++i;)
			{
					if(Math.abs(numbers[uint256(i)]) < Math.abs(absMinValue))
					{
							absMinValue = numbers[uint256(i)];
					}
			}
			return absMinValue;
	}

}

