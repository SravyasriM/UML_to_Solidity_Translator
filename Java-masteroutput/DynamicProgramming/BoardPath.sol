pragma solidity 0.7.5;

//package DynamicProgramming


/*
* this is an important Algo in which
* we have starting and ending of board and we have to reach
* we have to count no. of ways
* that help to reach end point i.e number by rolling dice
* which have 1 to 6 digits

Test Case:
here target is 10

int n=10;
		startAlgo();
		System.out.println(bpR(0,n));
		System.out.println(endAlgo()+"ms");
		int[] strg=new int [n+1];
		startAlgo();
		System.out.println(bpRS(0,n,strg));
		System.out.println(endAlgo()+"ms");
		startAlgo();
		System.out.println(bpIS(0,n,strg));
		System.out.println(endAlgo()+"ms");



*/

contract BoardPath
{
	int64 static  startTime;

	int64 static  endTime;

	function startAlgo() public
	{
			startTime = System.currentTimeMillis();
	}

	function endAlgo() public returns(int64)
	{
			endTime = System.currentTimeMillis();
			return endTime - startTime;
	}

	function bpR(int32 start, int32 end) public returns(int32)
	{
			if(start == end)
			{
					return 1;
			}
			else
			{
				if(start > end)
				{
					return 0;				}			}

			int32 count = int32(0);
			for(int32 dice = int32(1); dice <= 6; dice++;)
			{
					count += bpR(start + dice, end);
			}
			return count;
	}

}

library BoardPath_Library
{
	function startAlgo() public
	{
			startTime = System.currentTimeMillis();
	}

	function endAlgo() public returns(int64)
	{
			endTime = System.currentTimeMillis();
			return endTime - startTime;
	}

	function bpR(int32 start, int32 end) public returns(int32)
	{
			if(start == end)
			{
					return 1;
			}
			else
			{
				if(start > end)
				{
					return 0;				}			}

			int32 count = int32(0);
			for(int32 dice = int32(1); dice <= 6; dice++;)
			{
					count += bpR(start + dice, end);
			}
			return count;
	}

	function bpRS(int32 curr, int32 end, int32[] memory strg) public returns(int32)
	{
			if(curr == end)
			{
					return 1;
			}
			else
			{
				if(curr > end)
				{
					return 0;				}			}

			if(strg[uint256(curr)] != 0)
			{
				return strg[uint256(curr)];			}
			int32 count = int32(0);
			for(int32 dice = int32(1); dice <= 6; dice++;)
			{
					count += bpRS(curr + dice, end, strg);
			}
			strg[uint256(curr)] = count;
			return count;
	}

	function bpIS(int32 curr, int32 end, int32[] memory strg) public returns(int32)
	{
			strg[uint256(end)] = 1;
			for(int32 i = int32(end - 1); i >= 0; i--;)
			{
					int32 count = int32(0);
					for(int32 dice = int32(1); dice <= 6 && dice + i < strg.length; dice++;)
					{
							count += strg[uint256(i + dice)];
					}
					strg[uint256(i)] = count;
			}
			return strg[uint256(0)];
	}

}

