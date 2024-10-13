pragma solidity 0.7.5;

//package Others


import "java/util/Stack.sol";

contract ReverseStackUsingRecursion
{
	// Stack

	Stack static  stack;

	// Function Used to reverse Stack Using Recursion

	function reverseUsingRecursion(Stack stack) private
	{
			if(// If stack is empty then return

stack.isEmpty())
			{
					return 
			}
			int32 temptop = int32(stack.peek());
			stack.pop();
			// Recursion call

			reverseUsingRecursion(stack);
			// Insert items held in call stack one by one into stack

			insertAtEnd(temptop);
	}

	// Function used to insert element at the end of stack

	function insertAtEnd(int32 temptop) private
	{
			if(stack.isEmpty())
			{
					// If stack is empty push the element

					stack.push(temptop);
			}
			else
			{
					int32 temp = int32(stack.peek());
					/* All the items are stored in call stack until we reach end*/

					stack.pop();
					// Recursive call

					insertAtEnd(temptop);
					stack.push(temp);
			}

	}

}

library ReverseStackUsingRecursion_Library
{
	// Main function

	function main(string[] memory args) public
	{
			// To Create a Dummy Stack containing integers from 0-9

			for(int32 i = int32(0); i < 10; i++;)
			{
					stack.push(i);
			}
			System.out.println("STACK");
			// To print that dummy Stack

			for(int32 k = int32(9); k >= 0; k--;)
			{
					System.out.println(k);
			}
			// Reverse Function called

			reverseUsingRecursion(stack);
			System.out.println("REVERSED STACK : ");
			// To print reversed  stack

			while(!stack.isEmpty();)
			{
					System.out.println(stack.pop());

			}
	}

	// Function Used to reverse Stack Using Recursion

	function reverseUsingRecursion(Stack stack) private
	{
			if(// If stack is empty then return

stack.isEmpty())
			{
					return 
			}
			int32 temptop = int32(stack.peek());
			stack.pop();
			// Recursion call

			reverseUsingRecursion(stack);
			// Insert items held in call stack one by one into stack

			insertAtEnd(temptop);
	}

	// Function used to insert element at the end of stack

	function insertAtEnd(int32 temptop) private
	{
			if(stack.isEmpty())
			{
					// If stack is empty push the element

					stack.push(temptop);
			}
			else
			{
					int32 temp = int32(stack.peek());
					/* All the items are stored in call stack until we reach end*/

					stack.pop();
					// Recursive call

					insertAtEnd(temptop);
					stack.push(temp);
			}

	}

}

/*Optional.empty*/


