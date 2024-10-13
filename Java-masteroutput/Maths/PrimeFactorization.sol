pragma solidity 0.7.5;

//package Maths


import "java/util/Scanner.sol";

contract PrimeFactorization
{
	function pfactors(int32 n) public
	{
			while(n % 2 == 0)
			{
					System.out.print(2 + " ");
					n /= 2;

			}
			for(int32 i = int32(3); i <= Math.sqrt(n); i += 2;)
			{
					while(n % i == 0)
					{
							System.out.print(i + " ");
							n /= i;

					}
			}
			if(n > 2)
			{
				System.out.print(n);			}
	}

}

library PrimeFactorization_Library
{
	function main(string[] memory args) public
	{
			System.out.println("## all prime factors ##");
			Scanner scanner;
			System.out.print("Enter a number: ");
			int32 n = int32(scanner.nextInt());
			System.out.print(("printing factors of " + n + " : "));
			pfactors(n);
			scanner.close();
	}

	function pfactors(int32 n) public
	{
			while(n % 2 == 0)
			{
					System.out.print(2 + " ");
					n /= 2;

			}
			for(int32 i = int32(3); i <= Math.sqrt(n); i += 2;)
			{
					while(n % i == 0)
					{
							System.out.print(i + " ");
							n /= i;

					}
			}
			if(n > 2)
			{
				System.out.print(n);			}
	}

}

