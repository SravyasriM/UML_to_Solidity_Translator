pragma solidity 0.7.5;

//package Maths


/**
 * In number theory, the aliquot sum s(n) of a positive integer n is the sum of all proper divisors
 * of n, that is, all divisors of n other than n itself. For example, the proper divisors of 15
 * (that is, the positive divisors of 15 that are not equal to 15) are 1, 3 and 5, so the aliquot
 * sum of 15 is 9 i.e. (1 + 3 + 5). Wikipedia: https://en.wikipedia.org/wiki/Aliquot_sum
 */

contract AliquotSum
{
	/**
 * Finds the aliquot sum of an integer number
 *
 * @param number a positive integer
 * @return aliquot sum of given {@code number}
 */

	function aliquotSum(int32 number) public returns(int32)
	{
			int32 sum = int32(0);
			for(int32 i = int32(1); i <= limit; ++i;)
			{
					if(number % i == 0)
					{
							sum += i;
					}
			}
			return sum;
	}

}

library AliquotSum_Library
{
	function main(string[] memory args) public
	{
	}

	/**
 * Finds the aliquot sum of an integer number
 *
 * @param number a positive integer
 * @return aliquot sum of given {@code number}
 */

	function aliquotSum(int32 number) public returns(int32)
	{
			int32 sum = int32(0);
			for(int32 i = int32(1); i <= limit; ++i;)
			{
					if(number % i == 0)
					{
							sum += i;
					}
			}
			return sum;
	}

}

