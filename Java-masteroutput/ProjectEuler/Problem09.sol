pragma solidity 0.7.5;

//package ProjectEuler


/**
 * A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
 *
 * <p>a^2 + b^2 = c^2 For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
 *
 * <p>There exists exactly one Pythagorean triplet for which a + b + c = 1000. Find the product abc.
 *
 * <p>link: https://projecteuler.net/problem=9
 */

contract Problem09
{
	function solution1() private returns(int32)
	{
			for(int32 i = int32(0); i <= 300; ++i;)
			{
					for(int32 j = int32(0); j <= 400; ++j;)
					{
							int32 k = int32(1000 - i - j);
							if(i * i + j * j == k * k)
							{
									return i * j * k;
							}
					}
			}
			return -1;
	}

}

library Problem09_Library
{
	function main(string[] memory args) public
	{
	}

	function solution1() private returns(int32)
	{
			for(int32 i = int32(0); i <= 300; ++i;)
			{
					for(int32 j = int32(0); j <= 400; ++j;)
					{
							int32 k = int32(1000 - i - j);
							if(i * i + j * j == k * k)
							{
									return i * j * k;
							}
					}
			}
			return -1;
	}

}

