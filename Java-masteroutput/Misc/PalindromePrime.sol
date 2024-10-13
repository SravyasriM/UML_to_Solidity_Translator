pragma solidity 0.7.5;

//package Misc


import "java/util/Scanner.sol";

contract PalindromePrime
{
	function prime(int32 num) public returns(bool)
	{
			// checking if number is prime or not

			for(int32 divisor = int32(3); divisor <= Math.sqrt(num); divisor += 2;)
			{
					if(num % divisor == 0)
					{
							// false if not prime

							return false;
					}
			}
			// True if prime

			return true;
	}

	function reverse(int32 n) public returns(int32)
	{
			// Returns  the reverse of the number

			int32 reverse = int32(0);
			while(n != 0)
			{
					reverse *= 10;
					reverse += n % 10;
					n /= 10;

			}
			return reverse;
	}

	function functioning(int32 y) public
	{
			if(y == 0)
			{
				return 			}
			// print the first Palindromic Prime

			System.out.print(2 + "\n");
			int32 count = int32(1);
			int32 num = int32(3);
			while(count < y)
			{
					if(num == reverse(num) && prime(num))
					{
							// counts check when to terminate while loop

							count++;
							// print the Palindromic Prime

							System.out.print(num + "\n");
					}
					// inrease iterator value by two

					num += 2;

			}
	}

}

library PalindromePrime_Library
{
	function main(string[] memory args) public
	{
			// Main funtion

			Scanner in;
			System.out.println("Enter the quantity of First Palindromic Primes you want");
			// Input of how many first pallindromic prime we want

			int32 n = int32(in.nextInt());
			// calling function - functioning

			functioning(n);
			in.close();
	}

	function prime(int32 num) public returns(bool)
	{
			// checking if number is prime or not

			for(int32 divisor = int32(3); divisor <= Math.sqrt(num); divisor += 2;)
			{
					if(num % divisor == 0)
					{
							// false if not prime

							return false;
					}
			}
			// True if prime

			return true;
	}

	function reverse(int32 n) public returns(int32)
	{
			// Returns  the reverse of the number

			int32 reverse = int32(0);
			while(n != 0)
			{
					reverse *= 10;
					reverse += n % 10;
					n /= 10;

			}
			return reverse;
	}

	function functioning(int32 y) public
	{
			if(y == 0)
			{
				return 			}
			// print the first Palindromic Prime

			System.out.print(2 + "\n");
			int32 count = int32(1);
			int32 num = int32(3);
			while(count < y)
			{
					if(num == reverse(num) && prime(num))
					{
							// counts check when to terminate while loop

							count++;
							// print the Palindromic Prime

							System.out.print(num + "\n");
					}
					// inrease iterator value by two

					num += 2;

			}
	}

}

