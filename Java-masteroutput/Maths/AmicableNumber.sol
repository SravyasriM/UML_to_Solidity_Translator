pragma solidity 0.7.5;

//package Maths


/**
 * Amicable numbers are two different numbers so related that the sum of the proper divisors of each
 * is equal to the other number. (A proper divisor of a number is a positive factor of that number
 * other than the number itself. For example, the proper divisors of 6 are 1, 2, and 3.) A pair of
 * amicable numbers constitutes an aliquot sequence of period 2. It is unknown if there are
 * infinitely many pairs of amicable numbers. *
 *
 * <p>* link: https://en.wikipedia.org/wiki/Amicable_numbers *
 *
 * <p>Simple Example : (220,284) 220 is divisible by {1,2,4,5,10,11,20,22,44,55,110 } <- Sum = 284
 * 284 is divisible by -> 1,2,4,71,142 and the Sum of that is. Yes right you probably expected it
 * 220
 */

contract AmicableNumber
{
	/**
 * @param startValue
 * @param stopValue
 * @return
 */

	function findAllInRange(int32 startValue, int32 stopValue) internal
	{
			/* the 2 for loops are to avoid to double check tuple. For example (200,100) and (100,200) is the same calculation
     * also to avoid is to check the number with it self. a number with itself is always a AmicableNumber
     * */

			StringBuilder res;
			int32 countofRes = int32(0);
			for(int32 i = int32(startValue); i < stopValue; i++;)
			{
					for(int32 j = int32(i + 1); j <= stopValue; j++;)
					{
							if(isAmicableNumber(i, j))
							{
									countofRes++;
									res.append("" + countofRes + ": = ( " + i + "," + j + ")" + "\t");
							}
					}
			}
			System.out.println(res.toString());
	}

	/**
 * Check if {@code numberOne and numberTwo } are AmicableNumbers or not
 *
 * @param numberOne numberTwo
 * @return {@code true} if {@code numberOne numberTwo} isAmicableNumbers otherwise false
 */

	function isAmicableNumber(int32 numberOne, int32 numberTwo) internal returns(bool)
	{
			return ((recursiveCalcOfDividerSum(numberOne, numberOne) == numberTwo && numberOne == recursiveCalcOfDividerSum(numberTwo, numberTwo)));
	}

	/**
 * calculated in recursive calls the Sum of all the Dividers beside it self
 *
 * @param number div = the next to test dividely by using the modulo operator
 * @return sum of all the dividers
 */

	function recursiveCalcOfDividerSum(int32 number, int32 div) internal returns(int32)
	{
			if(div == 1)
			{
					return 0;
			}
			else
			{
				if(number % --div; == 0)
				{
						return recursiveCalcOfDividerSum(number, div) + div;
				}
				else
				{
						return recursiveCalcOfDividerSum(number, div);
				}
			}

	}

}

library AmicableNumber_Library
{
	function main(string[] memory args) public
	{
			AmicableNumber.findAllInRange(1, 3000);
	}

	/**
 * @param startValue
 * @param stopValue
 * @return
 */

	function findAllInRange(int32 startValue, int32 stopValue) internal
	{
			/* the 2 for loops are to avoid to double check tuple. For example (200,100) and (100,200) is the same calculation
     * also to avoid is to check the number with it self. a number with itself is always a AmicableNumber
     * */

			StringBuilder res;
			int32 countofRes = int32(0);
			for(int32 i = int32(startValue); i < stopValue; i++;)
			{
					for(int32 j = int32(i + 1); j <= stopValue; j++;)
					{
							if(isAmicableNumber(i, j))
							{
									countofRes++;
									res.append("" + countofRes + ": = ( " + i + "," + j + ")" + "\t");
							}
					}
			}
			System.out.println(res.toString());
	}

	/**
 * Check if {@code numberOne and numberTwo } are AmicableNumbers or not
 *
 * @param numberOne numberTwo
 * @return {@code true} if {@code numberOne numberTwo} isAmicableNumbers otherwise false
 */

	function isAmicableNumber(int32 numberOne, int32 numberTwo) internal returns(bool)
	{
			return ((recursiveCalcOfDividerSum(numberOne, numberOne) == numberTwo && numberOne == recursiveCalcOfDividerSum(numberTwo, numberTwo)));
	}

	/**
 * calculated in recursive calls the Sum of all the Dividers beside it self
 *
 * @param number div = the next to test dividely by using the modulo operator
 * @return sum of all the dividers
 */

	function recursiveCalcOfDividerSum(int32 number, int32 div) internal returns(int32)
	{
			if(div == 1)
			{
					return 0;
			}
			else
			{
				if(number % --div; == 0)
				{
						return recursiveCalcOfDividerSum(number, div) + div;
				}
				else
				{
						return recursiveCalcOfDividerSum(number, div);
				}
			}

	}

}

