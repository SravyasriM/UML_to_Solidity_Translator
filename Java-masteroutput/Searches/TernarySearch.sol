pragma solidity 0.7.5;

//package Searches


import "java/lang/String/format.sol";

import "java/util/Arrays.sol";

import "java/util/Random.sol";

import "java/util/stream/Stream.sol";

/**
 * A ternary search algorithm is a technique in computer science for finding the minimum or maximum
 * of a unimodal function The algorithm determines either that the minimum or maximum cannot be in
 * the first third of the domain or that it cannot be in the last third of the domain, then repeats
 * on the remaining third.
 *
 * <p>Worst-case performance Θ(log3(N)) Best-case performance O(1) Average performance Θ(log3(N))
 * Worst-case space complexity O(1)
 *
 * @author Podshivalov Nikita (https://github.com/nikitap492)
 * @see SearchAlgorithm
 * @see IterativeBinarySearch
 */

contract TernarySearch is SearchAlgorithm
{
}

library TernarySearch_Library
{
	// Driver Program

	function main(string[] memory args) public
	{
			// Just generate data

			Random r = Random(ThreadLocalRandom.current());
			int32 size = int32(100);
			int32 maxElement = int32(100000);
			// The element that should be found

			int32 shouldBeFound = int32(integers[uint256(r.nextInt(size - 1))]);
			BinarySearch search;
			int32 atIndex = int32(search.find(integers, shouldBeFound));
			System.out.println(format("Should be found: %d. Found %d at index %d. An array length %d", shouldBeFound, integers[uint256(atIndex)], atIndex, size));
			int32 toCheck = int32(Arrays.binarySearch(integers, shouldBeFound));
			System.out.println(format("Found by system method at an index: %d. Is equal: %b", toCheck, toCheck == atIndex));
	}

	function main(string[] memory args) public
	{
			// just generate data

			Random r;
			int32 size = int32(200);
			int32 maxElement = int32(100);
			// the element that should be found

			Integer shouldBeFound = Integer(integers[uint256(r.nextInt(size - 1))]);
			LinearSearch search;
			int32 atIndex = int32(search.find(integers, shouldBeFound));
			System.out.println(String.format("Should be found: %d. Found %d at index %d. An array length %d", shouldBeFound, integers[uint256(atIndex)], atIndex, size));
	}

	function main(string[] memory args) public
	{
			// just generate data

			Random r;
			int32 size = int32(100);
			int32 maxElement = int32(100000);
			// the element that should be found

			Integer shouldBeFound = Integer(integers[uint256(r.nextInt(size - 1))]);
			TernarySearch search;
			int32 atIndex = int32(search.find(integers, shouldBeFound));
			System.out.println(format("Should be found: %d. Found %d at index %d. An array length %d", shouldBeFound, integers[uint256(atIndex)], atIndex, size));
			int32 toCheck = int32(Arrays.binarySearch(integers, shouldBeFound));
			System.out.println(format("Found by system method at an index: %d. Is equal: %b", toCheck, toCheck == atIndex));
	}

}

