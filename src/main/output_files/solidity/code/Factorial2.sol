pragma solidity ^0.5.11;

contract Factorial2
{
	function fac(int32 a) public returns(int32)
	{
			int32 val = int32(1);
			for(int32 i = int32(a); i >= 1; i--;)
			{
					val = val * i;
			}
			return val;
	}

}

library Factorial2_Library
{
}

