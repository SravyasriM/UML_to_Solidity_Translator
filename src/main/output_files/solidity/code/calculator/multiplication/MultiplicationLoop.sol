pragma solidity ^0.5.11;

//package calculator.multiplication


contract MultiplicationLoop
{
	function multiply(int32 a, int32 b) public returns(int32)
	{
			int32 ans = int32(0);
			for(int32 i = int32(0); i < b; i++)
			{
				ans += a;			}
			return ans;
	}

}

