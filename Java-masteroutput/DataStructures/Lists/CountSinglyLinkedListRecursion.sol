pragma solidity 0.7.5;

//package DataStructures.Lists


contract CountSinglyLinkedListRecursion is SinglyLinkedList
{
	/**
 * Calculate the count of the list manually using recursion.
 *
 * @param head head of the list.
 * @return count of the list.
 */

	function countRecursion(Node head) private returns(int32)
	{
			return head == none ? 0 : 1 + countRecursion(head.next);
	}

	/**
 * Returns the count of the list.
 */

	function count() override public returns(int32)
	{
			return countRecursion(getHead());
	}

}

library CountSinglyLinkedListRecursion_Library
{
	function main(string[] memory args) public
	{
			CountSinglyLinkedListRecursion list;
			for(int32 i = int32(1); i <= 5; ++i;)
			{
					list.insert(i);
			}
	}

}

