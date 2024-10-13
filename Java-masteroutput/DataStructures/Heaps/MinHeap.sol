pragma solidity 0.7.5;

//package DataStructures.Heaps


import "java/util/ArrayList.sol";

import "java/util/List.sol";

/**
 * Heap tree where a node's key is higher than or equal to its parent's and lower than or equal to
 * its children's.
 *
 * @author Nicolas Renard
 */

contract MinHeap is Heap
{
	List private  immutable minHeap;

	// Get the element at a given index. The key for the list is equal to index value - 1

	function getElement(int32 elementIndex) public returns(HeapElement)
	{
			return minHeap.get(elementIndex - 1);
	}

	// Get the key of the element at a given index

	function getElementKey(int32 elementIndex) private returns(int64)
	{
			return minHeap.get(elementIndex - 1).getKey();
	}

	// Swaps two elements in the heap

	function swap(int32 index1, int32 index2) private
	{
			HeapElement temporaryElement = HeapElement(minHeap.get(index1 - 1));
			minHeap.set(index1 - 1, minHeap.get(index2 - 1));
			minHeap.set(index2 - 1, temporaryElement);
	}

	// Toggle an element up to its right place as long as its key is lower than its parent's

	function toggleUp(int32 elementIndex) private
	{
			int64 key = int64(minHeap.get(elementIndex - 1).getKey()); //Converted from DOUBLE TYPE of Java
			while(getElementKey(int32(Math.floor(elementIndex / 2))) > key)
			{
					swap(elementIndex, int32(Math.floor(elementIndex / 2)));
					elementIndex = int32(Math.floor(elementIndex / 2));

			}
	}

	// than any of its children's

	function toggleDown(int32 elementIndex) private
	{
			int64 key = int64(minHeap.get(elementIndex - 1).getKey()); //Converted from DOUBLE TYPE of Java
			bool wrongOrder = bool((key > getElementKey(elementIndex * 2)) || (key > getElementKey(Math.min(elementIndex * 2, minHeap.size()))));
			while((2 * elementIndex <= minHeap.size()) && wrongOrder)
			{
					// Check whether it shall swap the element with its left child or its right one if any.

					if((2 * elementIndex < minHeap.size()) && (getElementKey(elementIndex * 2 + 1) < getElementKey(elementIndex * 2)))
					{
							elementIndex = 2 * elementIndex + 1;
					}
					else
					{
							elementIndex = 2 * elementIndex;
					}

					wrongOrder = (key > getElementKey(elementIndex * 2)) || (key > getElementKey(Math.min(elementIndex * 2, minHeap.size())));

			}
	}

	function extractMin() private returns(HeapElement)
	{
			HeapElement result = HeapElement(minHeap.get(0));
			deleteElement(0);
			return result;
	}

	function insertElement(HeapElement element) override public
	{
			minHeap.add(element);
			toggleUp(minHeap.size());
	}

	function deleteElement(int32 elementIndex) override public
	{
			if(minHeap.isEmpty())
			{
					//try


					/* catch (EmptyHeapException e) {
    e.printStackTrace();
}*/

			}
			// The last element in heap replaces the one to be deleted

			minHeap.set(elementIndex - 1, getElement(minHeap.size()));
			minHeap.remove(minHeap.size());
			// Shall the new element be moved up...

			if(getElementKey(elementIndex) < getElementKey(int32(Math.floor(elementIndex / 2))))
			{
				toggleUp(elementIndex);			}
			else
			{
				// ... or down ?

				if(((2 * elementIndex <= minHeap.size()) && (getElementKey(elementIndex) > getElementKey(elementIndex * 2))) || ((2 * elementIndex < minHeap.size()) && (getElementKey(elementIndex) > getElementKey(elementIndex * 2))))
				{
					toggleDown(elementIndex);				}			}

	}

	function getElement() override public returns(HeapElement)
	{
				//try

					return extractMin();

				/* catch (Exception e) {
    throw new EmptyHeapException("Heap is empty. Error retrieving element");
}*/


	}

	constructor(List listElements) public
	{
			;
			for(uint256 iterator_var = uint256(0); iterator_var < listElements.length; iterator_var++;)
			{
					HeapElement heapElement = HeapElement(listElements[uint256(iterator_var)]);
					if(heapElement != none)
					{
						insertElement(heapElement);					}
					else
					{
						System.out.println("Null element. Not added to heap");					}

			}
			if(minHeap.size() == 0)
			{
				System.out.println("No element has been added, empty heap.");			}
	}

}

library MinHeap_Library
{
}

