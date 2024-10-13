pragma solidity 0.7.5;

//package Sorts


import "SortUtils/print.sol";

/**
 * This method implements the Generic Merge Sort
 *
 * @author Varun Upadhyay (https://github.com/varunu28)
 * @author Podshivalov Nikita (https://github.com/nikitap492)
 * @see SortAlgorithm
 */

contract MergeSort is SortAlgorithm
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

library MergeSort_Library
{
	// Driver program

	function main(string[] memory args) public
	{
			MergeSort mergeSort;
			mergeSort.sort(arr);
			// Output => 1	   4  	 6	9	12	23	54	78	231

			print(arr);
			mergeSort.sort(stringArray);
			// Output => a	b	c	d	e

			print(stringArray);
	}

}

