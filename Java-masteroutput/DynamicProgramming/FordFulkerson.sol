pragma solidity 0.7.5;

//package DynamicProgramming


import "java/util/LinkedList.sol";

import "java/util/Queue.sol";

import "java/util/Vector.sol";

contract FordFulkerson
{
	int32 static  immutable INF = int32(987654321);

	// edges

	int32 static  V;

	

	function networkFlow(int32 source, int32 sink) private returns(int32)
	{
			flow = new int32[](V);
			int32 totalFlow = int32(0);
			while(true)
			{
					Vector parent;
					for(int32 i = int32(0); i < V; i++;)
					{
						parent.add(-1;)					}
					Queue q = new LinkedList(2);
					q.constructor2();
					parent.set(source, source);
					q.add(source);
					while(!q.isEmpty(); && parent.get(sink) == -1;)
					{
							int32 here = int32(q.peek());
							q.poll();
							for(int32 there = int32(0); there < V; ++there;)
							{
								if(capacity[uint256(here)][uint256(there)] - flow[uint256(here)][uint256(there)] > 0 && parent.get(there) == -1;)
								{
										q.add(there);
										parent.set(there, here);
								}							}

					}
					if(parent.get(sink) == -1;)
					{
						break;					}
					int32 amount = int32(INF);
					string memory printer = string("path : ");
					StringBuilder sb;
					for(int32 p = int32(sink); p != source; p = parent.get(p);)
					{
							amount = Math.min(capacity[uint256(parent.get(p))][uint256(p)] - flow[uint256(parent.get(p))][uint256(p)], amount);
							sb.append(p + "-");
					}
					sb.append(source);
					for(int32 p = int32(sink); p != source; p = parent.get(p);)
					{
							flow[uint256(parent.get(p))][uint256(p)] += amount;
							flow[uint256(p)][uint256(parent.get(p))] -= amount;
					}
					totalFlow += amount;
					printer += sb.reverse() + " / max flow : " + totalFlow;
					System.out.println(printer);

			}
			return totalFlow;
	}

}

library FordFulkerson_Library
{
	function main(string[] memory args) public
	{
			System.out.println("V : 6");
			V = 6;
			capacity = new int32[](V);
			capacity[uint256(0)][uint256(1)] = 12;
			capacity[uint256(0)][uint256(3)] = 13;
			capacity[uint256(1)][uint256(2)] = 10;
			capacity[uint256(2)][uint256(3)] = 13;
			capacity[uint256(2)][uint256(4)] = 3;
			capacity[uint256(2)][uint256(5)] = 15;
			capacity[uint256(3)][uint256(2)] = 7;
			capacity[uint256(3)][uint256(4)] = 15;
			capacity[uint256(4)][uint256(5)] = 17;
			System.out.println("Max capacity in networkFlow : " + networkFlow(0, 5));
	}

	function networkFlow(int32 source, int32 sink) private returns(int32)
	{
			flow = new int32[](V);
			int32 totalFlow = int32(0);
			while(true)
			{
					Vector parent;
					for(int32 i = int32(0); i < V; i++;)
					{
						parent.add(-1;)					}
					Queue q = new LinkedList(2);
					q.constructor2();
					parent.set(source, source);
					q.add(source);
					while(!q.isEmpty(); && parent.get(sink) == -1;)
					{
							int32 here = int32(q.peek());
							q.poll();
							for(int32 there = int32(0); there < V; ++there;)
							{
								if(capacity[uint256(here)][uint256(there)] - flow[uint256(here)][uint256(there)] > 0 && parent.get(there) == -1;)
								{
										q.add(there);
										parent.set(there, here);
								}							}

					}
					if(parent.get(sink) == -1;)
					{
						break;					}
					int32 amount = int32(INF);
					string memory printer = string("path : ");
					StringBuilder sb;
					for(int32 p = int32(sink); p != source; p = parent.get(p);)
					{
							amount = Math.min(capacity[uint256(parent.get(p))][uint256(p)] - flow[uint256(parent.get(p))][uint256(p)], amount);
							sb.append(p + "-");
					}
					sb.append(source);
					for(int32 p = int32(sink); p != source; p = parent.get(p);)
					{
							flow[uint256(parent.get(p))][uint256(p)] += amount;
							flow[uint256(p)][uint256(parent.get(p))] -= amount;
					}
					totalFlow += amount;
					printer += sb.reverse() + " / max flow : " + totalFlow;
					System.out.println(printer);

			}
			return totalFlow;
	}

}

