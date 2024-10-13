pragma solidity 0.7.5;

//package Maths


/**
 * Calculate average of a list of numbers
 */

contract Average
{
	int64 static  immutable SMALL_VALUE = int64(0);

}

library Average_Library
{
	function main(string[] memory args) public
	{
	}

	/**
 * Calculate average of a list of numbers
 *
 * @param numbers array to store numbers
 * @return mean of given numbers
 */

	function average(int64[] memory numbers) public returns(int64)
	{
			int64 sum = int64(0); //Converted from DOUBLE TYPE of Java
			for(uint256 iterator_var = uint256(0); iterator_var < numbers.length; iterator_var++;)
			{
					int64 number = int64(numbers[uint256(iterator_var)]); //Converted from DOUBLE TYPE of Java
					sum += number;
			}
			return sum / numbers.length;
	}

	/**
 * find average value of int array
 *
 * @param array the array contains element and the sum does not excess long value limit
 * @return average value
 */

	function average(int32[] memory array) public returns(int32)
	{
			int64 sum = int64(0);
			for(int32 i = int32(0); i < array.length; ++i;)
			{
					sum += array[uint256(i)];
			}
			return int32((sum / array.length));
	}

}

