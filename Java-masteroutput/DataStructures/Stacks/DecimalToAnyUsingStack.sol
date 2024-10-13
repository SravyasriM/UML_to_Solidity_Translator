pragma solidity 0.7.5;

//package DataStructures.Stacks


import "java/util/Stack.sol";

contract DecimalToAnyUsingStack
{
	/**
 * Convert decimal number to another radix
 *
 * @param number the number to be converted
 * @param radix the radix
 * @return another radix
 * @throws ArithmeticException if <tt>number</tt> or <tt>radius</tt> is invalid
 */

	function convert(int32 number, int32 radix) private returns(String)
	{
			if(radix < 2 || radix > 16)
			{
			}
			Stack bits;
			do
			{
					bits.push(tables[uint256(number % radix)]);
					number = number / radix;

			}while(number != 0);
			StringBuilder result;
			while(!bits.isEmpty();)
			{
					result.append(bits.pop());

			}
			return result.toString();
	}

}

library DecimalToAnyUsingStack_Library
{
	function main(string[] memory args) public
	{
	}

	/**
 * Convert decimal number to another radix
 *
 * @param number the number to be converted
 * @param radix the radix
 * @return another radix
 * @throws ArithmeticException if <tt>number</tt> or <tt>radius</tt> is invalid
 */

	function convert(int32 number, int32 radix) private returns(String)
	{
			if(radix < 2 || radix > 16)
			{
			}
			Stack bits;
			do
			{
					bits.push(tables[uint256(number % radix)]);
					number = number / radix;

			}while(number != 0);
			StringBuilder result;
			while(!bits.isEmpty();)
			{
					result.append(bits.pop());

			}
			return result.toString();
	}

}

