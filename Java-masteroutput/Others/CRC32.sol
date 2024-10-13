pragma solidity 0.7.5;

//package Others


import "java/util/BitSet.sol";

/**
 * Generates a crc32 checksum for a given string or byte array
 */

contract CRC32
{
	function crc32(string str) public returns(int32)
	{
			return crc32(str.getBytes());
	}

}

library CRC32_Library
{
	function main(string[] memory args) public
	{
			System.out.println(Integer.toHexString(crc32("Hello World")));
	}

	function crc32(string str) public returns(int32)
	{
			return crc32(str.getBytes());
	}

	function crc32(int8[] memory data) public returns(int32)
	{
			BitSet bitSet = BitSet(BitSet.valueOf(data));
			// initial value

			int32 crc32 = int32(0xFFFFFFFF);
			for(int32 i = int32(0); i < data.length * 8; i++;)
			{
					if(((crc32 >>> 31) & 1) != (bitSet.get(i) ? 1 : 0))
					{
						// xor with polynomial

						crc32 = (crc32 << 1) ^ 0x04C11DB7;					}
					else
					{
						crc32 = (crc32 << 1);					}

			}
			// result reflect

			crc32 = Integer.reverse(crc32);
			// final xor value

			return crc32 ^ 0xFFFFFFFF;
	}

}

