pragma solidity 0.7.5;

//package Maths


/**
 * https://en.wikipedia.org/wiki/Pythagorean_triple
 */

contract PythagoreanTriple
{
	/**
 * Check if a,b,c are a Pythagorean Triple
 *
 * @param a x/y component length of a right triangle
 * @param b y/x component length of a right triangle
 * @param c hypotenuse length of a right triangle
 * @return boolean <tt>true</tt> if a, b, c satisfy the Pythagorean theorem, otherwise
 *     <tt>false</tt>
 */

	function isPythagTriple(int32 a, int32 b, int32 c) public returns(bool)
	{
			if(a <= 0 || b <= 0 || c <= 0)
			{
					return false;
			}
			else
			{
					return (a * a) + (b * b) == (c * c);
			}

	}

}

library PythagoreanTriple_Library
{
	function main(string[] memory args) public
	{
	}

	/**
 * Check if a,b,c are a Pythagorean Triple
 *
 * @param a x/y component length of a right triangle
 * @param b y/x component length of a right triangle
 * @param c hypotenuse length of a right triangle
 * @return boolean <tt>true</tt> if a, b, c satisfy the Pythagorean theorem, otherwise
 *     <tt>false</tt>
 */

	function isPythagTriple(int32 a, int32 b, int32 c) public returns(bool)
	{
			if(a <= 0 || b <= 0 || c <= 0)
			{
					return false;
			}
			else
			{
					return (a * a) + (b * b) == (c * c);
			}

	}

}

