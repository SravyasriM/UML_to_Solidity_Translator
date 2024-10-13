pragma solidity 0.7.5;

//package Maths


/**
 * In number theory, a perfect number is a positive integer that is equal to the sum of its positive
 * divisors, excluding the number itself. For instance, 6 has divisors 1, 2 and 3 (excluding
 * itself), and 1 + 2 + 3 = 6, so 6 is a perfect number.
 *
 * <p>link:https://en.wikipedia.org/wiki/Perfect_number
 */

contract PerfectNumber
{
	/**
 * Check if {@code number} is perfect number or not
 *
 * @param number the number
 * @return {@code true} if {@code number} is perfect number, otherwise false
 */

	function isPerfectNumber(int32 number) public returns(bool)
	{
			int32 sum = int32(0);
			/* sum of its positive divisors */

			for(int32 i = int32(1); i < number; ++i;)
			{
					if(number % i == 0)
					{
							sum += i;
					}
			}
			return sum == number;
	}

}

library PerfectNumber_Library
{
	function main(string[] memory args) public
	{
	}

	/**
 * Check if {@code number} is perfect number or not
 *
 * @param number the number
 * @return {@code true} if {@code number} is perfect number, otherwise false
 */

	function isPerfectNumber(int32 number) public returns(bool)
	{
			int32 sum = int32(0);
			/* sum of its positive divisors */

			for(int32 i = int32(1); i < number; ++i;)
			{
					if(number % i == 0)
					{
							sum += i;
					}
			}
			return sum == number;
	}

}

