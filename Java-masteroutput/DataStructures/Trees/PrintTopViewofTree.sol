pragma solidity 0.7.5;

//package DataStructures.Trees


import "java/util/HashSet.sol";

import "java/util/LinkedList.sol";

import "java/util/Queue.sol";

// Class for a tree node

contract TreeNode
{
	// Members

	int32 key;

	TreeNode left;

	// Constructor

	constructor(int32 key) public
	{
			TreeNode.key = key;
			left = right = none;
	}

}

library TreeNode_Library
{
}

// distance of node from root

contract QItem
{
	TreeNode node;

	int32 hd;

	constructor(TreeNode n, int32 h) public
	{
			node = n;
			hd = h;
	}

}

library QItem_Library
{
}

// Class for a Binary Tree

contract Tree
{
	TreeNode root;

	// This method prints nodes in top view of binary tree

	function printTopView() public
	{
			// base case

			if(root == none)
			{
					return 
			}
			// Creates an empty hashset

			HashSet set;
			// Create a queue and add root to it

			Queue Q;
			// Horizontal distance of root is 0

			Q.add(new QItem(root, 0));
			// Standard BFS or level order traversal loop

			while(!Q.isEmpty();)
			{
					// Remove the front item and get its details

					QItem qi = QItem(Q.remove());
					int32 hd = int32(qi.hd);
					TreeNode n = TreeNode(qi.node);
					// then this node is in top view

					if(!set.contains(hd);)
					{
							set.add(hd);
							System.out.print(n.key + " ");
					}
					// Enqueue left and right children of current node

					if(n.left != none)
					{
						Q.add(new QItem(n.left, hd - 1));					}
					if(n.right != none)
					{
						Q.add(new QItem(n.right, hd + 1));					}

			}
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

	// Constructors

	function constructor1() public	overloadedConstructor( 1 )
	{
			root = none;
	}

	function constructor2(TreeNode n) public	overloadedConstructor( 2 )
	{
			root = n;
	}

}

library Tree_Library
{
}

// Driver class to test above methods

contract PrintTopViewofTree
{
}

library PrintTopViewofTree_Library
{
	function main(string[] memory args) public
	{
			/* Create following Binary Tree
       1
     /  \
    2    3
     \
      4
       \
        5
         \
          6*/

			TreeNode root = new TreeNode(1);
			root.left = new TreeNode(2);
			root.right = new TreeNode(3);
			root.left.right = new TreeNode(4);
			root.left.right.right = new TreeNode(5);
			root.left.right.right.right = new TreeNode(6);
			Tree t = new Tree(2);
			t.constructor2(root);
			System.out.println("Following are nodes in top view of Binary Tree");
			t.printTopView();
	}

}

//Optional.empty


//Optional.empty


