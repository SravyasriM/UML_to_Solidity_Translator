pragma solidity 0.7.5;

//package Conversions


import "java/io/BufferedReader.sol";

import "java/io/InputStreamReader.sol";

import "java/util/ArrayList.sol";

// Driver Program

contract DecimalToAnyBase
{
	/**
 * This method produces a String value of any given input decimal in any base
 *
 * @param inp Decimal of which we need the value in base in String format
 * @return string format of the converted value in the given base
 */

	function convertToAnyBase(int32 inp, int32 base) public returns(String)
	{
			ArrayList charArr;
			while(inp > 0)
			{
					inp /= base;

			}
			StringBuilder str;
			for(uint256 iterator_var = uint256(0); iterator_var < charArr.length; iterator_var++;)
			{
					Character ch = Character(charArr[uint256(iterator_var)]);
					str.append(ch);
			}
			return str.reverse().toString();
	}

	/**
 * This method produces character value of the input integer and returns it
 *
 * @param num integer of which we need the character value of
 * @return character value of input integer
 */

	function reVal(int32 num) public returns(byte)
	{
			if(num >= 0 && num <= 9)
			{
				return byte((num + "0"));			}
			else
			{
				return byte((num - 10 + "A"));			}

	}

}

library DecimalToAnyBase_Library
{
	function main(string[] memory args) public
	{
			BufferedReader br;
			System.out.println("Enter the decimal input below: ");
			int32 decInput = int32(Integer.parseInt(br.readLine()));
			System.out.println();
			System.out.println("Enter the base below: ");
			int32 base = int32(Integer.parseInt(br.readLine()));
			System.out.println();
			System.out.println("Decimal Input" + " is: " + decInput);
			System.out.println("Value of " + decInput + " in base " + base + " is: " + convertToAnyBase(decInput, base));
			br.close();
	}

	/**
 * This method produces a String value of any given input decimal in any base
 *
 * @param inp Decimal of which we need the value in base in String format
 * @return string format of the converted value in the given base
 */

	function convertToAnyBase(int32 inp, int32 base) public returns(String)
	{
			ArrayList charArr;
			while(inp > 0)
			{
					inp /= base;

			}
			StringBuilder str;
			for(uint256 iterator_var = uint256(0); iterator_var < charArr.length; iterator_var++;)
			{
					Character ch = Character(charArr[uint256(iterator_var)]);
					str.append(ch);
			}
			return str.reverse().toString();
	}

	/**
 * This method produces character value of the input integer and returns it
 *
 * @param num integer of which we need the character value of
 * @return character value of input integer
 */

	function reVal(int32 num) public returns(byte)
	{
			if(num >= 0 && num <= 9)
			{
				return byte((num + "0"));			}
			else
			{
				return byte((num - 10 + "A"));			}

	}

}

/*Optional.empty*/


