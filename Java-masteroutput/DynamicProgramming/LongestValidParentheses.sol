pragma solidity 0.7.5;

//package DynamicProgramming


import "java/util/Scanner.sol";

/**
 * Given a string containing just the characters '(' and ')', find the length of the longest valid
 * (well-formed) parentheses substring.
 *
 * @author Libin Yang (https://github.com/yanglbme)
 * @since 2018/10/5
 */

contract LongestValidParentheses
{
	function getLongestValidParentheses(string s) public returns(int32)
	{
			if(s == none || s.length() < 2)
			{
					return 0;
			}
			int32 n = int32(chars.length);
			res[uint256(0)] = 0;
			res[uint256(1)] = keccak256(abi.encode(chars[uint256(1)])) == keccak256(abi.encode(")")) && keccak256(abi.encode(chars[uint256(0)])) == keccak256(abi.encode("(")) ? 2 : 0;
			int32 max = int32(res[uint256(1)]);
			for(int32 i = int32(2); i < n; ++i;)
			{
					if(keccak256(abi.encode(chars[uint256(i)])) == keccak256(abi.encode(")")))
					{
							if(keccak256(abi.encode(chars[uint256(i - 1)])) == keccak256(abi.encode("(")))
							{
									res[uint256(i)] = res[uint256(i - 2)] + 2;
							}
							else
							{
									int32 index = int32(i - res[uint256(i - 1)] - 1);
									if(index >= 0 && keccak256(abi.encode(chars[uint256(index)])) == keccak256(abi.encode("(")))
									{
											// ()(())

											res[uint256(i)] = res[uint256(i - 1)] + 2 + (index - 1 >= 0 ? res[uint256(index - 1)] : 0);
									}
							}

					}
					max = Math.max(max, res[uint256(i)]);
			}
			return max;
	}

}

library LongestValidParentheses_Library
{
	function getLongestValidParentheses(string s) public returns(int32)
	{
			if(s == none || s.length() < 2)
			{
					return 0;
			}
			int32 n = int32(chars.length);
			res[uint256(0)] = 0;
			res[uint256(1)] = keccak256(abi.encode(chars[uint256(1)])) == keccak256(abi.encode(")")) && keccak256(abi.encode(chars[uint256(0)])) == keccak256(abi.encode("(")) ? 2 : 0;
			int32 max = int32(res[uint256(1)]);
			for(int32 i = int32(2); i < n; ++i;)
			{
					if(keccak256(abi.encode(chars[uint256(i)])) == keccak256(abi.encode(")")))
					{
							if(keccak256(abi.encode(chars[uint256(i - 1)])) == keccak256(abi.encode("(")))
							{
									res[uint256(i)] = res[uint256(i - 2)] + 2;
							}
							else
							{
									int32 index = int32(i - res[uint256(i - 1)] - 1);
									if(index >= 0 && keccak256(abi.encode(chars[uint256(index)])) == keccak256(abi.encode("(")))
									{
											// ()(())

											res[uint256(i)] = res[uint256(i - 1)] + 2 + (index - 1 >= 0 ? res[uint256(index - 1)] : 0);
									}
							}

					}
					max = Math.max(max, res[uint256(i)]);
			}
			return max;
	}

	function main(string[] memory args) public
	{
			Scanner sc;
			while(true)
			{
					string memory str = string(sc.nextLine());
					if("quit".equals(str))
					{
							break;
					}
					System.out.println("Len is: " + getLongestValidParentheses(str));

			}
			sc.close();
	}

}

