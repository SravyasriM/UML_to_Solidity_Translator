pragma solidity 0.7.5;

//package Sorts


import "java/util/Arrays.sol";

import "java/util/List.sol";

/**
 * The class contains util methods
 *
 * @author Podshivalov Nikita (https://github.com/nikitap492)
 */

contract SortUtils
{
	/**
 * This method checks if first element is less than the other element
 *
 * @param v first element
 * @param w second element
 * @return true if the first element is less than the second element
 */

	function less(T v, T w) internal returns(bool)
	{
			return v.compareTo(w) < 0;
	}

	/**
 * This method checks if first element is greater than the other element
 *
 * @param v first element
 * @param w second element
 * @return true if the first element is greater than the second element
 */

	function greater(T v, T w) internal returns(bool)
	{
			return v.compareTo(w) > 0;
	}

	/**
 * Prints a list
 *
 * @param toPrint - a list which should be printed
 */

	function print(List toPrint) internal
	{
			System.out.println();
	}

}

library SortUtils_Library
{
	/**
 * This method checks if first element is less than the other element
 *
 * @param v first element
 * @param w second element
 * @return true if the first element is less than the second element
 */

	function less(T v, T w) internal returns(bool)
	{
			return v.compareTo(w) < 0;
	}

	/**
 * This method checks if first element is greater than the other element
 *
 * @param v first element
 * @param w second element
 * @return true if the first element is greater than the second element
 */

	function greater(T v, T w) internal returns(bool)
	{
			return v.compareTo(w) > 0;
	}

	/**
 * Prints a list
 *
 * @param toPrint - a list which should be printed
 */

	function print(List toPrint) internal
	{
			System.out.println();
	}

}

