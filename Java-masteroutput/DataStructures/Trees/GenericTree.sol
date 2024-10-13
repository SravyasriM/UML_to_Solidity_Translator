pragma solidity 0.7.5;

//package DataStructures.Trees


import "java/util/ArrayList.sol";

import "java/util/LinkedList.sol";

import "java/util/Scanner.sol";

/**
 * A generic tree is a tree which can have as many children as it can be It might be possible that
 * every node present is directly connected to root node.
 *
 * <p>In this code Every function has two copies: one function is helper function which can be
 * called from main and from that function a private function is called which will do the actual
 * work. I have done this, while calling from main one have to give minimum parameters.
 */

contract GenericTree
{
	Node private  root;

	int32 private  size;

	function create_treeG(Node node, int32 childindx, Scanner scn) private returns(Node)
	{
			// display

			if(node == none)
			{
					System.out.println("Enter root's data");
			}
			else
			{
			}

			// input

			node = new Node();
			node.data = scn.nextInt();
			System.out.println("number of children");
			int32 number = int32(scn.nextInt());
			for(int32 i = int32(0); i < number; i++;)
			{
					Node child = Node(create_treeG(node, i, scn));
					size++;
					node.child.add(child);
			}
			return node;
	}

	/**
 * Function to display the generic tree
 */

	function display() public
	{
			// Helper function

			display_1(root);
	}

	function display_1(Node parent) private
	{
			System.out.print(parent.data + "=>");
			for(int32 i = int32(0); i < parent.child.size(); i++;)
			{
					System.out.print(parent.child.get(i).data + " ");
			}
			System.out.println(".");
			for(int32 i = int32(0); i < parent.child.size(); i++;)
			{
					display_1(parent.child.get(i));
			}
	}

	/**
 * One call store the size directly but if you are asked compute size this function to calculate
 * size goes as follows
 *
 * @return size
 */

	function size2call() public returns(int32)
	{
			return size2(root);
	}

	function size2(Node roott) public returns(int32)
	{
			int32 sz = int32(0);
			for(int32 i = int32(0); i < roott.child.size(); i++;)
			{
					sz += size2(roott.child.get(i));
			}
			return sz + 1;
	}

	/**
 * Function to compute maximum value in the generic tree
 *
 * @return maximum value
 */

	function maxcall() public returns(int32)
	{
			int32 maxi = int32(root.data);
			return max(root, maxi);
	}

	function max(Node roott, int32 maxi) private returns(int32)
	{
			if(maxi < roott.data)
			{
				maxi = roott.data;			}
			for(int32 i = int32(0); i < roott.child.size(); i++;)
			{
					maxi = max(roott.child.get(i), maxi);
			}
			return maxi;
	}

	/**
 * Function to compute HEIGHT of the generic tree
 *
 * @return height
 */

	function heightcall() public returns(int32)
	{
			return height(root) - 1;
	}

	function height(Node node) private returns(int32)
	{
			int32 h = int32(0);
			for(int32 i = int32(0); i < node.child.size(); i++;)
			{
					int32 k = int32(height(node.child.get(i)));
					if(k > h)
					{
						h = k;					}
			}
			return h + 1;
	}

	/**
 * Function to find whether a number is present in the generic tree or not
 *
 * @param info number
 * @return present or not
 */

	function findcall(int32 info) public returns(bool)
	{
			return find(root, info);
	}

	function find(Node node, int32 info) private returns(bool)
	{
			if(node.data == info)
			{
				return true;			}
			for(int32 i = int32(0); i < node.child.size(); i++;)
			{
					if(find(node.child.get(i), info))
					{
						return true;					}
			}
			return false;
	}

	/**
 * Function to calculate depth of generic tree
 *
 * @param dep depth
 */

	function depthcaller(int32 dep) public
	{
			depth(root, dep);
	}

	function depth(Node node, int32 dep) public
	{
			if(dep == 0)
			{
					System.out.println(node.data);
					return 
			}
			for(int32 i = int32(0); i < node.child.size(); i++;)
			{
				depth(node.child.get(i), dep - 1);			}
			return 
	}

	/**
 * Function to print generic tree in pre-order
 */

	function preordercall() public
	{
			preorder(root);
			System.out.println(".");
	}

	function preorder(Node node) private
	{
			System.out.print(node.data + " ");
			for(int32 i = int32(0); i < node.child.size(); i++;)
			{
				preorder(node.child.get(i));			}
	}

	/**
 * Function to print generic tree in post-order
 */

	function postordercall() public
	{
			postorder(root);
			System.out.println(".");
	}

	function postorder(Node node) private
	{
			for(int32 i = int32(0); i < node.child.size(); i++;)
			{
				postorder(node.child.get(i));			}
			System.out.print(node.data + " ");
	}

	/**
 * Function to print generic tree in level-order
 */

	function levelorder() public
	{
			LinkedList q;
			q.addLast(root);
			while(!q.isEmpty();)
			{
					int32 k = int32(q.getFirst().data);
					System.out.print(k + " ");
					for(int32 i = int32(0); i < q.getFirst().child.size(); i++;)
					{
							q.addLast(q.getFirst().child.get(i));
					}
					q.removeFirst();

			}
			System.out.println(".");
	}

	/**
 * Function to remove all leaves of generic tree
 */

	function removeleavescall() public
	{
			removeleaves(root);
	}

	function removeleaves(Node node) private
	{
			ArrayList arr;
			for(int32 i = int32(0); i < node.child.size(); i++;)
			{
					if(node.child.get(i).child.size() == 0)
					{
							arr.add(i);
					}
					else
					{
						removeleaves(node.child.get(i));					}

			}
			for(int32 i = int32(arr.size() - 1); i >= 0; i--;)
			{
					node.child.remove(arr.get(i) + 0);
			}
	}

	constructor() public
	{
			// Constructor

			Scanner scn;
			root = create_treeG(none, 0, scn);
	}

}

library GenericTree_Library
{
}

