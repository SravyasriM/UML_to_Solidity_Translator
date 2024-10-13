pragma solidity 0.7.5;

//package Sorts


import "java/util/ArrayList.sol";

import "java/util/Collections.sol";

import "java/util/List.sol";

import "java/util/Random.sol";

/**
 * Wikipedia: https://en.wikipedia.org/wiki/Bucket_sort
 */

contract BucketSort
{
	/**
 * Get index of bucket which of our elements gets placed into it.
 *
 * @param elem the element of array to be sorted
 * @param min min value of array
 * @param numberOfBucket the number of bucket
 * @return index of bucket
 */

	function hash(int32 elem, int32 min, int32 numberOfBucket) private returns(int32)
	{
			return (elem - min) / numberOfBucket;
	}

}

library BucketSort_Library
{
	function main(string[] memory args) public
	{
			/* generate 10 random numbers from -50 to 49 */

			Random random;
			for(int32 i = int32(0); i < arr.length; ++i;)
			{
					arr[uint256(i)] = random.nextInt(100) - 50;
			}
			bucketSort(arr);
			/* check array is sorted or not */

			for(int32 i = int32(0); i < limit; ++i;)
			{
			}
	}

	/**
 * BucketSort algorithms implements
 *
 * @param arr the array contains elements
 */

	function bucketSort(int32[] memory arr) private
	{
			/* get max value of arr */

			int32 max = int32(max(arr));
			/* get min value of arr */

			int32 min = int32(min(arr));
			/* number of buckets */

			int32 numberOfBuckets = int32(max - min + 1);
			List buckets;
			/* init buckets */

			for(int32 i = int32(0); i < numberOfBuckets; ++i;)
			{
			}
			/* store elements to buckets */

			for(uint256 iterator_var = uint256(0); iterator_var < arr.length; iterator_var++;)
			{
					int32 value = int32(arr[uint256(iterator_var)]);
					int32 hash = int32(hash(value, min, numberOfBuckets));
					buckets.get(hash).add(value);
			}
			/* sort individual bucket */

			for(uint256 iterator_var = uint256(0); iterator_var < buckets.length; iterator_var++;)
			{
					List bucket = List(buckets[uint256(iterator_var)]);
					Collections.sort(bucket);
			}
			/* concatenate buckets to origin array */

			int32 index = int32(0);
			for(uint256 iterator_var = uint256(0); iterator_var < buckets.length; iterator_var++;)
			{
					List bucket = List(buckets[uint256(iterator_var)]);
					for(uint256 iterator_var = uint256(0); iterator_var < bucket.length; iterator_var++;)
					{
							int32 value = int32(bucket[uint256(iterator_var)]);
							arr[uint256(index++;)] = value
					}
			}
	}

	/**
 * Get index of bucket which of our elements gets placed into it.
 *
 * @param elem the element of array to be sorted
 * @param min min value of array
 * @param numberOfBucket the number of bucket
 * @return index of bucket
 */

	function hash(int32 elem, int32 min, int32 numberOfBucket) private returns(int32)
	{
			return (elem - min) / numberOfBucket;
	}

	/**
 * Calculate max value of array
 *
 * @param arr the array contains elements
 * @return max value of given array
 */

	function max(int32[] memory arr) public returns(int32)
	{
			int32 max = int32(arr[uint256(0)]);
			for(uint256 iterator_var = uint256(0); iterator_var < arr.length; iterator_var++;)
			{
					int32 value = int32(arr[uint256(iterator_var)]);
					if(value > max)
					{
							max = value;
					}
			}
			return max;
	}

	/**
 * Calculate min value of array
 *
 * @param arr the array contains elements
 * @return min value of given array
 */

	function min(int32[] memory arr) public returns(int32)
	{
			int32 min = int32(arr[uint256(0)]);
			for(uint256 iterator_var = uint256(0); iterator_var < arr.length; iterator_var++;)
			{
					int32 value = int32(arr[uint256(iterator_var)]);
					if(value < min)
					{
							min = value;
					}
			}
			return min;
	}

}

