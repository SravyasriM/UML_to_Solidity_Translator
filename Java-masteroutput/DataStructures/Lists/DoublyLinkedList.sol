pragma solidity 0.7.5;

//package DataStructures.Lists


/**
 * This class implements a DoublyLinkedList. This is done using the classes LinkedList and Link.
 *
 * <p>A linked list is similar to an array, it holds values. However, links in a linked list do not
 * have indexes. With a linked list you do not need to predetermine it's size as it grows and
 * shrinks as it is edited. This is an example of a double ended, doubly linked list. Each link
 * references the next link and the previous one.
 *
 * @author Unknown
 */

contract DoublyLinkedList
{
	/**
 * Head refers to the front of the list
 */

	Link private  head;

	/**
 * Tail refers to the back of the list
 */

	Link private  tail;

	/**
 * Size refers to the number of elements present in the list
 */

	int32 private  size;

	/**
 * Insert an element at the head
 *
 * @param x Element to be inserted
 */

	function insertHead(int32 x) public
	{
			// Create a new link with a value attached to it

			Link newLink;
			if(// Set the first element added to be the tail

isEmpty())
			{
				tail = newLink;			}
			else
			{
				// newLink <-- currenthead(head)

				head.previous = newLink;			}

			// newLink <--> currenthead(head)

			newLink.next = head;
			// newLink(head) <--> oldhead

			head = newLink;
			++size;
	}

	/**
 * Insert an element at the tail
 *
 * @param x Element to be inserted
 */

	function insertTail(int32 x) public
	{
			Link newLink;
			// currentTail(tail)     newlink -->

			newLink.next = none;
			if(isEmpty())
			{
					// Check if there are no elements in list then it adds first element

					tail = newLink;
					head = tail;
			}
			else
			{
					// currentTail(tail) --> newLink -->

					tail.next = newLink;
					// currentTail(tail) <--> newLink -->

					newLink.previous = tail;
					// oldTail <--> newLink(tail) -->

					tail = newLink;
			}

			++size;
	}

	/**
 * Insert an element at the index
 *
 * @param x Element to be inserted
 * @param index Index(from start) at which the element x to be inserted
 */

	function insertElementByIndex(int32 x, int32 index) public
	{
			if(index == 0)
			{
					insertHead(x);
			}
			else
			{
					if(index == size)
					{
							insertTail(x);
					}
					else
					{
							Link newLink;
							// 

							Link previousLink = Link(head);
							for(int32 i = int32(1); i < index; i++;)
							{
									// Loop to reach the index

									previousLink = previousLink.next;
							}
							// previousLink is the Link at index - 1 from start

							previousLink.next.previous = newLink;
							newLink.next = previousLink.next;
							newLink.previous = previousLink;
							previousLink.next = newLink;
					}

			}

			++size;
	}

	/**
 * Delete the element at the head
 *
 * @return The new head
 */

	function deleteHead() public returns(Link)
	{
			Link temp = Link(head);
			// oldHead <--> 2ndElement(head)

			head = head.next;
			if(head == none)
			{
					tail = none;
			}
			else
			{
					head.previous = none;
			}

			--size;
			return temp;
	}

	/**
 * Delete the element at the tail
 *
 * @return The new tail
 */

	function deleteTail() public returns(Link)
	{
			Link temp = Link(tail);
			// 2ndLast(tail) <--> oldTail --> null

			tail = tail.previous;
			if(tail == none)
			{
					head = none;
			}
			else
			{
					// 2ndLast(tail) --> null

					tail.next = none;
			}

			--size;
			return temp;
	}

	/**
 * Delete the element from somewhere in the list
 *
 * @param x element to be deleted
 * @return Link deleted
 */

	function delete(int32 x) public
	{
			Link current = Link(head);
			while(current.value != x)
			{
					// Find the position to delete

					if(current != tail)
					{
							current = current.next;
					}
					else
					{
					}


			}
			if(current == head)
			{
				deleteHead();			}
			else
			{
				if(current == tail)
				{
					deleteTail();				}
				else
				{
						// 1 --> 3

						current.previous.next = current.next;
						// 1 <--> 3

						current.next.previous = current.previous;
				}
			}

			--size;
	}

	/**
 * Inserts element and reorders
 *
 * @param x Element to be added
 */

	function insertOrdered(int32 x) public
	{
			Link newLink;
			Link current = Link(head);
			while(// Find the position to insert

current != none && x > current.value)
			{
				current = current.next;
			}
			if(current == head)
			{
				insertHead(x);			}
			else
			{
				if(current == none)
				{
					insertTail(x);				}
				else
				{
						// 1 <-- newLink

						newLink.previous = current.previous;
						// 1 <--> newLink

						current.previous.next = newLink;
						// 1 <--> newLink --> 2(current) <--> 3

						newLink.next = current;
						// 1 <--> newLink <--> 2(current) <--> 3

						current.previous = newLink;
				}
			}

			++size;
	}

	/**
 * Deletes the passed node from the current list
 *
 * @param z Element to be deleted
 */

	function deleteNode(Link z) public
	{
			if(z.next == none)
			{
					deleteTail();
			}
			else
			{
				if(z == head)
				{
						deleteHead();
				}
				else
				{
						// 1 --> 3

						z.previous.next = z.next;
						// 1 <--> 3

						z.next.previous = z.previous;
				}
			}

			--size;
	}

	function removeDuplicates(DoublyLinkedList l) public
	{
			Link linkOne = Link(l.head);
			while(linkOne.next != none)
			{
					// second link for comparison

					Link linkTwo = Link(linkOne.next);
					while(linkTwo.next != none)
					{
							if(// if there are duplicates values then

linkOne.value == linkTwo.value)
							{
								// delete the link

								l.delete(linkTwo.value);							}
							// go to next link

							linkTwo = linkTwo.next;

					}
					// go to link link to iterate the whole list again

					linkOne = linkOne.next;

			}
	}

	/**
 * Clears List
 */

	function clearList() public
	{
			head = none;
			tail = none;
			size = 0;
	}

	/**
 * Returns true if list is empty
 *
 * @return true if list is empty
 */

	function isEmpty() public returns(bool)
	{
			return (head == none);
	}

	/**
 * Prints contents of the list
 */

	function display() public
	{
			// Prints contents of the list

			Link current = Link(head);
			while(current != none)
			{
					current.displayLink();
					current = current.next;

			}
			System.out.println();
	}

	/**
 * Default Constructor
 */

	constructor() public
	{
			head = none;
			tail = none;
			size = 0;
	}

}

