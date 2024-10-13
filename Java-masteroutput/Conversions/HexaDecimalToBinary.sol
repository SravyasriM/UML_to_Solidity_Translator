pragma solidity 0.7.5;

//package Conversions


contract HexaDecimalToBinary
{
	int32 private  immutable LONG_BITS = int32(8);

	function convert(string numHex) public
	{
			// String a HexaDecimal:

			int32 conHex = int32(Integer.parseInt(numHex, 16));
			// Hex a Binary:

			string memory binary = string(Integer.toBinaryString(conHex));
			// Output:

			System.out.println(numHex + " = " + completeDigits(binary));
	}

	function completeDigits(string binNum) public returns(String)
	{
			for(int32 i = int32(binNum.length()); i < LONG_BITS; i++;)
			{
					binNum = "0" + binNum;
			}
			return binNum;
	}

}

library HexaDecimalToBinary_Library
{
	function main(string[] memory args) public
	{
			HexaDecimalToBinary objConvert;
			for(uint256 iterator_var = uint256(0); iterator_var < hexNums.length; iterator_var++;)
			{
					string num = string(hexNums[uint256(iterator_var)]);
					objConvert.convert(num);
			}
	}

}

//Optional.empty


