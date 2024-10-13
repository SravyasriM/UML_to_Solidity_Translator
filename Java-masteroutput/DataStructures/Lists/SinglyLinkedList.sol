pragma solidity 0.7.5;

//package DataStructures.Lists


import "java/util/StringJoiner.sol";

/**
 * https://en.wikipedia.org/wiki/Linked_list
 */

contract SinglyLinkedList
{
	/**
 * Head refer to the front of the list
 */

	Node private  head;

	/**
 * Size of SinglyLinkedList
 */

	int32 private  size;

	/**
 * Inserts an element at the head of the list
 *
 * @param x element to be added
 */

	function insertHead(int32 x) public
	{
			insertNth(x, 0);
	}

	/**
 * Insert an element at the tail of the list
 *
 * @param data element to be added
 */

	function insert(int32 data) public
	{
			insertNth(data, size);
	}

	/**
 * Inserts a new node at a specified position of the list
 *
 * @param data data to be stored in a new node
 * @param position position at which a new node is to be inserted
 */

	function insertNth(int32 data, int32 position) public
	{
			checkBounds(position, 0, size);
			Node newNode = new Node(data);
			if(head == none)
			{
					/* the list is empty */

					head = newNode;
					size++;
					return 
			}
			else
			{
				if(position == 0)
				{
						/* insert at the head of the list */

						newNode.next = head;
						head = newNode;
						size++;
						return 
				}			}

			Node cur = Node(head);
			for(int32 i = int32(0); i < position - 1; ++i;)
			{
					cur = cur.next;
			}
			newNode.next = cur.next;
			cur.next = newNode;
			size++;
	}

	/**
 * Deletes a node at the head
 */

	function deleteHead() public
	{
			deleteNth(0);
	}

	/**
 * Deletes an element at the tail
 */

	function delete() public
	{
			deleteNth(size - 1);
	}

	/**
 * Deletes an element at Nth position
 */

	function deleteNth(int32 position) public
	{
			checkBounds(position, 0, size - 1);
			if(position == 0)
			{
					Node destroy = Node(head);
					head = head.next;
					destroy = none;
					/* clear to let GC do its work */

					size--;
					return 
			}
			Node cur = Node(head);
			for(int32 i = int32(0); i < position - 1; ++i;)
			{
					cur = cur.next;
			}
			Node destroy = Node(cur.next);
			cur.next = cur.next.next;
			// clear to let GC do its work

			destroy = none;
			size--;
	}

	/**
 * @param position to check position
 * @param low low index
 * @param high high index
 * @throws IndexOutOfBoundsException if {@code position} not in range {@code low} to {@code high}
 */

	function checkBounds(int32 position, int32 low, int32 high) public
	{
			if(position > high || position < low)
			{
			}
	}

	/**
 * Clear all nodes in the list
 */

	function clear() public
	{
			Node cur = Node(head);
			while(cur != none)
			{
					Node prev = Node(cur);
					cur = cur.next;
					// clear to let GC do its work

					prev = none;

			}
			head = none;
			size = 0;
	}

	/**
 * Checks if the list is empty
 *
 * @return {@code true} if list is empty, otherwise {@code false}.
 */

	function isEmpty() public returns(bool)
	{
			return size == 0;
	}

	/**
 * Returns the size of the linked list.
 *
 * @return the size of the list.
 */

	function size() public returns(int32)
	{
			return size;
	}

	/**
 * Get head of the list.
 *
 * @return head of the list.
 */

	function getHead() public returns(Node)
	{
			return head;
	}

	/**
 * Calculate the count of the list manually
 *
 * @return count of the list
 */

	function count() public returns(int32)
	{
			int32 count = int32(0);
			Node cur = Node(head);
			while(cur != none)
			{
					cur = cur.next;
					count++;

			}
			return count;
	}

	/**
 * Test if the value key is present in the list.
 *
 * @param key the value to be searched.
 * @return {@code true} if key is present in the list, otherwise {@code false}.
 */

	function search(int32 key) public returns(bool)
	{
			Node cur = Node(head);
			while(cur != none)
			{
					if(cur.value == key)
					{
							return true;
					}
					cur = cur.next;

			}
			return false;
	}

	/**
 * Return element at special index.
 *
 * @param index given index of element
 * @return element at special index.
 */

	function getNth(int32 index) public returns(int32)
	{
			checkBounds(index, 0, size - 1);
			Node cur = Node(head);
			for(int32 i = int32(0); i < index; ++i;)
			{
					cur = cur.next;
			}
			return cur.value;
	}

	function toString() public returns(String)
	{
			StringJoiner joiner;
			Node cur = Node(head);
			while(cur != none)
			{
					joiner.add(cur.value + "");
					cur = cur.next;

			}
			return joiner.toString();
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
 * Init SinglyLinkedList
 */

	function constructor1() public	overloadedConstructor( 1 )
	{
			head = none;
			size = 0;
	}

	/**
 * Init SinglyLinkedList with specified head node and size
 *
 * @param head the head node of list
 * @param size the size of list
 */

	function constructor2(Node head, int32 size) public	overloadedConstructor( 2 )
	{
			SinglyLinkedList.head = head;
			SinglyLinkedList.size = size;
	}

}

library SinglyLinkedList_Library
{
	function main(string[] memory args) public
	{
			SinglyLinkedList listA;
			SinglyLinkedList listB;
			for(int32 i = int32(2); i <= 10; i += 2;)
			{
					listA.insert(i);
					listB.insert(i - 1);
			}
	}

	/**
 * Merge two sorted SingleLinkedList
 *
 * @param listA the first sorted list
 * @param listB the second sored list
 * @return merged sorted list
 */

	function merge(SinglyLinkedList listA, SinglyLinkedList listB) public returns(SinglyLinkedList)
	{
			Node headA = Node(listA.getHead());
			Node headB = Node(listB.getHead());
			int32 size = int32(listA.size() + listB.size());
			Node head = new Node();
			Node tail = Node(head);
			while(headA != none && headB != none)
			{
					if(headA.value <= headB.value)
					{
							tail.next = headA;
							headA = headA.next;
					}
					else
					{
							tail.next = headB;
							headB = headB.next;
					}

					tail = tail.next;

			}
			if(headA == none)
			{
					tail.next = headB;
			}
			if(headB == none)
			{
					tail.next = headA;
			}
			return 
	}

	/**
 * Driver Code
 */

	function main(string[] memory arg) public
	{
			SinglyLinkedList list;
			/* Test insert function */

			list.insertHead(5);
			list.insertHead(7);
			list.insertHead(10);
			list.insert(3);
			list.insertNth(1, 4);
			/* Test delete function */

			list.deleteHead();
			list.deleteNth(1);
			list.delete();
			list.clear();
				//try

					list.delete();

				/* catch (Exception e) {
    assert true;
/* this should happen */
}*/


	}

}

/**
 * This class is the nodes of the SinglyLinked List. They consist of a value and a pointer to the
 * node after them.
 */

contract Node
{
	/**
 * The value of the node
 */

	int32 value;

	/**
 * Point to the next node
 */

	Node next;

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

	function constructor1() internal	overloadedConstructor( 1 )
	{
	}

	/**
 * Constructor
 *
 * @param value Value to be put in the node
 */

	function constructor2(int32 value) internal	overloadedConstructor( 2 )
	{
	}

	/**
 * Constructor
 *
 * @param value Value to be put in the node
 * @param next Reference to the next node
 */

	function constructor3(int32 value, Node next) internal	overloadedConstructor( 3 )
	{
			Node.value = value;
			Node.next = next;
	}

}

library Node_Library
{
}

