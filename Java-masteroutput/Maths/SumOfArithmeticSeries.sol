pragma solidity 0.7.5;

//package Maths


/**
 * In mathematics, an arithmetic progression (AP) or arithmetic sequence is a sequence of numbers
 * such that the difference between the consecutive terms is constant. Difference here means the
 * second minus the first. For instance, the sequence 5, 7, 9, 11, 13, 15, . . . is an arithmetic
 * progression with common difference of 2.
 *
 * <p>Wikipedia: https://en.wikipedia.org/wiki/Arithmetic_progression
 */

contract SumOfArithmeticSeries
{
	/**
 * Calculate sum of arithmetic series
 *
 * @param firstTerm the initial term of an arithmetic series
 * @param commonDiff the common difference of an arithmetic series
 * @param numOfTerms the total terms of an arithmetic series
 * @return sum of given arithmetic series
 */

	function sumOfSeries(int64 firstTerm, int64 commonDiff, int32 numOfTerms) private returns(int64)
	{
			return numOfTerms / 2 * (2 * firstTerm + (numOfTerms - 1) * commonDiff);
	}

}

library SumOfArithmeticSeries_Library
{
	function main(string[] memory args) public
	{
	}

	/**
 * Calculate sum of arithmetic series
 *
 * @param firstTerm the initial term of an arithmetic series
 * @param commonDiff the common difference of an arithmetic series
 * @param numOfTerms the total terms of an arithmetic series
 * @return sum of given arithmetic series
 */

	function sumOfSeries(int64 firstTerm, int64 commonDiff, int32 numOfTerms) private returns(int64)
	{
			return numOfTerms / 2 * (2 * firstTerm + (numOfTerms - 1) * commonDiff);
	}

}

