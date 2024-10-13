pragma solidity 0.7.5;

//package DataStructures.Stacks


import "java/util/ArrayList.sol";

import "java/util/EmptyStackException.sol";

/**
 * This class implements a Stack using an ArrayList.
 *
 * <p>A stack is exactly what it sounds like. An element gets added to the top of the stack and only
 * the element on the top may be removed.
 *
 * <p>This is an ArrayList Implementation of a stack, where size is not a problem we can extend the
 * stack as much as we want.
 */

contract StackArrayList
{
	/**
 * ArrayList representation of the stack
 */

	ArrayList private  stack;

	/**
 * Adds value to the end of list which is the top for stack
 *
 * @param value value to be added
 */

	function push(int32 value) public
	{
			stack.add(value);
	}

	/**
 * Removes the element at the top of this stack and returns
 *
 * @return Element popped
 * @throws EmptyStackException if the stack is empty.
 */

	function pop() public returns(int32)
	{
			if(isEmpty())
			{
			}
			/* remove the element on the top of the stack */

			return stack.remove(stack.size() - 1);
	}

	/**
 * Test if the stack is empty.
 *
 * @return {@code true} if this stack is empty, {@code false} otherwise.
 */

	function isEmpty() public returns(bool)
	{
			return stack.isEmpty();
	}

	/**
 * Return the element at the top of this stack without removing it from the stack.
 *
 * @return the element at the top of this stack.
 */

	function peek() public returns(int32)
	{
			if(isEmpty())
			{
			}
			return stack.get(stack.size() - 1);
	}

	/**
 * Return size of this stack.
 *
 * @return size of this stack.
 */

	function size() public returns(int32)
	{
			return stack.size();
	}

	/**
 * Constructor
 */

	constructor() public
	{
			;
	}

}

library StackArrayList_Library
{
	/**
 * Driver Code
 */

	function main(string[] memory args) public
	{
			StackArrayList stack;
			for(int32 i = int32(1); i <= 5; ++i;)
			{
					stack.push(i);
			}
			/* pop elements at the top of this stack one by one */

			while(!stack.isEmpty();)
			{
					stack.pop();

			}
				//try

					stack.pop();

				/* catch (EmptyStackException e) {
    assert true;
/* this should happen */
}*/


	}

}

