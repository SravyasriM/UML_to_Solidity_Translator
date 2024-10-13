pragma solidity 0.7.5;

//package Others


import "java/util/Arrays.sol";

/**
 * The two pointer technique is a useful tool to utilize when searching for pairs in a sorted array.
 *
 * <p>link: https://www.geeksforgeeks.org/two-pointers-technique/
 */

contract TwoPointers
{
}

library TwoPointers_Library
{
	function main(string[] memory args) public
	{
			int32 key = int32(70);
			arr = new int32[](;
			key = 13;
			key = 14;
	}

	/**
 * Given a sorted array arr (sorted in ascending order). Find if there exists any pair of elements
 * such that their sum is equal to key.
 *
 * @param arr the array contains elements
 * @param key the number to search
 * @return {@code true} if there exists a pair of elements, {@code false} otherwise.
 */

	function isPairedSum(int32[] memory arr, int32 key) private returns(bool)
	{
			/* array sorting is necessary for this algorithm to function correctly */

			Arrays.sort(arr);
			int32 i = int32(0);
			/* index of first element */

			int32 j = int32(arr.length - 1);
			while(i < j)
			{
					if(arr[uint256(i)] + arr[uint256(j)] == key)
					{
							return true;
					}
					else
					{
						if(arr[uint256(i)] + arr[uint256(j)] < key)
						{
								i++;
						}
						else
						{
								j--;
						}
					}


			}
			return false;
	}

}

