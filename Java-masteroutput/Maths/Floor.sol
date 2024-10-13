pragma solidity 0.7.5;

//package Maths


import "java/util/Random.sol";

contract Floor
{
	/**
 * Returns the largest (closest to positive infinity)
 *
 * @param number the number
 * @return the largest (closest to positive infinity) of given {@code number}
 */

	function floor(int64 number) public returns(int64)
	{
			if(number - int32(number) == 0)
			{
					return number;
			}
			else
			{
				if(number - int32(number) > 0)
				{
						return int32(number);
				}
				else
				{
						return int32(number) - 1;
				}
			}

	}

}

library Floor_Library
{
	function main(string[] memory args) public
	{
			Random random;
			for(int32 i = int32(1); i <= 1000; ++i;)
			{
					int64 randomNumber = int64(random.nextDouble()); //Converted from DOUBLE TYPE of Java
			}
	}

	/**
 * Returns the largest (closest to positive infinity)
 *
 * @param number the number
 * @return the largest (closest to positive infinity) of given {@code number}
 */

	function floor(int64 number) public returns(int64)
	{
			if(number - int32(number) == 0)
			{
					return number;
			}
			else
			{
				if(number - int32(number) > 0)
				{
						return int32(number);
				}
				else
				{
						return int32(number) - 1;
				}
			}

	}

}

