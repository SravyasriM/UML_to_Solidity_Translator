pragma solidity 0.7.5;

//package Maths


import "java/util/Scanner.sol";

contract PrimeCheck
{
	/**
 * Checks if a number is prime or not
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

}

library PrimeCheck_Library
{
	function main(string[] memory args) public
	{
			Scanner scanner;
			System.out.print("Enter a number: ");
			int32 n = int32(scanner.nextInt());
			if(isPrime(n))
			{
					System.out.println(n + " is a prime number");
			}
			else
			{
					System.out.println(n + " is not a prime number");
			}

			scanner.close();
	}

	/**
 * Checks if a number is prime or not
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

}

