pragma solidity 0.7.5;

//package ProjectEuler


/**
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 *
 * <p>Find the sum of all the primes below two million.
 *
 * <p>link: https://projecteuler.net/problem=10
 */

contract Problem10
{
	/**
 * Checks if a number is prime or not
 * @param n the number
 * @return {@code true} if {@code n} is prime
 */

	function isPrime(int32 n) private returns(bool)
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

	function solution1(int64 n) private returns(int64)
	{
			int64 sum = int64(0);
			for(int32 i = int32(2); i < n; ++i;)
			{
					if(isPrime(i))
					{
							sum += i;
					}
			}
			return sum;
	}

}

library Problem10_Library
{
	function main(string[] memory args) public
	{
			for(uint256 iterator_var = uint256(0); iterator_var < testNumbers.length; iterator_var++;)
			{
					int64[] testNumber = [int64(estNumbers[uint256(iterator_var))];
			}
	}

	/**
 * Checks if a number is prime or not
 * @param n the number
 * @return {@code true} if {@code n} is prime
 */

	function isPrime(int32 n) private returns(bool)
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

	function solution1(int64 n) private returns(int64)
	{
			int64 sum = int64(0);
			for(int32 i = int32(2); i < n; ++i;)
			{
					if(isPrime(i))
					{
							sum += i;
					}
			}
			return sum;
	}

}

