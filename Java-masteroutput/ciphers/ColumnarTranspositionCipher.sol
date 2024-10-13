pragma solidity 0.7.5;

//package ciphers


/**
 * Columnar Transposition Cipher Encryption and Decryption.
 *
 * @author <a href="https://github.com/freitzzz">freitzzz</a>
 */

contract ColumnarTranspositionCipher
{
	string static  keyword;

	

	string static  abecedarium;

	string static  immutable ABECEDARIUM = string("abcdefghijklmnopqrstuvwxyzABCDEFG" + "HIJKLMNOPQRSTUVWXYZ0123456789,.;:-@)

	string static  immutable ENCRYPTION_FIELD = string("≈");

	byte static  immutable ENCRYPTION_FIELD_CHAR = byte("≈");

	/**
 * Encrypts a certain String with the Columnar Transposition Cipher Rule
 *
 * @param word Word being encrypted
 * @param keyword String with keyword being used
 * @return a String with the word encrypted by the Columnar Transposition Cipher Rule
 */

	function encrpyter(string word, string keyword) public returns(String)
	{
			ColumnarTranspositionCipher.keyword = keyword;
			abecedariumBuilder(500);
			table = tableBuilder(word);
			string memory wordEncrypted = string("");
			for(int32 i = int32(0); i < sortedTable[uint256(i)].length; i++;)
			{
					for(int32 j = int32(1); j < sortedTable.length; j++;)
					{
							wordEncrypted += sortedTable[uint256(j)][uint256(i)];
					}
			}
			return wordEncrypted;
	}

	/**
 * Encrypts a certain String with the Columnar Transposition Cipher Rule
 *
 * @param word Word being encrypted
 * @param keyword String with keyword being used
 * @param abecedarium String with the abecedarium being used. null for default one
 * @return a String with the word encrypted by the Columnar Transposition Cipher Rule
 */

	function encrpyter(string word, string keyword, string abecedarium) public returns(String)
	{
			ColumnarTranspositionCipher.keyword = keyword;
			if(abecedarium != none)
			{
					ColumnarTranspositionCipher.abecedarium = abecedarium;
			}
			else
			{
					ColumnarTranspositionCipher.abecedarium = ABECEDARIUM;
			}

			table = tableBuilder(word);
			string memory wordEncrypted = string("");
			for(int32 i = int32(0); i < sortedTable[uint256(0)].length; i++;)
			{
					for(int32 j = int32(1); j < sortedTable.length; j++;)
					{
							wordEncrypted += sortedTable[uint256(j)][uint256(i)];
					}
			}
			return wordEncrypted;
	}

	/**
 * Decrypts a certain encrypted String with the Columnar Transposition Cipher Rule
 *
 * @return a String decrypted with the word encrypted by the Columnar Transposition Cipher Rule
 */

	function decrypter() public returns(String)
	{
			string memory wordDecrypted = string("");
			for(int32 i = int32(1); i < table.length; i++;)
			{
			}
			return wordDecrypted.replaceAll(ENCRYPTION_FIELD, "");
	}

	/**
 * Determines the number of rows the table should have regarding the Columnar Transposition Cipher
 * Rule
 *
 * @return an int with the number of rows that the table should have in order to respect the
 *     Columnar Transposition Cipher Rule.
 */

	function numberOfRows(string word) private returns(int32)
	{
			if(word.length() / keyword.length() > word.length() / keyword.length())
			{
					return (word.length() / keyword.length()) + 1;
			}
			else
			{
					return word.length() / keyword.length();
			}

	}

	/**
 * Creates an abecedarium with a specified ascii inded
 *
 * @param value Number of characters being used based on the ASCII Table
 */

	function abecedariumBuilder(int32 value) private
	{
			abecedarium = "";
			for(int32 i = int32(0); i < value; i++;)
			{
					abecedarium += byte(i);
			}
	}

	function showTable() private
	{
	}

}

library ColumnarTranspositionCipher_Library
{
	/**
 * Encrypts a certain String with the Columnar Transposition Cipher Rule
 *
 * @param word Word being encrypted
 * @param keyword String with keyword being used
 * @return a String with the word encrypted by the Columnar Transposition Cipher Rule
 */

	function encrpyter(string word, string keyword) public returns(String)
	{
			ColumnarTranspositionCipher.keyword = keyword;
			abecedariumBuilder(500);
			table = tableBuilder(word);
			string memory wordEncrypted = string("");
			for(int32 i = int32(0); i < sortedTable[uint256(i)].length; i++;)
			{
					for(int32 j = int32(1); j < sortedTable.length; j++;)
					{
							wordEncrypted += sortedTable[uint256(j)][uint256(i)];
					}
			}
			return wordEncrypted;
	}

	/**
 * Encrypts a certain String with the Columnar Transposition Cipher Rule
 *
 * @param word Word being encrypted
 * @param keyword String with keyword being used
 * @param abecedarium String with the abecedarium being used. null for default one
 * @return a String with the word encrypted by the Columnar Transposition Cipher Rule
 */

	function encrpyter(string word, string keyword, string abecedarium) public returns(String)
	{
			ColumnarTranspositionCipher.keyword = keyword;
			if(abecedarium != none)
			{
					ColumnarTranspositionCipher.abecedarium = abecedarium;
			}
			else
			{
					ColumnarTranspositionCipher.abecedarium = ABECEDARIUM;
			}

			table = tableBuilder(word);
			string memory wordEncrypted = string("");
			for(int32 i = int32(0); i < sortedTable[uint256(0)].length; i++;)
			{
					for(int32 j = int32(1); j < sortedTable.length; j++;)
					{
							wordEncrypted += sortedTable[uint256(j)][uint256(i)];
					}
			}
			return wordEncrypted;
	}

	/**
 * Decrypts a certain encrypted String with the Columnar Transposition Cipher Rule
 *
 * @return a String decrypted with the word encrypted by the Columnar Transposition Cipher Rule
 */

	function decrypter() public returns(String)
	{
			string memory wordDecrypted = string("");
			for(int32 i = int32(1); i < table.length; i++;)
			{
			}
			return wordDecrypted.replaceAll(ENCRYPTION_FIELD, "");
	}

	/**
 * Determines the number of rows the table should have regarding the Columnar Transposition Cipher
 * Rule
 *
 * @return an int with the number of rows that the table should have in order to respect the
 *     Columnar Transposition Cipher Rule.
 */

	function numberOfRows(string word) private returns(int32)
	{
			if(word.length() / keyword.length() > word.length() / keyword.length())
			{
					return (word.length() / keyword.length()) + 1;
			}
			else
			{
					return word.length() / keyword.length();
			}

	}

	/**
 * Creates an abecedarium with a specified ascii inded
 *
 * @param value Number of characters being used based on the ASCII Table
 */

	function abecedariumBuilder(int32 value) private
	{
			abecedarium = "";
			for(int32 i = int32(0); i < value; i++;)
			{
					abecedarium += byte(i);
			}
	}

	function showTable() private
	{
	}

	function main(string[] memory args) public
	{
			string memory keywordForExample = string("asd215");
			string memory wordBeingEncrypted = string("This is a test of the Columnar Transposition Cipher");
			System.out.println("### Example of Columnar Transposition Cipher ###\n");
			System.out.println("Word being encryped ->>> " + wordBeingEncrypted);
			System.out.println("Word encrypted ->>> " + ColumnarTranspositionCipher.encrpyter(wordBeingEncrypted, keywordForExample));
			System.out.println("Word decryped ->>> " + ColumnarTranspositionCipher.decrypter());
			System.out.println("\n### Encrypted Table ###");
			showTable();
	}

}

