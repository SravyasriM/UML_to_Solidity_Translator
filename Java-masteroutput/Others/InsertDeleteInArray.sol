pragma solidity 0.7.5;

//package Others


import "java/util.sol";

contract InsertDeleteInArray
{
}

library InsertDeleteInArray_Library
{
	function main(string[] memory args) public
	{
			// Input statement

			Scanner s;
			System.out.println("Enter the size of the array");
			int32 size = int32(s.nextInt());
			int32 i;
			// To enter the initial elements

			for(i = 0; i < size; i++;)
			{
					System.out.println("Enter the element");
					a[uint256(i)] = s.nextInt();
			}
			// To insert a new element(we are creating a new array)

			System.out.println("Enter the index at which the element should be inserted");
			int32 insert_pos = int32(s.nextInt());
			System.out.println("Enter the element to be inserted");
			int32 ins = int32(s.nextInt());
			int32 size2 = int32(size + 1);
			for(i = 0; i < size2; i++;)
			{
					if(i <= insert_pos)
					{
							b[uint256(i)] = a[uint256(i)];
					}
					else
					{
							b[uint256(i)] = a[uint256(i - 1)];
					}

			}
			b[uint256(insert_pos)] = ins;
			for(i = 0; i < size2; i++;)
			{
					System.out.println(b[uint256(i)]);
			}
			// To delete an element given the index

			System.out.println("Enter the index at which element is to be deleted");
			int32 del_pos = int32(s.nextInt());
			for(i = del_pos; i < size2 - 1; i++;)
			{
					b[uint256(i)] = b[uint256(i + 1)];
			}
			for(i = 0; i < size2 - 1; i++;)
			{
				System.out.println(b[uint256(i)]);			}
			s.close();
	}

}

