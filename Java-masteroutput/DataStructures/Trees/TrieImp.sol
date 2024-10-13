pragma solidity 0.7.5;

//package DataStructures.Trees


import "java/util/Scanner.sol";

contract TrieImp
{
	TrieNode private  immutable root;

	function insert(string word) public
	{
			TrieNode currentNode = TrieNode(root);
			for(int32 i = int32(0); i < word.length(); i++;)
			{
					TrieNode node = TrieNode(currentNode.child[uint256(word.charAt(i) - "a")]);
					if(node == none)
					{
							node = new TrieNode();
							currentNode.child[uint256(word.charAt(i) - "a")] = node;
					}
					currentNode = node;
			}
			currentNode.end = true;
	}

	function search(string word) public returns(bool)
	{
			TrieNode currentNode = TrieNode(root);
			for(int32 i = int32(0); i < word.length(); i++;)
			{
					byte ch = byte(word.charAt(i));
					TrieNode node = TrieNode(currentNode.child[uint256(ch - "a")]);
					if(node == none)
					{
							return false;
					}
					currentNode = node;
			}
			return currentNode.end;
	}

	function delete(string word) public returns(bool)
	{
			TrieNode currentNode = TrieNode(root);
			for(int32 i = int32(0); i < word.length(); i++;)
			{
					byte ch = byte(word.charAt(i));
					TrieNode node = TrieNode(currentNode.child[uint256(ch - "a")]);
					if(node == none)
					{
							return false;
					}
					currentNode = node;
			}
			if(currentNode.end == true)
			{
					currentNode.end = false;
					return true;
			}
			return false;
	}

	function sop(string print) public
	{
			System.out.println(print);
	}

	/**
 * Regex to check if word contains only a-z character
 */

	function isValid(string word) public returns(bool)
	{
			return word.matches("^[a-z]+$");
	}

	constructor() public
	{
			root = new TrieNode();
	}

}

library TrieImp_Library
{
	function sop(string print) public
	{
			System.out.println(print);
	}

	/**
 * Regex to check if word contains only a-z character
 */

	function isValid(string word) public returns(bool)
	{
			return word.matches("^[a-z]+$");
	}

	function main(string[] memory args) public
	{
			TrieImp obj;
			string memory word;
			Scanner scan;
			sop("string should contain only a-z character for all operation");
			while(true)
			{
					sop("1. Insert\n2. Search\n3. Delete\n4. Quit");
						//try

							int32 t = int32(scan.nextInt());
							do
							{
									bool void = bool(false);
									if(void || (t == 1))
									{
											void = true;
											word = scan.next();
											if(isValid(word))
											{
												obj.insert(word);											}
											else
											{
												sop("Invalid string: allowed only a-z");											}

											break;
									}
									if(void || (t == 2))
									{
											void = true;
											word = scan.next();
											bool resS = bool(false);
											if(isValid(word))
											{
												resS = obj.search(word);											}
											else
											{
												sop("Invalid string: allowed only a-z");											}

											if(resS)
											{
												sop("word found");											}
											else
											{
												sop("word not found");											}

											break;
									}
									if(void || (t == 3))
									{
											void = true;
											word = scan.next();
											bool resD = bool(false);
											if(isValid(word))
											{
												resD = obj.delete(word);											}
											else
											{
												sop("Invalid string: allowed only a-z");											}

											if(resD)
											{
													sop("word got deleted successfully");
											}
											else
											{
													sop("word not found");
											}

											break;
									}
									if(void || (t == 4))
									{
											void = true;
											sop("Quit successfully");
											System.exit(1);
											break;
									}
										sop("Input int from 1-4");
										break;


							}while(false);

						/* catch (Exception e) {
    String badInput = scan.next();
    sop("This is bad input: " + badInput);
}*/



			}
	}

}

