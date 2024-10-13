pragma solidity 0.7.5;

//package ciphers


import "java/util.sol";

/**
 * The simple substitution cipher is a cipher that has been in use for many hundreds of years (an
 * excellent history is given in Simon Singhs 'the Code Book'). It basically consists of
 * substituting every plaintext character for a different ciphertext character. It differs from the
 * Caesar cipher in that the cipher alphabet is not simply the alphabet shifted, it is completely
 * jumbled.
 *
 * @author Hassan Elseoudy
 */

contract SimpleSubstitutionCipher
{
	/**
 * Encrypt text by replacing each element with its opposite character.
 *
 * @param message
 * @param cipherSmall
 * @return Encrypted message
 */

	function encode(string message, string cipherSmall) public returns(String)
	{
			string memory encoded = string("");
			// This map is used to encode

			Map cipherMap = new HashMap();
			byte beginSmallLetter = byte("a");
			byte beginCapitalLetter = byte("A");
			cipherSmall = cipherSmall.toLowerCase();
			string memory cipherCapital = string(cipherSmall.toUpperCase());
			// To handle Small and Capital letters

			for(int32 i = int32(0); i < cipherSmall.length(); i++;)
			{
					cipherMap.put(beginSmallLetter++;, cipherSmall.charAt(i))
					cipherMap.put(beginCapitalLetter++;, cipherCapital.charAt(i))
			}
			for(int32 i = int32(0); i < message.length(); i++;)
			{
					if(Character.isAlphabetic(message.charAt(i)))
					{
						encoded += cipherMap.get(message.charAt(i));					}
					else
					{
						encoded += message.charAt(i);					}

			}
			return encoded;
	}

	/**
 * Decrypt message by replacing each element with its opposite character in cipher.
 *
 * @param encryptedMessage
 * @param cipherSmall
 * @return message
 */

	function decode(string encryptedMessage, string cipherSmall) public returns(String)
	{
			string memory decoded = string("");
			Map cipherMap = new HashMap();
			byte beginSmallLetter = byte("a");
			byte beginCapitalLetter = byte("A");
			cipherSmall = cipherSmall.toLowerCase();
			string memory cipherCapital = string(cipherSmall.toUpperCase());
			for(int32 i = int32(0); i < cipherSmall.length(); i++;)
			{
					cipherMap.put(cipherSmall.charAt(i), beginSmallLetter++;)
					cipherMap.put(cipherCapital.charAt(i), beginCapitalLetter++;)
			}
			for(int32 i = int32(0); i < encryptedMessage.length(); i++;)
			{
					if(Character.isAlphabetic(encryptedMessage.charAt(i)))
					{
						decoded += cipherMap.get(encryptedMessage.charAt(i));					}
					else
					{
						decoded += encryptedMessage.charAt(i);					}

			}
			return decoded;
	}

}

library SimpleSubstitutionCipher_Library
{
	/**
 * Encrypt text by replacing each element with its opposite character.
 *
 * @param message
 * @param cipherSmall
 * @return Encrypted message
 */

	function encode(string message, string cipherSmall) public returns(String)
	{
			string memory encoded = string("");
			// This map is used to encode

			Map cipherMap = new HashMap();
			byte beginSmallLetter = byte("a");
			byte beginCapitalLetter = byte("A");
			cipherSmall = cipherSmall.toLowerCase();
			string memory cipherCapital = string(cipherSmall.toUpperCase());
			// To handle Small and Capital letters

			for(int32 i = int32(0); i < cipherSmall.length(); i++;)
			{
					cipherMap.put(beginSmallLetter++;, cipherSmall.charAt(i))
					cipherMap.put(beginCapitalLetter++;, cipherCapital.charAt(i))
			}
			for(int32 i = int32(0); i < message.length(); i++;)
			{
					if(Character.isAlphabetic(message.charAt(i)))
					{
						encoded += cipherMap.get(message.charAt(i));					}
					else
					{
						encoded += message.charAt(i);					}

			}
			return encoded;
	}

	/**
 * Decrypt message by replacing each element with its opposite character in cipher.
 *
 * @param encryptedMessage
 * @param cipherSmall
 * @return message
 */

	function decode(string encryptedMessage, string cipherSmall) public returns(String)
	{
			string memory decoded = string("");
			Map cipherMap = new HashMap();
			byte beginSmallLetter = byte("a");
			byte beginCapitalLetter = byte("A");
			cipherSmall = cipherSmall.toLowerCase();
			string memory cipherCapital = string(cipherSmall.toUpperCase());
			for(int32 i = int32(0); i < cipherSmall.length(); i++;)
			{
					cipherMap.put(cipherSmall.charAt(i), beginSmallLetter++;)
					cipherMap.put(cipherCapital.charAt(i), beginCapitalLetter++;)
			}
			for(int32 i = int32(0); i < encryptedMessage.length(); i++;)
			{
					if(Character.isAlphabetic(encryptedMessage.charAt(i)))
					{
						decoded += cipherMap.get(encryptedMessage.charAt(i));					}
					else
					{
						decoded += encryptedMessage.charAt(i);					}

			}
			return decoded;
	}

	/**
 * TODO remove main and make JUnit Testing
 */

	function main(string[] memory args) public
	{
			string memory a = string(encode("defend the east wall of the castle", "phqgiumeaylnofdxjkrcvstzwb"));
			string memory b = string(decode(a, "phqgiumeaylnofdxjkrcvstzwb"));
			System.out.println(b);
	}

}

