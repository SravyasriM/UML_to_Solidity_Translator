pragma solidity 0.7.5;

//package DataStructures.Lists


import "java/util/Objects.sol";

contract CursorLinkedList
{
	int32 private  immutable os;

	int32 private  head;

	

	int32 private  count;

	int32 static  immutable CURSOR_SPACE_SIZE = int32(100);

	function printList() public
	{
			if(head != -1;)
			{
					int32 start = int32(head);
					while(start != -1;)
					{
							T element = T(cursorSpace[uint256(start)].element);
							System.out.println(element.toString());
							start = cursorSpace[uint256(start)].next;

					}
			}
	}

	/**
 * @return the logical index of the element within the list , not the actual index of the
 *     [cursorSpace] array
 */

	function indexOf(T element) public returns(int32)
	{
			Objects.requireNonNull(element);
			Node iterator = Node(cursorSpace[uint256(head)]);
			for(int32 i = int32(0); i < count; i++;)
			{
					if(iterator.element.equals(element))
					{
							return i;
					}
					iterator = cursorSpace[uint256(iterator.next)];
			}
			return -1;
	}

	/**
 * @param position , the logical index of the element , not the actual one within the
 *     [cursorSpace] array . this method should be used to get the index give by indexOf() method.
 * @return
 */

	function get(int32 position) public returns(T)
	{
			if(position >= 0 && position < count)
			{
					int32 start = int32(head);
					int32 counter = int32(0);
					while(start != -1;)
					{
							T element = T(cursorSpace[uint256(start)].element);
							if(counter == position)
							{
									return element;
							}
							start = cursorSpace[uint256(start)].next;
							counter++;

					}
			}
			return none;
	}

	function removeByIndex(int32 index) public
	{
			if(index >= 0 && index < count)
			{
					T element = T(get(index));
					remove(element);
			}
	}

	function remove(T element) public
	{
			Objects.requireNonNull(element);
			// case element is in the head

			T temp_element = T(cursorSpace[uint256(head)].element);
			int32 temp_next = int32(cursorSpace[uint256(head)].next);
			if(temp_element.equals(element))
			{
					free(head);
					head = temp_next;
			}
			else
			{
					int32 prev_index = int32(head);
					int32 current_index = int32(cursorSpace[uint256(prev_index)].next);
					while(current_index != -1;)
					{
							T current_element = T(cursorSpace[uint256(current_index)].element);
							if(current_element.equals(element))
							{
									cursorSpace[uint256(prev_index)].next = cursorSpace[uint256(current_index)].next;
									free(current_index);
									break;
							}
							prev_index = current_index;
							current_index = cursorSpace[uint256(prev_index)].next;

					}
			}

			count--;
	}

	function free(int32 index) private
	{
			Node os_node = Node(cursorSpace[uint256(os)]);
			int32 os_next = int32(os_node.next);
			cursorSpace[uint256(os)].next = index;
			cursorSpace[uint256(index)].element = none;
			cursorSpace[uint256(index)].next = os_next;
	}

	function append(T element) public
	{
			Objects.requireNonNull(element);
			int32 availableIndex = int32(alloc());
			cursorSpace[uint256(availableIndex)].element = element;
			if(head == -1;)
			{
					head = availableIndex;
			}
			int32 iterator = int32(head);
			while(cursorSpace[uint256(iterator)].next != -1;)
			{
					iterator = cursorSpace[uint256(iterator)].next;

			}
			cursorSpace[uint256(iterator)].next = availableIndex;
			cursorSpace[uint256(availableIndex)].next = -1;
			count++;
	}

	/**
 * @return the index of the next available node
 */

	function alloc() private returns(int32)
	{
			// 1- get the index at which the os is pointing

			int32 availableNodeIndex = int32(cursorSpace[uint256(os)].next);
			if(availableNodeIndex == 0)
			{
			}
			// 2- make the os point to the next of the  @var{availableNodeIndex}

			int32 availableNext = int32(cursorSpace[uint256(availableNodeIndex)].next);
			cursorSpace[uint256(os)].next = availableNext;
			// would throw an outOfBoundException

			cursorSpace[uint256(availableNodeIndex)].next = -1;
			return availableNodeIndex;
	}

	constructor() public
	{
			os = 0;
			count = 0;
			head = -1;
	}

}

library CursorLinkedList_Library
{
}

