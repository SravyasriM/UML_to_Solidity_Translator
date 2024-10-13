pragma solidity 0.7.5;

//package Others


import "java/util/ArrayList.sol";

import "java/util/Collections.sol";

import "java/util/List.sol";

import "java/util/Random.sol";

/**
 * Creates a random password from ASCII letters Given password length bounds
 *
 * @author AKS1996
 * @date 2017.10.25
 */

contract PasswordGen
{
	function generatePassword(int32 min_length, int32 max_length) internal returns(String)
	{
			Random random;
			string memory upper = string("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
			string memory lower = string("abcdefghijklmnopqrstuvwxyz");
			string memory numbers = string("0123456789");
			string memory specialChars = string("!@#$%^&*(){}?");
			string memory allChars = string(upper + lower + numbers + specialChars);
			List letters;
			// Inbuilt method to randomly shuffle a elements of a list

			Collections.shuffle(letters);
			StringBuilder password;
			// Note that size of the password is also random

			for(int32 i = int32(); i > 0; --i;)
			{
					password.append(letters.get(random.nextInt(letters.size())));
			}
			return password.toString();
	}

}

library PasswordGen_Library
{
	function main(string[] memory args) public
	{
			string memory password = string(generatePassword(8, 16));
			System.out.print("Password: " + password);
	}

	function generatePassword(int32 min_length, int32 max_length) internal returns(String)
	{
			Random random;
			string memory upper = string("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
			string memory lower = string("abcdefghijklmnopqrstuvwxyz");
			string memory numbers = string("0123456789");
			string memory specialChars = string("!@#$%^&*(){}?");
			string memory allChars = string(upper + lower + numbers + specialChars);
			List letters;
			// Inbuilt method to randomly shuffle a elements of a list

			Collections.shuffle(letters);
			StringBuilder password;
			// Note that size of the password is also random

			for(int32 i = int32(); i > 0; --i;)
			{
					password.append(letters.get(random.nextInt(letters.size())));
			}
			return password.toString();
	}

}

