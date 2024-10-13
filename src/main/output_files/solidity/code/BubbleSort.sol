pragma solidity ^0.5.11;

contract BubbleSort
{
	function sort() public
	{
			for(int32 i = int32(0); i < 9; i++)
			{
					for(int32 j = int32(i + 1); j < 10; j++)
					{
							if(arr[uint256(j)] < arr[uint256(i)])
							{
									int32 temp = int32(arr[uint256(i)]);
									arr[uint256(i)] = arr[uint256(j)];
									arr[uint256(j)] = temp;
							}
					}
			}
	}

}

