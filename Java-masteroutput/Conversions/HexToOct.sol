pragma solidity 0.7.5;

//package Conversions


import "java/util/Scanner.sol";

/**
 * Converts any Hexadecimal Number to Octal
 *
 * @author Tanmay Joshi
 */

contract HexToOct
{
	/**
 * This method converts a Hexadecimal number to a decimal number
 *
 * @param s The Hexadecimal Number
 * @return The Decimal number
 */

	function hex2decimal(string s) public returns(int32)
	{
			string memory str = string("0123456789ABCDEF");
			s = s.toUpperCase();
			int32 val = int32(0);
			for(int32 i = int32(0); i < s.length(); i++;)
			{
					byte a = byte(s.charAt(i));
					int32 n = int32(str.indexOf(a));
					val = 16 * val + n;
			}
			return val;
	}

	/**
 * This method converts a Decimal number to a octal number
 *
 * @param q The Decimal Number
 * @return The Octal number
 */

	function decimal2octal(int32 q) public returns(int32)
	{
			int32 now;
			int32 i = int32(1);
			int32 octnum = int32(0);
			while(q > 0)
			{
					now = q % 8;
					octnum = (now * int32((Math.pow(10, i)))) + octnum;
					q /= 8;
					i++;

			}
			octnum /= 10;
			return octnum;
	}

}

library HexToOct_Library
{
	/**
 * This method converts a Hexadecimal number to a decimal number
 *
 * @param s The Hexadecimal Number
 * @return The Decimal number
 */

	function hex2decimal(string s) public returns(int32)
	{
			string memory str = string("0123456789ABCDEF");
			s = s.toUpperCase();
			int32 val = int32(0);
			for(int32 i = int32(0); i < s.length(); i++;)
			{
					byte a = byte(s.charAt(i));
					int32 n = int32(str.indexOf(a));
					val = 16 * val + n;
			}
			return val;
	}

	/**
 * This method converts a Decimal number to a octal number
 *
 * @param q The Decimal Number
 * @return The Octal number
 */

	function decimal2octal(int32 q) public returns(int32)
	{
			int32 now;
			int32 i = int32(1);
			int32 octnum = int32(0);
			while(q > 0)
			{
					now = q % 8;
					octnum = (now * int32((Math.pow(10, i)))) + octnum;
					q /= 8;
					i++;

			}
			octnum /= 10;
			return octnum;
	}

	/**
 * Main method that gets the hex input from user and converts it into octal.
 *
 * @param args arguments
 */

	function main(string[] memory args) public
	{
			string memory hexadecnum;
			int32 decnum;
			Scanner scan;
			System.out.print("Enter Hexadecimal Number : ");
			hexadecnum = scan.nextLine();
			// first convert hexadecimal to decimal

			decnum = hex2decimal(hexadecnum);
			// convert decimal to octal

			octalnum = decimal2octal(decnum);
			scan.close();
	}

}

