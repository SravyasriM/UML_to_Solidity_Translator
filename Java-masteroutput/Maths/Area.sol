pragma solidity 0.7.5;

//package Maths


/**
 * Find the area of various geometric shapes
 */

contract Area
{
	/**
 * Calculate the surface area of a cube.
 *
 * @param sideLength side length of cube
 * @return surface area of given cube
 */

	function surfaceAreaCube(int64 sideLength) private returns(int64)
	{
			return 6 * sideLength * sideLength;
	}

	/**
 * Calculate the surface area of a sphere.
 *
 * @param radius radius of sphere
 * @return surface area of given sphere
 */

	function surfaceAreaSphere(int64 radius) private returns(int64)
	{
			return 4 * Math.PI * radius * radius;
	}

	/**
 * Calculate the area of a rectangle
 *
 * @param length length of rectangle
 * @param width width of rectangle
 * @return area of given rectangle
 */

	function surfaceAreaRectangle(int64 length, int64 width) private returns(int64)
	{
			return length * width;
	}

	/**
 * Calculate the area of a square
 *
 * @param sideLength side length of square
 * @return area of given square
 */

	function surfaceAreaSquare(int64 sideLength) private returns(int64)
	{
			return sideLength * sideLength;
	}

	/**
 * Calculate the area of a triangle
 *
 * @param base base of triangle
 * @param height height of triangle
 * @return area of given triangle
 */

	function surfaceAreaTriangle(int64 base, int64 height) private returns(int64)
	{
			return base * height / 2;
	}

	/**
 * Calculate the area of a parallelogram
 *
 * @param base base of parallelogram
 * @param height height of parallelogram
 * @return area of given parallelogram
 */

	function surfaceAreaParallelogram(int64 base, int64 height) private returns(int64)
	{
			return base * height;
	}

	/**
 * Calculate the area of a trapezium
 *
 * @param base1 upper base of trapezium
 * @param base2 bottom base of trapezium
 * @param height height of trapezium
 * @return area of given trapezium
 */

	function surfaceAreaTrapezium(int64 base1, int64 base2, int64 height) private returns(int64)
	{
			return (base1 + base2) * height / 2;
	}

	/**
 * Calculate the area of a circle
 *
 * @param radius radius of circle
 * @return area of given circle
 */

	function surfaceAreaCircle(int64 radius) private returns(int64)
	{
			return Math.PI * radius * radius;
	}

}

library Area_Library
{
	function main(string[] memory args) public
	{
	}

	/**
 * Calculate the surface area of a cube.
 *
 * @param sideLength side length of cube
 * @return surface area of given cube
 */

	function surfaceAreaCube(int64 sideLength) private returns(int64)
	{
			return 6 * sideLength * sideLength;
	}

	/**
 * Calculate the surface area of a sphere.
 *
 * @param radius radius of sphere
 * @return surface area of given sphere
 */

	function surfaceAreaSphere(int64 radius) private returns(int64)
	{
			return 4 * Math.PI * radius * radius;
	}

	/**
 * Calculate the area of a rectangle
 *
 * @param length length of rectangle
 * @param width width of rectangle
 * @return area of given rectangle
 */

	function surfaceAreaRectangle(int64 length, int64 width) private returns(int64)
	{
			return length * width;
	}

	/**
 * Calculate the area of a square
 *
 * @param sideLength side length of square
 * @return area of given square
 */

	function surfaceAreaSquare(int64 sideLength) private returns(int64)
	{
			return sideLength * sideLength;
	}

	/**
 * Calculate the area of a triangle
 *
 * @param base base of triangle
 * @param height height of triangle
 * @return area of given triangle
 */

	function surfaceAreaTriangle(int64 base, int64 height) private returns(int64)
	{
			return base * height / 2;
	}

	/**
 * Calculate the area of a parallelogram
 *
 * @param base base of parallelogram
 * @param height height of parallelogram
 * @return area of given parallelogram
 */

	function surfaceAreaParallelogram(int64 base, int64 height) private returns(int64)
	{
			return base * height;
	}

	/**
 * Calculate the area of a trapezium
 *
 * @param base1 upper base of trapezium
 * @param base2 bottom base of trapezium
 * @param height height of trapezium
 * @return area of given trapezium
 */

	function surfaceAreaTrapezium(int64 base1, int64 base2, int64 height) private returns(int64)
	{
			return (base1 + base2) * height / 2;
	}

	/**
 * Calculate the area of a circle
 *
 * @param radius radius of circle
 * @return area of given circle
 */

	function surfaceAreaCircle(int64 radius) private returns(int64)
	{
			return Math.PI * radius * radius;
	}

}

