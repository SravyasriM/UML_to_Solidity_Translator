pragma solidity 0.7.5;

//package DataStructures.Lists


import "java/util/ArrayList.sol";

import "java/util/List.sol";

/**
 * @author https://github.com/shellhub
 */

contract MergeSortedArrayList
{
	/**
 * merge two sorted ArrayList
 *
 * @param listA the first list to merge
 * @param listB the second list to merge
 * @param listC the result list after merging
 */

	function merge(List listA, List listB, List listC) public
	{
			int32 pa = int32(0);
			/* the index of listA */

			int32 pb = int32(0);
			while(pa < listA.size() && pb < listB.size())
			{
					if(listA.get(pa) <= listB.get(pb))
					{
							listC.add(listA.get(pa++;))
					}
					else
					{
							listC.add(listB.get(pb++;))
					}


			}
			/* copy left element of listA to listC */

			while(pa < listA.size())
			{
					listC.add(listA.get(pa++;))

			}
			/* copy left element of listB to listC */

			while(pb < listB.size())
			{
					listC.add(listB.get(pb++;))

			}
	}

}

library MergeSortedArrayList_Library
{
	function main(string[] memory args) public
	{
			List listA;
			List listB;
			List listC;
			/* init ListA and List B */

			for(int32 i = int32(1); i <= 10; i += 2;)
			{
					listA.add(i);
					/* listA: [1, 3, 5, 7, 9]  */

					listB.add(i + 1);
			}
			/* merge listA and listB to listC */

			merge(listA, listB, listC);
			System.out.println("listA: " + listA);
			System.out.println("listB: " + listB);
			System.out.println("listC: " + listC);
	}

	/**
 * merge two sorted ArrayList
 *
 * @param listA the first list to merge
 * @param listB the second list to merge
 * @param listC the result list after merging
 */

	function merge(List listA, List listB, List listC) public
	{
			int32 pa = int32(0);
			/* the index of listA */

			int32 pb = int32(0);
			while(pa < listA.size() && pb < listB.size())
			{
					if(listA.get(pa) <= listB.get(pb))
					{
							listC.add(listA.get(pa++;))
					}
					else
					{
							listC.add(listB.get(pb++;))
					}


			}
			/* copy left element of listA to listC */

			while(pa < listA.size())
			{
					listC.add(listA.get(pa++;))

			}
			/* copy left element of listB to listC */

			while(pb < listB.size())
			{
					listC.add(listB.get(pb++;))

			}
	}

}

