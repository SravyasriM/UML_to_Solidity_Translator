pragma solidity 0.7.5;

//package Others


/**
 * You can read more about Euler's totient function
 *
 * <p>See https://en.wikipedia.org/wiki/Euler%27s_totient_function
 */

contract EulersFunction
{
	// complexity;

	function getEuler(int32 n) public returns(int32)
	{
			int32 result = int32(n);
			for(int32 i = int32(2); i * i <= n; i++;)
			{
					if(n % i == 0)
					{
							while(n % i == 0)
							{
								n /= i;
							}
							result -= result / i;
					}
			}
			if(n > 1)
			{
				result -= result / n;			}
			return result;
	}

}

library EulersFunction_Library
{
	// complexity;

	function getEuler(int32 n) public returns(int32)
	{
			int32 result = int32(n);
			for(int32 i = int32(2); i * i <= n; i++;)
			{
					if(n % i == 0)
					{
							while(n % i == 0)
							{
								n /= i;
							}
							result -= result / i;
					}
			}
			if(n > 1)
			{
				result -= result / n;			}
			return result;
	}

	function main(string[] memory args) public
	{
			for(int32 i = int32(1); i < 100; i++;)
			{
					System.out.println(getEuler(i));
			}
	}

}

