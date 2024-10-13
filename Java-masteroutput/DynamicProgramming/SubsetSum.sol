pragma solidity 0.7.5;

//package DynamicProgramming


contract SubsetSum
{
}

library SubsetSum_Library
{
	/**
 * Driver Code
 */

	function main(string[] memory args) public
	{
	}

	/**
 * Test if a set of integers contains a subset that sum to a given integer.
 *
 * @param arr the array contains integers.
 * @param sum target sum of subset.
 * @return {@code true} if subset exists, otherwise {@code false}.
 */

	function subsetSum(int32[] memory arr, int32 sum) private returns(bool)
	{
			int32 n = int32(arr.length);
			isSum[uint256(n + 1)][uint256(0)] = true;
			for(int32 i = int32(1); i <= sum; i++;)
			{
					isSum[uint256(n + 1)][uint256(i)] = false;
			}
			for(int32 i = int32(n); i > 0; i--;)
			{
					isSum[uint256(i)][uint256(0)] = true;
					for(int32 j = int32(1); j <= arr[uint256(i - 1)] - 1; j++;)
					{
							if(j <= sum)
							{
									isSum[uint256(i)][uint256(j)] = isSum[uint256(i + 1)][uint256(j)];
							}
					}
					for(int32 j = int32(arr[uint256(i - 1)]); j <= sum; j++;)
					{
							isSum[uint256(i)][uint256(j)] = (isSum[uint256(i + 1)][uint256(j)] || isSum[uint256(i + 1)][uint256(j - arr[uint256(i - 1)])]);
					}
			}
			return isSum[uint256(1)][uint256(sum)];
	}

}

