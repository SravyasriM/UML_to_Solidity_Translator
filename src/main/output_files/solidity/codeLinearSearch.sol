pragma solidity ^0.5.11;

contract LinearSearch
{
	function search(int32 ele) internal returns(int32)
	{
			int32 idx = int32(-1);
			for(int32 i = int32(0); i < 10; i++)
			{
					if(arr[uint256(i)] == ele)
					{
							idx = i;
							break;
					}
			}
			return idx;
	}

	function main() public
	{
			int32 idx = int32(search(5));
	}

}

