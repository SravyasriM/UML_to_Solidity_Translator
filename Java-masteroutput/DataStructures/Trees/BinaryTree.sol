pragma solidity 0.7.5;

//package DataStructures.Trees


/**
 * A binary tree is a data structure in which an element has two successors(children). The left
 * child is usually smaller than the parent, and the right child is usually bigger.
 *
 * @author Unknown
 */

contract BinaryTree
{
	/**
 * The root of the Binary Tree
 */

	Node private  root;

	/**
 * Method to find a Node with a certain value
 *
 * @param key Value being looked for
 * @return The node if it finds it, otherwise returns the parent
 */

	function find(int32 key) public returns(Node)
	{
			Node current = Node(root);
			while(current != none)
			{
					if(key < current.data)
					{
							// The key isn't exist, returns the parent

							if(current.left == none)
							{
								return current;							}
							current = current.left;
					}
					else
					{
						if(key > current.data)
						{
								if(current.right == none)
								{
									return current;								}
								current = current.right;
						}
						else
						{
								// If you find the value return it

								return current;
						}
					}


			}
			return none;
	}

	/**
 * Inserts certain value into the Binary Tree
 *
 * @param value Value to be inserted
 */

	function put(int32 value) public
	{
			Node newNode = new Node(value);
			if(root == none)
			{
				root = newNode;			}
			else
			{
					// This will return the soon to be parent of the value you're inserting

					Node parent = Node(find(value));
					// This if/else assigns the new node to be either the left or right child of the parent

					if(value < parent.data)
					{
							parent.left = newNode;
							parent.left.parent = parent;
							return 
					}
					else
					{
							parent.right = newNode;
							parent.right.parent = parent;
							return 
					}

			}

	}

	/**
 * Deletes a given value from the Binary Tree
 *
 * @param value Value to be deleted
 * @return If the value was deleted
 */

	function remove(int32 value) public returns(bool)
	{
			// temp is the node to be deleted

			Node temp = Node(find(value));
			// If the value doesn't exist

			if(temp.data != value)
			{
				return false;			}
			// No children

			if(temp.right == none && temp.left == none)
			{
					if(temp == root)
					{
						root = none;					}
					else
					{
						// This if/else assigns the new node to be either the left or right child of the parent

						if(temp.parent.data < temp.data)
						{
							temp.parent.right = none;						}
						else
						{
							temp.parent.left = none;						}
					}

					return true;
			}
			else
			{
				// Two children

				if(temp.left != none && temp.right != none)
				{
						Node successor = Node(findSuccessor(temp));
						// The left tree of temp is made the left tree of the successor

						successor.left = temp.left;
						successor.left.parent = successor;
						// If the successor has a right child, the child's grandparent is it's new parent

						if(successor.parent != temp)
						{
								if(successor.right != none)
								{
										successor.right.parent = successor.parent;
										successor.parent.left = successor.right;
										successor.right = temp.right;
										successor.right.parent = successor;
								}
								else
								{
										successor.parent.left = none;
										successor.right = temp.right;
										successor.right.parent = successor;
								}

						}
						if(temp == root)
						{
								successor.parent = none;
								root = successor;
								return true;
						}
						else
						{
// If you're not deleting the root

																successor.parent = temp.parent;
								// This if/else assigns the new node to be either the left or right child of the parent

								if(temp.parent.data < temp.data)
								{
									temp.parent.right = successor;								}
								else
								{
									temp.parent.left = successor;								}

								return true;
						}

				}
				else
				{
// One child

												// If it has a right child

						if(temp.right != none)
						{
								if(temp == root)
								{
										root = temp.right;
										return true;
								}
								temp.right.parent = temp.parent;
								// Assigns temp to left or right child

								if(temp.data < temp.parent.data)
								{
									temp.parent.left = temp.right;								}
								else
								{
									temp.parent.right = temp.right;								}

								return true;
						}
						else
						{
// If it has a left child

																if(temp == root)
								{
										root = temp.left;
										return true;
								}
								temp.left.parent = temp.parent;
								// Assigns temp to left or right side

								if(temp.data < temp.parent.data)
								{
									temp.parent.left = temp.left;								}
								else
								{
									temp.parent.right = temp.left;								}

								return true;
						}

				}
			}

	}

	/**
 * This method finds the Successor to the Node given. Move right once and go left down the tree as
 * far as you can
 *
 * @param n Node that you want to find the Successor of
 * @return The Successor of the node
 */

	function findSuccessor(Node n) public returns(Node)
	{
			if(n.right == none)
			{
				return n;			}
			Node current = Node(n.right);
			Node parent = Node(n.right);
			while(current != none)
			{
					parent = current;
					current = current.left;

			}
			return parent;
	}

	/**
 * Returns the root of the Binary Tree
 *
 * @return the root of the Binary Tree
 */

	function getRoot() public returns(Node)
	{
			return root;
	}

	/**
 * Prints leftChild - root - rightChild
 *
 * @param localRoot The local root of the binary tree
 */

	function inOrder(Node localRoot) public
	{
			if(localRoot != none)
			{
					inOrder(localRoot.left);
					System.out.print(localRoot.data + " ");
					inOrder(localRoot.right);
			}
	}

	/**
 * Prints root - leftChild - rightChild
 *
 * @param localRoot The local root of the binary tree
 */

	function preOrder(Node localRoot) public
	{
			if(localRoot != none)
			{
					System.out.print(localRoot.data + " ");
					preOrder(localRoot.left);
					preOrder(localRoot.right);
			}
	}

	/**
 * Prints rightChild - leftChild - root
 *
 * @param localRoot The local root of the binary tree
 */

	function postOrder(Node localRoot) public
	{
			if(localRoot != none)
			{
					postOrder(localRoot.left);
					postOrder(localRoot.right);
					System.out.print(localRoot.data + " ");
			}
	}

	/**
 * Constructor
 */

	constructor() public
	{
			root = none;
	}

}

library BinaryTree_Library
{
}

/*Optional.empty*/


