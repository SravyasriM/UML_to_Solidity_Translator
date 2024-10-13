pragma solidity 0.7.5;

//package Others


import "java/io.sol";

import "java/util.sol";

contract TopKWords
{
}

library TopKWords_Library
{
	function main(string[] memory args) public
	{
			// you can replace the filePath with yours

			CountWords cw = new CountWords("/Users/lisanaaa/Desktop/words.txt");
			Map dictionary = Map(// get the words dictionary: {word: frequency}

cw.getDictionary());
			// we change the map to list for convenient sort

			List list;
			Scanner input;
			int32 k = int32(input.nextInt());
			while(k > list.size())
			{
					System.out.println("Retype a number, your number is too large");
					;
					k = input.nextInt();

			}
			for(int32 i = int32(0); i < k; i++;)
			{
					System.out.println(list.get(list.size() - i - 1));
			}
			input.close();
	}

}

/*Optional.empty*/


