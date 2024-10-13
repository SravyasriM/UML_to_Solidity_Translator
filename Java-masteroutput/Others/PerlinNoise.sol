pragma solidity 0.7.5;

//package Others


import "java/util/Random.sol";

import "java/util/Scanner.sol";

/**
 * For detailed info and implementation see: <a
 * href="http://devmag.org.za/2009/04/25/perlin-noise/">Perlin-Noise</a>
 */

contract PerlinNoise
{
	/**
 * @param a value of point a
 * @param b value of point b
 * @param alpha determine which value has more impact (closer to 0 -> a, closer to 1 -> b)
 * @return interpolated value
 */

	function interpolate(int32 a, int32 b, int32 alpha) internal returns(int32)
	{
			return a * (1 - alpha) + alpha * b;
	}

}

library PerlinNoise_Library
{
	/**
 * @param a value of point a
 * @param b value of point b
 * @param alpha determine which value has more impact (closer to 0 -> a, closer to 1 -> b)
 * @return interpolated value
 */

	function interpolate(int32 a, int32 b, int32 alpha) internal returns(int32)
	{
			return a * (1 - alpha) + alpha * b;
	}

	function main(string[] memory args) public
	{
			Scanner in;
			int32 width;
			int32 height;
			int32 octaveCount;
			int32 persistence; //Converted from FLOAT TYPE of Java
			int64 seed;
			string memory charset;
			System.out.println("Width (int): ");
			width = in.nextInt();
			System.out.println("Height (int): ");
			height = in.nextInt();
			System.out.println("Octave count (int): ");
			octaveCount = in.nextInt();
			System.out.println("Persistence (float): ");
			persistence = in.nextFloat();
			System.out.println("Seed (long): ");
			seed = in.nextLong();
			System.out.println("Charset (String): ");
			charset = in.next();
			perlinNoise = generatePerlinNoise(width, height, octaveCount, persistence, seed);
			int32 length = int32(chars.length);
			int32 step = int32(1 / length); //Converted from FLOAT TYPE of Java
			// output based on charset

			for(int32 x = int32(0); x < width; x++;)
			{
					for(int32 y = int32(0); y < height; y++;)
					{
							int32 value = int32(step); //Converted from FLOAT TYPE of Java
							int32 noiseValue = int32(perlinNoise[uint256(x)][uint256(y)]); //Converted from FLOAT TYPE of Java
							for(uint256 iterator_var = uint256(0); iterator_var < chars.length; iterator_var++;)
							{
									byte c = byte(chars[uint256(iterator_var)]);
									if(noiseValue <= value)
									{
											System.out.print(c);
											break;
									}
									value += step;
							}
					}
					System.out.println();
			}
			in.close();
	}

}

