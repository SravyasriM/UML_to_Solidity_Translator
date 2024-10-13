pragma solidity 0.7.5;

//package com.maths


import "java/util/ArrayList.sol";

/**
 * Class for linear convolution of two discrete signals using the convolution theorem.
 *
 * @author Ioannis Karavitsis
 * @version 1.0
 */

contract ConvolutionFFT
{
	/**
 * This method pads the signal with zeros until it reaches the new size.
 *
 * @param x The signal to be padded.
 * @param newSize The new size of the signal.
 */

	function padding(ArrayList x, int32 newSize) private
	{
			if(x.size() < newSize)
			{
					int32 diff = newSize - x.size();
					for(
			}
	}

	/**
 * Discrete linear convolution function. It uses the convolution theorem for discrete signals
 * convolved: = IDFT(DFT(a)*DFT(b)). This is true for circular convolution. In order to get the
 * linear convolution of the two signals we first pad the two signals to have the same size equal
 * to the convolved signal (a.size() + b.size() - 1). Then we use the FFT algorithm for faster
 * calculations of the two DFTs and the final IDFT.
 *
 * <p>More info: https://en.wikipedia.org/wiki/Convolution_theorem
 * https://ccrma.stanford.edu/~jos/ReviewFourier/FFT_Convolution.html
 *
 * @param a The first signal.
 * @param b The other signal.
 * @return The convolved signal.
 */

	function convolutionFFT(ArrayList a, ArrayList b) public returns(ArrayList)
	{
			// The size of the convolved signal

			int32 convolvedSize = int32(a.size() + b.size() - 1);
			// Zero padding both signals

			padding(a, convolvedSize);
			padding(b, convolvedSize);
			/* Find the FFTs of both signals (Note that the size of the FFTs will be bigger than the convolvedSize because of the extra zero padding in FFT algorithm) */

			FFT.fft(a, false);
			FFT.fft(b, false);
			ArrayList convolved;
			// FFT(a)*FFT(b)

			for(int32 i = int32(0); i < a.size(); i++;)
			{
				convolved.add(a.get(i).multiply(b.get(i)));			}
			// IFFT

			FFT.fft(convolved, true);
			convolved.subList(convolvedSize, convolved.size()).clear();
			return convolved;
	}

}

library ConvolutionFFT_Library
{
	/**
 * This method pads the signal with zeros until it reaches the new size.
 *
 * @param x The signal to be padded.
 * @param newSize The new size of the signal.
 */

	function padding(ArrayList x, int32 newSize) private
	{
			if(x.size() < newSize)
			{
					int32 diff = newSize - x.size();
					for(
			}
	}

	/**
 * Discrete linear convolution function. It uses the convolution theorem for discrete signals
 * convolved: = IDFT(DFT(a)*DFT(b)). This is true for circular convolution. In order to get the
 * linear convolution of the two signals we first pad the two signals to have the same size equal
 * to the convolved signal (a.size() + b.size() - 1). Then we use the FFT algorithm for faster
 * calculations of the two DFTs and the final IDFT.
 *
 * <p>More info: https://en.wikipedia.org/wiki/Convolution_theorem
 * https://ccrma.stanford.edu/~jos/ReviewFourier/FFT_Convolution.html
 *
 * @param a The first signal.
 * @param b The other signal.
 * @return The convolved signal.
 */

	function convolutionFFT(ArrayList a, ArrayList b) public returns(ArrayList)
	{
			// The size of the convolved signal

			int32 convolvedSize = int32(a.size() + b.size() - 1);
			// Zero padding both signals

			padding(a, convolvedSize);
			padding(b, convolvedSize);
			/* Find the FFTs of both signals (Note that the size of the FFTs will be bigger than the convolvedSize because of the extra zero padding in FFT algorithm) */

			FFT.fft(a, false);
			FFT.fft(b, false);
			ArrayList convolved;
			// FFT(a)*FFT(b)

			for(int32 i = int32(0); i < a.size(); i++;)
			{
				convolved.add(a.get(i).multiply(b.get(i)));			}
			// IFFT

			FFT.fft(convolved, true);
			convolved.subList(convolvedSize, convolved.size()).clear();
			return convolved;
	}

}

