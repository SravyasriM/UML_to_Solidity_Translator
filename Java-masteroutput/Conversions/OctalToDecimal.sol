pragma solidity 0.7.5;

//package Conversions


import "java/util/Scanner.sol";

/**
 * Converts any Octal Number to a Decimal Number
 *
 * @author Zachary Jones
 */

contract OctalToDecimal
{
	/**
 * This method converts an octal number to a decimal number.
 *
 * @param inputOctal The octal number
 * @return The decimal number
 */

	function convertOctalToDecimal(string inputOctal) public returns(int32)
	{
				//try

					// Actual conversion of Octal to Decimal:

					Integer outputDecimal = Integer(Integer.parseInt(inputOctal, 8));
					return outputDecimal;

				/* catch (NumberFormatException ne) {
    // Printing a warning message if the input is not a valid octal
    // number:
    System.out.println("Invalid Input, Expecting octal number 0-7");
    return -1;
}*/


	}

}

library OctalToDecimal_Library
{
	/**
 * Main method
 *
 * @param args Command line arguments
 */

	function main(string[] memory args) public
	{
			Scanner sc;
			System.out.print("Octal Input: ");
			string memory inputOctal = string(sc.nextLine());
			int32 result = int32(convertOctalToDecimal(inputOctal));
			if(result != -1;)
			{
				System.out.println("Result convertOctalToDecimal : " + result);			}
			sc.close();
	}

	/**
 * This method converts an octal number to a decimal number.
 *
 * @param inputOctal The octal number
 * @return The decimal number
 */

	function convertOctalToDecimal(string inputOctal) public returns(int32)
	{
				//try

					// Actual conversion of Octal to Decimal:

					Integer outputDecimal = Integer(Integer.parseInt(inputOctal, 8));
					return outputDecimal;

				/* catch (NumberFormatException ne) {
    // Printing a warning message if the input is not a valid octal
    // number:
    System.out.println("Invalid Input, Expecting octal number 0-7");
    return -1;
}*/


	}

}

