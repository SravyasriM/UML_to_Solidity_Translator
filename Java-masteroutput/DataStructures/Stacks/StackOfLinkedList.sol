pragma solidity 0.7.5;

//package DataStructures.Stacks


import "java/util/NoSuchElementException.sol";

contract StackOfLinkedList
{
}

library StackOfLinkedList_Library
{
	function main(string[] memory args) public
	{
			LinkedListStack stack;
			stack.push(1);
			stack.push(2);
			stack.push(3);
			stack.push(4);
			stack.push(5);
			System.out.println(stack);
			System.out.println("Size of stack currently is: " + stack.getSize());
			System.out.println("Top element of stack currently is: " + stack.peek());
	}

}

contract Node
{
	int32 public  data;

	Node public  next;

	constructor(int32 data) public
	{
			Node.data = data;
			Node.next = none;
	}

}

library Node_Library
{
}

/**
 * A class which implements a stack using a linked list
 *
 * <p>Contains all the stack methods : push, pop, printStack, isEmpty
 */

contract LinkedListStack
{
	/**
 * Top of stack
 */

	Node head;

	/**
 * Size of stack
 */

	int32 private  size;

	/**
 * Add element at top
 *
 * @param x to be added
 * @return <tt>true</tt> if add successfully
 */

	function push(int32 x) public returns(bool)
	{
			Node newNode = new Node(x);
			newNode.next = head;
			head = newNode;
			size++;
			return true;
	}

	/**
 * Pop element at top of stack
 *
 * @return element at top of stack
 * @throws NoSuchElementException if stack is empty
 */

	function pop() public returns(int32)
	{
			if(size == 0)
			{
			}
			Node destroy = Node(head);
			head = head.next;
			int32 retValue = int32(destroy.data);
			// clear to let GC do it's work

			destroy = none;
			size--;
			return retValue;
	}

	/**
 * Peek element at top of stack
 *
 * @return element at top of stack
 * @throws NoSuchElementException if stack is empty
 */

	function peek() public returns(int32)
	{
			if(size == 0)
			{
			}
			return head.data;
	}

	function toString() public returns(String)
	{
			Node cur = Node(head);
			StringBuilder builder;
			while(cur != none)
			{
					builder.append(cur.data).append("->");
					cur = cur.next;

			}
			return builder.replace(builder.length() - 2, builder.length(), "").toString();
	}

	/**
 * Check if stack is empty
 *
 * @return <tt>true</tt> if stack is empty, otherwise <tt>false</tt>
 */

	function isEmpty() public returns(bool)
	{
			return size == 0;
	}

	/**
 * Return size of stack
 *
 * @return size of stack
 */

	function getSize() public returns(int32)
	{
			return size;
	}

	/**
 * Init properties
 */

	constructor() public
	{
			head = none;
			size = 0;
	}

}

library LinkedListStack_Library
{
}

/*Optional.empty*/


//Optional.empty


//Optional.empty


