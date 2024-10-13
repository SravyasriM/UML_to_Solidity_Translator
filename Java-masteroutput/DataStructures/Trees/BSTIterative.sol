pragma solidity 0.7.5;

import "java/util/Stack.sol";

contract BSTIterative
{
	/**
 * Reference for the node of BST.
 */

	Node private  root;

	/**
 * A method to insert a new value in BST. If the given value is already present in BST the
 * insertion is ignored.
 *
 * @param data the value to be inserted
 */

	function add(int32 data) public
	{
			Node parent;
			Node temp = Node(BSTIterative.root);
			int32 rightOrLeft = int32(-1);
			/* Finds the proper place this node can
     * be placed in according to rules of BST.
     */

			while(temp != none)
			{
					if(temp.data > data)
					{
							parent = temp;
							temp = parent.left;
							rightOrLeft = 0;
					}
					else
					{
						if(temp.data < data)
						{
								parent = temp;
								temp = parent.right;
								rightOrLeft = 1;
						}
						else
						{
								System.out.println(data + " is already present in BST.");
								// if data already present we ignore insertion

								return 
						}
					}


			}
			/* Creates a newNode with the value passed
     * Since this data doesn't already exists
     */

			Node newNode = new Node(data);
			/* If the parent node is null
     * then the insertion is to be done in
     * root itself.
     */

			if(parent == none)
			{
					BSTIterative.root = newNode;
			}
			else
			{
					/* Check if insertion is to be made in
       * left or right subtree.
       */

					if(rightOrLeft == 0)
					{
							parent.left = newNode;
					}
					else
					{
							parent.right = newNode;
					}

			}

	}

	/**
 * A method to delete the node in BST. If node is present it will be deleted
 *
 * @param data the value that needs to be deleted
 */

	function remove(int32 data) public
	{
			Node parent;
			Node temp = Node(BSTIterative.root);
			int32 rightOrLeft = int32(-1);
			/* Find the parent of the node and node itself
     * That is to be deleted.
     * parent variable store parent
     * temp stores node itself.
     * rightOrLeft use to keep track weather child
     * is left or right subtree
     */

			while(temp != none)
			{
					if(temp.data == data)
					{
							break;
					}
					else
					{
						if(temp.data > data)
						{
								parent = temp;
								temp = parent.left;
								rightOrLeft = 0;
						}
						else
						{
								parent = temp;
								temp = parent.right;
								rightOrLeft = 1;
						}
					}


			}
			/* If temp is null than node with given value is not
     * present in our tree.
     */

			if(temp != none)
			{
					// used to store the new values for replacing nodes

					Node replacement;
					if(temp.right == none && temp.left == none)
					{
							// Leaf node Case

							replacement = none;
					}
					else
					{
						if(temp.right == none)
						{
								// Node with only right child

								replacement = temp.left;
								temp.left = none;
						}
						else
						{
							if(temp.left == none)
							{
									// Node with only left child

									replacement = temp.right;
									temp.right = none;
							}
							else
							{
									/* If both left and right child are present
         * we replace this nodes data with
         * leftmost node's data in its right subtree
         * to maintain the balance of BST.
         * And then delete that node
         */

									if(temp.right.left == none)
									{
											temp.data = temp.right.data;
											replacement = temp;
											temp.right = temp.right.right;
									}
									else
									{
											Node parent2 = Node(temp.right);
											Node child = Node(temp.right.left);
											while(child.left != none)
											{
													parent2 = child;
													child = parent2.left;

											}
											temp.data = child.data;
											parent2.left = child.right;
											replacement = temp;
									}

							}
						}
					}

					/* Change references of parent after
       * deleting the child.
       */

					if(parent == none)
					{
							BSTIterative.root = replacement;
					}
					else
					{
							if(rightOrLeft == 0)
							{
									parent.left = replacement;
							}
							else
							{
									parent.right = replacement;
							}

					}

			}
	}

	/**
 * A method for inorder traversal of BST.
 */

	function inorder() public
	{
			if(BSTIterative.root == none)
			{
					System.out.println("This BST is empty.");
					return 
			}
			System.out.println("Inorder traversal of this tree is:");
			Stack st;
			Node cur = Node(BSTIterative.root);
			while(cur != none || !st.empty();)
			{
					while(cur != none)
					{
							st.push(cur);
							cur = cur.left;

					}
					cur = st.pop();
					System.out.print(cur.data + " ");
					cur = cur.right;

			}
			// for next line

			System.out.println();
	}

	/**
 * A method used to print postorder traversal of BST.
 */

	function postorder() public
	{
			if(BSTIterative.root == none)
			{
					System.out.println("This BST is empty.");
					return 
			}
			System.out.println("Postorder traversal of this tree is:");
			Stack st;
			Node cur = Node(BSTIterative.root);
			while(cur != none || !st.empty();)
			{
					if(cur != none)
					{
							st.push(cur);
							cur = cur.left;
					}
					else
					{
							temp2 = st.peek();
							if(temp2.right != none)
							{
									cur = temp2.right;
							}
							else
							{
									st.pop();
									while(!st.empty(); && st.peek().right == temp2)
									{
											System.out.print(temp2.data + " ");
											temp2 = st.pop();

									}
									System.out.print(temp2.data + " ");
							}

					}


			}
			// for next line

			System.out.println();
	}

	/**
 * Method used to display preorder traversal of BST.
 */

	function preorder() public
	{
			if(BSTIterative.root == none)
			{
					System.out.println("This BST is empty.");
					return 
			}
			System.out.println("Preorder traversal of this tree is:");
			Stack st;
			st.push(BSTIterative.root);
			Node temp;
			while(!st.empty();)
			{
					temp = st.pop();
					System.out.print(temp.data + " ");
					if(temp.right != none)
					{
							st.push(temp.right);
					}
					if(temp.left != none)
					{
							st.push(temp.left);
					}

			}
			// for next line

			System.out.println();
	}

	/**
 * A method to check if given data exists in out Binary Search Tree.
 *
 * @param data the value that needs to be searched for
 * @return boolean representing if the value was find
 */

	function find(int32 data) public returns(bool)
	{
			Node temp = Node(BSTIterative.root);
			/* Check if node exists
     */

			while(temp != none)
			{
					if(temp.data > data)
					{
							temp = temp.left;
					}
					else
					{
						if(temp.data < data)
						{
								temp = temp.right;
						}
						else
						{
								/* If found return true
         */

								System.out.println(data + " is present in the BST.");
								return true;
						}
					}


			}
			System.out.println(data + " not found.");
			return false;
	}

}

library BSTIterative_Library
{
	/**
 * main function for tests
 */

	function main(string[] memory args) public
	{
			BSTIterative tree;
			tree.add(3);
			tree.add(2);
			tree.add(9);
			tree.remove(2);
			tree.remove(1);
			tree.add(30);
			tree.add(40);
			/*
       Will print following order
       3 9 30 40
    */

			tree.inorder();
	}

}

