pragma solidity 0.7.5;

//package Misc


import "java/util.sol";

contract RangeInSortedArray
{
}

library RangeInSortedArray_Library
{
	function main(string[] memory args) public
	{
	}

	// Gives [-1, -1] in case element doesn't exist in array

	function sortedRange(int32[] memory nums, int32 key) public returns(

	// 'key'

	function alteredBinSearch(int32[] memory nums, int32 key, int32 left, int32 right, int32[] memory range, bool goLeft) public
	{
			if(left > right)
			{
				return 			}
			int32 mid = int32((left + right) / 2);
			if(nums[uint256(mid)] > key)
			{
				alteredBinSearch(nums, key, left, mid - 1, range, goLeft);			}
			else
			{
				if(nums[uint256(mid)] < key)
				{
					alteredBinSearch(nums, key, mid + 1, right, range, goLeft);				}
				else
				{
						if(goLeft)
						{
								if(mid == 0 || nums[uint256(mid - 1)] != key)
								{
									range[uint256(0)] = mid;								}
								else
								{
									alteredBinSearch(nums, key, left, mid - 1, range, goLeft);								}

						}
						else
						{
								if(mid == nums.length - 1 || nums[uint256(mid + 1)] != key)
								{
									range[uint256(1)] = mid;								}
								else
								{
									alteredBinSearch(nums, key, mid + 1, right, range, goLeft);								}

						}

				}
			}

	}

	// 'key'

	function alteredBinSearchIter(int32[] memory nums, int32 key, int32 left, int32 right, int32[] memory range, bool goLeft) public
	{
			while(left <= right)
			{
					int32 mid = int32((left + right) / 2);
					if(nums[uint256(mid)] > key)
					{
						right = mid - 1;					}
					else
					{
						if(nums[uint256(mid)] < key)
						{
							left = mid + 1;						}
						else
						{
								if(goLeft)
								{
										if(mid == 0 || nums[uint256(mid - 1)] != key)
										{
												range[uint256(0)] = mid;
												return 
										}
										else
										{
											right = mid - 1;										}

								}
								else
								{
										if(mid == nums.length - 1 || nums[uint256(mid + 1)] != key)
										{
												range[uint256(1)] = mid;
												return 
										}
										else
										{
											left = mid + 1;										}

								}

						}
					}


			}
	}

	function getCountLessThan(int32[] memory nums, int32 key) public returns(int32)
	{
			return getLessThan(nums, key, 0, nums.length - 1);
	}

	function getLessThan(int32[] memory nums, int32 key, int32 left, int32 right) public returns(int32)
	{
			int32 count = int32(0);
			while(left <= right)
			{
					int32 mid = int32((left + right) / 2);
					if(nums[uint256(mid)] > key)
					{
						right = mid - 1;					}
					else
					{
						if(nums[uint256(mid)] <= key)
						{
								// Atleast mid+1 elements exist which are <= key

								count = mid + 1;
								left = mid + 1;
						}					}


			}
			return count;
	}

}

