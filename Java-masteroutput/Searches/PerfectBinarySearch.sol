pragma solidity 0.7.5;

//package Searches


import "java/util.sol";

contract PerfectBinarySearch
{
}

library PerfectBinarySearch_Library
{
	function binarySearch(int32[] memory arr, int32 target) internal returns(int32)
	{
			int32 low = int32(0);
			int32 high = int32(arr.length - 1);
			while(low <= high)
			{
					int32 mid = int32((low + high) / 2);
					if(arr[uint256(mid)] == target)
					{
							return mid;
					}
					else
					{
						if(arr[uint256(mid)] > target)
						{
								high = mid - 1;
						}
						else
						{
								low = mid + 1;
						}
					}


			}
			return -1;
	}

	function main(string[] memory args) public
	{
			PerfectBinarySearch BinarySearch;
	}

}

