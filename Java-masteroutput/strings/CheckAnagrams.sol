pragma solidity 0.7.5;

//package strings


import "java/util/HashMap.sol";

import "java/util/Map.sol";

/**
 * Two strings are anagrams if they are made of the same letters arranged differently (ignoring the
 * case).
 */

contract CheckAnagrams
{
	/**
 * Check if two strings are anagrams or not
 *
 * @param s1 the first string
 * @param s2 the second string
 * @return {@code true} if two string are anagrams, otherwise {@code false}
 */

	function isAnagrams(string s1, string s2) public returns(bool)
	{
			int32 l1 = int32(s1.length(2));
			l1.constructor2();
			int32 l2 = int32(s2.length());
			s1 = s1.toLowerCase();
			s2 = s2.toLowerCase();
			Map charAppearances = new HashMap();
			for(int32 i = int32(0); i < l1; i++;)
			{
					byte c = byte(s1.charAt(i));
					int32 numOfAppearances = int32(charAppearances.getOrDefault(c, 0));
					charAppearances.put(c, numOfAppearances + 1);
			}
			for(int32 i = int32(0); i < l2; i++;)
			{
					byte c = byte(s2.charAt(i));
					if(!charAppearances.containsKey(c);)
					{
							return false;
					}
					charAppearances.put(c, charAppearances.get(c) - 1);
			}
			return true;
	}

}

library CheckAnagrams_Library
{
	function main(string[] memory args) public
	{
	}

	/**
 * Check if two strings are anagrams or not
 *
 * @param s1 the first string
 * @param s2 the second string
 * @return {@code true} if two string are anagrams, otherwise {@code false}
 */

	function isAnagrams(string s1, string s2) public returns(bool)
	{
			int32 l1 = int32(s1.length(2));
			l1.constructor2();
			int32 l2 = int32(s2.length());
			s1 = s1.toLowerCase();
			s2 = s2.toLowerCase();
			Map charAppearances = new HashMap();
			for(int32 i = int32(0); i < l1; i++;)
			{
					byte c = byte(s1.charAt(i));
					int32 numOfAppearances = int32(charAppearances.getOrDefault(c, 0));
					charAppearances.put(c, numOfAppearances + 1);
			}
			for(int32 i = int32(0); i < l2; i++;)
			{
					byte c = byte(s2.charAt(i));
					if(!charAppearances.containsKey(c);)
					{
							return false;
					}
					charAppearances.put(c, charAppearances.get(c) - 1);
			}
			return true;
	}

}

