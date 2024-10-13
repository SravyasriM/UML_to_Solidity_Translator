pragma solidity 0.7.5;

//package DataStructures.Graphs


import "java/util/ArrayList.sol";

import "java/util/HashSet.sol";

import "java/util/Set.sol";

/**
 * A class that counts the number of different connected components in a graph
 *
 * @author Lukas Keul, Florian Mercks
 */

contract Graph
{
	ArrayList edgeList;

	ArrayList nodeList;

	/**
 * Adds a new Edge to the graph. If the nodes aren't yet in nodeList, they will be added to it.
 *
 * @param startNode the starting Node from the edge
 * @param endNode the ending Node from the edge
 */

	function addEdge(E startNode, E endNode) public
	{
			Node start;
			for(uint256 iterator_var = uint256(0); iterator_var < nodeList.length; iterator_var++;)
			{
					Node node = Node(nodeList[uint256(iterator_var)]);
					if(startNode.compareTo(node.name) == 0)
					{
							start = node;
					}
					else
					{
						if(endNode.compareTo(node.name) == 0)
						{
								end = node;
						}					}

			}
			if(start == none)
			{
					start = new Node(startNode);
					nodeList.add(start);
			}
			if(end == none)
			{
					end = new Node(endNode);
					nodeList.add(end);
			}
			edgeList.add(new Edge(start, end));
	}

	/**
 * Main method used for counting the connected components. Iterates through the array of nodes to
 * do a depth first search to get all nodes of the graph from the actual node. These nodes are
 * added to the array markedNodes and will be ignored if they are chosen in the nodeList.
 *
 * @return returns the amount of unconnected graphs
 */

	function countGraphs() public returns(int32)
	{
			int32 count = int32(0);
			Set markedNodes;
			for(uint256 iterator_var = uint256(0); iterator_var < nodeList.length; iterator_var++;)
			{
					Node n = Node(nodeList[uint256(iterator_var)]);
					if(!markedNodes.contains(n);)
					{
							markedNodes.add(n);
							count++;
					}
			}
			return count;
	}

	/**
 * Implementation of depth first search.
 *
 * @param n the actual visiting node
 * @param visited A list of already visited nodes in the depth first search
 * @return returns a set of visited nodes
 */

	function depthFirstSearch(Node n, ArrayList visited) public returns(ArrayList)
	{
			visited.add(n);
			for(uint256 iterator_var = uint256(0); iterator_var < edgeList.length; iterator_var++;)
			{
					Edge e = Edge(edgeList[uint256(iterator_var)]);
					if(e.startNode.equals(n) && !visited.contains(e.endNode);)
					{
							depthFirstSearch(e.endNode, visited);
					}
			}
			return visited;
	}

	constructor() public
	{
			;
			;
	}

}

library Graph_Library
{
}

contract ConnectedComponent
{
}

library ConnectedComponent_Library
{
	function main(string[] memory args) public
	{
			Graph graphChars = new Graph();
			// Graph 1

			graphChars.addEdge("a", "b");
			graphChars.addEdge("a", "e");
			graphChars.addEdge("b", "e");
			graphChars.addEdge("b", "c");
			graphChars.addEdge("c", "d");
			graphChars.addEdge("d", "a");
			graphChars.addEdge("x", "y");
			graphChars.addEdge("x", "z");
			graphChars.addEdge("w", "w");
			Graph graphInts = new Graph();
			// Graph 2

			graphInts.addEdge(1, 2);
			graphInts.addEdge(2, 3);
			graphInts.addEdge(2, 4);
			graphInts.addEdge(3, 5);
			graphInts.addEdge(7, 8);
			graphInts.addEdge(8, 10);
			graphInts.addEdge(10, 8);
			System.out.println("Amount of different char-graphs: " + graphChars.countGraphs());
			System.out.println("Amount of different int-graphs: " + graphInts.countGraphs());
	}

}

