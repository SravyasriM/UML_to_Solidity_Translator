pragma solidity 0.7.5;

//package Others


import "java/util.sol";

contract StackPostfixNotation
{
	// Evaluates the given postfix expression string and returns the result.

	function postfixEvaluate(string exp) public returns(int32)
	{
			Stack s;
			Scanner tokens;
			while(tokens.hasNext())
			{
					if(tokens.hasNextInt())
					{
							// If int then push to stack

							s.push(tokens.nextInt());
					}
					else
					{
							// else pop top two values and perform the operation

							int32 num2 = int32(s.pop());
							int32 num1 = int32(s.pop());
							string memory op = string(tokens.next());
							if(op.equals("+"))
							{
									s.push(num1 + num2);
							}
							else
							{
								if(op.equals("-"))
								{
										s.push(num1 - num2);
								}
								else
								{
									if(op.equals("*"))
									{
											s.push(num1 * num2);
									}
									else
									{
											s.push(num1 / num2);
									}
								}
							}

					}


			}
			tokens.close();
			return s.pop();
	}

}

library StackPostfixNotation_Library
{
	function main(string[] memory args) public
	{
			Scanner scanner;
			// Takes input with spaces in between eg. "1 21 +"

			string memory post = string(scanner.nextLine());
			System.out.println(postfixEvaluate(post));
			scanner.close();
	}

	// Evaluates the given postfix expression string and returns the result.

	function postfixEvaluate(string exp) public returns(int32)
	{
			Stack s;
			Scanner tokens;
			while(tokens.hasNext())
			{
					if(tokens.hasNextInt())
					{
							// If int then push to stack

							s.push(tokens.nextInt());
					}
					else
					{
							// else pop top two values and perform the operation

							int32 num2 = int32(s.pop());
							int32 num1 = int32(s.pop());
							string memory op = string(tokens.next());
							if(op.equals("+"))
							{
									s.push(num1 + num2);
							}
							else
							{
								if(op.equals("-"))
								{
										s.push(num1 - num2);
								}
								else
								{
									if(op.equals("*"))
									{
											s.push(num1 * num2);
									}
									else
									{
											s.push(num1 / num2);
									}
								}
							}

					}


			}
			tokens.close();
			return s.pop();
	}

}

