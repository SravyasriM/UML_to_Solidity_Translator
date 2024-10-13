pragma solidity 0.7.5;

//package DataStructures.Trees


contract AVLTree
{
	Node private  root;

	function insert(int32 key) public returns(bool)
	{
			if(root == none)
			{
				root = new Node(key, none);			}
			else
			{
					Node n = Node(root);
					Node parent;
					while(true)
					{
							if(n.key == key)
							{
								return false;							}
							parent = n;
							bool goLeft = bool(n.key > key);
							n = goLeft ? n.left : n.right;
							if(n == none)
							{
									if(goLeft)
									{
											parent.left = new Node(key, parent);
									}
									else
									{
											parent.right = new Node(key, parent);
									}

									rebalance(parent);
									break;
							}

					}
			}

			return true;
	}

	function delete(Node node) private
	{
			if(node.left == none && node.right == none)
			{
					if(node.parent == none)
					{
						root = none;					}
					else
					{
							Node parent = Node(node.parent);
							if(parent.left == node)
							{
									parent.left = none;
							}
							else
							{
								parent.right = none;							}

							rebalance(parent);
					}

					return 
			}
			if(node.left != none)
			{
					Node child = Node(node.left);
					while(child.right != none)
					{
						child = child.right;
					}
					node.key = child.key;
					delete(child);
			}
			else
			{
					Node child = Node(node.right);
					while(child.left != none)
					{
						child = child.left;
					}
					node.key = child.key;
					delete(child);
			}

	}

	function delete(int32 delKey) public
	{
			if(root == none)
			{
				return 			}
			Node node = Node(root);
			Node child = Node(root);
			while(child != none)
			{
					node = child;
					child = delKey >= node.key ? node.right : node.left;
					if(delKey == node.key)
					{
							delete(node);
							return 
					}

			}
	}

	function rebalance(Node n) private
	{
			setBalance(n);
			if(n.balance == -2;)
			{
					if(height(n.left.left) >= height(n.left.right))
					{
						n = rotateRight(n);					}
					else
					{
						n = rotateLeftThenRight(n);					}

			}
			else
			{
				if(n.balance == 2)
				{
						if(height(n.right.right) >= height(n.right.left))
						{
							n = rotateLeft(n);						}
						else
						{
							n = rotateRightThenLeft(n);						}

				}			}

			if(n.parent != none)
			{
					rebalance(n.parent);
			}
			else
			{
					root = n;
			}

	}

	function rotateLeft(Node a) private returns(Node)
	{
			Node b = Node(a.right);
			b.parent = a.parent;
			a.right = b.left;
			if(a.right != none)
			{
				a.right.parent = a;			}
			b.left = a;
			a.parent = b;
			if(b.parent != none)
			{
					if(b.parent.right == a)
					{
							b.parent.right = b;
					}
					else
					{
							b.parent.left = b;
					}

			}
			setBalance(a, b);
			return b;
	}

	function rotateRight(Node a) private returns(Node)
	{
			Node b = Node(a.left);
			b.parent = a.parent;
			a.left = b.right;
			if(a.left != none)
			{
				a.left.parent = a;			}
			b.right = a;
			a.parent = b;
			if(b.parent != none)
			{
					if(b.parent.right == a)
					{
							b.parent.right = b;
					}
					else
					{
							b.parent.left = b;
					}

			}
			setBalance(a, b);
			return b;
	}

	function rotateLeftThenRight(Node n) private returns(Node)
	{
			n.left = rotateLeft(n.left);
			return rotateRight(n);
	}

	function rotateRightThenLeft(Node n) private returns(Node)
	{
			n.right = rotateRight(n.right);
			return rotateLeft(n);
	}

	function height(Node n) private returns(int32)
	{
			if(n == none)
			{
				return -1;			}
			return n.height;
	}

	function setBalance(Node nodes) private
	{
			for(uint256 iterator_var = uint256(0); iterator_var < nodes.length; iterator_var++;)
			{
					Node n = Node(nodes[uint256(iterator_var)]);
					reheight(n);
					n.balance = height(n.right) - height(n.left);
			}
	}

	function printBalance() public
	{
			printBalance(root);
	}

	function printBalance(Node n) private
	{
			if(n != none)
			{
					printBalance(n.left);
					System.out.printf("%s ", n.balance);
					printBalance(n.right);
			}
	}

	function reheight(Node node) private
	{
			if(node != none)
			{
					node.height = 1 + Math.max(height(node.left), height(node.right));
			}
	}

	function search(int32 key) public returns(bool)
	{
			Node result = Node(searchHelper(Node.root, key));
			if(result != none)
			{
				return true;			}
			return false;
	}

	function searchHelper(Node root, int32 key) private returns(Node)
	{
			// root is null or key is present at root

			if(root == none || root.key == key)
			{
				return root;			}
			// key is greater than root's key

			if(root.key > key)
			{
				// call the function on the node's left child

				return searchHelper(root.left, key);			}
			// call the function on the node's right child as it is greater

			return searchHelper(root.right, key);
	}

}

library AVLTree_Library
{
	function main(string[] memory args) public
	{
			AVLTree tree;
			System.out.println("Inserting values 1 to 10");
			for(int32 i = int32(1); i < 10; i++;)
			{
				tree.insert(i);			}
			System.out.print("Printing balance: ");
			tree.printBalance();
	}

}

