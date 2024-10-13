pragma solidity 0.7.5;

//package ProjectEuler


/**
 * If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
 * The sum of these multiples is 23.
 *
 * <p>Find the sum of all the multiples of 3 or 5 below 1000.
 *
 * <p>Link: https://projecteuler.net/problem=1
 */

contract Problem01
{
	function solution1(int32 n) private returns(int32)
	{
			int32 sum = int32(0);
			for(int32 i = int32(3); i < n; ++i;)
			{
					if(i % 3 == 0 || i % 5 == 0)
					{
							sum += i;
					}
			}
			return sum;
	}

	function solution2(int32 n) private returns(int32)
	{
			int32 sum = int32(0);
			int32 terms = int32((n - 1) / 3);
			sum += terms * (6 + (terms - 1) * 3) / 2;
			terms = (n - 1) / 5;
			sum += terms * (10 + (terms - 1) * 5) / 2;
			terms = (n - 1) / 15;
			sum -= terms * (30 + (terms - 1) * 15) / 2;
			return sum;
	}

}

library Problem01_Library
{
	function main(string[] memory args) public
	{
			for(uint256 iterator_var = uint256(0); iterator_var < testNumber.length; iterator_var++;)
			{
					int32[] ints = [int32(estNumber[uint256(iterator_var))];
			}
	}

	function solution1(int32 n) private returns(int32)
	{
			int32 sum = int32(0);
			for(int32 i = int32(3); i < n; ++i;)
			{
					if(i % 3 == 0 || i % 5 == 0)
					{
							sum += i;
					}
			}
			return sum;
	}

	function solution2(int32 n) private returns(int32)
	{
			int32 sum = int32(0);
			int32 terms = int32((n - 1) / 3);
			sum += terms * (6 + (terms - 1) * 3) / 2;
			terms = (n - 1) / 5;
			sum += terms * (10 + (terms - 1) * 5) / 2;
			terms = (n - 1) / 15;
			sum -= terms * (30 + (terms - 1) * 15) / 2;
			return sum;
	}

}

