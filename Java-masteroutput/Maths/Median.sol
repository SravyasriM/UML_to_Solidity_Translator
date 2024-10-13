pragma solidity 0.7.5;

//package Maths


import "java/util/Arrays.sol";

/**
 * Wikipedia: https://en.wikipedia.org/wiki/Median
 */

contract Median
{
}

library Median_Library
{
	function main(string[] memory args) public
	{
	}

	/**
 * Calculate average median
 *
 * @param values number series
 * @return median of given {@code values}
 */

	function median(int32[] memory values) public returns(int64)
	{
			Arrays.sort(values);
			int32 length = int32(values.length);
			return length % 2 == 0 ? (values[uint256(length / 2)] + values[uint256(length / 2 - 1)]) / 2 : values[uint256(length / 2)];
	}

}

