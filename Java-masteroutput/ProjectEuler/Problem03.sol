pragma solidity 0.7.5;

//package ProjectEuler


/**
 * The prime factors of 13195 are 5, 7, 13 and 29.
 *
 * <p>What is the largest prime factor of the number 600851475143 ?
 *
 * <p>Link: https://projecteuler.net/problem=3
 */

contract Problem03
{
	/**
 * Checks if a number is prime or not
 *
 * @param n the number
 * @return {@code true} if {@code n} is prime
 */

	function isPrime(int32 n) public returns(bool)
	{
			if(n == 2)
			{
					return true;
			}
			if(n < 2 || n % 2 == 0)
			{
					return false;
			}
			for(int32 i = int32(3); i <= limit; i += 2;)
			{
					if(n % i == 0)
					{
							return false;
					}
			}
			return true;
	}

	/**
 * Calculate all the prime factors of a number and return the largest
 *
 * @param n integer number
 * @return the maximum prime factor of the given number
 */

	function maxPrimeFactor(int64 n) internal returns(int64)
	{
			for(int32 i = int32(2); i < n / 2; i++;)
			{
					if(isPrime(i))
					{
						while(n % i == 0)
						{
								n /= i;

						}					}
			}
			return n;
	}

}

library Problem03_Library
{
	/**
 * Checks if a number is prime or not
 *
 * @param n the number
 * @return {@code true} if {@code n} is prime
 */

	function isPrime(int32 n) public returns(bool)
	{
			if(n == 2)
			{
					return true;
			}
			if(n < 2 || n % 2 == 0)
			{
					return false;
			}
			for(int32 i = int32(3); i <= limit; i += 2;)
			{
					if(n % i == 0)
					{
							return false;
					}
			}
			return true;
	}

	/**
 * Calculate all the prime factors of a number and return the largest
 *
 * @param n integer number
 * @return the maximum prime factor of the given number
 */

	function maxPrimeFactor(int64 n) internal returns(int64)
	{
			for(int32 i = int32(2); i < n / 2; i++;)
			{
					if(isPrime(i))
					{
						while(n % i == 0)
						{
								n /= i;

						}					}
			}
			return n;
	}

	function main(string[] memory args) public
	{
			for(uint256 iterator_var = uint256(0); iterator_var < testNumbers.length; iterator_var++;)
			{
					int32[] num = [int32(estNumbers[uint256(iterator_var))];
			}
	}

}

