pragma solidity 0.7.5;

//package Others


import "java/util.sol";

contract Dijkstra
{
	

	string static  immutable START = string("a");

	string static  immutable END = string("e");

}

library Dijkstra_Library
{
	/**
 * main function Will run the code with "GRAPH" that was defined above.
 */

	function main(string[] memory args) public
	{
			Graph g;
			g.dijkstra(START);
			g.printPath(END);
	}

}

contract Graph
{
	// mapping of vertex names to Vertex objects, built from a set of Edges

	Map private  immutable graph;

	/**
 * Runs dijkstra using a specified source vertex
 */

	function dijkstra(string startName) public
	{
			if(!graph.containsKey(startName);)
			{
					System.err.printf("Graph doesn't contain start vertex \"%s\"%n", startName);
					return 
			}
			Vertex source = Vertex(graph.get(startName));
			NavigableSet q;
			dijkstra(q);
	}

	/**
 * Implementation of dijkstra's algorithm using a binary heap.
 */

	function dijkstra(NavigableSet q) private
	{
			Vertex u;
			while(!q.isEmpty();)
			{
					// vertex with shortest distance (first iteration will return source)

					u = q.pollFirst();
					if(u.dist == Integer.MAX_VALUE)
					{
						// we can ignore u (and any other remaining vertices) since they are unreachable

						break;					}

			}
	}

	/**
 * Prints a path from the source to the specified vertex
 */

	function printPath(string endName) public
	{
			if(!graph.containsKey(endName);)
			{
					System.err.printf("Graph doesn't contain end vertex \"%s\"%n", endName);
					return 
			}
			graph.get(endName).printPath();
			System.out.println();
	}

	/**
 * Prints the path from the source to every vertex (output order is not guaranteed)
 */

	function printAllPaths() public
	{
	}

	constructor(string name) public
	{
			Vertex.name = name;
	}

}

library Graph_Library
{
}

