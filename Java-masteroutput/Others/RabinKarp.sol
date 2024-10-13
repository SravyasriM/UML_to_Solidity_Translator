pragma solidity 0.7.5;

import "java/util/Scanner.sol";

// Program will simply end if there is no match

contract RabinKarp
{
	Scanner static  scanner = Scanner(none);

	int32 static  immutable d = int32(256);

	function searchPat(string text, string pattern, int32 q) private
	{
			int32 m = int32(pattern.length());
			int32 n = int32(text.length());
			int32 t = int32(0);
			int32 p = int32(0);
			int32 h = int32(1);
			int32 j = int32(0);
			int32 i = int32(0);
			h = int32(Math.pow(d, m - 1)) % q;
			for(i = 0; i < m; i++;)
			{
					// as well as the text for length equal to the length of pattern

					p = (d * p + pattern.charAt(i)) % q;
					t = (d * t + text.charAt(i)) % q;
			}
			for(i = 0; i <= n - m; i++;)
			{
					// of the evaluated characters is added

					if(p == t)
					{
							// if hash value matches then the individual characters are matched

							for(j = 0; j < m; j++;)
							{
									// if not matched then break out of the loop

									if(text.charAt(i + j) != pattern.charAt(j))
									{
										break;									}
							}
							// if all characters are matched then pattern exist in the string

							if(j == m)
							{
									System.out.println("Pattern found at index " + i);
							}
					}
					// in the text

					if(i < n - m)
					{
							t = (d * (t - text.charAt(i) * h) + text.charAt(i + m)) % q;
							// if hash value becomes less than zero than q is added to make it positive

							if(t < 0)
							{
								t = (t + q);							}
					}
			}
	}

}

library RabinKarp_Library
{
	function main(string[] memory args) public
	{
			;
			System.out.println("Enter String");
			string memory text = string(scanner.nextLine());
			System.out.println("Enter pattern");
			string memory pattern = string(scanner.nextLine());
			int32 q = int32(101);
			searchPat(text, pattern, q);
	}

	function searchPat(string text, string pattern, int32 q) private
	{
			int32 m = int32(pattern.length());
			int32 n = int32(text.length());
			int32 t = int32(0);
			int32 p = int32(0);
			int32 h = int32(1);
			int32 j = int32(0);
			int32 i = int32(0);
			h = int32(Math.pow(d, m - 1)) % q;
			for(i = 0; i < m; i++;)
			{
					// as well as the text for length equal to the length of pattern

					p = (d * p + pattern.charAt(i)) % q;
					t = (d * t + text.charAt(i)) % q;
			}
			for(i = 0; i <= n - m; i++;)
			{
					// of the evaluated characters is added

					if(p == t)
					{
							// if hash value matches then the individual characters are matched

							for(j = 0; j < m; j++;)
							{
									// if not matched then break out of the loop

									if(text.charAt(i + j) != pattern.charAt(j))
									{
										break;									}
							}
							// if all characters are matched then pattern exist in the string

							if(j == m)
							{
									System.out.println("Pattern found at index " + i);
							}
					}
					// in the text

					if(i < n - m)
					{
							t = (d * (t - text.charAt(i) * h) + text.charAt(i + m)) % q;
							// if hash value becomes less than zero than q is added to make it positive

							if(t < 0)
							{
								t = (t + q);							}
					}
			}
	}

}

//Optional.empty


