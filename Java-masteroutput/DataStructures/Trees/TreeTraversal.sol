pragma solidity 0.7.5;

//package DataStructures.Trees


import "java/util/LinkedList.sol";

// Driver Program

contract TreeTraversal
{
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
 * Create an empty bag
 */

	function constructor1() public	overloadedConstructor( 1 )
	{
			firstElement = none;
			size = 0;
	}

	function constructor2(Node firstElement) public	overloadedConstructor( 2 )
	{
			currentElement = firstElement;
	}

}

library TreeTraversal_Library
{
	/**
 * main-method for testing
 */

	function main(string[] memory args) public
	{
			Bag bag;
			bag.add("1");
			bag.add("1");
			bag.add("2");
			System.out.println("size of bag = " + bag.size());
			for(uint256 iterator_var = uint256(0); iterator_var < bag.length; iterator_var++;)
			{
					string s = string(bag[uint256(iterator_var)]);
					System.out.println(s);
			}
			System.out.println(bag.contains(none));
			System.out.println(bag.contains("1"));
			System.out.println(bag.contains("3"));
	}

	function main(string[] memory args) public
	{
			Node tree = new Node(5);
			tree.insert(3);
			tree.insert(2);
			tree.insert(7);
			tree.insert(4);
			tree.insert(6);
			tree.insert(8);
			// Prints 5 3 2 4 7 6 8

			System.out.println("Pre order traversal:");
			tree.printPreOrder();
			System.out.println();
			// Prints 2 3 4 5 6 7 8

			System.out.println("In order traversal:");
			tree.printInOrder();
			System.out.println();
			// Prints 2 4 3 6 8 7 5

			System.out.println("Post order traversal:");
			tree.printPostOrder();
			System.out.println();
			// Prints 5 3 7 2 4 6 8

			System.out.println("Level order traversal:");
			tree.printLevelOrder();
			System.out.println();
	}

}

/**
 * The Node class which initializes a Node of a tree Consists of all 4 traversal methods:
 * printInOrder, printPostOrder， printPreOrder & printLevelOrder printInOrder: LEFT -> ROOT -> RIGHT
 * printPreOrder: ROOT -> LEFT -> RIGHT printPostOrder: LEFT -> RIGHT -> ROOT printLevelOrder:
 * Prints by level (starting at root), from left to right.
 */

contract Node
{
	Node left;

	int32 data;

	function insert(int32 value) public
	{
			if(value < data)
			{
					if(left == none)
					{
							left = new Node(value);
					}
					else
					{
							left.insert(value);
					}

			}
			else
			{
					if(right == none)
					{
							right = new Node(value);
					}
					else
					{
							right.insert(value);
					}

			}

	}

	function printInOrder() public
	{
			if(left != none)
			{
					left.printInOrder();
			}
			System.out.print(data + " ");
			if(right != none)
			{
					right.printInOrder();
			}
	}

	function printPreOrder() public
	{
			System.out.print(data + " ");
			if(left != none)
			{
					left.printPreOrder();
			}
			if(right != none)
			{
					right.printPreOrder();
			}
	}

	function printPostOrder() public
	{
			if(left != none)
			{
					left.printPostOrder();
			}
			if(right != none)
			{
					right.printPostOrder();
			}
			System.out.print(data + " ");
	}

	/**
 * O(n) time algorithm. Uses O(n) space to store nodes in a queue to aid in traversal.
 */

	function printLevelOrder() public
	{
			LinkedList queue;
			queue.add(Node);
			while(queue.size() > 0)
			{
					Node head = Node(queue.remove());
					System.out.print(head.data + " ");
					// Add children of recently-printed node to queue, if they exist.

					if(head.left != none)
					{
							queue.add(head.left);
					}
					if(head.right != none)
					{
							queue.add(head.right);
					}

			}
	}

	constructor(int32 data) public
	{
			Node.data = data;
	}

}

library Node_Library
{
}

/*Optional.empty*/


