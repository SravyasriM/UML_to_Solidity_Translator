pragma solidity 0.7.5;

//package DynamicProgramming


/**
 * A DynamicProgramming solution for Rod cutting problem Returns the best obtainable price for a rod
 * of length n and price[] as prices of different pieces
 */

contract RodCutting
{
}

library RodCutting_Library
{
	function cutRod(int32[] memory price, int32 n) private returns(int32)
	{
			val[uint256(0)] = 0;
			for(int32 i = int32(1); i <= n; i++;)
			{
					int32 max_val = int32(Integer.MIN_VALUE);
					for(int32 j = int32(0); j < i; j++;)
					{
						max_val = Math.max(max_val, price[uint256(j)] + val[uint256(i - j - 1)]);					}
					val[uint256(i)] = max_val;
			}
			return val[uint256(n)];
	}

	// main function to test

	function main(string[] memory args) public
	{
			int32 result = int32(cutRod(arr, arr.length));
			System.out.println("Maximum Obtainable Value is " + result);
	}

}

