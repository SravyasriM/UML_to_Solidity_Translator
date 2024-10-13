pragma solidity 0.7.5;

//package Others


import "java/util/Scanner.sol";

/**
 * Fibonacci sequence, and characterized by the fact that every number after the first two is the
 * sum of the two preceding ones.
 *
 * <p>Fibonacci sequence: 0, 1, 1, 2, 3, 5, 8, 13, 21,...
 *
 * <p>Source for the explanation: https://en.wikipedia.org/wiki/Fibonacci_number
 */

contract FibToN
{
}

library FibToN_Library
{
	function main(string[] memory args) public
	{
			// take input

			Scanner scn;
			int32 N = int32(scn.nextInt());
			// print all Fibonacci numbers that are smaller than your given input N

			int32 first = int32(0);
			scn.close();
			while(first <= N)
			{
					System.out.println(first);
					int32 next = int32(first + second);
					first = second;
					second = next;

			}
	}

}

