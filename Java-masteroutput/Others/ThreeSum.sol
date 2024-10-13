pragma solidity 0.7.5;

//package Others


import "java/util/Arrays.sol";

import "java/util/Scanner.sol";

/**
 * To find triplet equals to given sum in complexity O(n*log(n))
 *
 * <p>Array must be sorted
 *
 * @author Ujjawal Joshi
 * @date 2020.05.18
 *     <p>Test Cases: Input: 6 //Length of array 12 3 4 1 6 9 target=24 Output:3 9 12 Explanation:
 *     There is a triplet (12, 3 and 9) present in the array whose sum is 24.
 */

contract ThreeSum
{
}

library ThreeSum_Library
{
	function main(string[] memory args) public
	{
			Scanner sc;
			// Length of an array

			int32 n = int32(sc.nextInt());
			for(int32 i = int32(0); i < n; i++;)
			{
					a[uint256(i)] = sc.nextInt();
			}
			System.out.println("Target");
			int32 n_find = int32(sc.nextInt());
			// Sort the array if array is not sorted

			Arrays.sort(a);
			for(int32 i = int32(0); i < n; i++;)
			{
					int32 l = int32(i + 1);
					while(l < r)
					{
							if(a[uint256(i)] + a[uint256(l)] + a[uint256(r)] == n_find)
							{
									System.out.println(a[uint256(i)] + " " + a[uint256(l)] + " " + a[uint256(r)]);
									break;
							}
							else
							{
								// if you want all the triplets write l++;r--; insted of break;

								if(a[uint256(i)] + a[uint256(l)] + a[uint256(r)] < n_find)
								{
									l++;								}
								else
								{
									r--;								}
							}


					}
			}
			sc.close();
	}

}

