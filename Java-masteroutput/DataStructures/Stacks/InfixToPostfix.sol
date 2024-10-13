pragma solidity 0.7.5;

//package DataStructures.Stacks


import "java/util/Stack.sol";

contract InfixToPostfix
{
	function infix2PostFix(string infixExpression) public returns(String)
	{
			if(!BalancedBrackets.isBalanced(infixExpression);)
			{
			}
			StringBuilder output;
			Stack stack;
			while(!stack.isEmpty();)
			{
					output.append(stack.pop());

			}
			return output.toString();
	}

	function precedence(byte operator) private returns(int32)
	{
			do
			{
					bool void = bool(false);
					if(void || (operator == keccak256(abi.encode("+"))))
					{
							void = true;
					}
					if(void || (operator == keccak256(abi.encode("-"))))
					{
							void = true;
							return 0;
					}
					if(void || (operator == keccak256(abi.encode("*"))))
					{
							void = true;
					}
					if(void || (operator == keccak256(abi.encode("/"))))
					{
							void = true;
							return 1;
					}
					if(void || (operator == keccak256(abi.encode("^"))))
					{
							void = true;
							return 2;
					}
						return -1;


			}while(false);
	}

	int private oc_id;

	bool private oc_status;

	constructor(int _oc_id) public
	{
			oc_id = _oc_id;
			oc_status = false;
	}

	modifier overloadedConstructor(int _oc_id)
	{
			require(oc_id == _oc_id, "Restricted for Overloaded Constructor");
			require(oc_status == false, "Restricted for only One Time Execution");
			_;
			oc_status = true;
	}

	// Main cnstructor.

	function constructor1() internal	overloadedConstructor( 1 )
	{
			initialize();
	}

	/**
 * constructor
 *
 * @param capacity the starting length of the desired array
 */

	function constructor2(int32 capacity) public	overloadedConstructor( 2 )
	{
			DynamicArray.size = 0;
			DynamicArray.capacity = capacity;
			DynamicArray.elements = new Object[](DynamicArray.capacity);
	}

	/**
 * No-args constructor
 */

	function constructor3() public	overloadedConstructor( 3 )
	{
			DynamicArray.size = 0;
			DynamicArray.capacity = 10;
			DynamicArray.elements = new Object[](DynamicArray.capacity);
	}

}

library InfixToPostfix_Library
{
	function main(string[] memory args) public
	{
			Hanoi tower;
			int32 number = int32(Integer.parseInt(args[uint256(0)]));
			tower.number_of_disks = number;
			tower.startGame();
	}

	/**
 * This class is the driver for the DynamicArray<E> class it tests a variety of methods and prints
 * the output
 */

	function main(string[] memory args) public
	{
			DynamicArray names;
			names.add("Peubes");
			names.add("Marley");
			for(uint256 iterator_var = uint256(0); iterator_var < names.length; iterator_var++;)
			{
					string name = string(names[uint256(iterator_var)]);
					System.out.println(name);
			}
			System.out.println(names);
			System.out.println(names.getSize());
			names.remove(0);
			for(uint256 iterator_var = uint256(0); iterator_var < names.length; iterator_var++;)
			{
					string name = string(names[uint256(iterator_var)]);
					System.out.println(name);
			}
	}

	function main(string[] memory args) public
	{
	}

	function infix2PostFix(string infixExpression) public returns(String)
	{
			if(!BalancedBrackets.isBalanced(infixExpression);)
			{
			}
			StringBuilder output;
			Stack stack;
			while(!stack.isEmpty();)
			{
					output.append(stack.pop());

			}
			return output.toString();
	}

	function precedence(byte operator) private returns(int32)
	{
			do
			{
					bool void = bool(false);
					if(void || (operator == keccak256(abi.encode("+"))))
					{
							void = true;
					}
					if(void || (operator == keccak256(abi.encode("-"))))
					{
							void = true;
							return 0;
					}
					if(void || (operator == keccak256(abi.encode("*"))))
					{
							void = true;
					}
					if(void || (operator == keccak256(abi.encode("/"))))
					{
							void = true;
							return 1;
					}
					if(void || (operator == keccak256(abi.encode("^"))))
					{
							void = true;
							return 2;
					}
						return -1;


			}while(false);
	}

}

