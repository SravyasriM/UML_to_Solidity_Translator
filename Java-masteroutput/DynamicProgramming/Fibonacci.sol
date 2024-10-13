pragma solidity 0.7.5;

//package DynamicProgramming


import "java/util/HashMap.sol";

import "java/util/Map.sol";

import "java/util/Scanner.sol";

/**
 * @author Varun Upadhyay (https://github.com/varunu28)
 */

contract Fibonacci
{
	Map static  map = Map(new HashMap());

	/**
 * This method finds the nth fibonacci number using memoization technique
 *
 * @param n The input n for which we have to determine the fibonacci number Outputs the nth
 *     fibonacci number
 */

	function fibMemo(int32 n) public returns(int32)
	{
			if(map.containsKey(n))
			{
					return map.get(n);
			}
			int32 f;
			if(n <= 1)
			{
					f = n;
			}
			else
			{
					f = fibMemo(n - 1) + fibMemo(n - 2);
					map.put(n, f);
			}

			return f;
	}

	/**
 * This method finds the nth fibonacci number using bottom up
 *
 * @param n The input n for which we have to determine the fibonacci number Outputs the nth
 *     fibonacci number
 */

	function fibBotUp(int32 n) public returns(int32)
	{
			Map fib = new HashMap();
			for(int32 i = int32(0); i <= n; i++;)
			{
					int32 f;
					if(i <= 1)
					{
							f = i;
					}
					else
					{
							f = fib.get(i - 1) + fib.get(i - 2);
					}

					fib.put(i, f);
			}
			return fib.get(n);
	}

	/**
 * This method finds the nth fibonacci number using bottom up
 *
 * @param n The input n for which we have to determine the fibonacci number Outputs the nth
 *     fibonacci number
 *     <p>This is optimized version of Fibonacci Program. Without using Hashmap and recursion. It
 *     saves both memory and time. Space Complexity will be O(1) Time Complexity will be O(n)
 *     <p>Whereas , the above functions will take O(n) Space.
 * @author Shoaib Rayeen (https://github.com/shoaibrayeen)
 */

	function fibOptimized(int32 n) public returns(int32)
	{
			if(n == 0)
			{
					return 0;
			}
			int32 prev = int32(0);
			for(int32 i = int32(2); i <= n; i++;)
			{
					next = prev + res;
					prev = res;
					res = next;
			}
			return res;
	}

}

library Fibonacci_Library
{
	function main(string[] memory args) public
	{
			// Methods all returning [0, 1, 1, 2, 3, 5, ...] for n = [0, 1, 2, 3, 4, 5, ...]

			Scanner sc;
			int32 n = int32(sc.nextInt());
			System.out.println(fibMemo(n));
			System.out.println(fibBotUp(n));
			System.out.println(fibOptimized(n));
			sc.close();
	}

	/**
 * This method finds the nth fibonacci number using memoization technique
 *
 * @param n The input n for which we have to determine the fibonacci number Outputs the nth
 *     fibonacci number
 */

	function fibMemo(int32 n) public returns(int32)
	{
			if(map.containsKey(n))
			{
					return map.get(n);
			}
			int32 f;
			if(n <= 1)
			{
					f = n;
			}
			else
			{
					f = fibMemo(n - 1) + fibMemo(n - 2);
					map.put(n, f);
			}

			return f;
	}

	/**
 * This method finds the nth fibonacci number using bottom up
 *
 * @param n The input n for which we have to determine the fibonacci number Outputs the nth
 *     fibonacci number
 */

	function fibBotUp(int32 n) public returns(int32)
	{
			Map fib = new HashMap();
			for(int32 i = int32(0); i <= n; i++;)
			{
					int32 f;
					if(i <= 1)
					{
							f = i;
					}
					else
					{
							f = fib.get(i - 1) + fib.get(i - 2);
					}

					fib.put(i, f);
			}
			return fib.get(n);
	}

	/**
 * This method finds the nth fibonacci number using bottom up
 *
 * @param n The input n for which we have to determine the fibonacci number Outputs the nth
 *     fibonacci number
 *     <p>This is optimized version of Fibonacci Program. Without using Hashmap and recursion. It
 *     saves both memory and time. Space Complexity will be O(1) Time Complexity will be O(n)
 *     <p>Whereas , the above functions will take O(n) Space.
 * @author Shoaib Rayeen (https://github.com/shoaibrayeen)
 */

	function fibOptimized(int32 n) public returns(int32)
	{
			if(n == 0)
			{
					return 0;
			}
			int32 prev = int32(0);
			for(int32 i = int32(2); i <= n; i++;)
			{
					next = prev + res;
					prev = res;
					res = next;
			}
			return res;
	}

}

