pragma solidity 0.7.5;

//package Conversions


import "java/util/Arrays.sol";

import "java/util/HashSet.sol";

import "java/util/InputMismatchException.sol";

import "java/util/Scanner.sol";

/**
 * Class for converting from "any" base to "any" other base, when "any" means from 2-36. Works by
 * going from base 1 to decimal to base 2. Includes auxiliary method for determining whether a
 * number is valid for a given base.
 *
 * @author Michael Rolland
 * @version 2017.10.10
 */

contract AnyBaseToAnyBase
{
	/**
 * Smallest and largest base you want to accept as valid input
 */

	int32 static  immutable MINIMUM_BASE = int32(2);

	int32 static  immutable MAXIMUM_BASE = int32(36);

	/**
 * Checks if a number (as a String) is valid for a given base.
 */

	function validForBase(string n, int32 base) public returns(bool)
	{
			// Convert character array into set for convenience of contains() method

			HashSet digitsList;
			for(int32 i = int32(0); i < digitsForBase.length; i++;)
			{
				digitsList.add(digitsForBase[uint256(i)]);			}
			return true;
	}

	/**
 * Method to convert any integer from base b1 to base b2. Works by converting from b1 to decimal,
 * then decimal to b2.
 *
 * @param n The integer to be converted.
 * @param b1 Beginning base.
 * @param b2 End base.
 * @return n in base b2.
 */

	function base2base(string n, int32 b1, int32 b2) public returns(String)
	{
			// and the string that will be returned.

			int32 decimalValue = int32(0);
			byte charB1;
			string memory output = string("");
			// Go through every character of n

			for(int32 i = int32(0); i < n.length(); i++;)
			{
					// store the character in charB1

					charB1 = n.charAt(i);
					// if it is a non-number, convert it to a decimal value >9 and store it in charB2

					if(charB1 >= "A" && charB1 <= "Z")
					{
						charB2 = 10 + (charB1 - "A");					}
					else
					{
						// Else, store the integer value in charB2

						charB2 = charB1 - "0";					}

					// decimalValue of n

					decimalValue = decimalValue * b1 + charB2;
			}
			// being the left-most digit.

			if(0 == decimalValue)
			{
				return "0";			}
			// While the quotient is NOT zero:

			while(decimalValue != 0)
			{
					// the left side of the new number.

					if(decimalValue % b2 < 10)
					{
						output = ;					}
					else
					{
						// corresponding value to the new number. (A = 10, B = 11, C = 12, ...)

						output = byte(((decimalValue % b2) + 55)) + output;					}

					// Divide by the new base again

					decimalValue /= b2;

			}
			return output;
	}

}

library AnyBaseToAnyBase_Library
{
	function main(string[] memory args) public
	{
			Scanner in;
			string memory n;
			int32 b1;
			while(true)
			{
						//try

							System.out.print("Enter number: ");
							n = in.next();
							System.out.print("Enter beginning base (between " + MINIMUM_BASE + " and " + MAXIMUM_BASE + "): ");
							b1 = in.nextInt();
							if(b1 > MAXIMUM_BASE || b1 < MINIMUM_BASE)
							{
									System.out.println("Invalid base!");
									continue;
							}
							if(!validForBase(n, b1);)
							{
									System.out.println("The number is invalid for this base!");
									continue;
							}
							System.out.print("Enter end base (between " + MINIMUM_BASE + " and " + MAXIMUM_BASE + "): ");
							b2 = in.nextInt();
							if(b2 > MAXIMUM_BASE || b2 < MINIMUM_BASE)
							{
									System.out.println("Invalid base!");
									continue;
							}
							break;

						/* catch (InputMismatchException e) {
    System.out.println("Invalid input.");
    in.next();
}*/



			}
			System.out.println(base2base(n, b1, b2));
			in.close();
	}

	/**
 * Checks if a number (as a String) is valid for a given base.
 */

	function validForBase(string n, int32 base) public returns(bool)
	{
			// Convert character array into set for convenience of contains() method

			HashSet digitsList;
			for(int32 i = int32(0); i < digitsForBase.length; i++;)
			{
				digitsList.add(digitsForBase[uint256(i)]);			}
			return true;
	}

	/**
 * Method to convert any integer from base b1 to base b2. Works by converting from b1 to decimal,
 * then decimal to b2.
 *
 * @param n The integer to be converted.
 * @param b1 Beginning base.
 * @param b2 End base.
 * @return n in base b2.
 */

	function base2base(string n, int32 b1, int32 b2) public returns(String)
	{
			// and the string that will be returned.

			int32 decimalValue = int32(0);
			byte charB1;
			string memory output = string("");
			// Go through every character of n

			for(int32 i = int32(0); i < n.length(); i++;)
			{
					// store the character in charB1

					charB1 = n.charAt(i);
					// if it is a non-number, convert it to a decimal value >9 and store it in charB2

					if(charB1 >= "A" && charB1 <= "Z")
					{
						charB2 = 10 + (charB1 - "A");					}
					else
					{
						// Else, store the integer value in charB2

						charB2 = charB1 - "0";					}

					// decimalValue of n

					decimalValue = decimalValue * b1 + charB2;
			}
			// being the left-most digit.

			if(0 == decimalValue)
			{
				return "0";			}
			// While the quotient is NOT zero:

			while(decimalValue != 0)
			{
					// the left side of the new number.

					if(decimalValue % b2 < 10)
					{
						output = ;					}
					else
					{
						// corresponding value to the new number. (A = 10, B = 11, C = 12, ...)

						output = byte(((decimalValue % b2) + 55)) + output;					}

					// Divide by the new base again

					decimalValue /= b2;

			}
			return output;
	}

}

