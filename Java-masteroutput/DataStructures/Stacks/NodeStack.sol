pragma solidity 0.7.5;

//package DataStructures.Stacks


/**
 * Implementation of a stack using nodes. Unlimited size, no arraylist.
 *
 * @author Kyler Smith, 2017
 */

contract NodeStack
{
	/**
 * Information each node should contain.
 *
 * @value data : information of the value in the node
 * @value head : the head of the stack
 * @value next : the next value from this node
 * @value previous : the last value from this node
 * @value size : size of the stack
 */

	Item private  data;

	NodeStack static  head;

	NodeStack private  next;

	NodeStack private  previous;

	int32 static  size = int32(0);

	/**
 * Put a value onto the stack.
 *
 * @param item : value to be put on the stack.
 */

	function push(Item item) public
	{
			NodeStack newNs;
			if(this.isEmpty())
			{
					newNs.setNext(none);
					newNs.setPrevious(none);
			}
			else
			{
					newNs.setPrevious(NodeStack.head);
					NodeStack.head.setNext(newNs);
					NodeStack.head.setHead(newNs);
			}

			NodeStack.setSize(NodeStack.getSize() + 1);
	}

	/**
 * Value to be taken off the stack.
 *
 * @return item : value that is returned.
 */

	function pop() public returns(Item)
	{
			Item item = Item(Item(NodeStack.head.getData()));
			NodeStack.head.setHead(NodeStack.head.getPrevious());
			NodeStack.head.setNext(none);
			NodeStack.setSize(NodeStack.getSize() - 1);
			return item;
	}

	/**
 * Value that is next to be taken off the stack.
 *
 * @return item : the next value that would be popped off the stack.
 */

	function peek() public returns(Item)
	{
			return Item(NodeStack.head.getData());
	}

	/**
 * If the stack is empty or there is a value in.
 *
 * @return boolean : whether or not the stack has anything in it.
 */

	function isEmpty() public returns(bool)
	{
			return NodeStack.getSize() == 0;
	}

	/**
 * Returns the size of the stack.
 *
 * @return int : number of values in the stack.
 */

	function size() public returns(int32)
	{
			return NodeStack.getSize();
	}

	/**
 * Print the contents of the stack in the following format.
 *
 * <p>x <- head (next out) y z <- tail (first in) . . .
 */

	function print() public
	{
			for(NodeStack n = NodeStack(NodeStack.head); n != none; n = n.previous;)
			{
					System.out.println(n.getData().toString());
			}
	}

	/**
 * Getters and setters (private)
 */

	function getHead() private returns(NodeStack)
	{
			return NodeStack.head;
	}

	function setHead(NodeStack ns) private
	{
			NodeStack.head = ns;
	}

	function getNext() private returns(NodeStack)
	{
			return next;
	}

	function setNext(NodeStack next) private
	{
			NodeStack.next = next;
	}

	function getPrevious() private returns(NodeStack)
	{
			return previous;
	}

	function setPrevious(NodeStack previous) private
	{
			NodeStack.previous = previous;
	}

	function getSize() private returns(int32)
	{
			return size;
	}

	function setSize(int32 size) private
	{
			NodeStack.size = size;
	}

	function getData() private returns(Item)
	{
			return NodeStack.data;
	}

	function setData(Item item) private
	{
			NodeStack.data = item;
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
 * Constructors for the NodeStack.
 */

	function constructor1() public	overloadedConstructor( 1 )
	{
	}

	function constructor2(Item item) private	overloadedConstructor( 2 )
	{
			NodeStack.data = item;
	}

}

library NodeStack_Library
{
	/**
 * Entry point for the program.
 */

	function main(string[] memory args) public
	{
			NodeStack Stack;
			Stack.push(3);
			Stack.push(4);
			Stack.push(5);
			System.out.println("Testing :");
			// prints : 5 4 3

			Stack.print();
			// x = 5

			Integer x = Integer(Stack.pop());
			Stack.push(1);
			Stack.push(8);
			// y = 8

			Integer y = Integer(Stack.peek());
			System.out.println("Testing :");
			// prints : 8 1 4 3

			Stack.print();
			System.out.println("Testing :");
			System.out.println("x : " + x);
			System.out.println("y : " + y);
	}

	function setHead(NodeStack ns) private
	{
			NodeStack.head = ns;
	}

	function getSize() private returns(int32)
	{
			return size;
	}

	function setSize(int32 size) private
	{
			NodeStack.size = size;
	}

}

