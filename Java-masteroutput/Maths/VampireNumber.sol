pragma solidity 0.7.5;

//package Maths


import "java/util/ArrayList.sol";

import "java/util/Collections.sol";

/**
 * n number theory, a vampire number (or true vampire number) is a composite natural number with an
 * even number of digits, that can be factored into two natural numbers each with half as many
 * digits as the original number and not both with trailing zeroes, where the two factors contain
 * precisely all the digits of the original number, in any order, counting multiplicity. The first
 * vampire number is 1260 = 21 × 60. *
 *
 * <p>* link: https://en.wikipedia.org/wiki/Vampire_number *
 *
 * <p>
 */

contract VampireNumber
{
	function test(int32 startValue, int32 stopValue) internal
	{
			int32 countofRes = int32(1);
			StringBuilder res;
			for(int32 i = int32(startValue); i <= stopValue; i++;)
			{
					for(int32 j = int32(i); j <= stopValue; j++;)
					{
							// System.out.println(i+ " "+ j);

							if(isVampireNumber(i, j, true))
							{
									countofRes++;
									res.append("" + countofRes + ": = ( " + i + "," + j + " = " + i * j + ")" + "\n");
							}
					}
			}
			System.out.println(res);
	}

	function isVampireNumber(int32 a, int32 b, bool noPseudoVamireNumbers) internal returns(bool)
	{
			// 126 = 6 x 21

			if(noPseudoVamireNumbers)
			{
					if(a * 10 <= b || b * 10 <= a)
					{
							return false;
					}
			}
			string memory mulDigits;
			string memory faktorDigits = string(splitIntoDigits(a, b));
			return mulDigits.equals(faktorDigits);
	}

	// methode to Split the numbers to Digits

	function splitIntoDigits(int32 num, int32 num2) internal returns(String)
	{
			StringBuilder res;
			ArrayList digits;
			while(num > 0)
			{
					digits.add(num % 10);
					num /= 10;

			}
			while(num2 > 0)
			{
					digits.add(num2 % 10);
					num2 /= 10;

			}
			Collections.sort(digits);
			for(uint256 iterator_var = uint256(0); iterator_var < digits.length; iterator_var++;)
			{
					int32 i = int32(digits[uint256(iterator_var)]);
					res.append(i);
			}
			return res.toString();
	}

}

library VampireNumber_Library
{
	function main(string[] memory args) public
	{
			test(10, 1000);
	}

	function test(int32 startValue, int32 stopValue) internal
	{
			int32 countofRes = int32(1);
			StringBuilder res;
			for(int32 i = int32(startValue); i <= stopValue; i++;)
			{
					for(int32 j = int32(i); j <= stopValue; j++;)
					{
							// System.out.println(i+ " "+ j);

							if(isVampireNumber(i, j, true))
							{
									countofRes++;
									res.append("" + countofRes + ": = ( " + i + "," + j + " = " + i * j + ")" + "\n");
							}
					}
			}
			System.out.println(res);
	}

	function isVampireNumber(int32 a, int32 b, bool noPseudoVamireNumbers) internal returns(bool)
	{
			// 126 = 6 x 21

			if(noPseudoVamireNumbers)
			{
					if(a * 10 <= b || b * 10 <= a)
					{
							return false;
					}
			}
			string memory mulDigits;
			string memory faktorDigits = string(splitIntoDigits(a, b));
			return mulDigits.equals(faktorDigits);
	}

	// methode to Split the numbers to Digits

	function splitIntoDigits(int32 num, int32 num2) internal returns(String)
	{
			StringBuilder res;
			ArrayList digits;
			while(num > 0)
			{
					digits.add(num % 10);
					num /= 10;

			}
			while(num2 > 0)
			{
					digits.add(num2 % 10);
					num2 /= 10;

			}
			Collections.sort(digits);
			for(uint256 iterator_var = uint256(0); iterator_var < digits.length; iterator_var++;)
			{
					int32 i = int32(digits[uint256(iterator_var)]);
					res.append(i);
			}
			return res.toString();
	}

}

