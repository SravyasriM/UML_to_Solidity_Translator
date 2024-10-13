pragma solidity 0.7.5;

//package DataStructures.Graphs


import "java/util/ArrayList.sol";

contract AdjacencyListGraph
{
	ArrayList verticies;

	/**
 * this method removes an edge from the graph between two specified verticies
 *
 * @param from the data of the vertex the edge is from
 * @param to the data of the vertex the edge is going to
 * @return returns false if the edge doesn't exist, returns true if the edge exists and is removed
 */

	function removeEdge(E from, E to) public returns(bool)
	{
			Vertex fromV;
			for(uint256 iterator_var = uint256(0); iterator_var < verticies.length; iterator_var++;)
			{
					Vertex v = Vertex(verticies[uint256(iterator_var)]);
					if(from.compareTo(v.data) == 0)
					{
							fromV = v;
							break;
					}
			}
			if(fromV == none)
			{
				return false;			}
			return fromV.removeAdjacentVertex(to);
	}

	/**
 * this method adds an edge to the graph between two specified verticies
 *
 * @param from the data of the vertex the edge is from
 * @param to the data of the vertex the edge is going to
 * @return returns true if the edge did not exist, return false if it already did
 */

	function addEdge(E from, E to) public returns(bool)
	{
			Vertex fromV;
			for(uint256 iterator_var = uint256(0); iterator_var < verticies.length; iterator_var++;)
			{
					Vertex v = Vertex(verticies[uint256(iterator_var)]);
					if(from.compareTo(v.data) == 0)
					{
							// see if from vertex already exists

							fromV = v;
					}
					else
					{
						if(to.compareTo(v.data) == 0)
						{
								// see if to vertex already exists

								toV = v;
						}					}

					// both nodes exist so stop searching

					if(fromV != none && toV != none)
					{
						break;					}
			}
	}

	/**
 * this gives a list of verticies in the graph and their adjacencies
 *
 * @return returns a string describing this graph
 */

	function toString() public returns(String)
	{
	}

}

library AdjacencyListGraph_Library
{
}

contract Graphs
{
}

library Graphs_Library
{
	function main(string[] memory args) public
	{
			AdjacencyListGraph graph = new AdjacencyListGraph(1);
			graph.constructor1();
			System.out.println(graph);
	}

}

