pragma solidity 0.7.5;

//package DataStructures.Queues


/**
 * This class implements a PriorityQueue.
 *
 * <p>A priority queue adds elements into positions based on their priority. So the most important
 * elements are placed at the front/on the top. In this example I give numbers that are bigger, a
 * higher priority. Queues in theory have no fixed size but when using an array implementation it
 * does.
 */

contract PriorityQueue
{
	/**
 * The max size of the queue
 */

	int32 private  maxSize;

	/**
 * How many items are in the queue
 */

	int32 private  nItems;

	/**
 * Inserts an element in it's appropriate place
 *
 * @param value Value to be inserted
 */

	function insert(int32 value) public
	{
	}

	/**
 * Remove the element from the front of the queue
 *
 * @return The element removed
 */

	function remove() public returns(int32)
	{
	}

	/**
 * Checks what's at the front of the queue
 *
 * @return element at the front of the queue
 */

	function peek() public returns(int32)
	{
	}

	/**
 * Returns true if the queue is empty
 *
 * @return true if the queue is empty
 */

	function isEmpty() public returns(bool)
	{
	}

	/**
 * Returns true if the queue is full
 *
 * @return true if the queue is full
 */

	function isFull() public returns(bool)
	{
	}

	/**
 * Returns the number of elements in the queue
 *
 * @return number of elements in the queue
 */

	function getSize() public returns(int32)
	{
	}

	/**
 * Constructor
 *
 * @param size Size of the queue
 */

	constructor(int32 size) public
	{
	}

}

library PriorityQueue_Library
{
}

/**
 * This class implements the PriorityQueue class above.
 *
 * @author Unknown
 */

contract PriorityQueues
{
}

library PriorityQueues_Library
{
	/**
 * Main method
 *
 * @param args Command Line Arguments
 */

	function main(string[] memory args) public
	{
			PriorityQueue myQueue = new PriorityQueue(1);
			myQueue.constructor1(4);
			myQueue.insert(10);
			myQueue.insert(2);
			myQueue.insert(5);
			myQueue.insert(3);
			for(int32 i = int32(3); i >= 0; i--;)
			{
				System.out.print(// will print the queue in reverse order [10, 5, 3, 2]

myQueue.remove() + " ");			}
	}

}

