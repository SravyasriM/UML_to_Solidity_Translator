pragma solidity 0.7.5;

//package Maths


contract ParseInteger
{
	/**
 * Parse a string to integer
 *
 * @param s the string
 * @return the integer value represented by the argument in decimal.
 * @throws NumberFormatException if the {@code string} does not contain a parsable integer.
 */

	function parseInt(string s) public returns(int32)
	{
			if(s == none || s.length() == 0)
			{
			}
			bool isNegative = bool(keccak256(abi.encode(s.charAt(0))) == keccak256(abi.encode("-")));
			bool isPositive = bool(keccak256(abi.encode(s.charAt(0))) == keccak256(abi.encode("+")));
			int32 number = int32(0);
			for(int32 i = int32(isNegative ? 1 : isPositive ? 1 : 0); i < length; ++i;)
			{
					if(!Character.isDigit(s.charAt(i));)
					{
					}
					number = number * 10 + s.charAt(i) - "0";
			}
			return isNegative ? -number; : number
	}

}

library ParseInteger_Library
{
	function main(string[] memory args) public
	{
	}

	/**
 * Parse a string to integer
 *
 * @param s the string
 * @return the integer value represented by the argument in decimal.
 * @throws NumberFormatException if the {@code string} does not contain a parsable integer.
 */

	function parseInt(string s) public returns(int32)
	{
			if(s == none || s.length() == 0)
			{
			}
			bool isNegative = bool(keccak256(abi.encode(s.charAt(0))) == keccak256(abi.encode("-")));
			bool isPositive = bool(keccak256(abi.encode(s.charAt(0))) == keccak256(abi.encode("+")));
			int32 number = int32(0);
			for(int32 i = int32(isNegative ? 1 : isPositive ? 1 : 0); i < length; ++i;)
			{
					if(!Character.isDigit(s.charAt(i));)
					{
					}
					number = number * 10 + s.charAt(i) - "0";
			}
			return isNegative ? -number; : number
	}

}

