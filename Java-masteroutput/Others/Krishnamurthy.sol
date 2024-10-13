pragma solidity 0.7.5;

//package Others


import "java/util/Scanner.sol";

contract Krishnamurthy
{
	function fact(int32 n) internal returns(int32)
	{
			int32 i;
			for(i = n; i >= 1; i--;)
			{
				p = p * i;			}
			return p;
	}

}

library Krishnamurthy_Library
{
	function fact(int32 n) internal returns(int32)
	{
			int32 i;
			for(i = n; i >= 1; i--;)
			{
				p = p * i;			}
			return p;
	}

	function main(string[] memory args) public
	{
			Scanner sc;
			int32 a;
			System.out.print("Enter the number : ");
			a = sc.nextInt();
			int32 n = int32(a);
			while(a > 0)
			{
					b = a % 10;
					s = s + fact(b);
					a = a / 10;

			}
			if(s == n)
			{
				System.out.print(n + " is a krishnamurthy number");			}
			else
			{
				System.out.print(n + " is not a krishnamurthy number");			}

			sc.close();
	}

}

