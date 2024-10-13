pragma solidity 0.7.5;

//package DataStructures.Trees


contract ValidBSTOrNot
{
	/* returns true if given search tree is binary
  search tree (efficient version) */

	function isBST(Node root) internal returns(bool)
	{
			return isBSTUtil(root, Integer.MIN_VALUE, Integer.MAX_VALUE);
	}

	/* Returns true if the given tree is a BST and its
  values are >= min and <= max. */

	function isBSTUtil(Node node, int32 min, int32 max) internal returns(bool)
	{
			/* an empty tree is BST */

			if(node == none)
			{
				return true;			}
			/* false if this node violates the min/max constraints */

			if(node.data < min || node.data > max)
			{
				return false;			}
			// Allow only distinct values

			return (isBSTUtil(node.left, min, node.data - 1) && isBSTUtil(node.right, node.data + 1, max));
	}

}

library ValidBSTOrNot_Library
{
}

