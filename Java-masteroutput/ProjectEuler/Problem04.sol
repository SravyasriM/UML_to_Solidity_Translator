pragma solidity 0.7.5;

//package ProjectEuler


/**
 * A palindromic number reads the same both ways. The largest palindrome made from the product of
 * two 2-digit numbers is 9009 = 91 × 99.
 *
 * <p>Find the largest palindrome made from the product of two 3-digit numbers.
 *
 * <p>link: https://projecteuler.net/problem=4
 */

contract Problem04
{
	function solution1(int32 n) private returns(int32)
	{
			for(int32 i = int32(n - 1); i >= 10000; --i;)
			{
					string memory strNumber = string(String.valueOf(i));
			}
			return -1;
	}

}

library Problem04_Library
{
	function main(string[] memory args) public
	{
	}

	function solution1(int32 n) private returns(int32)
	{
			for(int32 i = int32(n - 1); i >= 10000; --i;)
			{
					string memory strNumber = string(String.valueOf(i));
			}
			return -1;
	}

}

