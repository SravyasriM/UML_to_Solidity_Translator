pragma solidity 0.7.5;

//package Conversions


import "java/util.sol";

contract RomanToInteger
{
	Map static  map = Map(new HashMap());

	/**
 * This function convert Roman number into Integer
 *
 * @param A Roman number string
 * @return integer
 */

	function romanToInt(string A) public returns(int32)
	{
			A = A.toUpperCase();
			byte prev = byte(" ");
			int32 sum = int32(0);
			int32 newPrev = int32(0);
			for(int32 i = int32(A.length() - 1); i >= 0; i--;)
			{
					byte c = byte(A.charAt(i));
					if(prev != " ")
					{
							// checking current Number greater then previous or not

							newPrev = map.get(prev) > newPrev ? map.get(prev) : newPrev;
					}
					int32 currentNum = int32(map.get(c));
					// if current number greater then prev max previous then add

					if(currentNum >= newPrev)
					{
							sum += currentNum;
					}
					else
					{
							// subtract upcoming number until upcoming number not greater then prev max

							sum -= currentNum;
					}

					prev = c;
			}
			return sum;
	}

}

library RomanToInteger_Library
{
	/**
 * This function convert Roman number into Integer
 *
 * @param A Roman number string
 * @return integer
 */

	function romanToInt(string A) public returns(int32)
	{
			A = A.toUpperCase();
			byte prev = byte(" ");
			int32 sum = int32(0);
			int32 newPrev = int32(0);
			for(int32 i = int32(A.length() - 1); i >= 0; i--;)
			{
					byte c = byte(A.charAt(i));
					if(prev != " ")
					{
							// checking current Number greater then previous or not

							newPrev = map.get(prev) > newPrev ? map.get(prev) : newPrev;
					}
					int32 currentNum = int32(map.get(c));
					// if current number greater then prev max previous then add

					if(currentNum >= newPrev)
					{
							sum += currentNum;
					}
					else
					{
							// subtract upcoming number until upcoming number not greater then prev max

							sum -= currentNum;
					}

					prev = c;
			}
			return sum;
	}

	function main(string[] memory args) public
	{
			int32 sum = int32(romanToInt("MDCCCIV"));
			System.out.println(sum);
	}

}

