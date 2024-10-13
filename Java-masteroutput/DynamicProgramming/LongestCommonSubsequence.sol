pragma solidity 0.7.5;

//package DynamicProgramming


contract LongestCommonSubsequence
{
	function getLCS(string str1, string str2) public returns(String)
	{
			// At least one string is null

			if(str1 == none || str2 == none)
			{
				return none;			}
			// At least one string is empty

			if(str1.length() == 0 || str2.length() == 0)
			{
				return "";			}
			for(int32 i = int32(0); i < arr1.length + 1; i++;)
			{
				lcsMatrix[uint256(i)][uint256(0)] = 0;			}
			for(int32 j = int32(1); j < arr2.length + 1; j++;)
			{
				lcsMatrix[uint256(0)][uint256(j)] = 0;			}
			for(int32 i = int32(1); i < arr1.length + 1; i++;)
			{
					for(int32 j = int32(1); j < arr2.length + 1; j++;)
					{
							if(arr1[uint256(i - 1)].equals(arr2[uint256(j - 1)]))
							{
									lcsMatrix[uint256(i)][uint256(j)] = lcsMatrix[uint256(i - 1)][uint256(j - 1)] + 1;
							}
							else
							{
									lcsMatrix[uint256(i)][uint256(j)] = lcsMatrix[uint256(i - 1)][uint256(j)] > lcsMatrix[uint256(i)][uint256(j - 1)] ? lcsMatrix[uint256(i - 1)][uint256(j)] : lcsMatrix[uint256(i)][uint256(j - 1)];
							}

					}
			}
			return lcsString(str1, str2, lcsMatrix);
	}

}

library LongestCommonSubsequence_Library
{
	function getLCS(string str1, string str2) public returns(String)
	{
			// At least one string is null

			if(str1 == none || str2 == none)
			{
				return none;			}
			// At least one string is empty

			if(str1.length() == 0 || str2.length() == 0)
			{
				return "";			}
			for(int32 i = int32(0); i < arr1.length + 1; i++;)
			{
				lcsMatrix[uint256(i)][uint256(0)] = 0;			}
			for(int32 j = int32(1); j < arr2.length + 1; j++;)
			{
				lcsMatrix[uint256(0)][uint256(j)] = 0;			}
			for(int32 i = int32(1); i < arr1.length + 1; i++;)
			{
					for(int32 j = int32(1); j < arr2.length + 1; j++;)
					{
							if(arr1[uint256(i - 1)].equals(arr2[uint256(j - 1)]))
							{
									lcsMatrix[uint256(i)][uint256(j)] = lcsMatrix[uint256(i - 1)][uint256(j - 1)] + 1;
							}
							else
							{
									lcsMatrix[uint256(i)][uint256(j)] = lcsMatrix[uint256(i - 1)][uint256(j)] > lcsMatrix[uint256(i)][uint256(j - 1)] ? lcsMatrix[uint256(i - 1)][uint256(j)] : lcsMatrix[uint256(i)][uint256(j - 1)];
							}

					}
			}
			return lcsString(str1, str2, lcsMatrix);
	}

	function main(string[] memory args) public
	{
			string memory str1 = string("DSGSHSRGSRHTRD");
			string memory str2 = string("DATRGAGTSHS");
			string memory lcs = string(getLCS(str1, str2));
			// Print LCS

			if(lcs != none)
			{
					System.out.println("String 1: " + str1);
					System.out.println("String 2: " + str2);
					System.out.println("LCS: " + lcs);
					System.out.println("LCS length: " + lcs.length());
			}
	}

}

