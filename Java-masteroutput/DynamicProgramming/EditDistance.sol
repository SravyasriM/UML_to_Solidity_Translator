pragma solidity 0.7.5;

//package DynamicProgramming


import "java/util/Scanner.sol";

contract EditDistance
{
	function minDistance(string word1, string word2) public returns(int32)
	{
			int32 len1 = int32(word1.length());
			int32 len2 = int32(word2.length());
			/* If second string is empty, the only option is to
    insert all characters of first string into second*/

			for(int32 i = int32(0); i <= len1; i++;)
			{
					dp[uint256(i)][uint256(0)] = i;
			}
			/* If first string is empty, the only option is to
    insert all characters of second string into first*/

			for(int32 j = int32(0); j <= len2; j++;)
			{
					dp[uint256(0)][uint256(j)] = j;
			}
			// iterate though, and check last char

			for(int32 i = int32(0); i < len1; i++;)
			{
					byte c1 = byte(word1.charAt(i));
					for(int32 j = int32(0); j < len2; j++;)
					{
							byte c2 = byte(word2.charAt(j));
							// if last two chars equal

							if(c1 == c2)
							{
									// update dp value for +1 length

									dp[uint256(i + 1)][uint256(j + 1)] = dp[uint256(i)][uint256(j)];
							}
							else
							{
									/* if two characters are different ,
          then take the minimum of the various operations(i.e insertion,removal,substitution)*/

									int32 replace = int32(dp[uint256(i)][uint256(j)] + 1);
									int32 insert = int32(dp[uint256(i)][uint256(j + 1)] + 1);
									int32 delete = int32(dp[uint256(i + 1)][uint256(j)] + 1);
									int32 min = int32(replace > insert ? insert : replace);
									min = delete > min ? min : delete;
									dp[uint256(i + 1)][uint256(j + 1)] = min;
							}

					}
			}
			/* return the final answer , after traversing through both the strings*/

			return dp[uint256(len1)][uint256(len2)];
	}

}

library EditDistance_Library
{
	function minDistance(string word1, string word2) public returns(int32)
	{
			int32 len1 = int32(word1.length());
			int32 len2 = int32(word2.length());
			/* If second string is empty, the only option is to
    insert all characters of first string into second*/

			for(int32 i = int32(0); i <= len1; i++;)
			{
					dp[uint256(i)][uint256(0)] = i;
			}
			/* If first string is empty, the only option is to
    insert all characters of second string into first*/

			for(int32 j = int32(0); j <= len2; j++;)
			{
					dp[uint256(0)][uint256(j)] = j;
			}
			// iterate though, and check last char

			for(int32 i = int32(0); i < len1; i++;)
			{
					byte c1 = byte(word1.charAt(i));
					for(int32 j = int32(0); j < len2; j++;)
					{
							byte c2 = byte(word2.charAt(j));
							// if last two chars equal

							if(c1 == c2)
							{
									// update dp value for +1 length

									dp[uint256(i + 1)][uint256(j + 1)] = dp[uint256(i)][uint256(j)];
							}
							else
							{
									/* if two characters are different ,
          then take the minimum of the various operations(i.e insertion,removal,substitution)*/

									int32 replace = int32(dp[uint256(i)][uint256(j)] + 1);
									int32 insert = int32(dp[uint256(i)][uint256(j + 1)] + 1);
									int32 delete = int32(dp[uint256(i + 1)][uint256(j)] + 1);
									int32 min = int32(replace > insert ? insert : replace);
									min = delete > min ? min : delete;
									dp[uint256(i + 1)][uint256(j + 1)] = min;
							}

					}
			}
			/* return the final answer , after traversing through both the strings*/

			return dp[uint256(len1)][uint256(len2)];
	}

	function main(string[] memory args) public
	{
			Scanner input;
			string memory s1;
			System.out.println("Enter the First String");
			s1 = input.nextLine();
			System.out.println("Enter the Second String");
			s2 = input.nextLine();
			// ans stores the final Edit Distance between the two strings

			int32 ans = int32(minDistance(s1, s2));
			input.close();
	}

}

