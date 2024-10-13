pragma solidity 0.7.5;

//package Conversions


// Driver program

contract AnyBaseToDecimal
{
	/**
 * Convert any radix to decimal number
 *
 * @param s the string to be convert
 * @param radix the radix
 * @return decimal of bits
 * @throws NumberFormatException if {@code bits} or {@code radix} is invalid
 */

	function convertToDecimal(string s, int32 radix) public returns(int32)
	{
			int32 num = int32(0);
			int32 pow = int32(1);
			for(int32 i = int32(s.length() - 1); i >= 0; i--;)
			{
					int32 digit = int32(valOfChar(s.charAt(i)));
					if(digit >= radix)
					{
					}
					num += valOfChar(s.charAt(i)) * pow;
					pow *= radix;
			}
			return num;
	}

	/**
 * Convert character to integer
 *
 * @param c the character
 * @return represented digit of given character
 * @throws NumberFormatException if {@code ch} is not UpperCase or Digit character.
 */

	function valOfChar(byte c) public returns(int32)
	{
			if(!(Character.isUpperCase(c) || Character.isDigit(c));)
			{
			}
			return Character.isDigit(c) ? c - "0" : c - "A" + 10;
	}

}

library AnyBaseToDecimal_Library
{
	function main(string[] memory args) public
	{
	}

	/**
 * Convert any radix to decimal number
 *
 * @param s the string to be convert
 * @param radix the radix
 * @return decimal of bits
 * @throws NumberFormatException if {@code bits} or {@code radix} is invalid
 */

	function convertToDecimal(string s, int32 radix) public returns(int32)
	{
			int32 num = int32(0);
			int32 pow = int32(1);
			for(int32 i = int32(s.length() - 1); i >= 0; i--;)
			{
					int32 digit = int32(valOfChar(s.charAt(i)));
					if(digit >= radix)
					{
					}
					num += valOfChar(s.charAt(i)) * pow;
					pow *= radix;
			}
			return num;
	}

	/**
 * Convert character to integer
 *
 * @param c the character
 * @return represented digit of given character
 * @throws NumberFormatException if {@code ch} is not UpperCase or Digit character.
 */

	function valOfChar(byte c) public returns(int32)
	{
			if(!(Character.isUpperCase(c) || Character.isDigit(c));)
			{
			}
			return Character.isDigit(c) ? c - "0" : c - "A" + 10;
	}

}

/*Optional.empty*/


