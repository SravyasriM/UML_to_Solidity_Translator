pragma solidity 0.7.5;

//package Sorts


import "SortUtils.sol";

/**
 * @author Varun Upadhyay (https://github.com/varunu28)
 * @author Podshivalov Nikita (https://github.com/nikitap492)
 * @see SortAlgorithm
 */

contract QuickSort is SortAlgorithm
{
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

library QuickSort_Library
{
	// Driver Program

	function main(string[] memory args) public
	{
			QuickSort quickSort;
			quickSort.sort(array);
			// Output => 0 1 1 2 2 3 4 5 5 5 7 8 9 12 32 44 111

			print(array);
			quickSort.sort(stringArray);
			// Output => a	b	c	d	e

			print(stringArray);
	}

}

