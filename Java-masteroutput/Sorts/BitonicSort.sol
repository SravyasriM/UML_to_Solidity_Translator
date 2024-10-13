pragma solidity 0.7.5;

//package Sorts


/* Java program for Bitonic Sort. Note that this program
works only when size of input is a power of 2. */

contract BitonicSort
{
	/* The parameter dir indicates the sorting direction,
  ASCENDING or DESCENDING; if (a[i] > a[j]) agrees
  with the direction, then a[i] and a[j] are
  interchanged. */

	function compAndSwap(int32[] memory a, int32 i, int32 j, int32 dir) internal
	{
			if((a[uint256(i)] > a[uint256(j)] && dir == 1) || (a[uint256(i)] < a[uint256(j)] && dir == 0))
			{
					// Swapping elements

					int32 temp = int32(a[uint256(i)]);
					a[uint256(i)] = a[uint256(j)];
					a[uint256(j)] = temp;
			}
	}

	/* It recursively sorts a bitonic sequence in ascending
  order, if dir = 1, and in descending order otherwise
  (means dir=0). The sequence to be sorted starts at
  index position low, the parameter cnt is the number
  of elements to be sorted.*/

	function bitonicMerge(int32[] memory a, int32 low, int32 cnt, int32 dir) internal
	{
			if(cnt > 1)
			{
					int32 k = int32(cnt / 2);
					for(int32 i = int32(low); i < low + k; i++;)
					{
						compAndSwap(a, i, i + k, dir);					}
					bitonicMerge(a, low, k, dir);
					bitonicMerge(a, low + k, k, dir);
			}
	}

	/* This funcion first produces a bitonic sequence by
  recursively sorting its two halves in opposite sorting
  orders, and then calls bitonicMerge to make them in
  the same order */

	function bitonicSort(int32[] memory a, int32 low, int32 cnt, int32 dir) internal
	{
			if(cnt > 1)
			{
					int32 k = int32(cnt / 2);
					// sort in ascending order since dir here is 1

					bitonicSort(a, low, k, 1);
					// sort in descending order since dir here is 0

					bitonicSort(a, low + k, k, 0);
					// since dir=1.

					bitonicMerge(a, low, cnt, dir);
			}
	}

	/*Caller of bitonicSort for sorting the entire array
  of length N in ASCENDING order */

	function sort(int32[] memory a, int32 N, int32 up) internal
	{
			bitonicSort(a, 0, N, up);
	}

}

library BitonicSort_Library
{
	function main(string[] memory args) public
	{
			PancakeSort pancakeSort;
			System.out.println("After sorting:");
			pancakeSort.sort(arr);
			print(arr);
	}

	/**
 * Driver Code
 */

	function main(string[] memory args) public
	{
			BubbleSort bubbleSort;
			bubbleSort.sort(integers);
			for(int32 i = int32(0); i < integers.length - 1; ++i;)
			{
			}
			print(integers);
			bubbleSort.sort(strings);
			for(int32 i = int32(0); i < strings.length - 1; i++;)
			{
			}
			print(bubbleSort.sort(strings));
	}

	function main(string[] memory args) public
	{
			CycleSort cycleSort;
			cycleSort.sort(arr);
			System.out.println("After sort : ");
			print(arr);
	}

	function main(string[] memory args) public
	{
			GnomeSort gnomeSort;
			gnomeSort.sort(integers);
			gnomeSort.sort(strings);
			System.out.println("After sort : ");
			print(integers);
			print(strings);
	}

	function main(string[] memory args) public
	{
			Random random;
			/* generate 10 random numbers from -50 to 49 */

			for(int32 i = int32(0); i < array.length; ++i;)
			{
					array[uint256(i)] = random.nextInt(100) - 50;
			}
			BubbleSortRecursion bubbleSortRecursion;
			bubbleSortRecursion.sort(array);
			/* check array is sorted or not */

			for(int32 i = int32(0); i < array.length - 1; ++i;)
			{
			}
	}

	/**
 * Driver Code
 */

	function main(string[] memory args) public
	{
			InsertionSort sort;
			sort.sort(integers);
			print(integers);
			sort.sort(strings);
			print(strings);
	}

	// Driver method

	function main(string[] memory args) public
	{
			CombSort ob;
			ob.sort(arr);
			System.out.println("sorted array");
			print(arr);
	}

	/* A utility function to print array of size n */

	function printArray(int32[] memory arr) internal
	{
			int32 n = int32(arr.length);
			for(int32 i = int32(0); i < n; ++i;)
			{
				System.out.print(arr[uint256(i)] + " ");			}
			System.out.println();
	}

	function main(string[] memory args) public
	{
			int32 up = int32(1);
			BitonicSort ob;
			ob.sort(a, a.length, up);
			System.out.println("\nSorted array");
			printArray(a);
	}

}

