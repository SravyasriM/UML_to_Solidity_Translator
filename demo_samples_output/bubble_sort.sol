pragma solidity 0.6.1;

contract BubbleSort
{
	function bubbleSort(int32[] memory arr) internal
	{
			int32 n = int32(arr.length);
			for(int32 i = int32(0); i < n - 1; i++)
			{
				for(int32 j = int32(0); j < n - i - 1; j++)
				{
					if(arr[uint256(j)] > arr[uint256(j + 1)])
					{
							// swap arr[j+1] and arr[j]

							int32 temp = int32(arr[uint256(j)]);
							arr[uint256(j)] = arr[uint256(j + 1)];
							arr[uint256(j + 1)] = temp;
					}				}			}
	}

	function forEachStmtDemo(int32[] memory arr) public returns(int32)
	{
			// For-each Statement Demo

			int32 sum = int32(0);
			for(uint256 iterator_var = uint256(0); iterator_var < arr.length; iterator_var++)
			{
					int32 i = int32(arr[uint256(iterator_var)]);
					sum += i;
			}
			return sum;
	}

}

library BubbleSort_Library
{
}

