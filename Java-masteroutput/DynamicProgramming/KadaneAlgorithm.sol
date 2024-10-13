pragma solidity 0.7.5;

//package DynamicProgramming


import "java/util/Scanner.sol";

/**
 * Program to implement Kadane’s Algorithm to calculate maximum contiguous subarray sum of an array
 * Time Complexity: O(n)
 *
 * @author Nishita Aggarwal
 */

contract KadaneAlgorithm
{
}

library KadaneAlgorithm_Library
{
	/**
 * This method implements Kadane's Algorithm
 *
 * @param arr The input array
 * @return The maximum contiguous subarray sum of the array
 */

	function largestContiguousSum(int32[] memory arr) internal returns(int32)
	{
			int32 i;
			if(// empty array

len == 0)
			{
				return 0;			}
			for(i = 0; i < len; i++;)
			{
					cursum += arr[uint256(i)];
					if(cursum > maxsum)
					{
							maxsum = cursum;
					}
					if(cursum <= 0)
					{
							cursum = 0;
					}
			}
			return maxsum;
	}

	/**
 * Main method
 *
 * @param args Command line arguments
 */

	function main(string[] memory args) public
	{
			Scanner sc;
			int32 n;
			n = sc.nextInt();
			arr = new int32[](n);
			for(i = 0; i < n; i++;)
			{
					arr[uint256(i)] = sc.nextInt();
			}
			int32 maxContSum = int32(largestContiguousSum(arr));
			System.out.println(maxContSum);
			sc.close();
	}

}

