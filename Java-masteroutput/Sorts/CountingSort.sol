pragma solidity 0.7.5;

//package Sorts


import "SortUtils/print.sol";

import "java/util/stream/Collectors/toList.sol";

import "java/util/stream/Collectors/toMap.sol";

import "java/util.sol";

import "java/util/stream/IntStream.sol";

import "java/util/stream/Stream.sol";

/**
 * @author Youssef Ali (https://github.com/youssefAli11997)
 * @author Podshivalov Nikita (https://github.com/nikitap492)
 */

contract CountingSort is SortAlgorithm
{
	/**
 * This method implements the Generic Counting Sort
 *
 * @param list The list to be sorted
 *     <p>Sorts the list in increasing order The method uses list elements as keys in the
 *     frequency map
 */

	function sort(List list) public returns(List)
	{
			Map frequency;
			// The final output array

			List sortedArray;
			return sortedArray;
	}

	/**
 * Stream Counting Sort The same as method {@link CountingSort#sort(List)} } but this method uses
 * stream API
 *
 * @param list The list to be sorted
 */

	function streamSort(List list) private returns(List)
	{
			return 
	}

}

library CountingSort_Library
{
	/**
 * Stream Counting Sort The same as method {@link CountingSort#sort(List)} } but this method uses
 * stream API
 *
 * @param list The list to be sorted
 */

	function streamSort(List list) private returns(List)
	{
			return 
	}

	// Driver Program

	function main(string[] memory args) public
	{
			// Integer Input

			List unsortedInts = List(Stream.of(4, 23, 6, 78, 1, 54, 23, 1, 9, 231, 9, 12).collect(toList()));
			CountingSort countingSort;
			System.out.println("Before Sorting:");
			print(unsortedInts);
			// Output => 1 1 4 6 9 9 12 23 23 54 78 231

			System.out.println("After Sorting:");
			print(countingSort.sort(unsortedInts));
			System.out.println("After Sorting By Streams:");
			print(streamSort(unsortedInts));
			System.out.println("\n------------------------------\n");
			// String Input

			List unsortedStrings = List(Stream.of("c", "a", "e", "b", "d", "a", "f", "g", "c").collect(toList()));
			System.out.println("Before Sorting:");
			print(unsortedStrings);
			// Output => a a b c c d e f g

			System.out.println("After Sorting:");
			print(countingSort.sort(unsortedStrings));
			System.out.println("After Sorting By Streams:");
			print(streamSort(unsortedStrings));
	}

}

