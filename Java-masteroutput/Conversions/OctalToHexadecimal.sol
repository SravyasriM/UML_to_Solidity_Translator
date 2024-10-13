pragma solidity 0.7.5;

//package Conversions


import "java/util/Scanner.sol";

/**
 * Converts any Octal Number to HexaDecimal
 *
 * @author Tanmay Joshi
 */

contract OctalToHexadecimal
{
	/**
 * This method converts a Octal number to a decimal number
 *
 * @param s The Octal Number
 * @return The Decimal number
 */

	function octToDec(string s) public returns(int32)
	{
			int32 i = int32(0);
			for(int32 j = int32(0); j < s.length(); j++;)
			{
					byte num = byte(s.charAt(j));
					num -= "0";
					i *= 8;
					i += num;
			}
			return i;
	}

	/**
 * This method converts a Decimal number to a Hexadecimal number
 *
 * @param d The Decimal Number
 * @return The Hexadecimal number
 */

	function decimalToHex(int32 d) public returns(String)
	{
			string memory digits = string("0123456789ABCDEF");
			if(d <= 0)
			{
				return "0";			}
			string memory hex = string("");
			while(d > 0)
			{
					int32 digit = int32(d % 16);
					hex = digits.charAt(digit) + hex;
					d = d / 16;

			}
			return hex;
	}

}

library OctalToHexadecimal_Library
{
	/**
 * This method converts a Octal number to a decimal number
 *
 * @param s The Octal Number
 * @return The Decimal number
 */

	function octToDec(string s) public returns(int32)
	{
			int32 i = int32(0);
			for(int32 j = int32(0); j < s.length(); j++;)
			{
					byte num = byte(s.charAt(j));
					num -= "0";
					i *= 8;
					i += num;
			}
			return i;
	}

	/**
 * This method converts a Decimal number to a Hexadecimal number
 *
 * @param d The Decimal Number
 * @return The Hexadecimal number
 */

	function decimalToHex(int32 d) public returns(String)
	{
			string memory digits = string("0123456789ABCDEF");
			if(d <= 0)
			{
				return "0";			}
			string memory hex = string("");
			while(d > 0)
			{
					int32 digit = int32(d % 16);
					hex = digits.charAt(digit) + hex;
					d = d / 16;

			}
			return hex;
	}

	function main(string[] memory args) public
	{
			Scanner input;
			System.out.print("Enter the Octal number: ");
			// Take octal number as input from user in a string

			string memory oct = string(input.next());
			// Pass the octal number to function and get converted deciaml form

			int32 decimal = int32(octToDec(oct));
			// Pass the decimla number to function and get converted Hex form of the number

			string memory hex = string(decimalToHex(decimal));
			System.out.println("The Hexadecimal equivalant is: " + hex);
			input.close();
	}

}

