pragma solidity 0.7.5;

//package DynamicProgramming


/**
 * @author Kshitij VERMA (github.com/kv19971) LEVENSHTEIN DISTANCE dyamic programming implementation
 *     to show the difference between two strings
 *     (https://en.wikipedia.org/wiki/Levenshtein_distance)
 */

contract LevenshteinDistance
{
	function minimum(int32 a, int32 b, int32 c) private returns(int32)
	{
			if(a < b && a < c)
			{
					return a;
			}
			else
			{
				if(b < a && b < c)
				{
						return b;
				}
				else
				{
						return c;
				}
			}

	}

	function calculate_distance(string a, string b) private returns(int32)
	{
			int32 len_a = int32(a.length() + 1);
			int32 len_b = int32(b.length() + 1);
			for(int32 i = int32(0); i < len_a; i++;)
			{
					distance_mat[uint256(i)][uint256(0)] = i;
			}
			for(int32 j = int32(0); j < len_b; j++;)
			{
					distance_mat[uint256(0)][uint256(j)] = j;
			}
			for(int32 i = int32(0); i < len_a; i++;)
			{
					for(int32 j = int32(0); j < len_b; j++;)
					{
							int32 cost;
							if(a.charAt(i) == b.charAt(j))
							{
									cost = 0;
							}
							else
							{
									cost = 1;
							}

							distance_mat[uint256(i)][uint256(j)] = minimum(distance_mat[uint256(i - 1)][uint256(j)], distance_mat[uint256(i - 1)][uint256(j - 1)], distance_mat[uint256(i)][uint256(j - 1)]) + cost;
					}
			}
			return distance_mat[uint256(len_a - 1)][uint256(len_b - 1)];
	}

}

library LevenshteinDistance_Library
{
	function minimum(int32 a, int32 b, int32 c) private returns(int32)
	{
			if(a < b && a < c)
			{
					return a;
			}
			else
			{
				if(b < a && b < c)
				{
						return b;
				}
				else
				{
						return c;
				}
			}

	}

	function calculate_distance(string a, string b) private returns(int32)
	{
			int32 len_a = int32(a.length() + 1);
			int32 len_b = int32(b.length() + 1);
			for(int32 i = int32(0); i < len_a; i++;)
			{
					distance_mat[uint256(i)][uint256(0)] = i;
			}
			for(int32 j = int32(0); j < len_b; j++;)
			{
					distance_mat[uint256(0)][uint256(j)] = j;
			}
			for(int32 i = int32(0); i < len_a; i++;)
			{
					for(int32 j = int32(0); j < len_b; j++;)
					{
							int32 cost;
							if(a.charAt(i) == b.charAt(j))
							{
									cost = 0;
							}
							else
							{
									cost = 1;
							}

							distance_mat[uint256(i)][uint256(j)] = minimum(distance_mat[uint256(i - 1)][uint256(j)], distance_mat[uint256(i - 1)][uint256(j - 1)], distance_mat[uint256(i)][uint256(j - 1)]) + cost;
					}
			}
			return distance_mat[uint256(len_a - 1)][uint256(len_b - 1)];
	}

	function main(string[] memory args) public
	{
			// enter your string here

			string memory a = string("");
			// enter your string here

			string memory b = string("");
			System.out.print("Levenshtein distance between " + a + " and " + b + " is: ");
			System.out.println(calculate_distance(a, b));
	}

}

