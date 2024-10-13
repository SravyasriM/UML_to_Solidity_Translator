pragma solidity 0.7.5;

//package DataStructures.Queues


import "java/util/ArrayList.sol";

/**
 * This class implements a GenericArrayListQueue.
 *
 * <p>A GenericArrayListQueue data structure functions the same as any specific-typed queue. The
 * GenericArrayListQueue holds elemets of types to-be-specified at runtime. The elements that are
 * added first are the first to be removed (FIFO) New elements are added to the back/rear of the
 * queue.
 */

contract GenericArrayListQueue
{
	/**
 * The generic ArrayList for the queue T is the generic element
 */

	ArrayList _queue;

	/**
 * Checks if the queue has elements (not empty)
 *
 * @return True if the queue has elements. False otherwise.
 */

	function hasElements() private returns(bool)
	{
			return !_queue.isEmpty();
	}

	/**
 * Checks what's at the front of the queue
 *
 * @return If queue is not empty, element at the front of the queue. Otherwise, null
 */

	function peek() public returns(T)
	{
			T result;
			if(this.hasElements())
			{
					result = _queue.get(0);
			}
			return result;
	}

	/**
 * Inserts an element of type T to the queue.
 *
 * @param element of type T to be added
 * @return True if the element was added successfully
 */

	function add(T element) public returns(bool)
	{
			return _queue.add(element);
	}

	/**
 * Retrieve what's at the front of the queue
 *
 * @return If queue is not empty, element retrieved. Otherwise, null
 */

	function poll() public returns(T)
	{
			T result;
			if(this.hasElements())
			{
					result = _queue.remove(0);
			}
			return result;
	}

}

library GenericArrayListQueue_Library
{
	/**
 * Main method
 *
 * @param args Command line arguments
 */

	function main(string[] memory args) public
	{
			GenericArrayListQueue queue;
			System.out.println("Running...");
			System.out.println("Finished.");
	}

}

