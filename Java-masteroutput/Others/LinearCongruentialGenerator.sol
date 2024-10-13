pragma solidity 0.7.5;

//package Others


/**
 * A pseudorandom number generator.
 *
 * @author Tobias Carryer
 * @date October 10, 2017
 */

contract LinearCongruentialGenerator
{
	int64 private  a;

	/**
 * The smallest number that can be generated is zero. The largest number that can be generated is
 * modulo-1. modulo is set in the constructor.
 *
 * @return a pseudorandom number.
 */

	function nextNumber() public returns(int64)
	{
			previousValue = (a * previousValue + c) % m;
			return previousValue;
	}

	int private oc_id;

	bool private oc_status;

	constructor(int _oc_id) public
	{
			oc_id = _oc_id;
			oc_status = false;
	}

	modifier overloadedConstructor(int _oc_id)
	{
			require(oc_id == _oc_id, "Restricted for Overloaded Constructor");
			require(oc_status == false, "Restricted for only One Time Execution");
			_;
			oc_status = true;
	}

	/**
 * These parameters are saved and used when nextNumber() is called.
 * The current timestamp in milliseconds is used as the seed.
 *
 * @param multiplier
 * @param increment
 * @param modulo The maximum number that can be generated (exclusive). A common value is 2^32.
 */

	function constructor1(int64 multiplier, int64 increment, int64 modulo) public	overloadedConstructor( 1 )
	{
	}

	/**
 * These parameters are saved and used when nextNumber() is called.
 *
 * @param seed
 * @param multiplier
 * @param increment
 * @param modulo The maximum number that can be generated (exclusive). A common value is 2^32.
 */

	function constructor2(int64 seed, int64 multiplier, int64 increment, int64 modulo) public	overloadedConstructor( 2 )
	{
			LinearCongruentialGenerator.previousValue = seed;
			LinearCongruentialGenerator.a = multiplier;
			LinearCongruentialGenerator.c = increment;
			LinearCongruentialGenerator.m = modulo;
	}

}

library LinearCongruentialGenerator_Library
{
	function main(string[] memory args) public
	{
			// generated to a Set while checking for duplicates.

			LinearCongruentialGenerator lcg;
			for(int32 i = int32(0); i < 512; i++;)
			{
					System.out.println(lcg.nextNumber());
			}
	}

}

