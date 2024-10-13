pragma solidity 0.7.5;

//package Maths


contract BinaryPow
{
	/**
 * Calculate a^p using binary exponentiation
 * [Binary-Exponentiation](https://cp-algorithms.com/algebra/binary-exp.html)
 *
 * @param a the base for exponentiation
 * @param p the exponent - must be greater than 0
 * @return a^p
 */

	function binPow(int32 a, int32 p) public returns(int32)
	{
			int32 res = int32(1);
			while(p > 0)
			{
					if((p & 1) == 1)
					{
							res = res * a;
					}
					a = a * a;
					p >>>= 1;

			}
			return res;
	}

	/**
 * Function for testing binary exponentiation
 *
 * @param a the base
 * @param p the exponent
 */

	function test(int32 a, int32 p) public
	{
			int32 res = int32(binPow(a, p));
	}

}

library BinaryPow_Library
{
	/**
 * Calculate a^p using binary exponentiation
 * [Binary-Exponentiation](https://cp-algorithms.com/algebra/binary-exp.html)
 *
 * @param a the base for exponentiation
 * @param p the exponent - must be greater than 0
 * @return a^p
 */

	function binPow(int32 a, int32 p) public returns(int32)
	{
			int32 res = int32(1);
			while(p > 0)
			{
					if((p & 1) == 1)
					{
							res = res * a;
					}
					a = a * a;
					p >>>= 1;

			}
			return res;
	}

	/**
 * Function for testing binary exponentiation
 *
 * @param a the base
 * @param p the exponent
 */

	function test(int32 a, int32 p) public
	{
			int32 res = int32(binPow(a, p));
	}

	/**
 * Main Function to call tests
 *
 * @param args System Line Arguments
 */

	function main(string[] memory args) public
	{
			// prints 2^15: 32768

			test(2, 15);
			// prints 3^9: 19683

			test(3, 9);
	}

}

