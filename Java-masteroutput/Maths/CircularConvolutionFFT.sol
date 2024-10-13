pragma solidity 0.7.5;

//package com.maths


import "java/util/ArrayList.sol";

/**
 * Class for circular convolution of two discrete signals using the convolution theorem.
 *
 * @author Ioannis Karavitsis
 * @version 1.0
 */

contract CircularConvolutionFFT
{
	/**
 * This method pads the signal with zeros until it reaches the new size.
 *
 * @param x The signal to be padded.
 * @param newSize The new size of the signal.
 */

	function padding(ArrayList x, int32 newSize) private
	{
	}

	/**
 * Discrete circular convolution function. It uses the convolution theorem for discrete signals:
 * convolved = IDFT(DFT(a)*DFT(b)). Then we use the FFT algorithm for faster calculations of the
 * two DFTs and the final IDFT.
 *
 * <p>More info: https://en.wikipedia.org/wiki/Convolution_theorem
 *
 * @param a The first signal.
 * @param b The other signal.
 * @return The convolved signal.
 */

	function fftCircularConvolution(ArrayList a, ArrayList b) public returns(ArrayList)
	{
			int32 convolvedSize = int32(Math.max(1));
			convolvedSize.constructor1(a.size(), // The two signals must have the same size equal to the bigger one

b.size());
			// Zero padding the smaller signal

			padding(a, convolvedSize);
			padding(b, convolvedSize);
			/* Find the FFTs of both signal. Here we use the Bluestein algorithm because we want the FFT to have the same length with the signal and not bigger */

			FFTBluestein.fftBluestein(a, false);
			FFTBluestein.fftBluestein(b, false);
			ArrayList convolved;
			// FFT(a)*FFT(b)

			for(int32 i = int32(0); i < a.size(); i++;)
			{
				convolved.add(a.get(i).multiply(b.get(i)));			}
			// IFFT

			FFTBluestein.fftBluestein(convolved, true);
			return convolved;
	}

}

library CircularConvolutionFFT_Library
{
	/**
 * This method pads the signal with zeros until it reaches the new size.
 *
 * @param x The signal to be padded.
 * @param newSize The new size of the signal.
 */

	function padding(ArrayList x, int32 newSize) private
	{
	}

	/**
 * Discrete circular convolution function. It uses the convolution theorem for discrete signals:
 * convolved = IDFT(DFT(a)*DFT(b)). Then we use the FFT algorithm for faster calculations of the
 * two DFTs and the final IDFT.
 *
 * <p>More info: https://en.wikipedia.org/wiki/Convolution_theorem
 *
 * @param a The first signal.
 * @param b The other signal.
 * @return The convolved signal.
 */

	function fftCircularConvolution(ArrayList a, ArrayList b) public returns(ArrayList)
	{
			int32 convolvedSize = int32(Math.max(1));
			convolvedSize.constructor1(a.size(), // The two signals must have the same size equal to the bigger one

b.size());
			// Zero padding the smaller signal

			padding(a, convolvedSize);
			padding(b, convolvedSize);
			/* Find the FFTs of both signal. Here we use the Bluestein algorithm because we want the FFT to have the same length with the signal and not bigger */

			FFTBluestein.fftBluestein(a, false);
			FFTBluestein.fftBluestein(b, false);
			ArrayList convolved;
			// FFT(a)*FFT(b)

			for(int32 i = int32(0); i < a.size(); i++;)
			{
				convolved.add(a.get(i).multiply(b.get(i)));			}
			// IFFT

			FFTBluestein.fftBluestein(convolved, true);
			return convolved;
	}

}

