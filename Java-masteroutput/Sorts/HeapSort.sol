pragma solidity 0.7.5;

//package Sorts


import "SortUtils.sol";

import "java/util/ArrayList.sol";

import "java/util/Arrays.sol";

import "java/util/List.sol";

/**
 * Heap Sort Algorithm Implements MinHeap
 *
 * @author Podshivalov Nikita (https://github.com/nikitap492)
 */

contract HeapSort is SortAlgorithm
{
	function sort(List unsorted) public returns(List)
	{
			int32 size = int32(unsorted.size());
			Heap heap = new Heap(unsorted.toArray());
			// make min heap using index 0 as root.

			heap.makeMinHeap(0);
			List sorted;
			while(size > 0)
			{
					T min = T(heap.getRoot(--size;)
					sorted.add(min);

			}
			return sorted;
	}

}

library HeapSort_Library
{
	/**
 * Main method
 *
 * @param args the command line arguments
 */

	function main(string[] memory args) public
	{
			HeapSort heapSort;
			print(heapSort.sort(heap));
	}

}

