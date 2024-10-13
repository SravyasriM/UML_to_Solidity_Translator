pragma solidity 0.7.5;

//package Searches


import "java/util/Scanner.sol";

/**
 * Program to perform Saddleback Search Given a sorted 2D array(elements are sorted across every row
 * and column, assuming ascending order) of size n*m we can search a given element in O(n+m)
 *
 * <p>we start from bottom left corner if the current element is greater than the given element then
 * we move up else we move right Sample Input: 5 5 ->Dimensions -10 -5 -3 4 9 -6 -2 0 5 10 -4 -1 1 6
 * 12 2 3 7 8 13 100 120 130 140 150 140 ->element to be searched output: 4 3 // first value is row,
 * second one is column
 *
 * @author Nishita Aggarwal
 */

contract SaddlebackSearch
{
}

library SaddlebackSearch_Library
{
	/**
 * Main method
 *
 * @param args Command line arguments
 */

	function main(string[] memory args) public
	{
			// TODO Auto-generated method stub

			Scanner sc;
			int32 i;
			arr = new int32[](rows);
			for(i = 0; i < rows; i++;)
			{
					for(j = 0; j < col; j++;)
					{
							arr[uint256(i)][uint256(j)] = sc.nextInt();
					}
			}
			int32 ele = int32(sc.nextInt());
			System.out.println(ans[uint256(0)] + " " + ans[uint256(1)]);
			sc.close();
	}

}

