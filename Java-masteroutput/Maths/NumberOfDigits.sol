pragma solidity 0.7.5;

//package Maths


/**
 * Find the number of digits in a number.
 */

contract NumberOfDigits
{
	/**
 * Find the number of digits in a number.
 *
 * @param number number to find
 * @return number of digits of given number
 */

	function numberOfDigits(int32 number) private returns(int32)
	{
			int32 digits = int32(0);
			do
			{
					digits++;
					number /= 10;

			}while(number != 0);
			return digits;
	}

	/**
 * Find the number of digits in a number fast version.
 *
 * @param number number to find
 * @return number of digits of given number
 */

	function numberOfDigitsFast(int32 number) private returns(int32)
	{
			return number == 0 ? 1 : int32(Math.floor(Math.log10(Math.abs(number)) + 1));
	}

	/**
 * Find the number of digits in a number faster version.
 *
 * @param number number to find
 * @return number of digits of given number
 */

	function numberOfDigitsFaster(int32 number) private returns(int32)
	{
			return number < 0 ? (-number; + "").length() : (number + "").length()
	}

	/**
 * Find the number of digits in a number using recursion.
 *
 * @param number number to find
 * @return number of digits of given number
 */

	function numberOfDigitsRecursion(int32 number) private returns(int32)
	{
			return number / 10 == 0 ? 1 : 1 + numberOfDigitsRecursion(number / 10);
	}

}

library NumberOfDigits_Library
{
	function main(string[] memory args) public
	{
			for(int32 i = int32(0); i < numbers.length; ++i;)
			{
			}
	}

	/**
 * Find the number of digits in a number.
 *
 * @param number number to find
 * @return number of digits of given number
 */

	function numberOfDigits(int32 number) private returns(int32)
	{
			int32 digits = int32(0);
			do
			{
					digits++;
					number /= 10;

			}while(number != 0);
			return digits;
	}

	/**
 * Find the number of digits in a number fast version.
 *
 * @param number number to find
 * @return number of digits of given number
 */

	function numberOfDigitsFast(int32 number) private returns(int32)
	{
			return number == 0 ? 1 : int32(Math.floor(Math.log10(Math.abs(number)) + 1));
	}

	/**
 * Find the number of digits in a number faster version.
 *
 * @param number number to find
 * @return number of digits of given number
 */

	function numberOfDigitsFaster(int32 number) private returns(int32)
	{
			return number < 0 ? (-number; + "").length() : (number + "").length()
	}

	/**
 * Find the number of digits in a number using recursion.
 *
 * @param number number to find
 * @return number of digits of given number
 */

	function numberOfDigitsRecursion(int32 number) private returns(int32)
	{
			return number / 10 == 0 ? 1 : 1 + numberOfDigitsRecursion(number / 10);
	}

}

