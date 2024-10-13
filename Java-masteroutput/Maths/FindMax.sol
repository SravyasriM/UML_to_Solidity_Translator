pragma solidity 0.7.5;

//package Maths


import "java/util/Arrays.sol";

import "java/util/Random.sol";

contract FindMax
{
}

library FindMax_Library
{
	/**
 * Driver Code
 */

	function main(string[] memory args) public
	{
			Random random;
			/* random size */

			int32 size = int32(random.nextInt(100) + 1);
			/* init array with random numbers */

			for(int32 i = int32(0); i < size; i++;)
			{
					array[uint256(i)] = random.nextInt() % 100;
			}
	}

	/**
 * find max of array
 *
 * @param array the array contains element
 * @return max value of given array
 */

	function findMax(int32[] memory array) public returns(int32)
	{
			int32 max = int32(array[uint256(0)]);
			for(int32 i = int32(1); i < array.length; ++i;)
			{
					if(array[uint256(i)] > max)
					{
							max = array[uint256(i)];
					}
			}
			return max;
	}

}

