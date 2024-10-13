pragma solidity 0.7.5;

//package Sorts


import "java/util/Arrays.sol";

contract RadixSort
{
}

library RadixSort_Library
{
	function getMax(int32[] memory arr, int32 n) private returns(int32)
	{
			int32 mx = int32(arr[uint256(0)]);
			for(int32 i = int32(1); i < n; i++;)
			{
				if(arr[uint256(i)] > mx)
				{
					mx = arr[uint256(i)];				}			}
			return mx;
	}

	function countSort(int32[] memory arr, int32 n, int32 exp) private
	{
			int32 i;
			Arrays.fill(count, 0);
			for(i = 0; i < n; i++;)
			{
				count[uint256((arr[uint256(i)] / exp) % 10)]++;			}
			for(i = 1; i < 10; i++;)
			{
				count[uint256(i)] += count[uint256(i - 1)];			}
			for(i = n - 1; i >= 0; i--;)
			{
					output[uint256(count[uint256((arr[uint256(i)] / exp) % 10)] - 1)] = arr[uint256(i)];
					count[uint256((arr[uint256(i)] / exp) % 10)]--;
			}
			for(i = 0; i < n; i++;)
			{
				arr[uint256(i)] = output[uint256(i)];			}
	}

	function radixsort(int32[] memory arr, int32 n) private
	{
			int32 m = int32(getMax(arr, n));
			for(int32 exp = int32(1); m / exp > 0; exp *= 10;)
			{
				countSort(arr, n, exp);			}
	}

	function print(int32[] memory arr, int32 n) internal
	{
			for(int32 i = int32(0); i < n; i++;)
			{
				System.out.print(arr[uint256(i)] + " ");			}
	}

	function main(string[] memory args) public
	{
			int32 n = int32(arr.length);
			radixsort(arr, n);
			print(arr, n);
	}

}

//Optional.empty


