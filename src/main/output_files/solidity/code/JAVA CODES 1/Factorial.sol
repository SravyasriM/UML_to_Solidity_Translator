pragma solidity ^0.5.11;

contract Factorial
{
	function fac(int32 n) public returns(int32)
	{
			if(n <= 1)
			{
					return 1;
			}
			else
			{
					return n * fac(n - 1);
			}

	}

}

contract Main
{
	function main() public
	{
			Factorial factorial = new Factorial();
			int32 fac = int32(factorial.fac(10));
	}

}

