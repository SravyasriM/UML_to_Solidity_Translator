pragma solidity 0.7.5;

//package Sorts


contract SelectionSort is SortAlgorithm
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

library SelectionSort_Library
{
	/**
 * Driver Code
 */

	function main(string[] memory args) public
	{
			SelectionSort selectionSort;
			for(int32 i = int32(0); i < sorted.length - 1; ++i;)
			{
			}
			for(int32 i = int32(0); i < sortedStrings.length - 1; ++i;)
			{
			}
	}

}

