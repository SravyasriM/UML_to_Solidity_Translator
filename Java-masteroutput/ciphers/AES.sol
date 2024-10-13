pragma solidity 0.7.5;

//package ciphers


import "java/math/BigInteger.sol";

import "java/util/Scanner.sol";

/**
 * This class is build to demonstrate the application of the AES-algorithm on a single 128-Bit block
 * of data.
 */

contract AES
{
	/**
 * Subroutine of the Rijndael key expansion.
 *
 * @param t
 * @param rconCounter
 * @return
 */

	function scheduleCore(BigInteger t, int32 rconCounter) public returns(BigInteger)
	{
			string memory rBytes = string(t.toString(16));
			// Add zero padding

			while(rBytes.length() < 8)
			{
					rBytes = "0" + rBytes;

			}
			// rotate the first 16 bits to the back

			string memory rotatingBytes = string(rBytes.substring(0, 2));
			string memory fixedBytes = string(rBytes.substring(2));
			rBytes = fixedBytes + rotatingBytes;
			// apply S-Box to all 8-Bit Substrings

			for(int32 i = int32(0); i < 4; i++;)
			{
					string memory currentByteBits = string(rBytes.substring(i * 2, (i + 1) * 2));
					int32 currentByte = int32(Integer.parseInt(currentByteBits, 16));
					currentByte = SBOX[uint256(currentByte)];
					// add the current RCON value to the first byte

					if(i == 0)
					{
							currentByte = currentByte ^ RCON[uint256(rconCounter)];
					}
					currentByteBits = Integer.toHexString(currentByte);
					while(currentByteBits.length() < 2)
					{
							currentByteBits = "0" + currentByteBits;

					}
					// replace bytes in original string

					rBytes = rBytes.substring(0, i * 2) + currentByteBits + rBytes.substring((i + 1) * 2);
			}
			// return t;

			return 
	}

	/**
 * representation of the input 128-bit block as an array of 8-bit integers.
 *
 * @param block of 128-bit integers
 * @return array of 8-bit integers
 */

	function splitBlockIntoCells(BigInteger block) public returns(

	/**
 * @param ciphertext
 * @param key
 * @return ciphertext XOR key
 */

	function addRoundKey(BigInteger ciphertext, BigInteger key) public returns(BigInteger)
	{
			return ciphertext.xor(key);
	}

	/**
 * substitutes 8-Bit long substrings of the input using the S-Box and returns the result.
 *
 * @param ciphertext
 * @return subtraction Output
 */

	function subBytes(BigInteger ciphertext) public returns(BigInteger)
	{
			for(int32 i = int32(0); i < 16; i++;)
			{
					cells[uint256(i)] = SBOX[uint256(cells[uint256(i)])];
			}
			return mergeCellsIntoBlock(cells);
	}

	/**
 * substitutes 8-Bit long substrings of the input using the inverse S-Box for decryption and
 * returns the result.
 *
 * @param ciphertext
 * @return subtraction Output
 */

	function subBytesDec(BigInteger ciphertext) public returns(BigInteger)
	{
			for(int32 i = int32(0); i < 16; i++;)
			{
					cells[uint256(i)] = INVERSE_SBOX[uint256(cells[uint256(i)])];
			}
			return mergeCellsIntoBlock(cells);
	}

	/**
 * Cell permutation step. Shifts cells within the rows of the input and returns the result.
 *
 * @param ciphertext
 */

	function shiftRows(BigInteger ciphertext) public returns(BigInteger)
	{
			// do nothing in the first row

			output[uint256(0)] = cells[uint256(0)];
			output[uint256(4)] = cells[uint256(4)];
			output[uint256(8)] = cells[uint256(8)];
			output[uint256(12)] = cells[uint256(12)];
			// shift the second row backwards by one cell

			output[uint256(1)] = cells[uint256(5)];
			output[uint256(5)] = cells[uint256(9)];
			output[uint256(9)] = cells[uint256(13)];
			output[uint256(13)] = cells[uint256(1)];
			// shift the third row backwards by two cell

			output[uint256(2)] = cells[uint256(10)];
			output[uint256(6)] = cells[uint256(14)];
			output[uint256(10)] = cells[uint256(2)];
			output[uint256(14)] = cells[uint256(6)];
			// shift the forth row backwards by tree cell

			output[uint256(3)] = cells[uint256(15)];
			output[uint256(7)] = cells[uint256(3)];
			output[uint256(11)] = cells[uint256(7)];
			output[uint256(15)] = cells[uint256(11)];
			return mergeCellsIntoBlock(output);
	}

	/**
 * Cell permutation step for decryption . Shifts cells within the rows of the input and returns
 * the result.
 *
 * @param ciphertext
 */

	function shiftRowsDec(BigInteger ciphertext) public returns(BigInteger)
	{
			// do nothing in the first row

			output[uint256(0)] = cells[uint256(0)];
			output[uint256(4)] = cells[uint256(4)];
			output[uint256(8)] = cells[uint256(8)];
			output[uint256(12)] = cells[uint256(12)];
			// shift the second row forwards by one cell

			output[uint256(1)] = cells[uint256(13)];
			output[uint256(5)] = cells[uint256(1)];
			output[uint256(9)] = cells[uint256(5)];
			output[uint256(13)] = cells[uint256(9)];
			// shift the third row forwards by two cell

			output[uint256(2)] = cells[uint256(10)];
			output[uint256(6)] = cells[uint256(14)];
			output[uint256(10)] = cells[uint256(2)];
			output[uint256(14)] = cells[uint256(6)];
			// shift the forth row forwards by tree cell

			output[uint256(3)] = cells[uint256(7)];
			output[uint256(7)] = cells[uint256(11)];
			output[uint256(11)] = cells[uint256(15)];
			output[uint256(15)] = cells[uint256(3)];
			return mergeCellsIntoBlock(output);
	}

	/**
 * Applies the Rijndael MixColumns to the input and returns the result.
 *
 * @param ciphertext
 */

	function mixColumns(BigInteger ciphertext) public returns(BigInteger)
	{
			for(int32 i = int32(0); i < 4; i++;)
			{
					outputCells[uint256(i * 4)] = MULT2[uint256(row[uint256(0)])] ^ MULT3[uint256(row[uint256(1)])] ^ row[uint256(2)] ^ row[uint256(3)];
					outputCells[uint256(i * 4 + 1)] = row[uint256(0)] ^ MULT2[uint256(row[uint256(1)])] ^ MULT3[uint256(row[uint256(2)])] ^ row[uint256(3)];
					outputCells[uint256(i * 4 + 2)] = row[uint256(0)] ^ row[uint256(1)] ^ MULT2[uint256(row[uint256(2)])] ^ MULT3[uint256(row[uint256(3)])];
					outputCells[uint256(i * 4 + 3)] = MULT3[uint256(row[uint256(0)])] ^ row[uint256(1)] ^ row[uint256(2)] ^ MULT2[uint256(row[uint256(3)])];
			}
			return mergeCellsIntoBlock(outputCells);
	}

	/**
 * Applies the inverse Rijndael MixColumns for decryption to the input and returns the result.
 *
 * @param ciphertext
 */

	function mixColumnsDec(BigInteger ciphertext) public returns(BigInteger)
	{
			for(int32 i = int32(0); i < 4; i++;)
			{
					outputCells[uint256(i * 4)] = MULT14[uint256(row[uint256(0)])] ^ MULT11[uint256(row[uint256(1)])] ^ MULT13[uint256(row[uint256(2)])] ^ MULT9[uint256(row[uint256(3)])];
					outputCells[uint256(i * 4 + 1)] = MULT9[uint256(row[uint256(0)])] ^ MULT14[uint256(row[uint256(1)])] ^ MULT11[uint256(row[uint256(2)])] ^ MULT13[uint256(row[uint256(3)])];
					outputCells[uint256(i * 4 + 2)] = MULT13[uint256(row[uint256(0)])] ^ MULT9[uint256(row[uint256(1)])] ^ MULT14[uint256(row[uint256(2)])] ^ MULT11[uint256(row[uint256(3)])];
					outputCells[uint256(i * 4 + 3)] = MULT11[uint256(row[uint256(0)])] ^ MULT13[uint256(row[uint256(1)])] ^ MULT9[uint256(row[uint256(2)])] ^ MULT14[uint256(row[uint256(3)])];
			}
			return mergeCellsIntoBlock(outputCells);
	}

	/**
 * Encrypts the plaintext with the key and returns the result
 *
 * @param plainText which we want to encrypt
 * @param key the key for encrypt
 * @return EncryptedText
 */

	function encrypt(BigInteger plainText, BigInteger key) public returns(BigInteger)
	{
			// Initial round

			plainText = addRoundKey(plainText, roundKeys[uint256(0)]);
			// Main rounds

			for(int32 i = int32(1); i < 10; i++;)
			{
					plainText = subBytes(plainText);
					plainText = shiftRows(plainText);
					plainText = mixColumns(plainText);
					plainText = addRoundKey(plainText, roundKeys[uint256(i)]);
			}
			// Final round

			plainText = subBytes(plainText);
			plainText = shiftRows(plainText);
			plainText = addRoundKey(plainText, roundKeys[uint256(10)]);
			return plainText;
	}

	/**
 * Decrypts the ciphertext with the key and returns the result
 *
 * @param cipherText The Encrypted text which we want to decrypt
 * @param key
 * @return decryptedText
 */

	function decrypt(BigInteger cipherText, BigInteger key) public returns(BigInteger)
	{
			// Invert final round

			cipherText = addRoundKey(cipherText, roundKeys[uint256(10)]);
			cipherText = shiftRowsDec(cipherText);
			cipherText = subBytesDec(cipherText);
			// Invert main rounds

			for(int32 i = int32(9); i > 0; i--;)
			{
					cipherText = addRoundKey(cipherText, roundKeys[uint256(i)]);
					cipherText = mixColumnsDec(cipherText);
					cipherText = shiftRowsDec(cipherText);
					cipherText = subBytesDec(cipherText);
			}
			// Invert initial round

			cipherText = addRoundKey(cipherText, roundKeys[uint256(0)]);
			return cipherText;
	}

}

library AES_Library
{
	/**
 * Subroutine of the Rijndael key expansion.
 *
 * @param t
 * @param rconCounter
 * @return
 */

	function scheduleCore(BigInteger t, int32 rconCounter) public returns(BigInteger)
	{
			string memory rBytes = string(t.toString(16));
			// Add zero padding

			while(rBytes.length() < 8)
			{
					rBytes = "0" + rBytes;

			}
			// rotate the first 16 bits to the back

			string memory rotatingBytes = string(rBytes.substring(0, 2));
			string memory fixedBytes = string(rBytes.substring(2));
			rBytes = fixedBytes + rotatingBytes;
			// apply S-Box to all 8-Bit Substrings

			for(int32 i = int32(0); i < 4; i++;)
			{
					string memory currentByteBits = string(rBytes.substring(i * 2, (i + 1) * 2));
					int32 currentByte = int32(Integer.parseInt(currentByteBits, 16));
					currentByte = SBOX[uint256(currentByte)];
					// add the current RCON value to the first byte

					if(i == 0)
					{
							currentByte = currentByte ^ RCON[uint256(rconCounter)];
					}
					currentByteBits = Integer.toHexString(currentByte);
					while(currentByteBits.length() < 2)
					{
							currentByteBits = "0" + currentByteBits;

					}
					// replace bytes in original string

					rBytes = rBytes.substring(0, i * 2) + currentByteBits + rBytes.substring((i + 1) * 2);
			}
			// return t;

			return 
	}

	/**
 * representation of the input 128-bit block as an array of 8-bit integers.
 *
 * @param block of 128-bit integers
 * @return array of 8-bit integers
 */

	function splitBlockIntoCells(BigInteger block) public returns(

	/**
 * Returns the 128-bit BigInteger representation of the input of an array of 8-bit integers.
 *
 * @param cells that we need to merge
 * @return block of merged cells
 */

	function mergeCellsIntoBlock(int32[] memory cells) public returns(BigInteger)
	{
			string memory blockBits = string("");
			for(int32 i = int32(0); i < 16; i++;)
			{
					string memory cellBits = string(Integer.toBinaryString(cells[uint256(i)]));
					// Append leading 0 for full "8-bit" strings

					while(cellBits.length() < 8)
					{
							cellBits = "0" + cellBits;

					}
					blockBits += cellBits;
			}
			return 
	}

	/**
 * @param ciphertext
 * @param key
 * @return ciphertext XOR key
 */

	function addRoundKey(BigInteger ciphertext, BigInteger key) public returns(BigInteger)
	{
			return ciphertext.xor(key);
	}

	/**
 * substitutes 8-Bit long substrings of the input using the S-Box and returns the result.
 *
 * @param ciphertext
 * @return subtraction Output
 */

	function subBytes(BigInteger ciphertext) public returns(BigInteger)
	{
			for(int32 i = int32(0); i < 16; i++;)
			{
					cells[uint256(i)] = SBOX[uint256(cells[uint256(i)])];
			}
			return mergeCellsIntoBlock(cells);
	}

	/**
 * substitutes 8-Bit long substrings of the input using the inverse S-Box for decryption and
 * returns the result.
 *
 * @param ciphertext
 * @return subtraction Output
 */

	function subBytesDec(BigInteger ciphertext) public returns(BigInteger)
	{
			for(int32 i = int32(0); i < 16; i++;)
			{
					cells[uint256(i)] = INVERSE_SBOX[uint256(cells[uint256(i)])];
			}
			return mergeCellsIntoBlock(cells);
	}

	/**
 * Cell permutation step. Shifts cells within the rows of the input and returns the result.
 *
 * @param ciphertext
 */

	function shiftRows(BigInteger ciphertext) public returns(BigInteger)
	{
			// do nothing in the first row

			output[uint256(0)] = cells[uint256(0)];
			output[uint256(4)] = cells[uint256(4)];
			output[uint256(8)] = cells[uint256(8)];
			output[uint256(12)] = cells[uint256(12)];
			// shift the second row backwards by one cell

			output[uint256(1)] = cells[uint256(5)];
			output[uint256(5)] = cells[uint256(9)];
			output[uint256(9)] = cells[uint256(13)];
			output[uint256(13)] = cells[uint256(1)];
			// shift the third row backwards by two cell

			output[uint256(2)] = cells[uint256(10)];
			output[uint256(6)] = cells[uint256(14)];
			output[uint256(10)] = cells[uint256(2)];
			output[uint256(14)] = cells[uint256(6)];
			// shift the forth row backwards by tree cell

			output[uint256(3)] = cells[uint256(15)];
			output[uint256(7)] = cells[uint256(3)];
			output[uint256(11)] = cells[uint256(7)];
			output[uint256(15)] = cells[uint256(11)];
			return mergeCellsIntoBlock(output);
	}

	/**
 * Cell permutation step for decryption . Shifts cells within the rows of the input and returns
 * the result.
 *
 * @param ciphertext
 */

	function shiftRowsDec(BigInteger ciphertext) public returns(BigInteger)
	{
			// do nothing in the first row

			output[uint256(0)] = cells[uint256(0)];
			output[uint256(4)] = cells[uint256(4)];
			output[uint256(8)] = cells[uint256(8)];
			output[uint256(12)] = cells[uint256(12)];
			// shift the second row forwards by one cell

			output[uint256(1)] = cells[uint256(13)];
			output[uint256(5)] = cells[uint256(1)];
			output[uint256(9)] = cells[uint256(5)];
			output[uint256(13)] = cells[uint256(9)];
			// shift the third row forwards by two cell

			output[uint256(2)] = cells[uint256(10)];
			output[uint256(6)] = cells[uint256(14)];
			output[uint256(10)] = cells[uint256(2)];
			output[uint256(14)] = cells[uint256(6)];
			// shift the forth row forwards by tree cell

			output[uint256(3)] = cells[uint256(7)];
			output[uint256(7)] = cells[uint256(11)];
			output[uint256(11)] = cells[uint256(15)];
			output[uint256(15)] = cells[uint256(3)];
			return mergeCellsIntoBlock(output);
	}

	/**
 * Applies the Rijndael MixColumns to the input and returns the result.
 *
 * @param ciphertext
 */

	function mixColumns(BigInteger ciphertext) public returns(BigInteger)
	{
			for(int32 i = int32(0); i < 4; i++;)
			{
					outputCells[uint256(i * 4)] = MULT2[uint256(row[uint256(0)])] ^ MULT3[uint256(row[uint256(1)])] ^ row[uint256(2)] ^ row[uint256(3)];
					outputCells[uint256(i * 4 + 1)] = row[uint256(0)] ^ MULT2[uint256(row[uint256(1)])] ^ MULT3[uint256(row[uint256(2)])] ^ row[uint256(3)];
					outputCells[uint256(i * 4 + 2)] = row[uint256(0)] ^ row[uint256(1)] ^ MULT2[uint256(row[uint256(2)])] ^ MULT3[uint256(row[uint256(3)])];
					outputCells[uint256(i * 4 + 3)] = MULT3[uint256(row[uint256(0)])] ^ row[uint256(1)] ^ row[uint256(2)] ^ MULT2[uint256(row[uint256(3)])];
			}
			return mergeCellsIntoBlock(outputCells);
	}

	/**
 * Applies the inverse Rijndael MixColumns for decryption to the input and returns the result.
 *
 * @param ciphertext
 */

	function mixColumnsDec(BigInteger ciphertext) public returns(BigInteger)
	{
			for(int32 i = int32(0); i < 4; i++;)
			{
					outputCells[uint256(i * 4)] = MULT14[uint256(row[uint256(0)])] ^ MULT11[uint256(row[uint256(1)])] ^ MULT13[uint256(row[uint256(2)])] ^ MULT9[uint256(row[uint256(3)])];
					outputCells[uint256(i * 4 + 1)] = MULT9[uint256(row[uint256(0)])] ^ MULT14[uint256(row[uint256(1)])] ^ MULT11[uint256(row[uint256(2)])] ^ MULT13[uint256(row[uint256(3)])];
					outputCells[uint256(i * 4 + 2)] = MULT13[uint256(row[uint256(0)])] ^ MULT9[uint256(row[uint256(1)])] ^ MULT14[uint256(row[uint256(2)])] ^ MULT11[uint256(row[uint256(3)])];
					outputCells[uint256(i * 4 + 3)] = MULT11[uint256(row[uint256(0)])] ^ MULT13[uint256(row[uint256(1)])] ^ MULT9[uint256(row[uint256(2)])] ^ MULT14[uint256(row[uint256(3)])];
			}
			return mergeCellsIntoBlock(outputCells);
	}

	/**
 * Encrypts the plaintext with the key and returns the result
 *
 * @param plainText which we want to encrypt
 * @param key the key for encrypt
 * @return EncryptedText
 */

	function encrypt(BigInteger plainText, BigInteger key) public returns(BigInteger)
	{
			// Initial round

			plainText = addRoundKey(plainText, roundKeys[uint256(0)]);
			// Main rounds

			for(int32 i = int32(1); i < 10; i++;)
			{
					plainText = subBytes(plainText);
					plainText = shiftRows(plainText);
					plainText = mixColumns(plainText);
					plainText = addRoundKey(plainText, roundKeys[uint256(i)]);
			}
			// Final round

			plainText = subBytes(plainText);
			plainText = shiftRows(plainText);
			plainText = addRoundKey(plainText, roundKeys[uint256(10)]);
			return plainText;
	}

	/**
 * Decrypts the ciphertext with the key and returns the result
 *
 * @param cipherText The Encrypted text which we want to decrypt
 * @param key
 * @return decryptedText
 */

	function decrypt(BigInteger cipherText, BigInteger key) public returns(BigInteger)
	{
			// Invert final round

			cipherText = addRoundKey(cipherText, roundKeys[uint256(10)]);
			cipherText = shiftRowsDec(cipherText);
			cipherText = subBytesDec(cipherText);
			// Invert main rounds

			for(int32 i = int32(9); i > 0; i--;)
			{
					cipherText = addRoundKey(cipherText, roundKeys[uint256(i)]);
					cipherText = mixColumnsDec(cipherText);
					cipherText = shiftRowsDec(cipherText);
					cipherText = subBytesDec(cipherText);
			}
			// Invert initial round

			cipherText = addRoundKey(cipherText, roundKeys[uint256(0)]);
			return cipherText;
	}

	function main(string[] memory args) public
	{
				//try

					System.out.println("Enter (e) letter for encrpyt or (d) letter for decrypt :");
					byte choice = byte(input.nextLine().charAt(0));
					string memory in;
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
									System.out.println("Choose a plaintext block (128-Bit Integer in base 16):");
									in = input.nextLine();
									BigInteger plaintext;
									System.out.println("Choose a Key (128-Bit Integer in base 16):");
									in = input.nextLine();
									BigInteger encryptionKey;
									System.out.println("The encrypted message is: \n" + encrypt(plaintext, encryptionKey).toString(16));
									break;
							}
							if(void || (choice == keccak256(abi.encode("D"))))
							{
									void = true;
							}
							if(void || (choice == keccak256(abi.encode("d"))))
							{
									void = true;
									System.out.println("Enter your ciphertext block (128-Bit Integer in base 16):");
									in = input.nextLine();
									BigInteger ciphertext;
									System.out.println("Choose a Key (128-Bit Integer in base 16):");
									in = input.nextLine();
									BigInteger decryptionKey;
									System.out.println("The deciphered message is:\n" + decrypt(ciphertext, decryptionKey).toString(16));
									break;
							}
								System.out.println("** End **");


					}while(false);


	}

}

