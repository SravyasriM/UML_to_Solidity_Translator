pragma solidity 0.7.5;

//package DynamicProgramming


import "java/util/ArrayList.sol";

import "java/util/Arrays.sol";

import "java/util/Scanner.sol";

contract MatrixChainMultiplication
{
	Scanner static  scan;

	ArrayList static  mArray;

	int32 static  size;

	

	

	function printOptimalParens(int32 i, int32 j) private
	{
			if(i == j)
			{
			}
			else
			{
					System.out.print("(");
					printOptimalParens(i, s[uint256(i)][uint256(j)]);
					printOptimalParens(s[uint256(i)][uint256(j)] + 1, j);
					System.out.print(")");
			}

	}

	function matrixChainOrder() private
	{
			for(int32 i = int32(1); i < size + 1; i++;)
			{
					m[uint256(i)][uint256(i)] = 0;
			}
			for(int32 l = int32(2); l < size + 1; l++;)
			{
					for(int32 i = int32(1); i < size - l + 2; i++;)
					{
							int32 j = int32(i + l - 1);
							m[uint256(i)][uint256(j)] = Integer.MAX_VALUE;
							for(int32 k = int32(i); k < j; k++;)
							{
									int32 q = int32(m[uint256(i)][uint256(k)] + m[uint256(k + 1)][uint256(j)] + p[uint256(i - 1)] * p[uint256(k)] * p[uint256(j)]);
									if(q < m[uint256(i)][uint256(j)])
									{
											m[uint256(i)][uint256(j)] = q;
											s[uint256(i)][uint256(j)] = k;
									}
							}
					}
			}
	}

	function input(string string) private returns(

}

library MatrixChainMultiplication_Library
{
	function main(string[] memory args) public
	{
			int32 count = int32(1);
			while(true)
			{
					int32 col = int32(Integer.parseInt(mSize[uint256(0)]));
					if(col == 0)
					{
						break;					}
					int32 row = int32(Integer.parseInt(mSize[uint256(1)]));
					Matrix matrix;
					mArray.add(matrix);
					count++;

			}
			for(uint256 iterator_var = uint256(0); iterator_var < mArray.length; iterator_var++;)
			{
					Matrix m = Matrix(mArray[uint256(iterator_var)]);
					System.out.format("A(%d)  =  %2d  x  %2d%n", m.count(), m.col(), m.row());
			}
			size = mArray.size();
			m = new int32[](size + 1);
			s = new int32[](size + 1);
			p = new int32[](size + 1);
			for(int32 i = int32(0); i < size + 1; i++;)
			{
					Arrays.fill(m[uint256(i)], -1;)
					Arrays.fill(s[uint256(i)], -1;)
			}
			for(int32 i = int32(0); i < p.length; i++;)
			{
					p[uint256(i)] = i == 0 ? mArray.get(i).col() : mArray.get(i - 1).row();
			}
			matrixChainOrder();
			for(int32 i = int32(0); i < size; i++;)
			{
					System.out.print("-------");
			}
			System.out.println();
			printArray(m);
			for(int32 i = int32(0); i < size; i++;)
			{
					System.out.print("-------");
			}
			System.out.println();
			printArray(s);
			for(int32 i = int32(0); i < size; i++;)
			{
					System.out.print("-------");
			}
			System.out.println();
			System.out.println("Optimal solution : " + m[uint256(1)][uint256(size)]);
			System.out.print("Optimal parens : ");
			printOptimalParens(1, size);
	}

	function printOptimalParens(int32 i, int32 j) private
	{
			if(i == j)
			{
			}
			else
			{
					System.out.print("(");
					printOptimalParens(i, s[uint256(i)][uint256(j)]);
					printOptimalParens(s[uint256(i)][uint256(j)] + 1, j);
					System.out.print(")");
			}

	}

	function matrixChainOrder() private
	{
			for(int32 i = int32(1); i < size + 1; i++;)
			{
					m[uint256(i)][uint256(i)] = 0;
			}
			for(int32 l = int32(2); l < size + 1; l++;)
			{
					for(int32 i = int32(1); i < size - l + 2; i++;)
					{
							int32 j = int32(i + l - 1);
							m[uint256(i)][uint256(j)] = Integer.MAX_VALUE;
							for(int32 k = int32(i); k < j; k++;)
							{
									int32 q = int32(m[uint256(i)][uint256(k)] + m[uint256(k + 1)][uint256(j)] + p[uint256(i - 1)] * p[uint256(k)] * p[uint256(j)]);
									if(q < m[uint256(i)][uint256(j)])
									{
											m[uint256(i)][uint256(j)] = q;
											s[uint256(i)][uint256(j)] = k;
									}
							}
					}
			}
	}

	function input(string string) private returns(

}

contract Matrix
{
	int32 private  count;

	int32 private  col;

	int32 private  row;

	function count() internal returns(int32)
	{
			return count;
	}

	function col() internal returns(int32)
	{
			return col;
	}

	function row() internal returns(int32)
	{
			return row;
	}

	constructor(int32 count, int32 col, int32 row) internal
	{
			Matrix.count = count;
			Matrix.col = col;
			Matrix.row = row;
	}

}

library Matrix_Library
{
}

