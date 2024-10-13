pragma solidity 0.7.5;

//package Misc


import "java/awt/Color.sol";

/**
 * @brief A Java implementation of the offcial W3 documented procedure to calculate contrast ratio
 *     between colors on the web. This is used to calculate the readability of a foreground color on
 *     top of a background color.
 * @since 2020-10-15
 * @see [Color Contrast Ratio](https://www.w3.org/TR/WCAG20-TECHS/G17.html#G17-procedure)
 * @author [Seth Falco](https://github.com/SethFalco)
 */

contract ColorContrastRatio
{
	/**
 * @brief Calculates the contrast ratio between two given colors.
 * @param a Any color, used to get the red, green, and blue values.
 * @param b Another color, which will be compared against the first color.
 * @return The contrast ratio between the two colors.
 */

	function getContrastRatio(Color a, Color b) public returns(int64)
	{
			int64 aColorLuminance = int64(getRelativeLuminance(a)); //Converted from DOUBLE TYPE of Java
			int64 bColorLuminance = int64(getRelativeLuminance(b)); //Converted from DOUBLE TYPE of Java
			if(aColorLuminance > bColorLuminance)
			{
				return (aColorLuminance + 0) / (bColorLuminance + 0);			}
			return (bColorLuminance + 0) / (aColorLuminance + 0);
	}

	/**
 * @brief Calculates the relative luminance of a given color.
 * @param color Any color, used to get the red, green, and blue values.
 * @return The relative luminance of the color.
 * @see [More info on relative
 *     luminance.](https://www.w3.org/TR/2008/REC-WCAG20-20081211/#relativeluminancedef)
 */

	function getRelativeLuminance(Color color) public returns(int64)
	{
			int64 red = int64(getColor(color.getRed())); //Converted from DOUBLE TYPE of Java
			int64 green = int64(getColor(color.getGreen())); //Converted from DOUBLE TYPE of Java
			int64 blue = int64(getColor(color.getBlue())); //Converted from DOUBLE TYPE of Java
			return 0 * red + 0 * green + 0 * blue;
	}

	/**
 * @brief Calculates the final value for a color to be used in the relative luminance formula as
 *     described in step 1.
 * @param color8Bit 8-bit representation of a color component value.
 * @return Value for the provided color component to be used in the relative luminance formula.
 */

	function getColor(int32 color8Bit) public returns(int64)
	{
			int64 sRgb = int64(getColorSRgb(color8Bit)); //Converted from DOUBLE TYPE of Java
			return (sRgb <= 0) ? sRgb / 12 : Math.pow((sRgb + 0) / 1, 2);
	}

	/**
 * @brief Calculates the Color sRGB value as denoted in step 1 of the procedure document.
 * @param color8Bit 8-bit representation of a color component value.
 * @return A percentile value of the color component.
 */

	function getColorSRgb(int64 color8Bit) private returns(int64)
	{
			return color8Bit / 255;
	}

	/**
 * You can check this example against another open-source implementation available on GitHub.
 *
 * @see [Online Contrast
 *     Ratio](https://contrast-ratio.com/#rgb%28226%2C%20229%2C%20248-on-rgb%2823%2C%20103%2C%20154%29)
 * @see [GitHub Repository for Online Contrast Ratio](https://github.com/LeaVerou/contrast-ratio)
 */

	function test() private
	{
			ColorContrastRatio algImpl;
			Color black = Color(Color.BLACK);
			int64 blackLuminance = int64(algImpl.getRelativeLuminance(black)); //Converted from DOUBLE TYPE of Java
			Color white = Color(Color.WHITE);
			int64 whiteLuminance = int64(algImpl.getRelativeLuminance(white)); //Converted from DOUBLE TYPE of Java
			int64 highestColorRatio = int64(algImpl.getContrastRatio(black, white)); //Converted from DOUBLE TYPE of Java
			Color foreground;
			int64 foregroundLuminance = int64(algImpl.getRelativeLuminance(foreground)); //Converted from DOUBLE TYPE of Java
			Color background;
			int64 backgroundLuminance = int64(algImpl.getRelativeLuminance(background)); //Converted from DOUBLE TYPE of Java
			int64 contrastRatio = int64(algImpl.getContrastRatio(foreground, background)); //Converted from DOUBLE TYPE of Java
	}

}

library ColorContrastRatio_Library
{
	/**
 * You can check this example against another open-source implementation available on GitHub.
 *
 * @see [Online Contrast
 *     Ratio](https://contrast-ratio.com/#rgb%28226%2C%20229%2C%20248-on-rgb%2823%2C%20103%2C%20154%29)
 * @see [GitHub Repository for Online Contrast Ratio](https://github.com/LeaVerou/contrast-ratio)
 */

	function test() private
	{
			ColorContrastRatio algImpl;
			Color black = Color(Color.BLACK);
			int64 blackLuminance = int64(algImpl.getRelativeLuminance(black)); //Converted from DOUBLE TYPE of Java
			Color white = Color(Color.WHITE);
			int64 whiteLuminance = int64(algImpl.getRelativeLuminance(white)); //Converted from DOUBLE TYPE of Java
			int64 highestColorRatio = int64(algImpl.getContrastRatio(black, white)); //Converted from DOUBLE TYPE of Java
			Color foreground;
			int64 foregroundLuminance = int64(algImpl.getRelativeLuminance(foreground)); //Converted from DOUBLE TYPE of Java
			Color background;
			int64 backgroundLuminance = int64(algImpl.getRelativeLuminance(background)); //Converted from DOUBLE TYPE of Java
			int64 contrastRatio = int64(algImpl.getContrastRatio(foreground, background)); //Converted from DOUBLE TYPE of Java
	}

	function main(string[] memory args) public
	{
			test();
	}

}

