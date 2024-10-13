pragma solidity 0.7.5;

//package Others


import "java/util/ArrayList.sol";

/**
 * @author Dekas Dimitrios
 */

contract BestFit
{
	int32 static  immutable NO_ALLOCATION = int32(// if a process has been allocated in position -255,

-255);

	/**
 * Method to print the memory allocated.
 *
 * @param memAllocation: an ArrayList of Integer representing the memory allocation done by the
 *     bestFit method.
 */

	function printMemoryAllocation(ArrayList memAllocation) public
	{
			System.out.println("Process No.\tBlock No.");
			System.out.println("===========\t=========");
			for(int32 i = int32(0); i < memAllocation.size(); i++;)
			{
					System.out.print(" " + i + "\t\t");
					if(memAllocation.get(i) != NO_ALLOCATION)
					{
						System.out.print(memAllocation.get(i));					}
					else
					{
						System.out.print("Not Allocated");					}

					System.out.println();
			}
	}

}

library BestFit_Library
{
	/**
 * Method to find the maximum valued element of an array filled with positive integers.
 *
 * @param array: an array filled with positive integers.
 * @return the maximum valued element of the array.
 */

	function findMaxElement(int32[] memory array) private returns(int32)
	{
			int32 max = int32(-1);
			for(uint256 iterator_var = uint256(0); iterator_var < array.length; iterator_var++;)
			{
					int32 value = int32(array[uint256(iterator_var)]);
					if(value > max)
					{
							max = value;
					}
			}
			return max;
	}

	/**
 * Method to find the index of the memory block that is going to fit the given process based on
 * the best fit algorithm.
 *
 * @param blocks: the array with the available memory blocks.
 * @param process: the size of the process.
 * @return the index of the block that fits, or -255 if no such block exists.
 */

	function findBestFit(int32[] memory blockSizes, int32 processSize) private returns(int32)
	{
			// processSize.

			int32 minDiff = int32(findMaxElement(blockSizes));
			int32 index = int32(NO_ALLOCATION);
			// result.

			for(int32 i = int32(0); i < blockSizes.length; i++;)
			{
					// Find the most fitting memory block for the given process.

					if(blockSizes[uint256(i)] - processSize < minDiff && blockSizes[uint256(i)] - processSize >= 0)
					{
							minDiff = blockSizes[uint256(i)] - processSize;
							index = i;
					}
			}
			return index;
	}

	/**
 * Method to allocate memory to blocks according to the best fit algorithm. It should return an
 * ArrayList of Integers, where the index is the process ID (zero-indexed) and the value is the
 * block number (also zero-indexed).
 *
 * @param sizeOfBlocks: an int array that contains the sizes of the memory blocks available.
 * @param sizeOfProcesses: an int array that contains the sizes of the processes we need memory
 *     blocks for.
 * @return the ArrayList filled with Integers repressenting the memory allocation that took place.
 */

	function bestFit(int32[] memory sizeOfBlocks, int32[] memory sizeOfProcesses) internal returns(ArrayList)
	{
			// The array list responsible for saving the memory allocations done by the best-fit algorithm

			ArrayList memAlloc;
			// Do this for every process

			for(uint256 iterator_var = uint256(0); iterator_var < sizeOfProcesses.length; iterator_var++;)
			{
					int32 processSize = int32(sizeOfProcesses[uint256(iterator_var)]);
					int32 chosenBlockIdx = int32(findBestFit(sizeOfBlocks, processSize));
					// Store the chosen block index in the memAlloc array list

					memAlloc.add(chosenBlockIdx);
					if(chosenBlockIdx != NO_ALLOCATION)
					{
							// resize the block based on the process size

							sizeOfBlocks[uint256(chosenBlockIdx)] -= processSize;
					}
			}
			return memAlloc;
	}

	/**
 * Method to print the memory allocated.
 *
 * @param memAllocation: an ArrayList of Integer representing the memory allocation done by the
 *     bestFit method.
 */

	function printMemoryAllocation(ArrayList memAllocation) public
	{
			System.out.println("Process No.\tBlock No.");
			System.out.println("===========\t=========");
			for(int32 i = int32(0); i < memAllocation.size(); i++;)
			{
					System.out.print(" " + i + "\t\t");
					if(memAllocation.get(i) != NO_ALLOCATION)
					{
						System.out.print(memAllocation.get(i));					}
					else
					{
						System.out.print("Not Allocated");					}

					System.out.println();
			}
	}

}

