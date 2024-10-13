pragma solidity 0.7.5;

//package DataStructures.Trees


contract LevelOrderTraversal
{
	// Root of the Binary Tree

	Node root;

	/* function to print level order traversal of tree*/

	function printLevelOrder() internal
	{
			int32 h = int32(height(root));
			int32 i;
			for(i = 1; i <= h; i++;)
			{
				printGivenLevel(root, i);			}
	}

	/* Compute the "height" of a tree -- the number of
  nodes along the longest path from the root node
  down to the farthest leaf node.*/

	function height(Node root) internal returns(int32)
	{
			if(root == none)
			{
				return 0;			}
			else
			{
					/**
 * Return the height of larger subtree
 */

					return Math.max(height(root.left), height(root.right)) + 1;
			}

	}

	/* Print nodes at the given level */

	function printGivenLevel(Node root, int32 level) internal
	{
			if(root == none)
			{
				return 			}
			if(level == 1)
			{
				System.out.print(root.data + " ");			}
			else
			{
				if(level > 1)
				{
						printGivenLevel(root.left, level - 1);
						printGivenLevel(root.right, level - 1);
				}			}

	}

	constructor(Node root) public
	{
			Node.root = root;
	}

}

library LevelOrderTraversal_Library
{
}

