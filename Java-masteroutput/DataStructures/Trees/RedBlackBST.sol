pragma solidity 0.7.5;

//package DataStructures.Trees


import "java/util/Scanner.sol";

/**
 * @author jack870131
 */

contract RedBlackBST
{
	int32 private  immutable R = int32(0);

	int32 private  immutable B = int32(1);

	Node private  immutable nil = Node(new Node(-1;)

	Node private  root = Node(nil);

	function printTree(Node node) public
	{
			if(node == nil)
			{
					return 
			}
			printTree(node.left);
			System.out.print(((node.color == R) ? " R " : " B ") + "Key: " + node.key + " Parent: " + node.p.key + "\n");
			printTree(node.right);
	}

	function printTreepre(Node node) public
	{
			if(node == nil)
			{
					return 
			}
			System.out.print(((node.color == R) ? " R " : " B ") + "Key: " + node.key + " Parent: " + node.p.key + "\n");
			printTree(node.left);
			printTree(node.right);
	}

	function findNode(Node findNode, Node node) private returns(Node)
	{
			if(root == nil)
			{
					return none;
			}
			if(findNode.key < node.key)
			{
					if(node.left != nil)
					{
							return findNode(findNode, node.left);
					}
			}
			else
			{
				if(findNode.key > node.key)
				{
						if(node.right != nil)
						{
								return findNode(findNode, node.right);
						}
				}
				else
				{
					if(findNode.key == node.key)
					{
							return node;
					}				}
			}

			return none;
	}

	function insert(Node node) private
	{
			Node temp = Node(root);
			if(root == nil)
			{
					root = node;
					node.color = B;
					node.p = nil;
			}
			else
			{
					node.color = R;
					while(true)
					{
							if(node.key < temp.key)
							{
									if(temp.left == nil)
									{
											temp.left = node;
											node.p = temp;
											break;
									}
									else
									{
											temp = temp.left;
									}

							}
							else
							{
								if(node.key >= temp.key)
								{
										if(temp.right == nil)
										{
												temp.right = node;
												node.p = temp;
												break;
										}
										else
										{
												temp = temp.right;
										}

								}							}


					}
					fixTree(node);
			}

	}

	function fixTree(Node node) private
	{
			while(node.p.color == R)
			{
					Node y = Node(nil);
					if(node.p == node.p.p.left)
					{
							y = node.p.p.right;
							if(y != nil && y.color == R)
							{
									node.p.color = B;
									y.color = B;
									node.p.p.color = R;
									node = node.p.p;
									continue;
							}
							if(node == node.p.right)
							{
									node = node.p;
									rotateLeft(node);
							}
							node.p.color = B;
							node.p.p.color = R;
							rotateRight(node.p.p);
					}
					else
					{
							y = node.p.p.left;
							if(y != nil && y.color == R)
							{
									node.p.color = B;
									y.color = B;
									node.p.p.color = R;
									node = node.p.p;
									continue;
							}
							if(node == node.p.left)
							{
									node = node.p;
									rotateRight(node);
							}
							node.p.color = B;
							node.p.p.color = R;
							rotateLeft(node.p.p);
					}


			}
			root.color = B;
	}

	function rotateLeft(Node node) internal
	{
			if(node.p != nil)
			{
					if(node == node.p.left)
					{
							node.p.left = node.right;
					}
					else
					{
							node.p.right = node.right;
					}

					node.right.p = node.p;
					node.p = node.right;
					if(node.right.left != nil)
					{
							node.right.left.p = node;
					}
					node.right = node.right.left;
					node.p.left = node;
			}
			else
			{
					Node right = Node(root.right);
					root.right = right.left;
					right.left.p = root;
					root.p = right;
					right.left = root;
					right.p = nil;
					root = right;
			}

	}

	function rotateRight(Node node) internal
	{
			if(node.p != nil)
			{
					if(node == node.p.left)
					{
							node.p.left = node.left;
					}
					else
					{
							node.p.right = node.left;
					}

					node.left.p = node.p;
					node.p = node.left;
					if(node.left.right != nil)
					{
							node.left.right.p = node;
					}
					node.left = node.left.right;
					node.p.right = node;
			}
			else
			{
					Node left = Node(root.left);
					root.left = root.left.right;
					left.right.p = root;
					root.p = left;
					left.right = root;
					left.p = nil;
					root = left;
			}

	}

	function transplant(Node target, Node with) internal
	{
			if(target.p == nil)
			{
					root = with;
			}
			else
			{
				if(target == target.p.left)
				{
						target.p.left = with;
				}
				else
				{
					target.p.right = with;				}
			}

			with.p = target.p;
	}

	function treeMinimum(Node subTreeRoot) internal returns(Node)
	{
			while(subTreeRoot.left != nil)
			{
					subTreeRoot = subTreeRoot.left;

			}
			return subTreeRoot;
	}

	function delete(Node z) internal returns(bool)
	{
			if((z = findNode(z, root);) == none)
			{
				return false;			}
			Node x;
			Node y = Node(z);
			int32 yorigcolor = int32(y.color);
			if(z.left == nil)
			{
					x = z.right;
					transplant(z, z.right);
			}
			else
			{
				if(z.right == nil)
				{
						x = z.left;
						transplant(z, z.left);
				}
				else
				{
						y = treeMinimum(z.right);
						yorigcolor = y.color;
						x = y.right;
						if(y.p == z)
						{
							x.p = y;						}
						else
						{
								transplant(y, y.right);
								y.right = z.right;
								y.right.p = y;
						}

						transplant(z, y);
						y.left = z.left;
						y.left.p = y;
						y.color = z.color;
				}
			}

			if(yorigcolor == B)
			{
				deleteFixup(x);			}
			return true;
	}

	function deleteFixup(Node x) internal
	{
			while(x != root && x.color == B)
			{
					if(x == x.p.left)
					{
							Node w = Node(x.p.right);
							if(w.color == R)
							{
									w.color = B;
									x.p.color = R;
									rotateLeft(x.p);
									w = x.p.right;
							}
							if(w.left.color == B && w.right.color == B)
							{
									w.color = R;
									x = x.p;
									continue;
							}
							else
							{
								if(w.right.color == B)
								{
										w.left.color = B;
										w.color = R;
										rotateRight(w);
										w = x.p.right;
								}							}

							if(w.right.color == R)
							{
									w.color = x.p.color;
									x.p.color = B;
									w.right.color = B;
									rotateLeft(x.p);
									x = root;
							}
					}
					else
					{
							Node w = Node(x.p.left);
							if(w.color == R)
							{
									w.color = B;
									x.p.color = R;
									rotateRight(x.p);
									w = x.p.left;
							}
							if(w.right.color == B && w.left.color == B)
							{
									w.color = R;
									x = x.p;
									continue;
							}
							else
							{
								if(w.left.color == B)
								{
										w.right.color = B;
										w.color = R;
										rotateLeft(w);
										w = x.p.left;
								}							}

							if(w.left.color == R)
							{
									w.color = x.p.color;
									x.p.color = B;
									w.left.color = B;
									rotateRight(x.p);
									x = root;
							}
					}


			}
			x.color = B;
	}

	function insertDemo() public
	{
			Scanner scan;
			while(true)
			{
					System.out.println("Add items");
					int32 item;
					Node node;
					item = scan.nextInt();
					while(item != -999;)
					{
							node = new Node(item);
							insert(node);
							item = scan.nextInt();

					}
					printTree(root);
					System.out.println("Pre order");
					printTreepre(root);
					break;

			}
			scan.close();
	}

	function deleteDemo() public
	{
			Scanner scan;
			System.out.println("Delete items");
			int32 item;
			Node node;
			item = scan.nextInt();
			node = new Node(item);
			System.out.print("Deleting item " + item);
			if(delete(node))
			{
					System.out.print(": deleted!");
			}
			else
			{
					System.out.print(": does not exist!");
			}

			System.out.println();
			printTree(root);
			System.out.println("Pre order");
			printTreepre(root);
			scan.close();
	}

}

library RedBlackBST_Library
{
}

