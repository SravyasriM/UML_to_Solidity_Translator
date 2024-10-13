pragma solidity 0.7.5;

//package Others


/**
 * @author Varun Upadhyay (https://github.com/varunu28)
 */

contract SieveOfEratosthenes
{
	/**
 * This method implements the Sieve of Eratosthenes Algorithm
 *
 * @param n The number till which we have to check for prime Prints all the prime numbers till n
 */

	function findPrimesTillN(int32 n) public
	{
			for(int32 i = int32(0); i <= n; i++;)
			{
					arr[uint256(i)] = 1;
			}
			arr[uint256(0)] = arr[uint256(1)] = 0;
			for(int32 i = int32(2); i <= Math.sqrt(n); i++;)
			{
					if(arr[uint256(i)] == 1)
					{
							for(int32 j = int32(2); i * j <= n; j++;)
							{
									arr[uint256(i * j)] = 0;
							}
					}
			}
			for(int32 i = int32(0); i < n + 1; i++;)
			{
					if(arr[uint256(i)] == 1)
					{
							System.out.print(i + " ");
					}
			}
			System.out.println();
	}

}

library SieveOfEratosthenes_Library
{
	/**
 * This method implements the Sieve of Eratosthenes Algorithm
 *
 * @param n The number till which we have to check for prime Prints all the prime numbers till n
 */

	function findPrimesTillN(int32 n) public
	{
			for(int32 i = int32(0); i <= n; i++;)
			{
					arr[uint256(i)] = 1;
			}
			arr[uint256(0)] = arr[uint256(1)] = 0;
			for(int32 i = int32(2); i <= Math.sqrt(n); i++;)
			{
					if(arr[uint256(i)] == 1)
					{
							for(int32 j = int32(2); i * j <= n; j++;)
							{
									arr[uint256(i * j)] = 0;
							}
					}
			}
			for(int32 i = int32(0); i < n + 1; i++;)
			{
					if(arr[uint256(i)] == 1)
					{
							System.out.print(i + " ");
					}
			}
			System.out.println();
	}

	// Driver Program

	function main(string[] memory args) public
	{
			int32 n = int32(100);
			// Prints 2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97

			findPrimesTillN(n);
	}

}

