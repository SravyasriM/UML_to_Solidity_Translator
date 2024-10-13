pragma solidity 0.7.5;

//package Others


import "java/util/Stack.sol";

/**
 * This implements Queue using two Stacks.
 *
 * <p>Big O Runtime: insert(): O(1) remove(): O(1) amortized isEmpty(): O(1)
 *
 * <p>A queue data structure functions the same as a real world queue. The elements that are added
 * first are the first to be removed. New elements are added to the back/rear of the queue.
 *
 * @author sahilb2 (https://www.github.com/sahilb2)
 */

contract QueueWithStack
{
	// Stack to keep track of elements inserted into the queue

	Stack private  inStack;

	// Stack to keep track of elements to be removed next in queue

	Stack private  outStack;

	/**
 * Inserts an element at the rear of the queue
 *
 * @param x element to be added
 */

	function insert(Object x) public
	{
			// Insert element into inStack

			QueueWithStack.inStack.push(x);
	}

	/**
 * Remove an element from the front of the queue
 *
 * @return the new front of the queue
 */

	function remove() public returns(Object)
	{
			if(QueueWithStack.outStack.isEmpty())
			{
					// Move all elements from inStack to outStack (preserving the order)

					while(!QueueWithStack.inStack.isEmpty();)
					{
							QueueWithStack.outStack.push(QueueWithStack.inStack.pop());

					}
			}
			return QueueWithStack.outStack.pop();
	}

	/**
 * Peek at the element from the front of the queue
 *
 * @return the front element of the queue
 */

	function peekFront() public returns(Object)
	{
			if(QueueWithStack.outStack.isEmpty())
			{
					// Move all elements from inStack to outStack (preserving the order)

					while(!QueueWithStack.inStack.isEmpty();)
					{
							QueueWithStack.outStack.push(QueueWithStack.inStack.pop());

					}
			}
			return QueueWithStack.outStack.peek();
	}

	/**
 * Peek at the element from the back of the queue
 *
 * @return the back element of the queue
 */

	function peekBack() public returns(Object)
	{
			return QueueWithStack.inStack.peek();
	}

	/**
 * Returns true if the queue is empty
 *
 * @return true if the queue is empty
 */

	function isEmpty() public returns(bool)
	{
			return (QueueWithStack.inStack.isEmpty() && QueueWithStack.outStack.isEmpty());
	}

	/**
 * Constructor
 */

	constructor() public
	{
			;
			;
	}

}

library QueueWithStack_Library
{
}

/**
 * This class is the example for the Queue class
 *
 * @author sahilb2 (https://www.github.com/sahilb2)
 */

contract QueueUsingTwoStacks
{
}

library QueueUsingTwoStacks_Library
{
	/**
 * Main method
 *
 * @param args Command line arguments
 */

	function main(string[] memory args) public
	{
			QueueWithStack myQueue = new QueueWithStack();
			myQueue.insert(1);
			// Will print 1

			System.out.println(myQueue.peekBack());
			// outStack: []

			myQueue.insert(2);
			// Will print 2

			System.out.println(myQueue.peekBack());
			// outStack: []

			myQueue.insert(3);
			// Will print 3

			System.out.println(myQueue.peekBack());
			// outStack: []

			myQueue.insert(4);
			// Will print 4

			System.out.println(myQueue.peekBack());
			// Will print false

			System.out.println(myQueue.isEmpty());
			// Will print 1

			System.out.println(myQueue.remove());
			// Will print NULL

			System.out.println(myQueue.peekBack());
			myQueue.insert(5);
			// Will print 2

			System.out.println(myQueue.peekFront());
			myQueue.remove();
			// Will print 3

			System.out.println(myQueue.peekFront());
			// outStack: [(top) 3, 4]

			myQueue.remove();
			// Will print 4

			System.out.println(myQueue.peekFront());
			// outStack: [(top) 4]

			myQueue.remove();
			// Will print 5

			System.out.println(myQueue.peekFront());
			// outStack: [(top) 5]

			myQueue.remove();
			// Will print true

			System.out.println(myQueue.isEmpty());
	}

}

