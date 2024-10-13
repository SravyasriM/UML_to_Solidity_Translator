pragma solidity 0.7.5;

//package DataStructures.Graphs


import "java/util/Scanner.sol";

contract FloydWarshall
{
	

	// number of vertices in the graph

	int32 private  numberofvertices;

	int32 static  immutable INFINITY = int32(999);

	function main(string arg) public
	{
			Scanner scan;
			System.out.println("Enter the number of vertices");
			int32 numberOfVertices = int32(scan.nextInt());
			System.out.println("Enter the Weighted Matrix for the graph");
			for(int32 source = int32(1); source <= numberOfVertices; source++;)
			{
					for(int32 destination = int32(1); destination <= numberOfVertices; destination++;)
					{
							adjacencyMatrix[uint256(source)][uint256(destination)] = scan.nextInt();
							if(source == destination)
							{
									adjacencyMatrix[uint256(source)][uint256(destination)] = 0;
									continue;
							}
							if(adjacencyMatrix[uint256(source)][uint256(destination)] == 0)
							{
									adjacencyMatrix[uint256(source)][uint256(destination)] = INFINITY;
							}
					}
			}
			System.out.println("The Transitive Closure of the Graph");
			FloydWarshall floydwarshall;
			floydwarshall.floydwarshall(adjacencyMatrix);
			scan.close();
	}

	constructor(int32 numberofvertices) public
	{
			DistanceMatrix = new int32[](numberofvertices + 1);
			// The matrix is initialized with 0's by default

			FloydWarshall.numberofvertices = numberofvertices;
	}

}

library FloydWarshall_Library
{
	function main(string arg) public
	{
			Scanner scan;
			System.out.println("Enter the number of vertices");
			int32 numberOfVertices = int32(scan.nextInt());
			System.out.println("Enter the Weighted Matrix for the graph");
			for(int32 source = int32(1); source <= numberOfVertices; source++;)
			{
					for(int32 destination = int32(1); destination <= numberOfVertices; destination++;)
					{
							adjacencyMatrix[uint256(source)][uint256(destination)] = scan.nextInt();
							if(source == destination)
							{
									adjacencyMatrix[uint256(source)][uint256(destination)] = 0;
									continue;
							}
							if(adjacencyMatrix[uint256(source)][uint256(destination)] == 0)
							{
									adjacencyMatrix[uint256(source)][uint256(destination)] = INFINITY;
							}
					}
			}
			System.out.println("The Transitive Closure of the Graph");
			FloydWarshall floydwarshall;
			floydwarshall.floydwarshall(adjacencyMatrix);
			scan.close();
	}

}

