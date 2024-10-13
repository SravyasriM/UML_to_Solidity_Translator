pragma solidity 0.7.5;

//package DataStructures.HashMap.Hashing


contract HashMap
{
	int32 private  hsize;

	

	function hashing(int32 key) public returns(int32)
	{
			int32 hash = int32(key % hsize);
			if(hash < 0)
			{
				hash += hsize;			}
			return hash;
	}

	function insertHash(int32 key) public
	{
			int32 hash = int32(hashing(key));
			buckets[uint256(hash)].insert(key);
	}

	function deleteHash(int32 key) public
	{
			int32 hash = int32(hashing(key));
			buckets[uint256(hash)].delete(key);
	}

	function displayHashtable() public
	{
			for(int32 i = int32(0); i < hsize; i++;)
			{
					System.out.printf("Bucket %d :", i);
					System.out.println(buckets[uint256(i)].display());
			}
	}

}

library HashMap_Library
{
}

