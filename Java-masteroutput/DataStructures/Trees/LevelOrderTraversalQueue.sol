pragma solidity 0.7.5;

//package DataStructures.Trees


import "java/util/LinkedList.sol";

import "java/util/Queue.sol";

/* Class to print Level Order Traversal */

contract LevelOrderTraversalQueue
{
	/* Given a binary tree. Print its nodes in level order
  using array for implementing queue  */

	function printLevelOrder(Node root) internal
	{
			Queue queue;
			queue.add(root);
			while(!queue.isEmpty();)
			{
					/* poll() removes the present head.
      For more information on poll() visit
      http://www.tutorialspoint.com/java/util/linkedlist_poll.htm */

					Node tempNode = Node(queue.poll());
					System.out.print(tempNode.data + " ");
					/*Enqueue left child */

					if(tempNode.left != none)
					{
							queue.add(tempNode.left);
					}
					/*Enqueue right child */

					if(tempNode.right != none)
					{
							queue.add(tempNode.right);
					}

			}
	}

}

library LevelOrderTraversalQueue_Library
{
}

