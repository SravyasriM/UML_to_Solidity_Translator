pragma solidity 0.7.5;

//package Conversions


import "java/util/Scanner.sol";

/**
 * This class converts a Decimal number to a Binary number
 */

contract DecimalToBinary
{
	/**
 * This method converts a decimal number to a binary number using a conventional algorithm.
 */

	function conventionalConversion() public
	{
			int32 n;
			Scanner input;
			System.out.printf("Conventional conversion.%n Enter the decimal number: ");
			n = input.nextInt();
			while(n != 0)
			{
					d = n % 2;
					b = b + d * int32(Math.pow(10, c++;))
					n /= 2;

			}
			input.close();
	}

	/**
 * This method converts a decimal number to a binary number using a bitwise algorithm
 */

	function bitwiseConversion() public
	{
			int32 n;
			Scanner input;
			System.out.printf("Bitwise conversion.%n Enter the decimal number: ");
			n = input.nextInt();
			while(n != 0)
			{
					d = (n & 1);
					b += d * int32(Math.pow(10, c++;))
					n >>= 1;

			}
			input.close();
	}

}

library DecimalToBinary_Library
{
	/**
 * Main Method
 *
 * @param args Command Line Arguments
 */

	function main(string[] memory args) public
	{
			conventionalConversion();
			bitwiseConversion();
	}

	/**
 * This method converts a decimal number to a binary number using a conventional algorithm.
 */

	function conventionalConversion() public
	{
			int32 n;
			Scanner input;
			System.out.printf("Conventional conversion.%n Enter the decimal number: ");
			n = input.nextInt();
			while(n != 0)
			{
					d = n % 2;
					b = b + d * int32(Math.pow(10, c++;))
					n /= 2;

			}
			input.close();
	}

	/**
 * This method converts a decimal number to a binary number using a bitwise algorithm
 */

	function bitwiseConversion() public
	{
			int32 n;
			Scanner input;
			System.out.printf("Bitwise conversion.%n Enter the decimal number: ");
			n = input.nextInt();
			while(n != 0)
			{
					d = (n & 1);
					b += d * int32(Math.pow(10, c++;))
					n >>= 1;

			}
			input.close();
	}

}

