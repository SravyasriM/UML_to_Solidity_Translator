pragma solidity 0.7.5;

//package MinimizingLateness


import "java/io/BufferedReader.sol";

import "java/io/FileReader.sol";

import "java/io/IOException.sol";

import "java/util/StringTokenizer.sol";

contract MinimizingLateness
{
}

library MinimizingLateness_Library
{
	function main(string[] memory args) public
	{
			StringTokenizer token;
			BufferedReader in;
			string memory ch = string(in.readLine());
			if(ch == none || ch.isEmpty())
			{
					in.close();
					return 
			}
			int32 indexCount = int32(Integer.parseInt(ch));
			System.out.println("Input Data : ");
			// number of operations

			System.out.println(indexCount);
			int32 i = int32(0);
			while((ch = in.readLine();) != none)
			{
					;
					// should be completed.

					array[uint256(i)] = new Schedule(Integer.parseInt(token.nextToken()), Integer.parseInt(token.nextToken()));
					i++;
					System.out.println(array[uint256(i - 1)].t + " " + array[uint256(i - 1)].d);

			}
			// Total time worked

			int32 tryTime = int32(0);
			// Lateness

			int32 lateness = int32(0);
			for(int32 j = int32(0); j < indexCount - 1; j++;)
			{
					// Start time of the task

					array[uint256(j)].s = tryTime;
					// Time finished

					array[uint256(j)].f = tryTime + array[uint256(j)].t;
					// Add total work time

					tryTime = tryTime + array[uint256(j)].t;
					// Lateness

					lateness = lateness + Math.max(0, tryTime - array[uint256(j)].d);
			}
			System.out.println();
			System.out.println("Output Data : ");
			System.out.println(lateness);
			in.close();
	}

}

