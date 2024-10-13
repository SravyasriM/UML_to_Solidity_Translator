pragma solidity 0.7.5;

//package DataStructures.Graphs


import "java/util.sol";

contract BellmanFord
{
	int32 vertex;

	

	int32 private  index = int32(0);

	/**
 * @param p[] Parent array which shows updates in edges
 * @param i Current vertex under consideration
 */

	function printPath(int32[] memory p, int32 i) internal
	{
			if(// Found the path back to parent

p[uint256(i)] == -1;)
			{
				return 			}
			printPath(p, p[uint256(i)]);
			System.out.print(i + " ");
	}

	function go() public
	{
// shows distance to all vertices

						// Grab scanner object for user input

			Scanner sc;
			int32 i;
			System.out.println("Enter no. of vertices and edges please");
			v = sc.nextInt();
			e = sc.nextInt();
			System.out.println("Input edges");
	}

	/**
 * @param x Source Vertex
 * @param y End vertex
 * @param z Weight
 */

	function addEdge(int32 x, int32 y, int32 z) public
	{
	}

}

library BellmanFord_Library
{
	function main(string[] memory args) public
	{
			// Dummy object to call nonstatic variables

			BellmanFord obj;
			obj.go();
	}

}

