pragma solidity 0.7.5;

//package DynamicProgramming


import "java/util/Scanner.sol";

/**
 * @author Afrizal Fikri (https://github.com/icalF)
 */

contract LongestIncreasingSubsequence
{
}

library LongestIncreasingSubsequence_Library
{
	function main(string[] memory args) public
	{
			Scanner sc;
			int32 n = int32(sc.nextInt());
			for(int32 i = int32(0); i < n; i++;)
			{
					arr[uint256(i)] = sc.nextInt();
			}
			System.out.println(LIS(arr));
			System.out.println(findLISLen(arr));
			sc.close();
	}

	function upperBound(int32[] memory ar, int32 l, int32 r, int32 key) private returns(int32)
	{
			while(l < r - 1)
			{
					int32 m = int32((l + r) >>> 1);
					if(ar[uint256(m)] >= key)
					{
						r = m;					}
					else
					{
						l = m;					}


			}
			return r;
	}

	function LIS(int32[] memory array) private returns(int32)
	{
			int32 N = int32(array.length);
			if(N == 0)
			{
				return 0;			}
			// always points empty slot in tail

			int32 length = int32(1);
			tail[uint256(0)] = array[uint256(0)];
			for(int32 i = int32(1); i < N; i++;)
			{
					// new smallest value

					if(array[uint256(i)] < tail[uint256(0)])
					{
						tail[uint256(0)] = array[uint256(i)];					}
					else
					{
						// array[i] extends largest subsequence

						if(array[uint256(i)] > tail[uint256(length - 1)])
						{
							tail[uint256(length++;)] = array[uint256(i)]						}
						else
						{
							// replace it)

							tail[uint256(upperBound(tail, -1;, length - 1, array[uint256(i)]))] = array[uint256(i)]						}
					}

			}
			return length;
	}

	// A function for finding the length of the LIS algorithm in O(nlogn) complexity.

	function findLISLen(int32[] memory a) public returns(int32)
	{
			int32 size = int32(a.length);
			arr[uint256(0)] = a[uint256(0)];
			int32 lis = int32(1);
			for(int32 i = int32(1); i < size; i++;)
			{
					int32 index = int32(binarySearchBetween(arr, lis, a[uint256(i)]));
					arr[uint256(index)] = a[uint256(i)];
					if(index > lis)
					{
						lis++;					}
			}
			return lis;
	}

	// O(logn)

	function binarySearchBetween(int32[] memory t, int32 end, int32 key) private returns(int32)
	{
			int32 left = int32(0);
			int32 right = int32(end);
			if(key < t[uint256(0)])
			{
				return 0;			}
			if(key > t[uint256(end)])
			{
				return end + 1;			}
			while(left < right - 1)
			{
					int32 middle = int32((left + right) / 2);
					if(t[uint256(middle)] < key)
					{
						left = middle;					}
					else
					{
						right = middle;					}


			}
			return right;
	}

}

