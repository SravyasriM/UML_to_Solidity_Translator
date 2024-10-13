pragma solidity 0.7.5;

//package Conversions


import "java/util/Scanner.sol";

/**
 * This class converts a Binary number to a Decimal number
 */

contract BinaryToDecimal
{
}

library BinaryToDecimal_Library
{
	/**
 * Main Method
 *
 * @param args Command line arguments
 */

	function main(string[] memory args) public
	{
			Scanner sc;
			int32 binNum;
			System.out.print("Binary number: ");
			binNum = sc.nextInt();
			binCopy = binNum;
			while(binCopy != 0)
			{
					d = binCopy % 10;
					s += d * int32(Math.pow(2, power++;))
					binCopy /= 10;

			}
			sc.close();
	}

}

