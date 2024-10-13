pragma solidity 0.7.5;

//package Others


import "java/util/Scanner.sol";

contract RootPrecision
{
	function squareRoot(int32 N, int32 P) public returns(int64)
	{
			// rv means return value

			int64 rv; //Converted from DOUBLE TYPE of Java
			int64 root = int64(Math.pow(N, 0)); //Converted from DOUBLE TYPE of Java
			// calculate precision to power of 10 and then multiply it with root value.

			int32 precision = int32(int32(Math.pow(10, P)));
			root = root * precision;
			rv = int32(root);
			return rv / precision;
	}

}

library RootPrecision_Library
{
	function main(string[] memory args) public
	{
			// take input

			Scanner scn;
			// N is the input number

			int32 N = int32(scn.nextInt());
			// P is precision value for eg - P is 3 in 2.564 and 5 in 3.80870.

			int32 P = int32(scn.nextInt());
			System.out.println(squareRoot(N, P));
			scn.close();
	}

	function squareRoot(int32 N, int32 P) public returns(int64)
	{
			// rv means return value

			int64 rv; //Converted from DOUBLE TYPE of Java
			int64 root = int64(Math.pow(N, 0)); //Converted from DOUBLE TYPE of Java
			// calculate precision to power of 10 and then multiply it with root value.

			int32 precision = int32(int32(Math.pow(10, P)));
			root = root * precision;
			rv = int32(root);
			return rv / precision;
	}

}

