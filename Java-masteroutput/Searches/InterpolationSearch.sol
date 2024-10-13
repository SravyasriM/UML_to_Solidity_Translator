pragma solidity 0.7.5;

//package Searches


import "java/lang/String/format.sol";

import "java/util/Arrays.sol";

import "java/util/Random.sol";

import "java/util/stream/IntStream.sol";

/**
 * Interpolation search algorithm implementation
 *
 * <p>Worst-case performance O(n) Best-case performance O(1) Average performance O(log(log(n))) if
 * the elements are uniformly distributed if not O(n) Worst-case space complexity O(1)
 *
 * @author Podshivalov Nikita (https://github.com/nikitap492)
 */

contract InterpolationSearch
{
	/**
 * @param array is a sorted array
 * @param key is a value what shoulb be found in the array
 * @return an index if the array contains the key unless -1
 */

	function find(int32[] memory array, int32 key) public returns(int32)
	{
			// Find indexes of two corners

			int32 start = int32(0);
			// in array must be in range defined by corner

			while(start <= end && key >= array[uint256(start)] && key <= array[uint256(end)])
			{
					// uniform distribution in mind.

					int32 pos = int32(start + (((end - start) / (array[uint256(end)] - array[uint256(start)])) * (key - array[uint256(start)])));
					// Condition of target found

					if(array[uint256(pos)] == key)
					{
						return pos;					}
					// If key is larger, key is in upper part

					if(array[uint256(pos)] < key)
					{
						start = pos + 1;					}
					else
					{
						// If key is smaller, x is in lower part

						end = pos - 1;					}


			}
			return -1;
	}

	constructor(string message) public
	{
	}

}

library InterpolationSearch_Library
{
	// Only a main method for test purpose

	function main(string[] memory args) public
	{
			Random r;
			int32 size = int32(100);
			int32 maxElement = int32(100000);
			// the element that should be found

			Integer shouldBeFound = Integer(integers[uint256(r.nextInt(size - 1))]);
			IterativeBinarySearch search;
			int32 atIndex = int32(search.find(integers, shouldBeFound));
			System.out.println(String.format("Should be found: %d. Found %d at index %d. An array length %d", shouldBeFound, integers[uint256(atIndex)], atIndex, size));
			int32 toCheck = int32(Arrays.binarySearch(integers, shouldBeFound));
			System.out.println(format("Found by system method at an index: %d. Is equal: %b", toCheck, toCheck == atIndex));
	}

	function main(string[] memory args) public
	{
			// just generate data

			Random r;
			int32 size = int32(100);
			int32 maxElement = int32(100000);
			// the element that should be found

			Integer shouldBeFound = Integer(integers[uint256(r.nextInt(size - 1))]);
			IterativeTernarySearch search;
			int32 atIndex = int32(search.find(integers, shouldBeFound));
			System.out.println(format("Should be found: %d. Found %d at index %d. An array length %d", shouldBeFound, integers[uint256(atIndex)], atIndex, size));
			int32 toCheck = int32(Arrays.binarySearch(integers, shouldBeFound));
			System.out.println(format("Found by system method at an index: %d. Is equal: %b", toCheck, toCheck == atIndex));
	}

	// Driver method

	function main(string[] memory args) public
	{
			Random r;
			int32 size = int32(100);
			int32 maxElement = int32(100000);
			// the element that should be found

			Integer shouldBeFound = Integer(integers[uint256(r.nextInt(size - 1))]);
			InterpolationSearch search;
			int32 atIndex = int32(search.find(integers, shouldBeFound));
			System.out.println(String.format("Should be found: %d. Found %d at index %d. An array length %d", shouldBeFound, integers[uint256(atIndex)], atIndex, size));
			int32 toCheck = int32(Arrays.binarySearch(integers, shouldBeFound));
			System.out.println(format("Found by system method at an index: %d. Is equal: %b", toCheck, toCheck == atIndex));
	}

}

