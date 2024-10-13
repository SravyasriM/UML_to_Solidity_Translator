pragma solidity 0.7.5;

//package Conversions


import "java/util/Scanner.sol";

/**
 * Converts any Binary number to an Octal Number
 *
 * @author Zachary Jones
 */

contract BinaryToOctal
{
	/**
 * This method converts a binary number to an octal number.
 *
 * @param binary The binary number
 * @return The octal number
 */

	function convertBinaryToOctal(int32 binary) public returns(String)
	{
			string memory octal = string("");
			int32 currBit = int32(0);
			while(binary != 0)
			{
					int32 code3 = int32(0);
					for(int32 i = int32(0); i < 3; i++;)
					{
							currBit = binary % 10;
							binary = binary / 10;
							code3 += currBit * j;
							j *= 2;
					}
					octal = code3 + octal;
					j = 1;

			}
			return octal;
	}

}

library BinaryToOctal_Library
{
	/**
 * Main method
 *
 * @param args Command line arguments
 */

	function main(string[] memory args) public
	{
			Scanner sc;
			System.out.println("Input the binary number: ");
			int32 b = int32(sc.nextInt());
			System.out.println("Octal equivalent: " + convertBinaryToOctal(b));
			sc.close();
	}

	/**
 * This method converts a binary number to an octal number.
 *
 * @param binary The binary number
 * @return The octal number
 */

	function convertBinaryToOctal(int32 binary) public returns(String)
	{
			string memory octal = string("");
			int32 currBit = int32(0);
			while(binary != 0)
			{
					int32 code3 = int32(0);
					for(int32 i = int32(0); i < 3; i++;)
					{
							currBit = binary % 10;
							binary = binary / 10;
							code3 += currBit * j;
							j *= 2;
					}
					octal = code3 + octal;
					j = 1;

			}
			return octal;
	}

}

