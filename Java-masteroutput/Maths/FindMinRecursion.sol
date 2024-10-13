pragma solidity 0.7.5;

//package Maths


import "java/util/Arrays.sol";

import "java/util/Random.sol";

contract FindMinRecursion
{
}

library FindMinRecursion_Library
{
	/**
 * Driver Code
 */

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
 * Get min of array using divide and conquer algorithm
 *
 * @param array contains elements
 * @param low the index of the first element
 * @param high the index of the last element
 * @return min of {@code array}
 */

	function min(int32[] memory array, int32 low, int32 high) public returns(int32)
	{
			if(low == high)
			{
					// or array[high]

					return array[uint256(low)];
			}
			int32 mid = int32((low + high) >>> 1);
			// get min in [low, mid]

			int32 leftMin = int32(min(array, low, mid));
			// get min in [mid+1, high]

			int32 rightMin = int32(min(array, mid + 1, high));
			return Math.min(leftMin, rightMin);
	}

	/**
 * Get min of array using recursion algorithm
 *
 * @param array contains elements
 * @param len length of given array
 * @return min value of {@code array}
 */

	function min(int32[] memory array, int32 len) public returns(int32)
	{
			return len == 1 ? array[uint256(0)] : Math.min(min(array, len - 1), array[uint256(len - 1)]);
	}

}

