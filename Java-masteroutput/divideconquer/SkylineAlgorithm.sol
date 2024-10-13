pragma solidity 0.7.5;

//package divideconquer


import "java/util/ArrayList.sol";

import "java/util/Comparator.sol";

/**
 * @author dimgrichr
 *     <p>Space complexity: O(n) Time complexity: O(nlogn), because it is a divide and conquer
 *     algorithm
 */

contract SkylineAlgorithm
{
	ArrayList private  points;

	/**
 * @return points, the ArrayList that includes all points.
 */

	function getPoints() public returns(ArrayList)
	{
			return points;
	}

	/**
 * The main divide and conquer, and also recursive algorithm. It gets an ArrayList full of points
 * as an argument. If the size of that ArrayList is 1 or 2, the ArrayList is returned as it is, or
 * with one less point (if the initial size is 2 and one of it's points, is dominated by the other
 * one). On the other hand, if the ArrayList's size is bigger than 2, the function is called
 * again, twice, with arguments the corresponding half of the initial ArrayList each time. Once
 * the flashback has ended, the function produceFinalSkyLine gets called, in order to produce the
 * final skyline, and return it.
 *
 * @param list, the initial list of points
 * @return leftSkyLine, the combination of first half's and second half's skyline
 * @see Point
 */

	function produceSubSkyLines(ArrayList list) public returns(ArrayList)
	{
			// part where function exits flashback

			int32 size = int32(list.size());
			if(size == 1)
			{
					return list;
			}
			else
			{
				if(size == 2)
				{
						if(list.get(0).dominates(list.get(1)))
						{
								list.remove(1);
						}
						else
						{
								if(list.get(1).dominates(list.get(0)))
								{
										list.remove(0);
								}
						}

						return list;
				}			}

			// recursive part of the function

			ArrayList leftHalf;
			ArrayList rightHalf;
			for(int32 i = int32(0); i < list.size(); i++;)
			{
					if(i < list.size() / 2)
					{
							leftHalf.add(list.get(i));
					}
					else
					{
							rightHalf.add(list.get(i));
					}

			}
			ArrayList leftSubSkyLine = ArrayList(produceSubSkyLines(leftHalf));
			ArrayList rightSubSkyLine = ArrayList(produceSubSkyLines(rightHalf));
			// skyline is produced

			return produceFinalSkyLine(leftSubSkyLine, rightSubSkyLine);
	}

	/**
 * The first half's skyline gets cleared from some points that are not part of the final skyline
 * (Points with same x-value and different y=values. The point with the smallest y-value is kept).
 * Then, the minimum y-value of the points of first half's skyline is found. That helps us to
 * clear the second half's skyline, because, the points of second half's skyline that have greater
 * y-value of the minimum y-value that we found before, are dominated, so they are not part of the
 * final skyline. Finally, the "cleaned" first half's and second half's skylines, are combined,
 * producing the final skyline, which is returned.
 *
 * @param left the skyline of the left part of points
 * @param right the skyline of the right part of points
 * @return left the final skyline
 */

	function produceFinalSkyLine(ArrayList left, ArrayList right) public returns(ArrayList)
	{
			// dominated points of ArrayList left are removed

			for(int32 i = int32(0); i < left.size() - 1; i++;)
			{
					if(left.get(i).x == left.get(i + 1).x && left.get(i).y > left.get(i + 1).y)
					{
							left.remove(i);
							i--;
					}
			}
			// minimum y-value is found

			int32 min = int32(left.get(0).y);
			for(int32 i = int32(1); i < left.size(); i++;)
			{
					if(min > left.get(i).y)
					{
							min = left.get(i).y;
							if(min == 1)
							{
									i = left.size();
							}
					}
			}
			// dominated points of ArrayList right are removed

			for(int32 i = int32(0); i < right.size(); i++;)
			{
					if(right.get(i).y >= min)
					{
							right.remove(i);
							i--;
					}
			}
			// final skyline found and returned

			left.addAll(right);
			return left;
	}

}

library SkylineAlgorithm_Library
{
}

