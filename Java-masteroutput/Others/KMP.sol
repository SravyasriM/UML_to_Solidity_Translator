pragma solidity 0.7.5;

//package Others


/**
 * Implementation of Knuth–Morris–Pratt algorithm Usage: see the main function for an example
 */

contract KMP
{
	// find the starting index in string haystack[] that matches the search word P[]

	function KMPmatcher(string haystack, string needle) public
	{
			int32 m = int32(haystack.length());
			int32 n = int32(needle.length());
			int32 q = int32(0);
			for(int32 i = int32(0); i < m; i++;)
			{
					while(q > 0 && haystack.charAt(i) != needle.charAt(q))
					{
							q = pi[uint256(q - 1)];

					}
					if(haystack.charAt(i) == needle.charAt(q))
					{
							q++;
					}
					if(q == n)
					{
							System.out.println("Pattern starts: " + (i + 1 - n));
							q = pi[uint256(q - 1)];
					}
			}
	}

	// return the prefix function

	function computePrefixFunction(string P) private returns(

}

library KMP_Library
{
	// a working example

	function main(string[] memory args) public
	{
			// This is the full string

			string memory haystack = string("AAAAABAAABA");
			// This is the substring that we want to find

			string memory needle = string("AAAA");
			KMPmatcher(haystack, needle);
	}

	// find the starting index in string haystack[] that matches the search word P[]

	function KMPmatcher(string haystack, string needle) public
	{
			int32 m = int32(haystack.length());
			int32 n = int32(needle.length());
			int32 q = int32(0);
			for(int32 i = int32(0); i < m; i++;)
			{
					while(q > 0 && haystack.charAt(i) != needle.charAt(q))
					{
							q = pi[uint256(q - 1)];

					}
					if(haystack.charAt(i) == needle.charAt(q))
					{
							q++;
					}
					if(q == n)
					{
							System.out.println("Pattern starts: " + (i + 1 - n));
							q = pi[uint256(q - 1)];
					}
			}
	}

	// return the prefix function

	function computePrefixFunction(string P) private returns(

}

