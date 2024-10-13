pragma solidity 0.7.5;

//package Maths


contract SumOfDigits
{
	/**
 * Calculate the sum of digits of a number
 *
 * @param number the number contains digits
 * @return sum of digits of given {@code number}
 */

	function sumOfDigits(int32 number) public returns(int32)
	{
			number = number < 0 ? -number; : number
			/* calculate abs value */

			int32 sum = int32(0);
			while(number != 0)
			{
					sum += number % 10;
					number /= 10;

			}
			return sum;
	}

	/**
 * Calculate the sum of digits of a number using recursion
 *
 * @param number the number contains digits
 * @return sum of digits of given {@code number}
 */

	function sumOfDigitsRecursion(int32 number) public returns(int32)
	{
			number = number < 0 ? -number; : number
			/* calculate abs value */

			return number < 10 ? number : number % 10 + sumOfDigitsRecursion(number / 10);
	}

	/**
 * Calculate the sum of digits of a number using char array
 *
 * @param number the number contains digits
 * @return sum of digits of given {@code number}
 */

	function sumOfDigitsFast(int32 number) public returns(int32)
	{
			number = number < 0 ? -number; : number
			int32 sum = int32(0);
			for(int32 i = int32(0); i < digits.length; ++i;)
			{
					sum += digits[uint256(i)] - "0";
			}
			return sum;
	}

}

library SumOfDigits_Library
{
	function main(string[] memory args) public
	{
	}

	/**
 * Calculate the sum of digits of a number
 *
 * @param number the number contains digits
 * @return sum of digits of given {@code number}
 */

	function sumOfDigits(int32 number) public returns(int32)
	{
			number = number < 0 ? -number; : number
			/* calculate abs value */

			int32 sum = int32(0);
			while(number != 0)
			{
					sum += number % 10;
					number /= 10;

			}
			return sum;
	}

	/**
 * Calculate the sum of digits of a number using recursion
 *
 * @param number the number contains digits
 * @return sum of digits of given {@code number}
 */

	function sumOfDigitsRecursion(int32 number) public returns(int32)
	{
			number = number < 0 ? -number; : number
			/* calculate abs value */

			return number < 10 ? number : number % 10 + sumOfDigitsRecursion(number / 10);
	}

	/**
 * Calculate the sum of digits of a number using char array
 *
 * @param number the number contains digits
 * @return sum of digits of given {@code number}
 */

	function sumOfDigitsFast(int32 number) public returns(int32)
	{
			number = number < 0 ? -number; : number
			int32 sum = int32(0);
			for(int32 i = int32(0); i < digits.length; ++i;)
			{
					sum += digits[uint256(i)] - "0";
			}
			return sum;
	}

}

