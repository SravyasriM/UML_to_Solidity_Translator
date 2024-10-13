pragma solidity 0.7.5;

//package Sorts


import "java/util/Arrays.sol";

import "java/util/List.sol";

/**
 * The common interface of most sorting algorithms
 *
 * @author Podshivalov Nikita (https://github.com/nikitap492)
 */

interface SortAlgorithm
{
/*
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
*/

}

