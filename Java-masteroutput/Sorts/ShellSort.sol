pragma solidity 0.7.5;

//package Sorts


import "SortUtils.sol";

contract ShellSort is SortAlgorithm
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

library ShellSort_Library
{
	/* Driver Code */

	function main(string[] memory args) public
	{
			ShellSort sort;
			sort.sort(toSort);
			for(int32 i = int32(0); i < toSort.length - 1; ++i;)
			{
			}
			print(toSort);
	}

}

