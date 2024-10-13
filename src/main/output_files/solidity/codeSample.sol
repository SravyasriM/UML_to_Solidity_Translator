pragma solidity ^0.5.11;

import "java/io/IOException.sol";

import "java/util/Scanner.sol";

contract Student
{
	int32 rollNumber;

	int32 age;

	bool ok;

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

	function constructor1(int32 _age) public	overloadedConstructor( 1 )
	{
			age = _age;
	}

	function constructor2(string _name) public	overloadedConstructor( 2 )
	{
			int32 day = int32(2);
			string memory dayString;
			do
			{
					bool void = bool(false);
					if(void || (day == 1))
					{
							void = true;
							dayString = "Monday";
							break;
					}
					if(void || (day == 2))
					{
							void = true;
							dayString = "Tuesday";
					}
					if(void || (day == 3))
					{
							void = true;
							dayString = "Wednesday";
							break;
					}
						dayString = "Invalid day";


			}while(false);
			string memory x = string("Hello");
			string memory y = string("hello");
			if(keccak256(abi.encode(x)) == keccak256(abi.encode(y)));
	}

	function constructor3(int32 _age, int32 _rollNumber) public	overloadedConstructor( 3 )
	{
			age = _age;
			rollNumber = _rollNumber;
	}

	function constructor4(bool _ok) public	overloadedConstructor( 4 )
	{
			ok = _ok;
	}

}

interface A
{
// 	int32 immutable x = int32(5);

// 	int32 immutable y = int32(10);

/*
	function funA(int32 x, int32 y) public
	{
			int32 k;
	}
*/

	function funA1(string s) virtual external;

/*
	function funA2(int32 x, string y) public
	{
			int32 k2;
	}
*/

}

interface B
{
// 	int32 immutable w = int32(4);

// 	int32 immutable u = int32(2);

	function funB() virtual external;

}

interface C is B
{
// 	int32 immutable z = int32(9);

}

contract IntefaceExample is A, C
{
	function funB() override public
	{
				//try

					int32 t = int32(0);
					int32 tdiv = int32(5 / t);

				/* catch (IOException e) {
    int ca;
}*/

				/* catch (Exception e) {
    int cab;
}*/

				//finally

					int32 fin;


	}

	function funA1(string s) override public
	{
			s = "Rahul";
	}

	function funA2(int32 x, string y) public
	{
			int32 k3 = int32(0);
	}

	int32 immutable x = int32(5);

	int32 immutable y = int32(10);

	int32 immutable z = int32(9);

	int32 immutable w = int32(4);

	int32 immutable u = int32(2);

	function funA(int32 x, int32 y) public
	{
			int32 k;
	}

}

abstract contract Base
{
	function fun(int32 x1, int32 y1) virtual external;

	int32 public  x;

	int32 public  y;

}

contract Derived is Base
{
	function fun(int32 x1, int32 y1) override public
	{
			int32 a = int32(0);
	}

}

