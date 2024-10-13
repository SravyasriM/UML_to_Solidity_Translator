pragma solidity 0.7.5;

//package DataStructures.Queues


/**
 * This implements Queues by using the class Queue.
 *
 * <p>A queue data structure functions the same as a real world queue. The elements that are added
 * first are the first to be removed. New elements are added to the back/rear of the queue.
 */

contract Queue
{
	/**
 * Default initial capacity.
 */

	int32 static  immutable DEFAULT_CAPACITY = int32(10);

	/**
 * Max size of the queue
 */

	int32 private  maxSize;

	/**
 * Front of the queue
 */

	int32 private  front;

	/**
 * Rear of the queue
 */

	int32 private  rear;

	/**
 * How many items are in the queue
 */

	int32 private  nItems;

	/**
 * Inserts an element at the rear of the queue
 *
 * @param x element to be added
 * @return True if the element was added successfully
 */

	function insert(int32 x) public returns(bool)
	{
			if(isFull())
			{
				return false;			}
			// If the back of the queue is the end of the array wrap around to the front

			rear = (rear + 1) % maxSize;
			queueArray[uint256(rear)] = x;
			nItems++;
			return true;
	}

	/**
 * Remove an element from the front of the queue
 *
 * @return the new front of the queue
 */

	function remove() public returns(int32)
	{
			if(isEmpty())
			{
					return -1;
			}
			int32 temp = int32(queueArray[uint256(front)]);
			front = (front + 1) % maxSize;
			nItems--;
			return temp;
	}

	/**
 * Checks what's at the front of the queue
 *
 * @return element at the front of the queue
 */

	function peekFront() public returns(int32)
	{
			return queueArray[uint256(front)];
	}

	/**
 * Checks what's at the rear of the queue
 *
 * @return element at the rear of the queue
 */

	function peekRear() public returns(int32)
	{
			return queueArray[uint256(rear)];
	}

	/**
 * Returns true if the queue is empty
 *
 * @return true if the queue is empty
 */

	function isEmpty() public returns(bool)
	{
			return nItems == 0;
	}

	/**
 * Returns true if the queue is full
 *
 * @return true if the queue is full
 */

	function isFull() public returns(bool)
	{
			return nItems == maxSize;
	}

	/**
 * Returns the number of elements in the queue
 *
 * @return number of elements in the queue
 */

	function getSize() public returns(int32)
	{
			return nItems;
	}

	function toString() public returns(String)
	{
			StringBuilder sb;
			sb.append("[");
			for(int32 i = int32(front); ; i = ++i; % maxSize)
			{
					sb.append(queueArray[uint256(i)]).append(", ");
					if(i == rear)
					{
							break;
					}
			}
			sb.replace(sb.length() - 2, sb.length(), "]");
			return sb.toString();
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

	/**
 * init with DEFAULT_CAPACITY
 */

	function constructor1() public	overloadedConstructor( 1 )
	{
	}

	/**
 * Constructor
 *
 * @param size Size of the new queue
 */

	function constructor2(int32 size) public	overloadedConstructor( 2 )
	{
			maxSize = size;
			queueArray = new int32[](size);
			front = 0;
			rear = -1;
			nItems = 0;
	}

}

library Queue_Library
{
}

/**
 * This class is the example for the Queue class
 *
 * @author Unknown
 */

contract Queues
{
}

library Queues_Library
{
	/**
 * Main method
 *
 * @param args Command line arguments
 */

	function main(string[] memory args) public
	{
			Queue myQueue = new Queue(2);
			myQueue.constructor2(4);
			myQueue.insert(10);
			myQueue.insert(2);
			myQueue.insert(5);
			myQueue.insert(3);
			// Will print true

			System.out.println(myQueue.isFull());
			// Will make 2 the new front, making 10 no longer part of the queue

			myQueue.remove();
			// Insert 7 at the rear which will be index 0 because of wrap around

			myQueue.insert(7);
			// Will print 2

			System.out.println(myQueue.peekFront());
			// Will print 7

			System.out.println(myQueue.peekRear());
			// Will print [2, 5, 3, 7]

			System.out.println(myQueue.toString());
	}

}

