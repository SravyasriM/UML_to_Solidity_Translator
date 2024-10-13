pragma solidity 0.7.5;

//package Sorts


import "java/util/Random.sol";

/**
 * @author Podshivalov Nikita (https://github.com/nikitap492)
 * @see SortAlgorithm
 */

contract BogoSort is SortAlgorithm
{
	Random static  immutable random;

	/**
 * Auxiliary method for algorithms what wanted to work with lists from JCF
 *
 * @param unsorted - a list should be sorted
 * @return a sorted list
 */

	function sort(List unsorted) public returns(List)
	{
			return Arrays.asList(sort(unsorted.toArray()));
	}

}

library BogoSort_Library
{
	// Driver Program

	function main(string[] memory args) public
	{
			BogoSort bogoSort;
			// print a sorted array

			SortUtils.print(bogoSort.sort(integers));
			SortUtils.print(bogoSort.sort(strings));
	}

}

