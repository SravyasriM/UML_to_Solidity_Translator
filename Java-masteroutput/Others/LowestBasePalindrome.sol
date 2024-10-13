pragma solidity 0.7.5;

//package Others


import "java/util/InputMismatchException.sol";

import "java/util/Scanner.sol";

/**
 * Class for finding the lowest base in which a given integer is a palindrome. Includes auxiliary
 * methods for converting between bases and reversing strings.
 *
 * <p>NOTE: There is potential for error, see note at line 63.
 *
 * @author RollandMichael
 * @version 2017.09.28
 */

contract LowestBasePalindrome
{
	/**
 * Given a number in base 10, returns the lowest base in which the number is represented by a
 * palindrome (read the same left-to-right and right-to-left).
 *
 * @param num A number in base 10.
 * @return The lowest base in which num is a palindrome.
 */

	function lowestBasePalindrome(int32 num) public returns(int32)
	{
			int32 base;
			int32 digit;
			byte digitC;
			bool foundBase = bool(false);
			string memory newNum = string("");
			string memory digits = string("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ");
			while(!foundBase;)
			{
					// Try from bases 2 to num-1

					for(base = 2; base < num2; base++;)
					{
							newNum = "";
							while(num > 0)
							{
									// until n is <=0 and the number in the new base is obtained.

									digit = (num % base);
									num /= base;
									// in the current base.

									if(digit >= digits.length())
									{
											digitC = byte((digit));
											newNum += digitC;
											continue;
									}
									newNum += digits.charAt(digit);

							}
							// Num is assigned back its original value for the next iteration.

							num = num2;
							// Auxiliary method reverses the number.

							string memory reverse = reverse(newNum);
							// The current base is returned.

							if(reverse.equals(newNum))
							{
									foundBase = true;
									return base;
							}
					}

			}
			// If all else fails, n is always a palindrome in base n-1. ("11")

			return num - 1;
	}

	function reverse(string str) private returns(String)
	{
			string memory reverse = string("");
			for(int32 i = int32(str.length() - 1); i >= 0; i--;)
			{
					reverse += str.charAt(i);
			}
			return reverse;
	}

	function base2base(string n, int32 b1, int32 b2) private returns(String)
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

library LowestBasePalindrome_Library
{
	function main(string[] memory args) public
	{
			Scanner in;
			int32 n = int32(0);
			while(true)
			{
						//try

							System.out.print("Enter number: ");
							n = in.nextInt();
							break;

						/* catch (InputMismatchException e) {
    System.out.println("Invalid input!");
    in.next();
}*/



			}
			System.out.println(n + " is a palindrome in base " + lowestBasePalindrome(n));
			System.out.println(base2base(Integer.toString(n), 10, lowestBasePalindrome(n)));
			in.close();
	}

	/**
 * Given a number in base 10, returns the lowest base in which the number is represented by a
 * palindrome (read the same left-to-right and right-to-left).
 *
 * @param num A number in base 10.
 * @return The lowest base in which num is a palindrome.
 */

	function lowestBasePalindrome(int32 num) public returns(int32)
	{
			int32 base;
			int32 digit;
			byte digitC;
			bool foundBase = bool(false);
			string memory newNum = string("");
			string memory digits = string("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ");
			while(!foundBase;)
			{
					// Try from bases 2 to num-1

					for(base = 2; base < num2; base++;)
					{
							newNum = "";
							while(num > 0)
							{
									// until n is <=0 and the number in the new base is obtained.

									digit = (num % base);
									num /= base;
									// in the current base.

									if(digit >= digits.length())
									{
											digitC = byte((digit));
											newNum += digitC;
											continue;
									}
									newNum += digits.charAt(digit);

							}
							// Num is assigned back its original value for the next iteration.

							num = num2;
							// Auxiliary method reverses the number.

							string memory reverse = reverse(newNum);
							// The current base is returned.

							if(reverse.equals(newNum))
							{
									foundBase = true;
									return base;
							}
					}

			}
			// If all else fails, n is always a palindrome in base n-1. ("11")

			return num - 1;
	}

	function reverse(string str) private returns(String)
	{
			string memory reverse = string("");
			for(int32 i = int32(str.length() - 1); i >= 0; i--;)
			{
					reverse += str.charAt(i);
			}
			return reverse;
	}

	function base2base(string n, int32 b1, int32 b2) private returns(String)
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

