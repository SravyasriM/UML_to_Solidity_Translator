pragma solidity 0.7.5;

//package DataStructures.Lists


contract CircleLinkedList
{
	// For better O.O design this should be private allows for better black box design

	int32 private  size;

	// this will point to dummy node;

	Node private  head = Node(none)

	// getter for the size... needed because size is private.

	function getSize() public returns(int32)
	{
			return size;
	}

	// add functions can be implemented however this is the basses of them all really.

	function append(E value) public
	{
			if(value == none)
			{
			}
			// head.next points to the last element;

			head.next = new Node(value, head);
			size++;
	}

	function remove(int32 pos) public returns(E)
	{
			if(pos > size || pos < 0)
			{
			}
			// bellow.

			Node before = Node(head);
			for(int32 i = int32(1); i <= pos; i++;)
			{
					before = before.next;
			}
			Node destroy = Node(before.next);
			E saved = E(destroy.value);
			// the last element will be assigned to the head.

			before.next = before.next.next;
			// scrubbing

			destroy = none;
			size--;
			return saved;
	}

	// with reduced error catching as our list will never be empty;

	constructor() public
	{
			// creation of the dummy node

			head = new Node(none, head);
			size = 0;
	}

}

library CircleLinkedList_Library
{
}

