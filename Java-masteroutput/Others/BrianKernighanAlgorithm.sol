pragma solidity 0.7.5;

//package Others


import "java/util/Scanner.sol";

/**
 * @author Nishita Aggarwal
 *     <p>Brian Kernighan’s Algorithm
 *     <p>algorithm to count the number of set bits in a given number
 *     <p>Subtraction of 1 from a number toggles all the bits (from right to left) till the
 *     rightmost set bit(including the rightmost set bit). So if we subtract a number by 1 and do
 *     bitwise & with itself i.e. (n & (n-1)), we unset the rightmost set bit.
 *     <p>If we do n & (n-1) in a loop and count the no of times loop executes we get the set bit
 *     count.
 *     <p>
 *     <p>Time Complexity: O(logn)
 */

contract BrianKernighanAlgorithm
{
	/**
 * @param num: number in which we count the set bits
 * @return int: Number of set bits
 */

	function countSetBits(int32 num) internal returns(int32)
	{
			int32 cnt = int32(0);
			while(num != 0)
			{
					num = num & (num - 1);
					cnt++;

			}
			return cnt;
	}

}

library BrianKernighanAlgorithm_Library
{
	/**
 * @param num: number in which we count the set bits
 * @return int: Number of set bits
 */

	function countSetBits(int32 num) internal returns(int32)
	{
			int32 cnt = int32(0);
			while(num != 0)
			{
					num = num & (num - 1);
					cnt++;

			}
			return cnt;
	}

	/**
 * @param args : command line arguments
 */

	function main(string[] memory args) public
	{
			Scanner sc;
			int32 num = int32(sc.nextInt());
			int32 setBitCount = int32(countSetBits(num));
			System.out.println(setBitCount);
			sc.close();
	}

}

