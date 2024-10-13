pragma solidity 0.7.5;

//package DataStructures.Stacks


/**
 * This class implements a Stack using a regular array.
 *
 * <p>A stack is exactly what it sounds like. An element gets added to the top of the stack and only
 * the element on the top may be removed. This is an example of an array implementation of a Stack.
 * So an element can only be added/removed from the end of the array. In theory stack have no fixed
 * size, but with an array implementation it does.
 */

contract StackArray
{
	/**
 * Default initial capacity.
 */

	int32 static  immutable DEFAULT_CAPACITY = int32(10);

	/**
 * The max size of the Stack
 */

	int32 private  maxSize;

	/**
 * The top of the stack
 */

	int32 private  top;

	/**
 * Adds an element to the top of the stack
 *
 * @param value The element added
 */

	function push(int32 value) public
	{
			if(!isFull();)
			{
					// Checks for a full stack

					top++;
					stackArray[uint256(top)] = value;
			}
			else
			{
					resize(maxSize * 2);
					// don't forget push after resizing

					push(value);
			}

	}

	/**
 * Removes the top element of the stack and returns the value you've removed
 *
 * @return value popped off the Stack
 */

	function pop() public returns(int32)
	{
			if(!isEmpty();)
			{
					// Checks for an empty stack

					return stackArray[uint256(top--;)]
			}
			if(top < maxSize / 4)
			{
					resize(maxSize / 2);
					// don't forget pop after resizing

					return pop();
			}
			else
			{
					System.out.println("The stack is already empty");
					return -1;
			}

	}

	/**
 * Returns the element at the top of the stack
 *
 * @return element at the top of the stack
 */

	function peek() public returns(int32)
	{
			if(!isEmpty();)
			{
					// Checks for an empty stack

					return stackArray[uint256(top)];
			}
			else
			{
					System.out.println("The stack is empty, cant peek");
					return -1;
			}

	}

	function resize(int32 newSize) private
	{
			for(int32 i = int32(0); i < stackArray.length; i++;)
			{
					transferArray[uint256(i)] = stackArray[uint256(i)];
			}
			// This reference change might be nice in here

			stackArray = transferArray;
			maxSize = newSize;
	}

	/**
 * Returns true if the stack is empty
 *
 * @return true if the stack is empty
 */

	function isEmpty() public returns(bool)
	{
			return (top == -1;)
	}

	/**
 * Returns true if the stack is full
 *
 * @return true if the stack is full
 */

	function isFull() public returns(bool)
	{
			return (top + 1 == maxSize);
	}

	/**
 * Deletes everything in the Stack
 *
 * <p>Doesn't delete elements in the array but if you call push method after calling makeEmpty it
 * will overwrite previous values
 */

	function makeEmpty() public
	{
			// push method after calling makeEmpty it will overwrite previous values

			top = -1;
	}

	/**
 * Return size of stack
 *
 * @return size of stack
 */

	function size() public returns(int32)
	{
			return top + 1;
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
 * init Stack with DEFAULT_CAPACITY
 */

	function constructor1() public	overloadedConstructor( 1 )
	{
	}

	/**
 * Constructor
 *
 * @param size Size of the Stack
 */

	function constructor2(int32 size) public	overloadedConstructor( 2 )
	{
			maxSize = size;
			stackArray = new int32[](maxSize);
			top = -1;
	}

}

library StackArray_Library
{
	/**
 * Driver Code
 */

	function main(string[] memory args) public
	{
			// Declare a stack of maximum size 4

			StackArray myStackArray;
			// Populate the stack

			myStackArray.push(5);
			myStackArray.push(8);
			myStackArray.push(2);
			myStackArray.push(9);
	}

}

