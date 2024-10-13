pragma solidity 0.7.5;

//package com.maths


import "java/util/ArrayList.sol";

import "java/util/Collections.sol";

/**
 * Class for calculating the Fast Fourier Transform (FFT) of a discrete signal using the
 * Cooley-Tukey algorithm.
 *
 * @author Ioannis Karavitsis
 * @version 1.0
 */

contract FFT
{
	/**
 * Iterative In-Place Radix-2 Cooley-Tukey Fast Fourier Transform Algorithm with Bit-Reversal. The
 * size of the input signal must be a power of 2. If it isn't then it is padded with zeros and the
 * output FFT will be bigger than the input signal.
 *
 * <p>More info: https://www.algorithm-archive.org/contents/cooley_tukey/cooley_tukey.html
 * https://www.geeksforgeeks.org/iterative-fast-fourier-transformation-polynomial-multiplication/
 * https://en.wikipedia.org/wiki/Cooley%E2%80%93Tukey_FFT_algorithm
 * https://cp-algorithms.com/algebra/fft.html
 *
 * @param x The discrete signal which is then converted to the FFT or the IFFT of signal x.
 * @param inverse True if you want to find the inverse FFT.
 */

	function fft(ArrayList x, bool inverse) public
	{
			/* Pad the signal with zeros if necessary */

			paddingPowerOfTwo(x);
			int32 N = int32(x.size());
			/* Find the log2(N) */

			int32 log2N = int32(0);
			while((1 << log2N) < N)
			{
				log2N++;
			}
			/* Swap the values of the signal with bit-reversal method */

			int32 reverse;
			for(int32 i = int32(0); i < N; i++;)
			{
					reverse = reverseBits(i, log2N);
					if(i < reverse)
					{
						Collections.swap(x, i, reverse);					}
			}
			int32 direction = int32(inverse ? -1; : )
			/* Main loop of the algorithm */

			for(int32 len = int32(2); len <= N; len *= 2;)
			{
					int64 angle = int64(-2; * Math.PI / len * directio) //Converted from DOUBLE TYPE of Java
					Complex wlen = new Complex(1);
					wlen.constructor1(Math.cos(angle), Math.sin(angle));
					for(int32 i = int32(0); i < N; i += len;)
					{
							Complex w;
							for(int32 j = int32(0); j < len / 2; j++;)
							{
									Complex u = Complex(x.get(i + j));
									Complex v = Complex(w.multiply(x.get(i + j + len / 2)));
									x.set(i + j, u.add(v));
									x.set(i + j + len / 2, u.subtract(v));
									w = w.multiply(wlen);
							}
					}
			}
			/* Divide by N if we want the inverse FFT */

			if(inverse)
			{
					for(int32 i = int32(0); i < x.size(); i++;)
					{
							Complex z = Complex(x.get(i));
							x.set(i, z.divide(N));
					}
			}
	}

	/**
 * This function reverses the bits of a number. It is used in Cooley-Tukey FFT algorithm.
 *
 * <p>E.g. num = 13 = 00001101 in binary log2N = 8 Then reversed = 176 = 10110000 in binary
 *
 * <p>More info: https://cp-algorithms.com/algebra/fft.html
 * https://www.geeksforgeeks.org/write-an-efficient-c-program-to-reverse-bits-of-a-number/
 *
 * @param num The integer you want to reverse its bits.
 * @param log2N The number of bits you want to reverse.
 * @return The reversed number
 */

	function reverseBits(int32 num, int32 log2N) private returns(int32)
	{
			int32 reversed = int32(0);
			for(int32 i = int32(0); i < log2N; i++;)
			{
					if((num & (1 << i)) != 0)
					{
						reversed |= 1 << (log2N - 1 - i);					}
			}
			return reversed;
	}

	/**
 * This method pads an ArrayList with zeros in order to have a size equal to the next power of two
 * of the previous size.
 *
 * @param x The ArrayList to be padded.
 */

	function paddingPowerOfTwo(ArrayList x) private
	{
			int32 n = int32(1);
			int32 oldSize = int32(x.size());
			while(n < oldSize)
			{
				n *= 2;
			}
	}

}

