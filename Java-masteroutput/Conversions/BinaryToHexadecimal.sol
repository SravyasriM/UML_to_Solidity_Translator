pragma solidity 0.7.5;

//package Conversions


import "java/util.sol";

/**
 * Converts any Binary Number to a Hexadecimal Number
 *
 * @author Nishita Aggarwal
 */

contract BinaryToHexadecimal
{
	/**
 * This method converts a binary number to a hexadecimal number.
 *
 * @param binary The binary number
 * @return The hexadecimal number
 */

	function binToHex(int32 binary) internal returns(String)
	{
			// decimal numbers 0 to 15

			HashMap hm = new HashMap();
			// String to store hexadecimal code

			string memory hex = string("");
			int32 i;
			for(i = 0; i < 10; i++;)
			{
					hm.put(i, String.valueOf(i));
			}
			for(i = 10; i < 16; i++;)
			{
				hm.put(i, String.valueOf(byte(("A" + i - 10))));			}
			int32 currbit;
			while(binary != 0)
			{
					// to store decimal equivalent of number formed by 4 decimal digits

					int32 code4 = int32(0);
					for(i = 0; i < 4; i++;)
					{
							currbit = binary % 10;
							binary = binary / 10;
							code4 += currbit * Math.pow(2, i);
					}
					hex = hm.get(code4) + hex;

			}
			return hex;
	}

}

library BinaryToHexadecimal_Library
{
	/**
 * This method converts a binary number to a hexadecimal number.
 *
 * @param binary The binary number
 * @return The hexadecimal number
 */

	function binToHex(int32 binary) internal returns(String)
	{
			// decimal numbers 0 to 15

			HashMap hm = new HashMap();
			// String to store hexadecimal code

			string memory hex = string("");
			int32 i;
			for(i = 0; i < 10; i++;)
			{
					hm.put(i, String.valueOf(i));
			}
			for(i = 10; i < 16; i++;)
			{
				hm.put(i, String.valueOf(byte(("A" + i - 10))));			}
			int32 currbit;
			while(binary != 0)
			{
					// to store decimal equivalent of number formed by 4 decimal digits

					int32 code4 = int32(0);
					for(i = 0; i < 4; i++;)
					{
							currbit = binary % 10;
							binary = binary / 10;
							code4 += currbit * Math.pow(2, i);
					}
					hex = hm.get(code4) + hex;

			}
			return hex;
	}

	/**
 * Main method
 *
 * @param args Command line arguments
 */

	function main(string[] memory args) public
	{
			Scanner sc;
			System.out.println("Enter binary number:");
			int32 binary = int32(sc.nextInt());
			string memory hex = string(binToHex(binary));
			System.out.println("Hexadecimal Code:" + hex);
			sc.close();
	}

}

