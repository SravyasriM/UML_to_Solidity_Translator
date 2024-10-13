pragma solidity 0.7.5;

//package DynamicProgramming


/**
 * DynamicProgramming solution for the Egg Dropping Puzzle
 */

contract EggDropping
{
	function minTrials(int32 n, int32 m) private returns(int32)
	{
			int32 result;
			for(int32 i = int32(1); i <= n; i++;)
			{
					// Zero trial for zero floor.

					eggFloor[uint256(i)][uint256(0)] = 0;
					// One trial for one floor

					eggFloor[uint256(i)][uint256(1)] = 1;
			}
			for(int32 j = int32(1); j <= m; j++;)
			{
				eggFloor[uint256(1)][uint256(j)] = j;			}
			for(int32 i = int32(2); i <= n; i++;)
			{
					for(int32 j = int32(2); j <= m; j++;)
					{
							eggFloor[uint256(i)][uint256(j)] = Integer.MAX_VALUE;
							for(x = 1; x <= j; x++;)
							{
									result = 1 + Math.max(eggFloor[uint256(i - 1)][uint256(x - 1)], eggFloor[uint256(i)][uint256(j - x)]);
									// choose min of all values for particular x

									if(result < eggFloor[uint256(i)][uint256(j)])
									{
										eggFloor[uint256(i)][uint256(j)] = result;									}
							}
					}
			}
			return eggFloor[uint256(n)][uint256(m)];
	}

}

library EggDropping_Library
{
	function minTrials(int32 n, int32 m) private returns(int32)
	{
			int32 result;
			for(int32 i = int32(1); i <= n; i++;)
			{
					// Zero trial for zero floor.

					eggFloor[uint256(i)][uint256(0)] = 0;
					// One trial for one floor

					eggFloor[uint256(i)][uint256(1)] = 1;
			}
			for(int32 j = int32(1); j <= m; j++;)
			{
				eggFloor[uint256(1)][uint256(j)] = j;			}
			for(int32 i = int32(2); i <= n; i++;)
			{
					for(int32 j = int32(2); j <= m; j++;)
					{
							eggFloor[uint256(i)][uint256(j)] = Integer.MAX_VALUE;
							for(x = 1; x <= j; x++;)
							{
									result = 1 + Math.max(eggFloor[uint256(i - 1)][uint256(x - 1)], eggFloor[uint256(i)][uint256(j - x)]);
									// choose min of all values for particular x

									if(result < eggFloor[uint256(i)][uint256(j)])
									{
										eggFloor[uint256(i)][uint256(j)] = result;									}
							}
					}
			}
			return eggFloor[uint256(n)][uint256(m)];
	}

	function main(string[] memory args) public
	{
			int32 n = int32(2);
			// result outputs min no. of trials in worst case for n eggs and m floors

			int32 result = int32(minTrials(n, m));
			System.out.println(result);
	}

}

