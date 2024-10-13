pragma solidity 0.7.5;

//package Maths


import "java/util/Arrays.sol";

import "java/util/Random.sol";

contract FindMaxRecursion
{
}

library FindMaxRecursion_Library
{
	function main(string[] memory args) public
	{
			Random rand;
			/* rand size */

			int32 size = int32(rand.nextInt(100) + 1);
			/* init array with rand numbers */

			for(int32 i = int32(0); i < size; i++;)
			{
					array[uint256(i)] = rand.nextInt() % 100;
			}
	}

	/**
 * Get max of array using divide and conquer algorithm
 *
 * @param array contains elements
 * @param low the index of the first element
 * @param high the index of the last element
 * @return max of {@code array}
 */

	function max(int32[] memory array, int32 low, int32 high) public returns(int32)
	{
			if(low == high)
			{
					// or array[high]

					return array[uint256(low)];
			}
			int32 mid = int32((low + high) >>> 1);
			// get max in [low, mid]

			int32 leftMax = int32(max(array, low, mid));
			// get max in [mid+1, high]

			int32 rightMax = int32(max(array, mid + 1, high));
			return Math.max(leftMax, rightMax);
	}

	/**
 * Get max of array using recursion algorithm
 *
 * @param array contains elements
 * @param len length of given array
 * @return max value of {@code array}
 */

	function max(int32[] memory array, int32 len) public returns(int32)
	{
			return len == 1 ? array[uint256(0)] : Math.max(max(array, len - 1), array[uint256(len - 1)]);
	}

}

