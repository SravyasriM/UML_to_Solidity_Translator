pragma solidity 0.7.5;

//package DataStructures.HashMap.Hashing


import "java/util/Scanner.sol";

contract MainLinearProbing
{
}

library MainLinearProbing_Library
{
	function main(string[] memory args) public
	{
			int32 choice;
			HashMapLinearProbing h = new HashMapLinearProbing(7);
			Scanner In;
			while(true)
			{
					System.out.println("Enter your Choice :");
					System.out.println("1. Add Key");
					System.out.println("2. Delete Key");
					System.out.println("3. Print Table");
					System.out.println("4. Exit");
					System.out.println("5. Search and print key index");
					System.out.println("6. Check load factor");
					choice = In.nextInt();
					do
					{
							bool void = bool(false);
							if(void || (choice == 1))
							{
									void = true;
										System.out.println("Enter the Key: ");
										key = In.nextInt();
										h.insertHash(key);
										break;

							}
							if(void || (choice == 2))
							{
									void = true;
										System.out.println("Enter the Key delete:  ");
										key = In.nextInt();
										h.deleteHash(key);
										break;

							}
							if(void || (choice == 3))
							{
									void = true;
										System.out.println("Print table");
										h.displayHashtable();
										break;

							}
							if(void || (choice == 4))
							{
									void = true;
										In.close();
										return 

							}
							if(void || (choice == 5))
							{
									void = true;
										System.out.println("Enter the Key to find and print:  ");
										key = In.nextInt();
										break;

							}
							if(void || (choice == 6))
							{
									void = true;
										h.checkLoadFactor();
										break;

							}

					}while(false);

			}
	}

}

