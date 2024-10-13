pragma solidity 0.7.5;

//package DynamicProgramming


/**
 * @author Varun Upadhyay (https://github.com/varunu28)
 */

contract CoinChange
{
}

library CoinChange_Library
{
	// Driver Program

	function main(string[] memory args) public
	{
			int32 amount = int32(12);
			System.out.println("Number of combinations of getting change for " + amount + " is: " + change(coins, amount));
			System.out.println("Minimum number of coins required for amount :" + amount + " is: " + minimumCoins(coins, amount));
	}

	/**
 * This method finds the number of combinations of getting change for a given amount and change
 * coins
 *
 * @param coins The list of coins
 * @param amount The amount for which we need to find the change Finds the number of combinations
 *     of change
 */

	function change(int32[] memory coins, int32 amount) public returns(int32)
	{
			combinations[uint256(0)] = 1;
			for(uint256 iterator_var = uint256(0); iterator_var < coins.length; iterator_var++;)
			{
					int32 coin = int32(coins[uint256(iterator_var)]);
					for(int32 i = int32(coin); i < amount + 1; i++;)
					{
							combinations[uint256(i)] += combinations[uint256(i - coin)];
					}
			}
			return combinations[uint256(amount)];
	}

	/**
 * This method finds the minimum number of coins needed for a given amount.
 *
 * @param coins The list of coins
 * @param amount The amount for which we need to find the minimum number of coins. Finds the the
 *     minimum number of coins that make a given value.
 */

	function minimumCoins(int32[] memory coins, int32 amount) public returns(int32)
	{
			minimumCoins[uint256(0)] = 0;
			for(int32 i = int32(1); i <= amount; i++;)
			{
					minimumCoins[uint256(i)] = Integer.MAX_VALUE;
			}
			for(int32 i = int32(1); i <= amount; i++;)
			{
					for(uint256 iterator_var = uint256(0); iterator_var < coins.length; iterator_var++;)
					{
							int32 coin = int32(coins[uint256(iterator_var)]);
							if(coin <= i)
							{
									int32 sub_res = int32(minimumCoins[uint256(i - coin)]);
									if(sub_res != Integer.MAX_VALUE && sub_res + 1 < minimumCoins[uint256(i)])
									{
										minimumCoins[uint256(i)] = sub_res + 1;									}
							}
					}
			}
			// printAmount(minimumCoins);

			return minimumCoins[uint256(amount)]
	}

	// A basic print method which prints all the contents of the array

	function printAmount(int32[] memory arr) public
	{
			for(int32 i = int32(0); i < arr.length; i++;)
			{
					System.out.print(arr[uint256(i)] + " ");
			}
			System.out.println();
	}

}

