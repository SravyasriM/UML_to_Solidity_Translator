pragma solidity 0.7.5;

//package Conversions


import "java/util/Scanner.sol";

/**
 * This class converts Decimal numbers to Octal Numbers
 */

contract DecimalToOctal
{
}

library DecimalToOctal_Library
{
	// enter in a decimal value to get Octal output

	function main(string[] memory args) public
	{
			Scanner sc;
			int32 n;
			System.out.print("Decimal number: ");
			n = sc.nextInt();
			k = n;
			while(k != 0)
			{
					d = k % 8;
					s += d * int32(Math.pow(10, c++;))
					k /= 8;

			}
			sc.close();
	}

}

