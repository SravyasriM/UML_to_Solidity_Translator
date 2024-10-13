pragma solidity 0.7.5;

import "java/util.sol";

contract WordBoggle
{
}

library WordBoggle_Library
{
	function main(string[] memory args) public
	{
			// Testcase

			List ans;
	}

}

// Trie used to optimize string search

contract TrieNode
{
	Map children = Map(new HashMap());

	string word = string("");

}

library TrieNode_Library
{
}

contract Trie
{
	TrieNode root;

	byte endSymbol;

	function add(string str) public
	{
			TrieNode node = TrieNode(Trie.root);
			for(int32 i = int32(0); i < str.length(); i++;)
			{
					byte letter = byte(str.charAt(i));
					if(!node.children.containsKey(letter);)
					{
							TrieNode newNode = new TrieNode();
							node.children.put(letter, newNode);
					}
					node = node.children.get(letter);
			}
			node.children.put(Trie.endSymbol, none);
			node.word = str;
	}

	constructor() public
	{
			Trie.root = new TrieNode();
			Trie.endSymbol = "*";
	}

}

library Trie_Library
{
}

