pragma solidity 0.7.5;

//package DataStructures.Graphs


contract MatrixGraphs
{
}

library MatrixGraphs_Library
{
	function main(string[] memory args) public
	{
			AdjacencyMatrixGraph graph;
			graph.addEdge(1, 2);
			graph.addEdge(1, 5);
			graph.addEdge(2, 5);
			graph.addEdge(1, 2);
			graph.addEdge(2, 3);
			graph.addEdge(3, 4);
			graph.addEdge(4, 1);
			graph.addEdge(2, 3);
			System.out.println(graph);
	}

}

contract AdjacencyMatrixGraph
{
	int32 private  _numberOfVertices;

	int32 private  _numberOfEdges;

	

	int32 static  immutable EDGE_EXIST = int32(1);

	int32 static  immutable EDGE_NONE = int32(0);

	function setNumberOfVertices(int32 newNumberOfVertices) private
	{
			AdjacencyMatrixGraph._numberOfVertices = newNumberOfVertices;
	}

	function numberOfVertices() public returns(int32)
	{
			return AdjacencyMatrixGraph._numberOfVertices;
	}

	function setNumberOfEdges(int32 newNumberOfEdges) private
	{
			AdjacencyMatrixGraph._numberOfEdges = newNumberOfEdges;
	}

	function numberOfEdges() public returns(int32)
	{
			return AdjacencyMatrixGraph._numberOfEdges;
	}

	function adjacencyOfEdgeDoesExist(int32 from, int32 to) private returns(bool)
	{
			return (this.adjacency()[uint256(from)][uint256(to)] != AdjacencyMatrixGraph.EDGE_NONE);
	}

	function vertexDoesExist(int32 aVertex) public returns(bool)
	{
			if(aVertex >= 0 && aVertex < this.numberOfVertices())
			{
					return true;
			}
			else
			{
					return false;
			}

	}

	function edgeDoesExist(int32 from, int32 to) public returns(bool)
	{
			if(this.vertexDoesExist(from) && this.vertexDoesExist(to))
			{
					return (this.adjacencyOfEdgeDoesExist(from, to));
			}
			return false;
	}

	/**
 * This method adds an edge to the graph between two specified vertices
 *
 * @param from the data of the vertex the edge is from
 * @param to the data of the vertex the edge is going to
 * @return returns true if the edge did not exist, return false if it already did
 */

	function addEdge(int32 from, int32 to) public returns(bool)
	{
			if(this.vertexDoesExist(from) && this.vertexDoesExist(to))
			{
					if(!this.adjacencyOfEdgeDoesExist(from, to);)
					{
							this.adjacency()[uint256(from)][uint256(to)] = AdjacencyMatrixGraph.EDGE_EXIST;
							this.adjacency()[uint256(to)][uint256(from)] = AdjacencyMatrixGraph.EDGE_EXIST;
							this.setNumberOfEdges(this.numberOfEdges() + 1);
							return true;
					}
			}
			return false;
	}

	/**
 * this method removes an edge from the graph between two specified vertices
 *
 * @param from the data of the vertex the edge is from
 * @param to the data of the vertex the edge is going to
 * @return returns false if the edge doesn't exist, returns true if the edge exists and is removed
 */

	function removeEdge(int32 from, int32 to) public returns(bool)
	{
			if(!this.vertexDoesExist(from); || !this.vertexDoesExist(to);)
			{
					if(this.adjacencyOfEdgeDoesExist(from, to))
					{
							this.adjacency()[uint256(from)][uint256(to)] = AdjacencyMatrixGraph.EDGE_NONE;
							this.adjacency()[uint256(to)][uint256(from)] = AdjacencyMatrixGraph.EDGE_NONE;
							this.setNumberOfEdges(this.numberOfEdges() - 1);
							return true;
					}
			}
			return false;
	}

	/**
 * this gives a list of vertices in the graph and their adjacencies
 *
 * @return returns a string describing this graph
 */

	function toString() public returns(String)
	{
			string memory s = string("    ");
			for(int32 i = int32(0); i < this.numberOfVertices(); i++;)
			{
					s = s + String.valueOf(i) + " ";
			}
			s = s + " \n";
			for(int32 i = int32(0); i < this.numberOfVertices(); i++;)
			{
					s = s + String.valueOf(i) + " : ";
					for(int32 j = int32(0); j < this.numberOfVertices(); j++;)
					{
							s = s + String.valueOf(AdjacencyMatrixGraph._adjacency[uint256(i)][uint256(j)]) + " ";
					}
					s = s + "\n";
			}
			return s;
	}

	constructor(int32 givenNumberOfVertices) public
	{
			this.setNumberOfVertices(givenNumberOfVertices);
			this.setNumberOfEdges(0);
			this.setAdjacency(new int32[](givenNumberOfVertices));
			for(int32 i = int32(0); i < givenNumberOfVertices; i++;)
			{
					for(int32 j = int32(0); j < givenNumberOfVertices; j++;)
					{
							this.adjacency()[uint256(i)][uint256(j)] = AdjacencyMatrixGraph.EDGE_NONE;
					}
			}
	}

}

library AdjacencyMatrixGraph_Library
{
}

