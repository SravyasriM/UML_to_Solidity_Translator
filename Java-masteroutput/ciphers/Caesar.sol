pragma solidity 0.7.5;

//package ciphers


import "java/util/Scanner.sol";

/**
 * A Java implementation of Caesar Cipher. /It is a type of substitution cipher in which each letter
 * in the plaintext is replaced by a letter some fixed number of positions down the alphabet. /
 *
 * @author FAHRI YARDIMCI
 * @author khalil2535
 */

contract Caesar
{
	/**
 * Encrypt text by shifting every Latin char by add number shift for ASCII Example : A + 1 -> B
 *
 * @param message
 * @param shift
 * @return Encrypted message
 */

	function encode(string message, int32 shift) public returns(String)
	{
			string memory encoded = string("");
			shift %= 26;
			int32 length = int32(message.length());
			for(int32 i = int32(0); i < length; i++;)
			{
					// Java law : char + int = char

					byte current = byte(message.charAt(i));
					if(IsCapitalLatinLetter(current))
					{
							current += shift;
							// 26 = number of latin letters

							encoded += byte((current > "Z" ? current - 26 : current));
					}
					else
					{
						if(IsSmallLatinLetter(current))
						{
								current += shift;
								// 26 = number of latin letters

								encoded += byte((current > "z" ? current - 26 : current));
						}
						else
						{
								encoded += current;
						}
					}

			}
			return encoded;
	}

	/**
 * Decrypt message by shifting back every Latin char to previous the ASCII Example : B - 1 -> A
 *
 * @param encryptedMessage
 * @param shift
 * @return message
 */

	function decode(string encryptedMessage, int32 shift) public returns(String)
	{
			string memory decoded = string("");
			shift %= 26;
			int32 length = int32(encryptedMessage.length());
			for(int32 i = int32(0); i < length; i++;)
			{
					byte current = byte(encryptedMessage.charAt(i));
					if(IsCapitalLatinLetter(current))
					{
							current -= shift;
							// 26 = number of latin letters

							decoded += byte((current < "A" ? current + 26 : current));
					}
					else
					{
						if(IsSmallLatinLetter(current))
						{
								current -= shift;
								// 26 = number of latin letters

								decoded += byte((current < "a" ? current + 26 : current));
						}
						else
						{
								decoded += current;
						}
					}

			}
			return decoded;
	}

	/**
 * @param c
 * @return true if character is capital Latin letter or false for others
 */

	function IsCapitalLatinLetter(byte c) private returns(bool)
	{
			return c >= "A" && c <= "Z";
	}

	/**
 * @param c
 * @return true if character is small Latin letter or false for others
 */

	function IsSmallLatinLetter(byte c) private returns(bool)
	{
			return c >= "a" && c <= "z";
	}

}

library Caesar_Library
{
	/**
 * Encrypt text by shifting every Latin char by add number shift for ASCII Example : A + 1 -> B
 *
 * @param message
 * @param shift
 * @return Encrypted message
 */

	function encode(string message, int32 shift) public returns(String)
	{
			string memory encoded = string("");
			shift %= 26;
			int32 length = int32(message.length());
			for(int32 i = int32(0); i < length; i++;)
			{
					// Java law : char + int = char

					byte current = byte(message.charAt(i));
					if(IsCapitalLatinLetter(current))
					{
							current += shift;
							// 26 = number of latin letters

							encoded += byte((current > "Z" ? current - 26 : current));
					}
					else
					{
						if(IsSmallLatinLetter(current))
						{
								current += shift;
								// 26 = number of latin letters

								encoded += byte((current > "z" ? current - 26 : current));
						}
						else
						{
								encoded += current;
						}
					}

			}
			return encoded;
	}

	/**
 * Decrypt message by shifting back every Latin char to previous the ASCII Example : B - 1 -> A
 *
 * @param encryptedMessage
 * @param shift
 * @return message
 */

	function decode(string encryptedMessage, int32 shift) public returns(String)
	{
			string memory decoded = string("");
			shift %= 26;
			int32 length = int32(encryptedMessage.length());
			for(int32 i = int32(0); i < length; i++;)
			{
					byte current = byte(encryptedMessage.charAt(i));
					if(IsCapitalLatinLetter(current))
					{
							current -= shift;
							// 26 = number of latin letters

							decoded += byte((current < "A" ? current + 26 : current));
					}
					else
					{
						if(IsSmallLatinLetter(current))
						{
								current -= shift;
								// 26 = number of latin letters

								decoded += byte((current < "a" ? current + 26 : current));
						}
						else
						{
								decoded += current;
						}
					}

			}
			return decoded;
	}

	/**
 * @param c
 * @return true if character is capital Latin letter or false for others
 */

	function IsCapitalLatinLetter(byte c) private returns(bool)
	{
			return c >= "A" && c <= "Z";
	}

	/**
 * @param c
 * @return true if character is small Latin letter or false for others
 */

	function IsSmallLatinLetter(byte c) private returns(bool)
	{
			return c >= "a" && c <= "z";
	}

	function main(string[] memory args) public
	{
			Scanner input;
			System.out.println("Please enter the message (Latin Alphabet)");
			string memory message = string(input.nextLine());
			System.out.println(message);
			System.out.println("Please enter the shift number");
			int32 shift = int32(input.nextInt() % 26);
			System.out.println("(E)ncode or (D)ecode ?");
			byte choice = byte(input.next().charAt(0));
			do
			{
					bool void = bool(false);
					if(void || (choice == keccak256(abi.encode("E"))))
					{
							void = true;
					}
					if(void || (choice == keccak256(abi.encode("e"))))
					{
							void = true;
							System.out.println(// send our function to handle

"ENCODED MESSAGE IS \n" + encode(message, shift));
							break;
					}
					if(void || (choice == keccak256(abi.encode("D"))))
					{
							void = true;
					}
					if(void || (choice == keccak256(abi.encode("d"))))
					{
							void = true;
							System.out.println("DECODED MESSAGE IS \n" + decode(message, shift));
					}
						System.out.println("default case");


			}while(false);
			input.close();
	}

}

