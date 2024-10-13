pragma solidity 0.7.5;

//package Others


import "java/util/Scanner.sol";

contract TowerOfHanoi
{
	function shift(int32 n, string startPole, string intermediatePole, string endPole) public
	{
			// if n becomes zero the program returns thus ending the loop.

			if(n != 0)
			{
					// intermediatePole

					shift(n - 1, startPole, endPole, intermediatePole);
					// Result Printing

					System.out.format("Move %d from %s to %s\n", n, startPole, endPole);
					// to the endPole

					shift(n - 1, intermediatePole, startPole, endPole);
			}
	}

}

library TowerOfHanoi_Library
{
	function shift(int32 n, string startPole, string intermediatePole, string endPole) public
	{
			// if n becomes zero the program returns thus ending the loop.

			if(n != 0)
			{
					// intermediatePole

					shift(n - 1, startPole, endPole, intermediatePole);
					// Result Printing

					System.out.format("Move %d from %s to %s\n", n, startPole, endPole);
					// to the endPole

					shift(n - 1, intermediatePole, startPole, endPole);
			}
	}

	function main(string[] memory args) public
	{
			System.out.print("Enter number of discs on Pole 1: ");
			Scanner scanner;
			// input of number of discs on pole 1

			int32 numberOfDiscs = int32(scanner.nextInt());
			// Shift function called

			shift(numberOfDiscs, "Pole1", "Pole2", "Pole3");
			scanner.close();
	}

}

