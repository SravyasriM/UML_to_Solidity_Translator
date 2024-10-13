pragma solidity 0.7.5;

//package ProjectEuler


/**
 * By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is
 * 13.
 *
 * <p>What is the 10 001st prime number?
 *
 * <p>link: https://projecteuler.net/problem=7
 */

contract Problem07
{
	/**
 * Checks if a number is prime or not
 * @param number the number
 * @return {@code true} if {@code number} is prime
 */

	function isPrime(int32 number) private returns(bool)
	{
			if(number == 2)
			{
					return true;
			}
			if(number < 2 || number % 2 == 0)
			{
					return false;
			}
			for(int32 i = int32(3); i <= limit; i += 2;)
			{
					if(number % i == 0)
					{
							return false;
					}
			}
			return true;
	}

	function solution1(int32 n) private returns(int32)
	{
			int32 count = int32(0);
			int32 number = int32(1);
			while(count != n)
			{
					if(isPrime(++number;))
					{
							count++;
					}

			}
			return number;
	}

}

library Problem07_Library
{
	function main(string[] memory args) public
	{
			for(uint256 iterator_var = uint256(0); iterator_var < testNumbers.length; iterator_var++;)
			{
					int32[] number = [int32(estNumbers[uint256(iterator_var))];
			}
	}

	/**
 * Checks if a number is prime or not
 * @param number the number
 * @return {@code true} if {@code number} is prime
 */

	function isPrime(int32 number) private returns(bool)
	{
			if(number == 2)
			{
					return true;
			}
			if(number < 2 || number % 2 == 0)
			{
					return false;
			}
			for(int32 i = int32(3); i <= limit; i += 2;)
			{
					if(number % i == 0)
					{
							return false;
					}
			}
			return true;
	}

	function solution1(int32 n) private returns(int32)
	{
			int32 count = int32(0);
			int32 number = int32(1);
			while(count != n)
			{
					if(isPrime(++number;))
					{
							count++;
					}

			}
			return number;
	}

}

