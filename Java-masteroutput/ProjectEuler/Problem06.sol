pragma solidity 0.7.5;

//package ProjectEuler


/**
 * The sum of the squares of the first ten natural numbers is, 1^2 + 2^2 + ... + 10^2 = 385 The
 * square of the sum of the first ten natural numbers is, (1 + 2 + ... + 10)^2 = 552 = 3025 Hence
 * the difference between the sum of the squares of the first ten natural numbers and the square of
 * the sum is 3025 − 385 = 2640. Find the difference between the sum of the squares of the first N
 * natural numbers and the square of the sum.
 *
 * <p>link: https://projecteuler.net/problem=6
 */

contract Problem06
{
	function solution1(int32 n) private returns(int32)
	{
			int32 sum1 = int32(0);
			int32 sum2 = int32(0);
			for(int32 i = int32(1); i <= n; ++i;)
			{
					sum1 += i * i;
					sum2 += i;
			}
			return sum2 * sum2 - sum1;
	}

	function solutions2(int32 n) private returns(int32)
	{
			int32 sumOfSquares = int32(n * (n + 1) * (2 * n + 1) / 6);
			int32 squareOfSum = int32(int32(Math.pow((n * (n + 1) / 2), 2)));
			return squareOfSum - sumOfSquares;
	}

}

library Problem06_Library
{
	function main(string[] memory args) public
	{
			for(uint256 iterator_var = uint256(0); iterator_var < testNumbers.length; iterator_var++;)
			{
					int32[] testNumber = [int32(estNumbers[uint256(iterator_var))];
			}
	}

	function solution1(int32 n) private returns(int32)
	{
			int32 sum1 = int32(0);
			int32 sum2 = int32(0);
			for(int32 i = int32(1); i <= n; ++i;)
			{
					sum1 += i * i;
					sum2 += i;
			}
			return sum2 * sum2 - sum1;
	}

	function solutions2(int32 n) private returns(int32)
	{
			int32 sumOfSquares = int32(n * (n + 1) * (2 * n + 1) / 6);
			int32 squareOfSum = int32(int32(Math.pow((n * (n + 1) / 2), 2)));
			return squareOfSum - sumOfSquares;
	}

}

