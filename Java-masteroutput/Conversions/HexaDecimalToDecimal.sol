pragma solidity 0.7.5;

//package Conversions


import "java/util/Scanner.sol";

contract HexaDecimalToDecimal
{
	// convert hexadecimal to decimal

	function getHexaToDec(string hex) public returns(int32)
	{
			string memory digits = string("0123456789ABCDEF");
			hex = hex.toUpperCase();
			int32 val = int32(0);
			for(int32 i = int32(0); i < hex.length(); i++;)
			{
					int32 d = int32(digits.indexOf(hex.charAt(i)));
					val = 16 * val + d;
			}
			return val;
	}

}

library HexaDecimalToDecimal_Library
{
	// convert hexadecimal to decimal

	function getHexaToDec(string hex) public returns(int32)
	{
			string memory digits = string("0123456789ABCDEF");
			hex = hex.toUpperCase();
			int32 val = int32(0);
			for(int32 i = int32(0); i < hex.length(); i++;)
			{
					int32 d = int32(digits.indexOf(hex.charAt(i)));
					val = 16 * val + d;
			}
			return val;
	}

	function main(string[] memory args) public
	{
			string memory hexa_Input;
			int32 dec_output;
			Scanner scan;
			System.out.print("Enter Hexadecimal Number : ");
			hexa_Input = scan.nextLine();
			dec_output = getHexaToDec(hexa_Input);
			/*
    Pass the string to the getHexaToDec function
    and it returns the decimal form in the variable dec_output.
    */

			System.out.println("Number in Decimal: " + dec_output);
			scan.close();
	}

}

