pragma solidity 0.7.5;

//package com.maths


import "java/util/ArrayList.sol";

/**
 * Class for calculating the Fast Fourier Transform (FFT) of a discrete signal using the Bluestein's
 * algorithm.
 *
 * @author Ioannis Karavitsis
 * @version 1.0
 */

contract FFTBluestein
{
	/**
 * Bluestein's FFT Algorithm.
 *
 * <p>More info: https://en.wikipedia.org/wiki/Chirp_Z-transform#Bluestein.27s_algorithm
 * http://tka4.org/materials/lib/Articles-Books/Numerical%20Algorithms/Hartley_Trasform/Bluestein%27s%20FFT%20algorithm%20-%20Wikipedia,%20the%20free%20encyclopedia.htm
 *
 * @param x The discrete signal which is then converted to the FFT or the IFFT of signal x.
 * @param inverse True if you want to find the inverse FFT.
 */

	function fftBluestein(ArrayList x, bool inverse) public
	{
			int32 N = int32(x.size());
			int32 bnSize = int32(2 * N - 1);
			int32 direction = int32(inverse ? -1; : )
			ArrayList an;
			ArrayList bn;
			/* Initialization of the b(n) sequence (see Wikipedia's article above for the symbols used)*/

			for(
			for(int32 i = int32(0); i < N; i++;)
			{
					int64 angle = int64((i - N + 1) * (i - N + 1) * Math.PI / N * direction); //Converted from DOUBLE TYPE of Java
			}
			/* Initialization of the a(n) sequence */

			for(int32 i = int32(0); i < N; i++;)
			{
					int64 angle = int64(-i; * i * Math.PI / N * directio) //Converted from DOUBLE TYPE of Java
			}
			ArrayList convolution = ArrayList(ConvolutionFFT.convolutionFFT(an, bn));
			/* The final multiplication of the convolution with the b*(k) factor  */

			for(int32 i = int32(0); i < N; i++;)
			{
					int64 angle = int64(-1; * i * i * Math.PI / N * directio) //Converted from DOUBLE TYPE of Java
					Complex bk;
					x.set(i, bk.multiply(convolution.get(i + N - 1)));
			}
			/* Divide by N if we want the inverse FFT */

			if(inverse)
			{
					for(int32 i = int32(0); i < N; i++;)
					{
							Complex z = Complex(x.get(i));
							x.set(i, z.divide(N));
					}
			}
	}

}

library FFTBluestein_Library
{
	/**
 * Bluestein's FFT Algorithm.
 *
 * <p>More info: https://en.wikipedia.org/wiki/Chirp_Z-transform#Bluestein.27s_algorithm
 * http://tka4.org/materials/lib/Articles-Books/Numerical%20Algorithms/Hartley_Trasform/Bluestein%27s%20FFT%20algorithm%20-%20Wikipedia,%20the%20free%20encyclopedia.htm
 *
 * @param x The discrete signal which is then converted to the FFT or the IFFT of signal x.
 * @param inverse True if you want to find the inverse FFT.
 */

	function fftBluestein(ArrayList x, bool inverse) public
	{
			int32 N = int32(x.size());
			int32 bnSize = int32(2 * N - 1);
			int32 direction = int32(inverse ? -1; : )
			ArrayList an;
			ArrayList bn;
			/* Initialization of the b(n) sequence (see Wikipedia's article above for the symbols used)*/

			for(
			for(int32 i = int32(0); i < N; i++;)
			{
					int64 angle = int64((i - N + 1) * (i - N + 1) * Math.PI / N * direction); //Converted from DOUBLE TYPE of Java
			}
			/* Initialization of the a(n) sequence */

			for(int32 i = int32(0); i < N; i++;)
			{
					int64 angle = int64(-i; * i * Math.PI / N * directio) //Converted from DOUBLE TYPE of Java
			}
			ArrayList convolution = ArrayList(ConvolutionFFT.convolutionFFT(an, bn));
			/* The final multiplication of the convolution with the b*(k) factor  */

			for(int32 i = int32(0); i < N; i++;)
			{
					int64 angle = int64(-1; * i * i * Math.PI / N * directio) //Converted from DOUBLE TYPE of Java
					Complex bk;
					x.set(i, bk.multiply(convolution.get(i + N - 1)));
			}
			/* Divide by N if we want the inverse FFT */

			if(inverse)
			{
					for(int32 i = int32(0); i < N; i++;)
					{
							Complex z = Complex(x.get(i));
							x.set(i, z.divide(N));
					}
			}
	}

}

