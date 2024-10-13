pragma solidity 0.7.5;

//package test


import "java/io.sol";

import "java/util.sol";

/**
 * Algorithm explanation https://www.educative.io/edpresso/longest-palindromic-subsequence-algorithm
 */

contract LongestPalindromicSubsequence
{
	function LPS(string original) public returns(String)
	{
			StringBuilder reverse;
			reverse = reverse.reverse();
			return recursiveLPS(original, reverse.toString());
	}

	function recursiveLPS(string original, string reverse) private returns(String)
	{
			string memory bestResult = string("");
			// no more chars, then return empty

			if(original.length() == 0 || reverse.length() == 0)
			{
					bestResult = "";
			}
			else
			{
					// if the last chars match, then remove it from both strings and recur

					if(original.charAt(original.length() - 1) == reverse.charAt(reverse.length() - 1))
					{
							string memory bestSubResult = string(recursiveLPS(original.substring(0, original.length() - 1), reverse.substring(0, reverse.length() - 1)));
							bestResult = reverse.charAt(reverse.length() - 1) + bestSubResult;
					}
					else
					{
							string memory bestSubResult1 = string(recursiveLPS(original, reverse.substring(0, reverse.length() - 1)));
							string memory bestSubResult2 = string(recursiveLPS(original.substring(0, original.length() - 1), reverse));
							if(bestSubResult1.length() > bestSubResult2.length())
							{
									bestResult = bestSubResult1;
							}
							else
							{
									bestResult = bestSubResult2;
							}

					}

			}

			return bestResult;
	}

}

library LongestPalindromicSubsequence_Library
{
	function main(string[] memory args) public
	{
			string memory a = string("BBABCBCAB");
			string memory b = string("BABCBAB");
			string memory aLPS = string(LPS(a));
			string memory bLPS = string(LPS(b));
			System.out.println(a + " => " + aLPS);
			System.out.println(b + " => " + bLPS);
	}

	function LPS(string original) public returns(String)
	{
			StringBuilder reverse;
			reverse = reverse.reverse();
			return recursiveLPS(original, reverse.toString());
	}

	function recursiveLPS(string original, string reverse) private returns(String)
	{
			string memory bestResult = string("");
			// no more chars, then return empty

			if(original.length() == 0 || reverse.length() == 0)
			{
					bestResult = "";
			}
			else
			{
					// if the last chars match, then remove it from both strings and recur

					if(original.charAt(original.length() - 1) == reverse.charAt(reverse.length() - 1))
					{
							string memory bestSubResult = string(recursiveLPS(original.substring(0, original.length() - 1), reverse.substring(0, reverse.length() - 1)));
							bestResult = reverse.charAt(reverse.length() - 1) + bestSubResult;
					}
					else
					{
							string memory bestSubResult1 = string(recursiveLPS(original, reverse.substring(0, reverse.length() - 1)));
							string memory bestSubResult2 = string(recursiveLPS(original.substring(0, original.length() - 1), reverse));
							if(bestSubResult1.length() > bestSubResult2.length())
							{
									bestResult = bestSubResult1;
							}
							else
							{
									bestResult = bestSubResult2;
							}

					}

			}

			return bestResult;
	}

}

