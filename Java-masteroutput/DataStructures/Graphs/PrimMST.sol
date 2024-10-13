pragma solidity 0.7.5;

//package DataStructures.Graphs


/**
 * A Java program for Prim's Minimum Spanning Tree (MST) algorithm. adjacency matrix representation
 * of the graph
 */

contract PrimMST
{
	// Number of vertices in the graph

	int32 static  immutable V = int32(5);

}

library PrimMST_Library
{
	function main(string[] memory args) public
	{
			/* Let us create the following graph
       2    3
    (0)--(1)--(2)
    |    / \   |
    6| 8/   \5 |7
    | /      \ |
    (3)-------(4)
         9          */

			PrimMST t;
			// Print the solution

			t.primMST(graph);
	}

}

