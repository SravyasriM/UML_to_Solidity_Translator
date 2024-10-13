pragma solidity 0.7.5;

//package DynamicProgramming


import "java/io.sol";

import "java/util.sol";

contract MinimumSumPartition
{
}

library MinimumSumPartition_Library
{
	function subSet(int32[] memory arr) public returns(int32)
	{
			int32 n = int32(arr.length);
			int32 sum = int32(getSum(arr));
			for(int32 i = int32(0); i <= n; i++;)
			{
					dp[uint256(i)][uint256(0)] = true;
			}
			for(int32 j = int32(0); j <= sum; j++;)
			{
					dp[uint256(0)][uint256(j)] = false;
			}
			// fill dp array

			for(int32 i = int32(1); i <= n; i++;)
			{
					for(int32 j = int32(1); j <= sum; j++;)
					{
							if(arr[uint256(i - 1)] < j)
							{
									dp[uint256(i)][uint256(j)] = dp[uint256(i - 1)][uint256(j - arr[uint256(i - 1)])] || dp[uint256(i - 1)][uint256(j)];
							}
							else
							{
								if(arr[uint256(i - 1)] == j)
								{
										dp[uint256(i)][uint256(j)] = true;
								}
								else
								{
										dp[uint256(i)][uint256(j)] = dp[uint256(i - 1)][uint256(j)];
								}
							}

					}
			}
			int32 p = int32(0);
			for(int32 i = int32(0); i <= sum / 2; i++;)
			{
					if(dp[uint256(n)][uint256(i)])
					{
							index[uint256(p++;)] = i
					}
			}
			return getMin(index, sum);
	}

	/**
 * Calculate sum of array elements
 *
 * @param arr the array
 * @return sum of given array
 */

	function getSum(int32[] memory arr) public returns(int32)
	{
			int32 sum = int32(0);
			for(uint256 iterator_var = uint256(0); iterator_var < arr.length; iterator_var++;)
			{
					int32 temp = int32(arr[uint256(iterator_var)]);
					sum += temp;
			}
			return sum;
	}

	function getMin(int32[] memory arr, int32 sum) public returns(int32)
	{
			if(arr.length == 0)
			{
					return 0;
			}
			int32 min = int32(Integer.MAX_VALUE);
			for(uint256 iterator_var = uint256(0); iterator_var < arr.length; iterator_var++;)
			{
					int32 temp = int32(arr[uint256(iterator_var)]);
					min = Math.min(min, sum - 2 * temp);
			}
			return min;
	}

	/**
 * Driver Code
 */

	function main(string[] memory args) public
	{
	}

}

//Optional.empty


/*Optional.empty*/