library FFT_Library
{
	/**
 * Iterative In-Place Radix-2 Cooley-Tukey Fast Fourier Transform Algorithm with Bit-Reversal. The
 * size of the input signal must be a power of 2. If it isn't then it is padded with zeros and the
 * output FFT will be bigger than the input signal.
 *
 * <p>More info: https://www.algorithm-archive.org/contents/cooley_tukey/cooley_tukey.html
 * https://www.geeksforgeeks.org/iterative-fast-fourier-transformation-polynomial-multiplication/
 * https://en.wikipedia.org/wiki/Cooley%E2%80%93Tukey_FFT_algorithm
 * https://cp-algorithms.com/algebra/fft.html
 *
 * @param x The discrete signal which is then converted to the FFT or the IFFT of signal x.
 * @param inverse True if you want to find the inverse FFT.
 */

	function fft(ArrayList x, bool inverse) public
	{
			/* Pad the signal with zeros if necessary */

			paddingPowerOfTwo(x);
			int32 N = int32(x.size());
			/* Find the log2(N) */

			int32 log2N = int32(0);
			while((1 << log2N) < N)
			{
				log2N++;
			}
			/* Swap the values of the signal with bit-reversal method */

			int32 reverse;
			for(int32 i = int32(0); i < N; i++;)
			{
					reverse = reverseBits(i, log2N);
					if(i < reverse)
					{
						Collections.swap(x, i, reverse);					}
			}
			int32 direction = int32(inverse ? -1; : )
			/* Main loop of the algorithm */

			for(int32 len = int32(2); len <= N; len *= 2;)
			{
					int64 angle = int64(-2; * Math.PI / len * directio) //Converted from DOUBLE TYPE of Java
					Complex wlen = new Complex(1);
					wlen.constructor1(Math.cos(angle), Math.sin(angle));
					for(int32 i = int32(0); i < N; i += len;)
					{
							Complex w;
							for(int32 j = int32(0); j < len / 2; j++;)
							{
									Complex u = Complex(x.get(i + j));
									Complex v = Complex(w.multiply(x.get(i + j + len / 2)));
									x.set(i + j, u.add(v));
									x.set(i + j + len / 2, u.subtract(v));
									w = w.multiply(wlen);
							}
					}
			}
			/* Divide by N if we want the inverse FFT */

			if(inverse)
			{
					for(int32 i = int32(0); i < x.size(); i++;)
					{
							Complex z = Complex(x.get(i));
							x.set(i, z.divide(N));
					}
			}
	}

	/**
 * This function reverses the bits of a number. It is used in Cooley-Tukey FFT algorithm.
 *
 * <p>E.g. num = 13 = 00001101 in binary log2N = 8 Then reversed = 176 = 10110000 in binary
 *
 * <p>More info: https://cp-algorithms.com/algebra/fft.html
 * https://www.geeksforgeeks.org/write-an-efficient-c-program-to-reverse-bits-of-a-number/
 *
 * @param num The integer you want to reverse its bits.
 * @param log2N The number of bits you want to reverse.
 * @return The reversed number
 */

	function reverseBits(int32 num, int32 log2N) private returns(int32)
	{
			int32 reversed = int32(0);
			for(int32 i = int32(0); i < log2N; i++;)
			{
					if((num & (1 << i)) != 0)
					{
						reversed |= 1 << (log2N - 1 - i);					}
			}
			return reversed;
	}

	/**
 * This method pads an ArrayList with zeros in order to have a size equal to the next power of two
 * of the previous size.
 *
 * @param x The ArrayList to be padded.
 */

	function paddingPowerOfTwo(ArrayList x) private
	{
			int32 n = int32(1);
			int32 oldSize = int32(x.size());
			while(n < oldSize)
			{
				n *= 2;
			}
	}

}

