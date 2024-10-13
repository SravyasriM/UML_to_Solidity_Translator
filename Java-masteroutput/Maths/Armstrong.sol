pragma solidity 0.7.5;

//package Maths


/**
 * An Armstrong number is equal to the sum of the cubes of its digits. For example, 370 is an
 * Armstrong number because 3*3*3 + 7*7*7 + 0*0*0 = 370. An Armstrong number is often called
 * Narcissistic number.
 */

contract Armstrong
{
	/**
 * Checks whether a given number is an armstrong number or not.
 *
 * @param number number to check
 * @return {@code true} if given number is armstrong number, {@code false} otherwise
 */

	function isArmStrong(int32 number) private returns(bool)
	{
			int32 sum = int32(0);
			int32 temp = int32(number);
			int32 numberOfDigits = int32(0);
			while(temp != 0)
			{
					numberOfDigits++;
					temp /= 10;

			}
			temp = number;
			/* copy number again */

			while(number > 0)
			{
					int32 remainder = int32(number % 10);
					int32 power = int32(1);
					sum = sum + power;
					number /= 10;

			}
			return sum == temp;
	}

}

library Armstrong_Library
{
	function main(string[] memory args) public
	{
	}

	/**
 * Checks whether a given number is an armstrong number or not.
 *
 * @param number number to check
 * @return {@code true} if given number is armstrong number, {@code false} otherwise
 */

	function isArmStrong(int32 number) private returns(bool)
	{
			int32 sum = int32(0);
			int32 temp = int32(number);
			int32 numberOfDigits = int32(0);
			while(temp != 0)
			{
					numberOfDigits++;
					temp /= 10;

			}
			temp = number;
			/* copy number again */

			while(number > 0)
			{
					int32 remainder = int32(number % 10);
					int32 power = int32(1);
					sum = sum + power;
					number /= 10;

			}
			return sum == temp;
	}

}

