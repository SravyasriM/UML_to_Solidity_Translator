pragma solidity 0.7.5;

//package Maths


/**
 * Fibonacci: 0 1 1 2 3 5 8 13 21 ...
 */

contract FibonacciNumber
{
	/**
 * Check if a number is perfect square number
 *
 * @param number the number to be checked
 * @return <tt>true</tt> if {@code number} is perfect square, otherwise <tt>false</tt>
 */

	function isPerfectSquare(int32 number) public returns(bool)
	{
			int32 sqrt = int32(int32(Math.sqrt(number)));
			return sqrt * sqrt == number;
	}

	/**
 * Check if a number is fibonacci number This is true if and only if at least one of 5x^2+4 or
 * 5x^2-4 is a perfect square
 *
 * @param number the number
 * @return <tt>true</tt> if {@code number} is fibonacci number, otherwise <tt>false</tt>
 * @link https://en.wikipedia.org/wiki/Fibonacci_number#Identification
 */

	function isFibonacciNumber(int32 number) public returns(bool)
	{
			return ;
	}

}

library FibonacciNumber_Library
{
	function main(string[] memory args) public
	{
	}

	/**
 * Check if a number is perfect square number
 *
 * @param number the number to be checked
 * @return <tt>true</tt> if {@code number} is perfect square, otherwise <tt>false</tt>
 */

	function isPerfectSquare(int32 number) public returns(bool)
	{
			int32 sqrt = int32(int32(Math.sqrt(number)));
			return sqrt * sqrt == number;
	}

	/**
 * Check if a number is fibonacci number This is true if and only if at least one of 5x^2+4 or
 * 5x^2-4 is a perfect square
 *
 * @param number the number
 * @return <tt>true</tt> if {@code number} is fibonacci number, otherwise <tt>false</tt>
 * @link https://en.wikipedia.org/wiki/Fibonacci_number#Identification
 */

	function isFibonacciNumber(int32 number) public returns(bool)
	{
			return ;
	}

}

