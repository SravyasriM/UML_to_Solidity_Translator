pragma solidity 0.7.5;

import "java/util/Scanner.sol";

// An implementaion of string matching using finite automata

contract StringMatchFiniteAutomata
{
	int32 static  immutable CHARS = int32(256);

	

	Scanner static  scanner = Scanner(none);

	function searchPat(string text, string pat) public
	{
			int32 m = int32(pat.length());
			int32 n = int32(text.length());
			FA = new int32[](m + 1);
			computeFA(pat, m, FA);
			int32 state = int32(0);
			for(int32 i = int32(0); i < n; i++;)
			{
					state = FA[uint256(state)][uint256(text.charAt(i))];
					if(state == m)
					{
							System.out.println("Pattern found at index " + (i - m + 1));
					}
			}
	}

	function getNextState(string pat, int32 m, int32 state, int32 x) public returns(int32)
	{
			// then automata goes to next state

			if(state < m && x == pat.charAt(state))
			{
					return state + 1;
			}
			for(int32 ns = int32(state); ns > 0; ns--;)
			{
					if(pat.charAt(ns - 1) == x)
					{
							for(int32 i = int32(0); i < ns - 1; i++;)
							{
									if(pat.charAt(i) != pat.charAt(state - ns + i + 1))
									{
											break;
									}
									if(i == ns - 1)
									{
											return ns;
									}
							}
					}
			}
			return 0;
	}

}

library StringMatchFiniteAutomata_Library
{
	function main(string[] memory args) public
	{
			;
			System.out.println("Enter String");
			string memory text = string(scanner.nextLine());
			System.out.println("Enter pattern");
			string memory pat = string(scanner.nextLine());
			searchPat(text, pat);
			scanner.close();
	}

	function searchPat(string text, string pat) public
	{
			int32 m = int32(pat.length());
			int32 n = int32(text.length());
			FA = new int32[](m + 1);
			computeFA(pat, m, FA);
			int32 state = int32(0);
			for(int32 i = int32(0); i < n; i++;)
			{
					state = FA[uint256(state)][uint256(text.charAt(i))];
					if(state == m)
					{
							System.out.println("Pattern found at index " + (i - m + 1));
					}
			}
	}

	function getNextState(string pat, int32 m, int32 state, int32 x) public returns(int32)
	{
			// then automata goes to next state

			if(state < m && x == pat.charAt(state))
			{
					return state + 1;
			}
			for(int32 ns = int32(state); ns > 0; ns--;)
			{
					if(pat.charAt(ns - 1) == x)
					{
							for(int32 i = int32(0); i < ns - 1; i++;)
							{
									if(pat.charAt(i) != pat.charAt(state - ns + i + 1))
									{
											break;
									}
									if(i == ns - 1)
									{
											return ns;
									}
							}
					}
			}
			return 0;
	}

}

