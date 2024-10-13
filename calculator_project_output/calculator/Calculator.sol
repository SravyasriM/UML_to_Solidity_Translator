pragma solidity 0.7.5;

//package calculator


import "addition/Addition.sol";

import "substraction/Substraction.sol";

import "multiplication/Multiplication.sol";

import "multiplication/MultiplicationLoop.sol";

import "division/Division.sol";

contract Calculator
{
	function calculate() public
	{
			int32 a = int32(5);
			int32 b = int32(2);
			int32 c = int32(Addition.add(a, b));
			int32 d = int32(Substraction.subtract(a, b));
			int32 e = int32(Multiplication.multiply(a, b));
			int32 f = int32(Division.divide(a, b));
			int32 g = int32(MultiplicationLoop.multiply(a, b));
			int32 h = int32(c + d + e + f + g);
			Addition ad;
			int32 j = int32(ad.add(a, 5));
			int32 xyz;
	}

}

library Calculator_Library
{
	function calculate() public
	{
			int32 a = int32(5);
			int32 b = int32(2);
			int32 c = int32(Addition.add(a, b));
			int32 d = int32(Substraction.subtract(a, b));
			int32 e = int32(Multiplication.multiply(a, b));
			int32 f = int32(Division.divide(a, b));
			int32 g = int32(MultiplicationLoop.multiply(a, b));
			int32 h = int32(c + d + e + f + g);
			Addition ad;
			int32 j = int32(ad.add(a, 5));
			int32 xyz;
	}

}

contract MiniCalc
{
	function fun() public
	{
			Calculator cal = new Calculator();
			cal.calculate();
	}

}

library MiniCalc_Library
{
}

