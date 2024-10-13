pragma solidity 0.7.5;

//package ciphers


/**
 * A Java implementation of Vigenere Cipher.
 *
 * @author straiffix
 */

contract Vigenere
{
	function encrypt(string message, string key) public returns(String)
	{
			string memory result = string("");
			for(int32 i = int32(0); i < message.length(); i++;)
			{
					byte c = byte(message.charAt(i));
					if(Character.isLetter(c))
					{
							if(Character.isUpperCase(c))
							{
									result += byte(((c + key.toUpperCase().charAt(j) - 2 * "A") % 26 + "A"));
							}
							else
							{
									result += byte(((c + key.toLowerCase().charAt(j) - 2 * "a") % 26 + "a"));
							}

					}
					else
					{
							result += c;
					}

					j = ++j; % key.length()
			}
			return result;
	}

	function decrypt(string message, string key) public returns(String)
	{
			string memory result = string("");
			for(int32 i = int32(0); i < message.length(); i++;)
			{
					byte c = byte(message.charAt(i));
					if(Character.isLetter(c))
					{
							if(Character.isUpperCase(c))
							{
									result += (byte(("Z" - (25 - (c - key.toUpperCase().charAt(j))) % 26)));
							}
							else
							{
									result += (byte(("z" - (25 - (c - key.toLowerCase().charAt(j))) % 26)));
							}

					}
					else
					{
							result += c;
					}

					j = ++j; % key.length()
			}
			return result;
	}

}

library Vigenere_Library
{
	function encrypt(string message, string key) public returns(String)
	{
			string memory result = string("");
			for(int32 i = int32(0); i < message.length(); i++;)
			{
					byte c = byte(message.charAt(i));
					if(Character.isLetter(c))
					{
							if(Character.isUpperCase(c))
							{
									result += byte(((c + key.toUpperCase().charAt(j) - 2 * "A") % 26 + "A"));
							}
							else
							{
									result += byte(((c + key.toLowerCase().charAt(j) - 2 * "a") % 26 + "a"));
							}

					}
					else
					{
							result += c;
					}

					j = ++j; % key.length()
			}
			return result;
	}

	function decrypt(string message, string key) public returns(String)
	{
			string memory result = string("");
			for(int32 i = int32(0); i < message.length(); i++;)
			{
					byte c = byte(message.charAt(i));
					if(Character.isLetter(c))
					{
							if(Character.isUpperCase(c))
							{
									result += (byte(("Z" - (25 - (c - key.toUpperCase().charAt(j))) % 26)));
							}
							else
							{
									result += (byte(("z" - (25 - (c - key.toLowerCase().charAt(j))) % 26)));
							}

					}
					else
					{
							result += c;
					}

					j = ++j; % key.length()
			}
			return result;
	}

	function main(string[] memory args) public
	{
			string memory text = string("Hello World!");
			string memory key = string("itsakey");
			System.out.println(text);
			string memory ciphertext = string(encrypt(text, key));
			System.out.println(ciphertext);
			System.out.println(decrypt(ciphertext, key));
	}

}

