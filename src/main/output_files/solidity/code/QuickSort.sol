pragma solidity ^0.5.11;

contract QuickSort
{
	function sort(int32[] memory arr, int32 begin, int32 end) public
	{
			if(begin < end)
			{
					int32 pivot = int32(arr[uint256(end)]);
					int32 idx = int32(begin - 1);
					for(int32 i = int32(begin); i < end - 1; i++)
					{
							if(arr[uint256(i)] < pivot)
							{
									idx++;
									int32 temp = int32(arr[uint256(i)]);
									arr[uint256(i)] = arr[uint256(idx)];
									arr[uint256(idx)] = temp;
							}
					}
					int32 temp = int32(arr[uint256(idx + 1)]);
					arr[uint256(idx + 1)] = arr[uint256(end)];
					arr[uint256(end)] = temp;
					sort(arr, begin, idx);
					sort(arr, idx + 2, end);
			}
	}

}

