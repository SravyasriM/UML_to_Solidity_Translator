pragma solidity 0.7.5;

//package DataStructures.HashMap.Hashing


import "java/util/Scanner.sol";

contract Main
{
}

library Main_Library
{
	function main(string[] memory args) public
	{
			int32 choice;
			HashMap h;
			Scanner In;
			while(true)
			{
					System.out.println("Enter your Choice :");
					System.out.println("1. Add Key");
					System.out.println("2. Delete Key");
					System.out.println("3. Print Table");
					System.out.println("4. Exit");
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

					}while(false);

			}
	}

}

