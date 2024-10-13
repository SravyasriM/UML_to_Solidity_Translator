pragma solidity ^0.5.11;

contract BinarySearch
{
	function search(int32[] memory arr, int32 ele) public returns(int32)
	{
			int32 high = int32(arr.length - 1);
			int32 low = int32(0);
			int32 mid;
			while(low <= high)
			{
					mid = (low + high) / 2;
					if(arr[uint256(mid)] == ele)
					{
							return mid;
					}
					else
					{
						if(arr[uint256(mid)] < ele)
						{
								low = mid + 1;
						}
						else
						{
								high = mid - 1;
						}
					}


			}
			return -1;
	}

}

