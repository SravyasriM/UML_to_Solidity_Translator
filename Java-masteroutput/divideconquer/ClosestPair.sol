pragma solidity 0.7.5;

//package divideconquer


/**
 * For a set of points in a coordinates system (10000 maximum), ClosestPair class calculates the two
 * closest points.
 *
 * @author: anonymous
 * @author: Marisa Afuera
 */

contract ClosestPair
{
	/**
 * Number of points
 */

	int32 numberPoints = int32(0);

	

	/**
 * Minimum point coordinate.
 */

	Location point1 = Location(none);

	/**
 * Minimum point coordinate.
 */

	Location point2 = Location(none);

	/**
 * Minimum point length.
 */

	int64 static  minNum = int64(Double.MAX_VALUE);

	function setMinNum(int64 minNum) public
	{
			ClosestPair.minNum = minNum;
	}

	function setSecondCount(int32 secondCount) public
	{
			ClosestPair.secondCount = secondCount;
	}

	/**
 * secondCount
 */

	int32 static  secondCount = int32(0);

	function buildLocation(int64 x, int64 y) public returns(Location)
	{
	}

}

library ClosestPair_Library
{
	function setMinNum(int64 minNum) public
	{
			ClosestPair.minNum = minNum;
	}

	function setSecondCount(int32 secondCount) public
	{
			ClosestPair.secondCount = secondCount;
	}

	/**
 * main function: execute class.
 *
 * @param args (IN Parameter) <br>
 * @throws IOException If an input or output exception occurred
 */

	function main(string[] memory args) public
	{
	}

}

