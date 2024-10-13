pragma solidity 0.7.5;

//package Others


import "java/util/Scanner.sol";

/**
 * You enter a string into this program, and it will return how many words were in that particular
 * string
 *
 * @author Marcus
 */

contract CountWords
{
	function wordCount(string s) private returns(int32)
	{
			if(s == none || s.isEmpty())
			{
				return 0;			}
			return s.trim().split("[\\s]+").length;
	}

	/**
 * counts the number of words in a sentence but ignores all potential non-alphanumeric characters
 * that do not represent a word. runs in O(n) where n is the length of s
 *
 * @param s String: sentence with word(s)
 * @return int: number of words
 */

	function secondaryWordCount(string s) private returns(int32)
	{
			if(s == none || s.isEmpty())
			{
				return 0;			}
			StringBuilder sb;
			s = sb.toString();
			return s.trim().split("[\\s]+").length;
	}

}

library CountWords_Library
{
	function main(string[] memory args) public
	{
			Scanner input;
			System.out.println("Enter your text: ");
			string memory str = string(input.nextLine());
			System.out.println("Your text has " + wordCount(str) + " word(s)");
			System.out.println("Your text has " + secondaryWordCount(str) + " word(s)");
			input.close();
	}

	function wordCount(string s) private returns(int32)
	{
			if(s == none || s.isEmpty())
			{
				return 0;			}
			return s.trim().split("[\\s]+").length;
	}

	/**
 * counts the number of words in a sentence but ignores all potential non-alphanumeric characters
 * that do not represent a word. runs in O(n) where n is the length of s
 *
 * @param s String: sentence with word(s)
 * @return int: number of words
 */

	function secondaryWordCount(string s) private returns(int32)
	{
			if(s == none || s.isEmpty())
			{
				return 0;			}
			StringBuilder sb;
			s = sb.toString();
			return s.trim().split("[\\s]+").length;
	}

}

