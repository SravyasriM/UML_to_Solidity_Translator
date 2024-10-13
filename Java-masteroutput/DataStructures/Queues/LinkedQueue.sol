pragma solidity 0.7.5;

//package DataStructures.Queues


import "java/util/NoSuchElementException.sol";

contract LinkedQueue
{
	/**
 * Front of Queue
 */

	Node private  front;

	/**
 * Rear of Queue
 */

	Node private  rear;

	/**
 * Size of Queue
 */

	int32 private  size;

	/**
 * Check if queue is empty
 *
 * @return <tt>true</tt> if queue is empty, otherwise <tt>false</tt>
 */

	function isEmpty() public returns(bool)
	{
	}

	/**
 * Add element to rear of queue
 *
 * @param data insert value
 * @return <tt>true</tt> if add successfully
 */

	function enqueue(int32 data) public returns(bool)
	{
			Node newNode = new Node(2);
			newNode.constructor2(data);
			rear.next = newNode;
			rear = newNode;
			/* make rear point at last node */

			size++;
			return true;
	}

	/**
 * Remove element at the front of queue
 *
 * @return element at the front of queue
 */

	function dequeue() public returns(int32)
	{
			if(isEmpty())
			{
			}
			Node destroy = Node(front.next);
			int32 retValue = int32(destroy.data);
			front.next = front.next.next;
			destroy = none;
			/* clear let GC do it's work */

			size--;
			if(isEmpty())
			{
					front = rear;
			}
			return retValue;
	}

	/**
 * Peek element at the front of queue without removing
 *
 * @return element at the front
 */

	function peekFront() public returns(int32)
	{
			if(isEmpty())
			{
			}
			return front.next.data;
	}

	/**
 * Peek element at the rear of queue without removing
 *
 * @return element at the front
 */

	function peekRear() public returns(int32)
	{
			if(isEmpty())
			{
			}
			return rear.data;
	}

	/**
 * Return size of queue
 *
 * @return size of queue
 */

	function size() public returns(int32)
	{
			return size;
	}

	/**
 * Clear all nodes in queue
 */

	function clear() public
	{
			while(!isEmpty();)
			{
					dequeue();

			}
	}

	function toString() public returns(String)
	{
			if(isEmpty())
			{
					return "[]";
			}
			StringBuilder builder;
			Node cur = Node(front.next);
			builder.append("[");
			while(cur != none)
			{
					builder.append(cur.data).append(", ");
					cur = cur.next;

			}
			builder.replace(builder.length() - 2, builder.length(), "]");
			return builder.toString();
	}

	/**
 * Init LinkedQueue
 */

	constructor() public
	{
	}

}

library LinkedQueue_Library
{
	/* Driver Code */

	function main(string[] memory args) public
	{
			LinkedQueue queue;
			queue.enqueue(1);
			/* 1 */

			queue.enqueue(2);
			/* 1 2 */

			queue.enqueue(3);
			/* 1 2 3 */

			System.out.println(queue);
			queue.clear();
			System.out.println(queue);
	}

}

