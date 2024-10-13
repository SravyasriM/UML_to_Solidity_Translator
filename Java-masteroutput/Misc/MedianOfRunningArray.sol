pragma solidity 0.7.5;

//package Misc


import "java/util/Collections.sol";

import "java/util/PriorityQueue.sol";

/**
 * @author shrutisheoran
 */

contract MedianOfRunningArray
{
	PriorityQueue private  p1;

	PriorityQueue private  p2;

	/*
      Inserting lower half of array to max Heap
      and upper half to min heap
  */

	function insert(Integer e) public
	{
			p2.add(e);
			if(p2.size() - p1.size() > 1)
			{
				p1.add(p2.remove());			}
	}

	/*
      Returns median at any given point
  */

	function median() public returns(Integer)
	{
			if(p1.size() == p2.size())
			{
				return (p1.peek() + p2.peek()) / 2;			}
			return p1.size() > p2.size() ? p1.peek() : p2.peek();
	}

	// Constructor

	constructor() public
	{
			// Max Heap

			MedianOfRunningArray.p1 = new PriorityQueue(Collections.reverseOrder());
			// Min Heap

			MedianOfRunningArray.p2 = new PriorityQueue();
	}

}

library MedianOfRunningArray_Library
{
	function main(string[] memory args) public
	{
			MedianOfRunningArray p;
			for(int32 i = int32(0); i < 9; i++;)
			{
					p.insert(arr[uint256(i)]);
					System.out.print(p.median() + " ");
			}
	}

}

