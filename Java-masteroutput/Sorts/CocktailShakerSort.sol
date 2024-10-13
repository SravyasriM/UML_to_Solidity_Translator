pragma solidity 0.7.5;

//package Sorts


/**
 * @author Mateus Bizzo (https://github.com/MattBizzo)
 * @author Podshivalov Nikita (https://github.com/nikitap492)
 */

contract CocktailShakerSort is SortAlgorithm
{
	/**
 * Auxiliary method for algorithms what wanted to work with lists from JCF
 *
 * @param unsorted - a list should be sorted
 * @return a sorted list
 */

	function sort(List unsorted) public returns(List)
	{
			return Arrays.asList(sort(unsorted.toArray()));
	}

}

library CocktailShakerSort_Library
{
	// Driver Program

	function main(string[] memory args) public
	{
			CocktailShakerSort shakerSort;
			// Output => 1 4 6 9 12 23 54 78 231

			SortUtils.print(shakerSort.sort(integers));
			SortUtils.print(shakerSort.sort(strings));
	}

}

