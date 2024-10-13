pragma solidity 0.7.5;

//package ciphers


import "java/security/InvalidKeyException.sol";

import "java/security/NoSuchAlgorithmException.sol";

import "javax/crypto/BadPaddingException.sol";

import "javax/crypto/Cipher.sol";

import "javax/crypto/IllegalBlockSizeException.sol";

import "javax/crypto/KeyGenerator.sol";

import "javax/crypto/NoSuchPaddingException.sol";

import "javax/crypto/SecretKey.sol";

/**
 * This example program shows how AES encryption and decryption can be done in Java. Please note
 * that secret key and encrypted text is unreadable binary and hence in the following program we
 * display it in hexadecimal format of the underlying bytes.
 */

contract AESEncryption
{
	/**
 * gets the AES encryption key. In your actual programs, this should be safely stored.
 *
 * @return secKey (Secret key that we encrypt using it)
 * @throws NoSuchAlgorithmException (from KeyGenrator)
 */

	function getSecretEncryptionKey() public returns(SecretKey)
	{
			KeyGenerator aesKeyGenerator = KeyGenerator(KeyGenerator.getInstance("AES"));
			// The AES key size in number of bits

			aesKeyGenerator.init(128);
			SecretKey secKey = SecretKey(aesKeyGenerator.generateKey());
			return secKey;
	}

	/**
 * Encrypts plainText in AES using the secret key
 *
 * @param plainText
 * @param secKey
 * @return byteCipherText (The encrypted text)
 * @throws NoSuchPaddingException (from Cipher)
 * @throws NoSuchAlgorithmException (from Cipher)
 * @throws InvalidKeyException (from Cipher)
 * @throws BadPaddingException (from Cipher)
 * @throws IllegalBlockSizeException (from Cipher)
 */

	function encryptText(string plainText, SecretKey secKey) public returns(

}

library AESEncryption_Library
{
	/**
 * 1. Generate a plain text for encryption 2. Get a secret key (printed in hexadecimal form). In
 * actual use this must by encrypted and kept safe. The same key is required for decryption.
 */

	function main(string[] memory args) public
	{
			string memory plainText = string("Hello World");
			SecretKey secKey = SecretKey(getSecretEncryptionKey());
			string memory decryptedText = string(decryptText(cipherText, secKey));
			System.out.println("Original Text:" + plainText);
			System.out.println("AES Key (Hex Form):" + bytesToHex(secKey.getEncoded()));
			System.out.println("Encrypted Text (Hex Form):" + bytesToHex(cipherText));
			System.out.println("Descrypted Text:" + decryptedText);
	}

	/**
 * gets the AES encryption key. In your actual programs, this should be safely stored.
 *
 * @return secKey (Secret key that we encrypt using it)
 * @throws NoSuchAlgorithmException (from KeyGenrator)
 */

	function getSecretEncryptionKey() public returns(SecretKey)
	{
			KeyGenerator aesKeyGenerator = KeyGenerator(KeyGenerator.getInstance("AES"));
			// The AES key size in number of bits

			aesKeyGenerator.init(128);
			SecretKey secKey = SecretKey(aesKeyGenerator.generateKey());
			return secKey;
	}

	/**
 * Encrypts plainText in AES using the secret key
 *
 * @param plainText
 * @param secKey
 * @return byteCipherText (The encrypted text)
 * @throws NoSuchPaddingException (from Cipher)
 * @throws NoSuchAlgorithmException (from Cipher)
 * @throws InvalidKeyException (from Cipher)
 * @throws BadPaddingException (from Cipher)
 * @throws IllegalBlockSizeException (from Cipher)
 */

	function encryptText(string plainText, SecretKey secKey) public returns(

	/**
 * Decrypts encrypted byte array using the key used for encryption.
 *
 * @param byteCipherText
 * @param secKey
 * @return plainText
 * @throws NoSuchPaddingException
 * @throws NoSuchAlgorithmException
 * @throws InvalidKeyException
 * @throws BadPaddingException
 * @throws IllegalBlockSizeException
 */

	function decryptText(int8[] memory byteCipherText, SecretKey secKey) public returns(String)
	{
			// AES defaults to AES/ECB/PKCS5Padding in Java 7

			Cipher aesCipher = Cipher(Cipher.getInstance("AES"));
			aesCipher.init(Cipher.DECRYPT_MODE, secKey);
			return 
	}

	/**
 * Convert a binary byte array into readable hex form Old library is deprecated on OpenJdk 11 and
 * this is faster regarding other solution is using StringBuilder Credit {@link
 * https://stackoverflow.com/questions/9655181/how-to-convert-a-byte-array-to-a-hex-string-in-java/9855338#9855338}
 *
 * @param hash (in binary)
 * @return hexHash
 */

	function bytesToHex(int8[] memory bytes) public returns(String)
	{
			for(int32 j = int32(0); j < bytes.length; j++;)
			{
					int32 v = int32(bytes[uint256(j)] & 0xFF);
					hexChars[uint256(j * 2)] = HEX_ARRAY[uint256(v >>> 4)];
					hexChars[uint256(j * 2 + 1)] = HEX_ARRAY[uint256(v & 0x0F)];
			}
			return 
	}

}