library DoublyLinkedList_Library
{
	function removeDuplicates(DoublyLinkedList l) public
	{
			Link linkOne = Link(l.head);
			while(linkOne.next != none)
			{
					// second link for comparison

					Link linkTwo = Link(linkOne.next);
					while(linkTwo.next != none)
					{
							if(// if there are duplicates values then

linkOne.value == linkTwo.value)
							{
								// delete the link

								l.delete(linkTwo.value);							}
							// go to next link

							linkTwo = linkTwo.next;

					}
					// go to link link to iterate the whole list again

					linkOne = linkOne.next;

			}
	}

}

/**
 * This class is used to implement the nodes of the linked list.
 *
 * @author Unknown
 */

contract Link
{
	/**
 * Value of node
 */

	int32 public  value;

	/**
 * This points to the link in front of the new link
 */

	Link public  next;

	/**
 * This points to the link behind the new link
 */

	Link public  previous;

	/**
 * Displays the node
 */

	function displayLink() public
	{
			System.out.print(value + " ");
	}

	/**
 * Constructor
 *
 * @param value Value of node
 */

	constructor(int32 value) public
	{
			Link.value = value;
	}

}

library Link_Library
{
	/**
 * Main Method
 *
 * @param args Command line arguments
 */

	function main(string[] memory args) public
	{
			DoublyLinkedList myList = new DoublyLinkedList();
			myList.insertHead(13);
			myList.insertHead(7);
			myList.insertHead(10);
			// <-- 10(head) <--> 7 <--> 13(tail) -->

			myList.display();
			myList.insertTail(11);
			// <-- 10(head) <--> 7 <--> 13 <--> 11(tail) -->

			myList.display();
			myList.deleteTail();
			// <-- 10(head) <--> 7 <--> 13(tail) -->

			myList.display();
			myList.delete(7);
			// <-- 10(head) <--> 13(tail) -->

			myList.display();
			myList.insertOrdered(23);
			myList.insertOrdered(67);
			myList.insertOrdered(3);
			// <-- 3(head) <--> 10 <--> 13 <--> 23 <--> 67(tail) -->

			myList.display();
			myList.insertElementByIndex(5, 1);
			// <-- 3(head) <--> 5 <--> 10 <--> 13 <--> 23 <--> 67(tail) -->

			myList.display();
			myList.clearList();
			myList.display();
			myList.insertHead(20);
			myList.display();
	}

}

