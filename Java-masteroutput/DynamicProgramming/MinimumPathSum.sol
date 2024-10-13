pragma solidity 0.7.5;

//package DynamicProgramming


/*
Given the following grid with length m and width n:
\---\---\---\ (n)
\ 1 \ 3 \ 1 \
\---\---\---\
\ 1 \ 5 \ 1 \
\---\---\---\
\ 4 \ 2 \ 1 \
\---\---\---\
(m)
Find the path where its sum is the smallest.

All numbers given are positive.
The Time Complexity of your algorithm should be smaller than or equal to O(mn).
The Space Complexity of your algorithm should be smaller than or equal to O(mn).
You can only move from the top left corner to the down right corner.
You can only move one step down or right.

EXAMPLE:
INPUT: grid = [[1,3,1],[1,5,1],[4,2,1]]
OUTPUT: 7
EXPLANATIONS: 1 + 3 + 1 + 1 + 1 = 7

For more information see https://www.geeksforgeeks.org/maximum-path-sum-matrix/
*/

contract MinimumPathSum
{
	function testRegular() public
	{
			System.out.println(minimumPathSum(grid));
	}

	function testLessColumns() public
	{
			System.out.println(minimumPathSum(grid));
	}

	function testLessRows() public
	{
			System.out.println(minimumPathSum(grid));
	}

	function testOneRowOneColumn() public
	{
			System.out.println(minimumPathSum(grid));
	}

}

library MinimumPathSum_Library
{
}

