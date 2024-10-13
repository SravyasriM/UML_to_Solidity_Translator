pragma solidity 0.7.5;

//package Conversions


/**
 * Converting Integers into Roman Numerals
 *
 * <p>('I', 1); ('IV',4); ('V', 5); ('IV',9); ('X', 10); ('XL',40; ('L', 50); ('XC',90); ('C', 100);
 * ('D', 500); ('M', 1000);
 */

contract IntegerToRoman
{
	function integerToRoman(int32 num) public returns(String)
	{
			if(num <= 0)
			{
					return "";
			}
			StringBuilder builder;
			for(int32 a = int32(0); a < allArabianRomanNumbers.length; a++;)
			{
					int32 times = int32(num / allArabianRomanNumbers[uint256(a)]);
					for(int32 b = int32(0); b < times; b++;)
					{
							builder.append(allRomanNumbers[uint256(a)]);
					}
					num -= times * allArabianRomanNumbers[uint256(a)];
			}
			return builder.toString();
	}

}

library IntegerToRoman_Library
{
	function integerToRoman(int32 num) public returns(String)
	{
			if(num <= 0)
			{
					return "";
			}
			StringBuilder builder;
			for(int32 a = int32(0); a < allArabianRomanNumbers.length; a++;)
			{
					int32 times = int32(num / allArabianRomanNumbers[uint256(a)]);
					for(int32 b = int32(0); b < times; b++;)
					{
							builder.append(allRomanNumbers[uint256(a)]);
					}
					num -= times * allArabianRomanNumbers[uint256(a)];
			}
			return builder.toString();
	}

	function main(string[] memory args) public
	{
			System.out.println(IntegerToRoman.integerToRoman(2131));
	}

}

