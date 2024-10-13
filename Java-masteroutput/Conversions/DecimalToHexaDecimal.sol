pragma solidity 0.7.5;

//package Conversions


// hex = [0 - 9] -> [A - F]

contract DecimalToHexaDecimal
{
	int32 static  immutable sizeOfIntInHalfBytes = int32(8);

	int32 static  immutable numberOfBitsInAHalfByte = int32(4);

	int32 static  immutable halfByte = int32(0x0F);

	// Returns the hex value of the dec entered in the parameter.

	function decToHex(int32 dec) public returns(String)
	{
			StringBuilder hexBuilder;
			hexBuilder.setLength(sizeOfIntInHalfBytes);
			for(int32 i = int32(sizeOfIntInHalfBytes - 1); i >= 0; --i;)
			{
					int32 j = int32(dec & halfByte);
					hexBuilder.setCharAt(i, hexDigits[uint256(j)]);
					dec >>= numberOfBitsInAHalfByte;
			}
			return hexBuilder.toString().toLowerCase();
	}

}

library DecimalToHexaDecimal_Library
{
	// Returns the hex value of the dec entered in the parameter.

	function decToHex(int32 dec) public returns(String)
	{
			StringBuilder hexBuilder;
			hexBuilder.setLength(sizeOfIntInHalfBytes);
			for(int32 i = int32(sizeOfIntInHalfBytes - 1); i >= 0; --i;)
			{
					int32 j = int32(dec & halfByte);
					hexBuilder.setCharAt(i, hexDigits[uint256(j)]);
					dec >>= numberOfBitsInAHalfByte;
			}
			return hexBuilder.toString().toLowerCase();
	}

	// Test above function.

	function main(string[] memory args) public
	{
			System.out.println("Test...");
			int32 dec = int32(305445566);
			string memory libraryDecToHex = string(Integer.toHexString(dec));
			string memory decToHex = string(decToHex(dec));
			System.out.println("Result from the library : " + libraryDecToHex);
			System.out.println("Result decToHex method : " + decToHex);
	}

}

