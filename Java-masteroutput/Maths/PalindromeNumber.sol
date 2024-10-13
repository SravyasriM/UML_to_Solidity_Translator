pragma solidity 0.7.5;

//package Maths


contract PalindromeNumber
{
	/**
 * Check if {@code n} is palindrome number or not
 *
 * @param number the number
 * @return {@code true} if {@code n} is palindrome number, otherwise {@code false}
 */

	function isPalindrome(int32 number) public returns(bool)
	{
			if(number < 0)
			{
			}
			int32 numberCopy = int32(number);
			int32 reverseNumber = int32(0);
			while(numberCopy != 0)
			{
					int32 remainder = int32(numberCopy % 10);
					reverseNumber = reverseNumber * 10 + remainder;
					numberCopy /= 10;

			}
			return number == reverseNumber;
	}

}

library PalindromeNumber_Library
{
	function main(string[] memory args) public
	{
	}

	/**
 * Check if {@code n} is palindrome number or not
 *
 * @param number the number
 * @return {@code true} if {@code n} is palindrome number, otherwise {@code false}
 */

	function isPalindrome(int32 number) public returns(bool)
	{
			if(number < 0)
			{
			}
			int32 numberCopy = int32(number);
			int32 reverseNumber = int32(0);
			while(numberCopy != 0)
			{
					int32 remainder = int32(numberCopy % 10);
					reverseNumber = reverseNumber * 10 + remainder;
					numberCopy /= 10;

			}
			return number == reverseNumber;
	}

}

