pragma solidity 0.7.5;

//package A_Star


import "java/util.sol";

contract A_Star
{
	function initializeGraph(Graph graph, ArrayList data) private
	{
			for(int32 i = int32(0); i < data.size(); i += 4;)
			{
					graph.addEdge(new Edge(data.get(i), data.get(i + 1), data.get(i + 2)));
			}
	}

}

library A_Star_Library
{
	function initializeGraph(Graph graph, ArrayList data) private
	{
			for(int32 i = int32(0); i < data.size(); i += 4;)
			{
					graph.addEdge(new Edge(data.get(i), data.get(i + 1), data.get(i + 2)));
			}
	}

	function main(string[] memory args) public
	{
			Graph graph = new Graph(20);
			ArrayList graphData;
			initializeGraph(graph, graphData);
			PathAndDistance solution = PathAndDistance(aStar(3, 1, graph, heuristic));
			solution.printSolution();
	}

	function aStar(int32 from, int32 to, Graph graph, int32[] memory heuristic) public returns(PathAndDistance)
	{
			// given by the heuristic function to reach the destination point from the current point.

			PriorityQueue queue = new PriorityQueue();
			// dummy data to start the algorithm from the beginning point

			queue.add(new PathAndDistance(0, 0));
			bool solutionFound = bool(false);
			PathAndDistance currentData = new PathAndDistance(-1;, none, -1;
			while(!queue.isEmpty(); && !solutionFound;)
			{
					// first in the queue, best node so keep exploring.

					currentData = queue.poll();
					int32 currentPosition = int32(// current node.

currentData.getPath().get(currentData.getPath().size() - 1));

			}
			return (solutionFound) ? currentData : new PathAndDistance(-1, none, -1);
	}

}

