pragma solidity 0.7.5;

//package DataStructures.Heaps


/**
 * Minimum Priority Queue It is a part of heap data structure A heap is a specific tree based data
 * structure in which all the nodes of tree are in a specific order. that is the children are
 * arranged in some respect of their parents, can either be greater or less than the parent. This
 * makes it a min priority queue or max priority queue.
 *
 * <p>
 *
 * <p>Functions: insert, delete, peek, isEmpty, print, heapSort, sink
 */

contract MinPriorityQueue
{
	int32 private  capacity;

	int32 private  size;

	// so that the binary heap is in appropriate order

	function insert(int32 key) public
	{
			if(this.isFull())
			{
				return 			}
			MinPriorityQueue.heap[uint256(MinPriorityQueue.size + 1)] = key;
			int32 k = int32(MinPriorityQueue.size + 1);
			while(k > 1)
			{
					if(MinPriorityQueue.heap[uint256(k)] < MinPriorityQueue.heap[uint256(k / 2)])
					{
							int32 temp = int32(MinPriorityQueue.heap[uint256(k)]);
							MinPriorityQueue.heap[uint256(k)] = MinPriorityQueue.heap[uint256(k / 2)];
							MinPriorityQueue.heap[uint256(k / 2)] = temp;
					}
					k = k / 2;

			}
			MinPriorityQueue.size++;
	}

	// returns the highest priority value

	function peek() public returns(int32)
	{
			return MinPriorityQueue.heap[uint256(1)];
	}

	// returns boolean value whether the heap is empty or not

	function isEmpty() public returns(bool)
	{
			if(0 == MinPriorityQueue.size)
			{
				return true;			}
			return false;
	}

	// returns boolean value whether the heap is full or not

	function isFull() public returns(bool)
	{
			if(MinPriorityQueue.size == MinPriorityQueue.capacity)
			{
				return true;			}
			return false;
	}

	// prints the heap

	function print() public
	{
			for(int32 i = int32(1); i <= MinPriorityQueue.capacity; i++;)
			{
				System.out.print(MinPriorityQueue.heap[uint256(i)] + " ");			}
			System.out.println();
	}

	// it returns reverse sort because it is a min priority queue

	function heapSort() public
	{
			for(int32 i = int32(1); i < MinPriorityQueue.capacity; i++;)
			{
				this.delete();			}
	}

	// this function reorders the heap after every delete function

	function sink() private
	{
			int32 k = int32(1);
			while(2 * k <= MinPriorityQueue.size || 2 * k + 1 <= MinPriorityQueue.size)
			{
					int32 minIndex;
					if(MinPriorityQueue.heap[uint256(2 * k)] >= MinPriorityQueue.heap[uint256(k)])
					{
							if(2 * k + 1 <= MinPriorityQueue.size && MinPriorityQueue.heap[uint256(2 * k + 1)] >= MinPriorityQueue.heap[uint256(k)])
							{
									break;
							}
							else
							{
								if(2 * k + 1 > MinPriorityQueue.size)
								{
										break;
								}							}

					}
					if(2 * k + 1 > MinPriorityQueue.size)
					{
							minIndex = MinPriorityQueue.heap[uint256(2 * k)] < MinPriorityQueue.heap[uint256(k)] ? 2 * k : k;
					}
					else
					{
							if(MinPriorityQueue.heap[uint256(k)] > MinPriorityQueue.heap[uint256(2 * k)] || MinPriorityQueue.heap[uint256(k)] > MinPriorityQueue.heap[uint256(2 * k + 1)])
							{
									minIndex = MinPriorityQueue.heap[uint256(2 * k)] < MinPriorityQueue.heap[uint256(2 * k + 1)] ? 2 * k : 2 * k + 1;
							}
							else
							{
									minIndex = k;
							}

					}

					int32 temp = int32(MinPriorityQueue.heap[uint256(k)]);
					MinPriorityQueue.heap[uint256(k)] = MinPriorityQueue.heap[uint256(minIndex)];
					MinPriorityQueue.heap[uint256(minIndex)] = temp;
					k = minIndex;

			}
	}

	// deletes the highest priority value from the heap

	function delete() public returns(int32)
	{
			int32 min = int32(MinPriorityQueue.heap[uint256(1)]);
			MinPriorityQueue.heap[uint256(1)] = MinPriorityQueue.heap[uint256(MinPriorityQueue.size)];
			MinPriorityQueue.heap[uint256(MinPriorityQueue.size)] = min;
			MinPriorityQueue.size--;
			this.sink();
			return min;
	}

	int private oc_id;

	bool private oc_status;

	constructor(int _oc_id) public
	{
			oc_id = _oc_id;
			oc_status = false;
	}

	modifier overloadedConstructor(int _oc_id)
	{
			require(oc_id == _oc_id, "Restricted for Overloaded Constructor");
			require(oc_status == false, "Restricted for only One Time Execution");
			_;
			oc_status = true;
	}

	function constructor1(List listElements) public	overloadedConstructor( 1 )
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
			if(maxHeap.size() == 0)
			{
				System.out.println("No element has been added, empty heap.");			}
	}

	// calss the constructor and initializes the capacity

	function constructor2(int32 c) internal	overloadedConstructor( 2 )
	{
			MinPriorityQueue.capacity = c;
			MinPriorityQueue.size = 0;
			MinPriorityQueue.heap = new int32[](c + 1);
	}

}

library MinPriorityQueue_Library
{
	function main(string[] memory args) public
	{
			// testing

			MinPriorityQueue q;
			q.insert(5);
			q.insert(2);
			q.insert(4);
			q.insert(1);
			q.insert(7);
			q.insert(6);
			q.insert(3);
			q.insert(8);
			// [ 1, 2, 3, 5, 7, 6, 4, 8 ]

			q.print();
			q.heapSort();
			// [ 8, 7, 6, 5, 4, 3, 2, 1 ]

			q.print();
	}

}

