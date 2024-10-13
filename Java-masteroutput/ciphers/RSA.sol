pragma solidity 0.7.5;

//package ciphers


import "java/math/BigInteger.sol";

import "java/security/SecureRandom.sol";

import "javax/swing/JOptionPane.sol";

/**
 * @author Nguyen Duy Tiep on 23-Oct-17.
 */

contract RSA
{
	BigInteger private  modulus;

	/**
 * @param message
 * @return encrypted message
 */

	function encrypt(string message) public returns(String)
	{
			return ().modPow(publicKey, modulus).toString();
	}

	/**
 * @param message
 * @return encrypted message as big integer
 */

	function encrypt(BigInteger message) public returns(BigInteger)
	{
			return message.modPow(publicKey, modulus);
	}

	/**
 * @param encryptedMessage
 * @return plain message
 */

	function decrypt(string encryptedMessage) public returns(String)
	{
			return 
	}

	/**
 * @param encryptedMessage
 * @return plain message as big integer
 */

	function decrypt(BigInteger encryptedMessage) public returns(BigInteger)
	{
			return encryptedMessage.modPow(privateKey, modulus);
	}

	/**
 * Generate a new public and private key set.
 *
 * @param bits
 */

	function generateKeys(int32 bits) public
	{
			SecureRandom r;
			BigInteger p;
			BigInteger q;
			modulus = p.multiply(q);
			BigInteger m = BigInteger((p.subtract(BigInteger.ONE)).multiply(q.subtract(BigInteger.ONE)));
			;
			while(m.gcd(publicKey).intValue() > 1)
			{
					;

			}
			privateKey = publicKey.modInverse(m);
	}

	/**
 * @param bits
 */

	constructor(int32 bits) public
	{
			generateKeys(bits);
	}

}

library RSA_Library
{
	function main(string[] memory args) public
	{
			RSA rsa;
			string memory text1 = string(JOptionPane.showInputDialog("Enter a message to encrypt :"));
			string memory ciphertext = string(rsa.encrypt(text1));
			JOptionPane.showMessageDialog(none, "Your encrypted message : " + ciphertext);
			JOptionPane.showMessageDialog(none, "Your message after decrypt : " + rsa.decrypt(ciphertext));
	}

}

