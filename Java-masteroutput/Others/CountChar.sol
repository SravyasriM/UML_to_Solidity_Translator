pragma solidity 0.7.5;

//package Others


import "java/util/Scanner.sol";

contract CountChar
{
	/**
 * Count non space character in string
 *
 * @param str String to count the characters
 * @return number of character in the specified string
 */

	function CountCharacters(string str) private returns(int32)
	{
			return str.replaceAll("\\s", "").length();
	}

}

library CountChar_Library
{
	function main(string[] memory args) public
	{
			Scanner input;
			System.out.print("Enter your text: ");
			string memory str = string(input.nextLine());
			input.close();
			System.out.println("There are " + CountCharacters(str) + " characters.");
	}

	/**
 * Count non space character in string
 *
 * @param str String to count the characters
 * @return number of character in the specified string
 */

	function CountCharacters(string str) private returns(int32)
	{
			return str.replaceAll("\\s", "").length();
	}

}

