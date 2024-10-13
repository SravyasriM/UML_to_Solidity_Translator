pragma solidity 0.7.5;

//package Others


import "java/io/BufferedReader.sol";

import "java/io/InputStreamReader.sol";

/**
 * @author Varun Upadhyay (https://github.com/varunu28)
 */

contract RemoveDuplicateFromString
{
	/**
 * This method produces a string after removing all the duplicate characters from input string and
 * returns it Example: Input String - "aabbbccccddddd" Output String - "abcd"
 *
 * @param s String from which duplicate characters have to be removed
 * @return string with only unique characters
 */

	function removeDuplicate(string s) public returns(String)
	{
			if(s == none || s.isEmpty())
			{
					return s;
			}
			StringBuilder sb;
			int32 n = int32(s.length());
			for(int32 i = int32(0); i < n; i++;)
			{
					if(sb.toString().indexOf(s.charAt(i)) == -1;)
					{
							sb.append(String.valueOf(s.charAt(i)));
					}
			}
			return sb.toString();
	}

}

library RemoveDuplicateFromString_Library
{
	function main(string[] memory args) public
	{
			BufferedReader br;
			string memory inpStr = string(br.readLine());
			System.out.println("Actual string is: " + inpStr);
			System.out.println("String after removing duplicates: " + removeDuplicate(inpStr));
			br.close();
	}

	/**
 * This method produces a string after removing all the duplicate characters from input string and
 * returns it Example: Input String - "aabbbccccddddd" Output String - "abcd"
 *
 * @param s String from which duplicate characters have to be removed
 * @return string with only unique characters
 */

	function removeDuplicate(string s) public returns(String)
	{
			if(s == none || s.isEmpty())
			{
					return s;
			}
			StringBuilder sb;
			int32 n = int32(s.length());
			for(int32 i = int32(0); i < n; i++;)
			{
					if(sb.toString().indexOf(s.charAt(i)) == -1;)
					{
							sb.append(String.valueOf(s.charAt(i)));
					}
			}
			return sb.toString();
	}

}

