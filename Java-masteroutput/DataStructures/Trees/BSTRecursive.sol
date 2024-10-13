pragma solidity 0.7.5;

/**
 * <h1>Binary Search Tree (Recursive)</h1>
 *
 * An implementation of BST recursively. In recursive implementation the checks are down the tree
 * First root is checked if not found then its childs are checked Binary Search Tree is a binary
 * tree which satisfies three properties: left child is less than root node, right child is grater
 * than root node, both left and right childs must themselves be a BST.
 *
 * <p>I have made public functions as methods and to actually implement recursive approach I have
 * used private methods
 *
 * @author [Lakhan Nad](https://github.com/Lakhan-Nad)
 */

contract BSTRecursive
{
	/**
 * only data member is root of BST
 */

	Node private  root;

	/**
 * Recursive method to delete a data if present in BST.
 *
 * @param node the current node to search for data
 * @param data the value to be deleted
 * @return Node the updated value of root parameter after delete operation
 */

	function delete(Node node, int32 data) private returns(Node)
	{
			if(node == none)
			{
					System.out.println("No such data present in BST.");
			}
			else
			{
				if(node.data > data)
				{
						node.left = delete(node.left, data);
				}
				else
				{
					if(node.data < data)
					{
							node.right = delete(node.right, data);
					}
					else
					{
							if(node.right == none && node.left == none)
							{
									// If it is leaf node

									node = none;
							}
							else
							{
								if(node.left == none)
								{
										// If only right node is present

										Node temp = Node(node.right);
										node.right = none;
										node = temp;
								}
								else
								{
									if(node.right == none)
									{
											// Only left node is present

											Node temp = Node(node.left);
											node.left = none;
											node = temp;
									}
									else
									{
											// both child are present

											Node temp = Node(node.right);
											// Find leftmost child of right subtree

											while(temp.left != none)
											{
													temp = temp.left;

											}
											node.data = temp.data;
											node.right = delete(node.right, temp.data);
									}
								}
							}

					}
				}
			}

			return node;
	}

	/**
 * Recursive insertion of value in BST.
 *
 * @param node to check if the data can be inserted in current node or its subtree
 * @param data the value to be inserted
 * @return the modified value of the root parameter after insertion
 */

	function insert(Node node, int32 data) private returns(Node)
	{
			if(node == none)
			{
					node = new Node(data);
			}
			else
			{
				if(node.data > data)
				{
						node.left = insert(node.left, data);
				}
				else
				{
					if(node.data < data)
					{
							node.right = insert(node.right, data);
					}				}
			}

			return node;
	}

	/**
 * Recursively print Preorder traversal of the BST
 *
 * @param node the root node
 */

	function preOrder(Node node) private
	{
			if(node == none)
			{
					return 
			}
			System.out.print(node.data + " ");
			if(node.left != none)
			{
					preOrder(node.left);
			}
			if(node.right != none)
			{
					preOrder(node.right);
			}
	}

	/**
 * Recursively print Postorder travesal of BST.
 *
 * @param node the root node
 */

	function postOrder(Node node) private
	{
			if(node == none)
			{
					return 
			}
			if(node.left != none)
			{
					postOrder(node.left);
			}
			if(node.right != none)
			{
					postOrder(node.right);
			}
			System.out.print(node.data + " ");
	}

	/**
 * Recursively print Inorder traversal of BST.
 *
 * @param node the root node
 */

	function inOrder(Node node) private
	{
			if(node == none)
			{
					return 
			}
			if(node.left != none)
			{
					inOrder(node.left);
			}
			System.out.print(node.data + " ");
			if(node.right != none)
			{
					inOrder(node.right);
			}
	}

	/**
 * Serach recursively if the given value is present in BST or not.
 *
 * @param node the current node to check
 * @param data the value to be checked
 * @return boolean if data is present or not
 */

	function search(Node node, int32 data) private returns(bool)
	{
			if(node == none)
			{
					return false;
			}
			else
			{
				if(node.data == data)
				{
						return true;
				}
				else
				{
					if(node.data > data)
					{
							return search(node.left, data);
					}
					else
					{
							return search(node.right, data);
					}
				}
			}

	}

	/**
 * add in BST. if the value is not already present it is inserted or else no change takes place.
 *
 * @param data the value to be inserted
 */

	function add(int32 data) public
	{
			BSTRecursive.root = insert(BSTRecursive.root, data);
	}

	/**
 * If data is present in BST delete it else do nothing.
 *
 * @param data the value to be removed
 */

	function remove(int32 data) public
	{
			BSTRecursive.root = delete(BSTRecursive.root, data);
	}

	/**
 * To call inorder traversal on tree
 */

	function inorder() public
	{
			System.out.println("Inorder traversal of this tree is:");
			inOrder(BSTRecursive.root);
			// for next line

			System.out.println();
	}

	/**
 * To call postorder traversal on tree
 */

	function postorder() public
	{
			System.out.println("Postorder traversal of this tree is:");
			postOrder(BSTRecursive.root);
			// for next li

			System.out.println();
	}

	/**
 * To call preorder traversal on tree.
 */

	function preorder() public
	{
			System.out.println("Preorder traversal of this tree is:");
			preOrder(BSTRecursive.root);
			// for next li

			System.out.println();
	}

	/**
 * To check if given value is present in tree or not.
 *
 * @param data the data to be found for
 */

	function find(int32 data) public returns(bool)
	{
			if(search(BSTRecursive.root, data))
			{
					System.out.println(data + " is present in given BST.");
					return true;
			}
			System.out.println(data + " not found.");
			return false;
	}

}

library BSTRecursive_Library
{
	/**
 * main function for tests
 */

	function main(string[] memory args) public
	{
			BSTIterative tree;
			tree.add(5);
			tree.add(10);
			tree.add(9);
			tree.remove(9);
			tree.remove(1);
			tree.add(20);
			tree.add(70);
			/*
     Will print in following order
     5 10 20 70
    */

			tree.inorder();
	}

}

