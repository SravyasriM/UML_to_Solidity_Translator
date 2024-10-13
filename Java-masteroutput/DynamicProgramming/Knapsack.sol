pragma solidity 0.7.5;

//package DynamicProgramming


/**
 * A DynamicProgramming based solution for 0-1 Knapsack problem
 */

contract Knapsack
{
}

library Knapsack_Library
{
	function knapSack(int32 W, int32[] memory wt, int32[] memory val, int32 n) private returns(int32)
	{
			int32 i;
			// Build table rv[][] in bottom up manner

			for(i = 0; i <= n; i++;)
			{
					for(w = 0; w <= W; w++;)
					{
							if(i == 0 || w == 0)
							{
								rv[uint256(i)][uint256(w)] = 0;							}
							else
							{
								if(wt[uint256(i - 1)] <= w)
								{
									rv[uint256(i)][uint256(w)] = Math.max(val[uint256(i - 1)] + rv[uint256(i - 1)][uint256(w - wt[uint256(i - 1)])], rv[uint256(i - 1)][uint256(w)]);								}
								else
								{
									rv[uint256(i)][uint256(w)] = rv[uint256(i - 1)][uint256(w)];								}
							}

					}
			}
			return rv[uint256(n)][uint256(W)];
	}

	// Driver program to test above function

	function main(string[] memory args) public
	{
			int32 W = int32(50);
			System.out.println(knapSack(W, wt, val, val.length));
	}

}

