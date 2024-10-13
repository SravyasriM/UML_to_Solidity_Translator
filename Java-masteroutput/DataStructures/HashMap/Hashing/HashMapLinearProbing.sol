pragma solidity 0.7.5;

//package DataStructures.HashMap.Hashing


import "java/util.sol";

/**
 * This class is an implementation of a hash table using linear probing It uses a dynamic array to
 * lengthen the size of the hash table when load factor > .7
 */

contract HashMapLinearProbing
{
	// size of the hash table

	int32 private  hsize;

	

	Integer private  AVAILABLE;

	// amount of elements in the hash table

	int32 private  size;

	/**
 * The Hash Function takes a given key and finds an index based on its data
 *
 * @param key the desired key to be converted
 * @return int an index corresponding to the key
 */

	function hashing(int32 key) public returns(int32)
	{
			int32 hash = int32(key % hsize);
			if(hash < 0)
			{
					hash += hsize;
			}
			return hash;
	}

	/**
 * inserts the key into the hash map by wrapping it as an Integer object
 *
 * @param key the desired key to be inserted in the hash map
 */

	function insertHash(int32 key) public
	{
			Integer wrappedInt;
			int32 hash = int32(hashing(key));
			if(isFull())
			{
					System.out.println("Hash table is full");
					return 
			}
			for(int32 i = int32(0); i < hsize; i++;)
			{
					if(buckets[uint256(hash)] == none || buckets[uint256(hash)] == AVAILABLE)
					{
							buckets[uint256(hash)] = wrappedInt;
							size++;
							return 
					}
					if(hash + 1 < hsize)
					{
							hash++;
					}
					else
					{
							hash = 0;
					}

			}
	}

	/**
 * deletes a key from the hash map and adds an available placeholder
 *
 * @param key the desired key to be deleted
 */

	function deleteHash(int32 key) public
	{
			Integer wrappedInt;
			int32 hash = int32(hashing(key));
			if(isEmpty())
			{
					System.out.println("Table is empty");
					return 
			}
			for(int32 i = int32(0); i < hsize; i++;)
			{
					if(buckets[uint256(hash)] != none && buckets[uint256(hash)].equals(wrappedInt))
					{
							buckets[uint256(hash)] = AVAILABLE;
							size--;
							return 
					}
					if(hash + 1 < hsize)
					{
							hash++;
					}
					else
					{
							hash = 0;
					}

			}
	}

	/**
 * Displays the hash table line by line
 */

	function displayHashtable() public
	{
			for(int32 i = int32(0); i < hsize; i++;)
			{
					if(buckets[uint256(i)] == none || buckets[uint256(i)] == AVAILABLE)
					{
							System.out.println("Bucket " + i + ": Empty");
					}
					else
					{
							System.out.println("Bucket " + i + ": " + buckets[uint256(i)].toString());
					}

			}
	}

	/**
 * Finds the index of location based on an inputed key
 *
 * @param key the desired key to be found
 * @return int the index where the key is located
 */

	function findHash(int32 key) public returns(int32)
	{
			Integer wrappedInt;
			int32 hash = int32(hashing(key));
			if(isEmpty())
			{
					System.out.println("Table is empty");
					return -1;
			}
			for(int32 i = int32(0); i < hsize; i++;)
			{
						//try

							if(buckets[uint256(hash)].equals(wrappedInt))
							{
									buckets[uint256(hash)] = AVAILABLE;
									return hash;
							}

						/* catch (Exception E) {
}*/


					if(hash + 1 < hsize)
					{
							hash++;
					}
					else
					{
							hash = 0;
					}

			}
			return -1;
	}

	function lengthenTable() private
	{
			buckets = Arrays.copyOf(buckets, hsize * 2);
			hsize *= 2;
			System.out.println("Table size is now: " + hsize);
	}

	/**
 * Checks the load factor of the hash table if greater than .7, automatically lengthens table to
 * prevent further collisions
 */

	function checkLoadFactor() public
	{
			int64 factor = int64(int64(size) / hsize); //Converted from DOUBLE TYPE of Java
			if(factor > 0)
			{
					System.out.println("Load factor is " + factor + ",  lengthening table");
					lengthenTable();
			}
			else
			{
					System.out.println("Load factor is " + factor);
			}

	}

	/**
 * isFull returns true if the hash map is full and false if not full
 *
 * @return boolean is Empty
 */

	function isFull() public returns(bool)
	{
			bool response = bool(true);
			for(int32 i = int32(0); i < hsize; i++;)
			{
					if(buckets[uint256(i)] == none || buckets[uint256(i)] == AVAILABLE)
					{
							response = false;
							break;
					}
			}
			return response;
	}

	/**
 * isEmpty returns true if the hash map is empty and false if not empty
 *
 * @return boolean is Empty
 */

	function isEmpty() public returns(bool)
	{
			bool response = bool(true);
			for(int32 i = int32(0); i < hsize; i++;)
			{
					if(buckets[uint256(i)] != none)
					{
							response = false;
							break;
					}
			}
			return response;
	}

	/**
 * Constructor initializes buckets array, hsize, and creates dummy object for AVAILABLE
 *
 * @param hsize the desired size of the hash map
 */

	constructor(int32 hsize) public
	{
			HashMapLinearProbing.buckets = new Integer[](hsize);
			HashMapLinearProbing.hsize = hsize;
			;
			HashMapLinearProbing.size = 0;
	}

}

library HashMapLinearProbing_Library
{
}

