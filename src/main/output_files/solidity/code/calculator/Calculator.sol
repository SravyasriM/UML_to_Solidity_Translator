pragma solidity ^0.5.11;

//package calculator


import "calculator/addition/Addition.sol";

import "calculator/substraction/Substraction.sol";

import "calculator/multiplication.sol";

import "calculator/division/Division.sol";

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
	}

}

