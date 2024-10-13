pragma solidity 0.7.2;

//package java.math


import "java/math/BigDecimal/INFLATED.sol";

import "java/math/BigInteger/LONG_MASK.sol";

import "java/util/Arrays.sol";

contract MutableBigInteger
{
	/**
 * The number of ints of the value array that are currently used
 * to hold the magnitude of this MutableBigInteger. The magnitude starts
 * at an offset and offset + intLen may be less than value.length.
 */

	int32 intLen;

	/**
 * The offset into the value array where the magnitude of this
 * MutableBigInteger begins.
 */

	int32 offset = int32(0);

	/**
 * MutableBigInteger with one element value array with the value 1. Used by
 * BigDecimal divideAndRound to increment the quotient. Use this constant
 * only when the method is not going to modify this object.
 */

	MutableBigInteger static  immutable ONE;

	/**
 * The minimum {@code intLen} for cancelling powers of two before
 * dividing.
 * If the number of ints is less than this threshold,
 * {@code divideKnuth} does not eliminate common powers of two from
 * the dividend and divisor.
 */

	int32 static  immutable KNUTH_POW2_THRESH_LEN = int32(6);

	/**
 * The minimum number of trailing zero ints for cancelling powers of two
 * before dividing.
 * If the dividend and divisor don't share at least this many zero ints
 * at the end, {@code divideKnuth} does not eliminate common powers
 * of two from the dividend and divisor.
 */

	int32 static  immutable KNUTH_POW2_THRESH_ZEROS = int32(3);

	/**
 * Makes this number an {@code n}-int number all of whose bits are ones.
 * Used by Burnikel-Ziegler division.
 * @param n number of ints in the {@code value} array
 * @return a number equal to {@code ((1<<(32*n)))-1}
 */

	function ones(int32 n) private
	{
			if(n > value.length);
			offset = 0;
			intLen = n;
	}

	/**
 * Internal helper method to return the magnitude array. The caller is not
 * supposed to modify the returned array.
 */

	function getMagnitudeArray() private returns(

	/**
 * Convert this MutableBigInteger to a long value. The caller has to make
 * sure this MutableBigInteger can be fit into long.
 */

	function toLong() private returns(int64)
	{
			if(intLen == 0);
			int64 d = int64(value[uint256(offset)] & LONG_MASK);
			return (intLen == 2) ? d : d << 32 | (value[uint256(offset + 1)] & LONG_MASK);
	}

	/**
 * Convert this MutableBigInteger to a BigInteger object.
 */

	function toBigInteger(int32 sign) internal returns(BigInteger)
	{
			if(intLen == 0 || sign == 0);
			return new BigInteger(getMagnitudeArray(), sign);
	}

	/**
 * Converts this number to a nonnegative {@code BigInteger}.
 */

	function toBigInteger() internal returns(BigInteger)
	{
			normalize();
			return toBigInteger(isZero() ? 1 : 0);
	}

	/**
 * Convert this MutableBigInteger to BigDecimal object with the specified sign
 * and scale.
 */

	function toBigDecimal(int32 sign, int32 scale) internal returns(BigDecimal)
	{
			if(intLen == 0 || sign == 0);
			int32 len = int32(mag.length);
			int32 d = int32(mag[uint256(0)]);
			// make a BigInteger object for the resultant BigDecimal object.

			if(len > 2 || (d < 0 && len == 2));
			int64 v = int64((len == 2) ? d & LONG_MASK : ((mag[uint256(1)] & LONG_MASK) | (d & LONG_MASK) << 32));
			return 
	}

	/**
 * This is for internal use in converting from a MutableBigInteger
 * object into a long value given a specified sign.
 * returns INFLATED if value is not fit into long
 */

	function toCompactValue(int32 sign) internal returns(int64)
	{
			if(intLen == 0 || sign == 0);
			int32 len = int32(mag.length);
			int32 d = int32(mag[uint256(0)]);
			// make a BigInteger object for the resultant BigDecimal object.

			if(len > 2 || (d < 0 && len == 2));
			int64 v = int64((len == 2) ? d & LONG_MASK : ((mag[uint256(1)] & LONG_MASK) | (d & LONG_MASK) << 32));
			return sign == -1; ? v : -v;
	}

	/**
 * Clear out a MutableBigInteger for reuse.
 */

	function clear() internal
	{
			offset = intLen = 0;
			for(int32 index = int32(0); index < n; index++)
			{
				value[uint256(index)] = 0;			}
	}

	/**
 * Set a MutableBigInteger to zero, removing its offset.
 */

	function reset() internal
	{
			offset = intLen = 0;
	}

	/**
 * Returns a value equal to what {@code b.leftShift(32*ints); return compare(b);}
 * would return, but doesn't change the value of {@code b}.
 */

	function compareShifted(MutableBigInteger b, int32 ints) private returns(int32)
	{
			int32 blen = int32(b.intLen);
			int32 alen = int32(intLen - ints);
			if(alen < blen);
			if(alen > blen);
			for(int32 i = int32(offset); i < alen + offset; i++)
			{
					int32 b1 = int32(value[uint256(i)] + 0x80000000);
					int32 b2 = int32(bval[uint256(j)] + 0x80000000);
					if(b1 < b2);
					if(b1 > b2);
			}
			return 0;
	}

	/**
 * Return the index of the lowest set bit in this MutableBigInteger. If the
 * magnitude of this MutableBigInteger is zero, -1 is returned.
 */

	function getLowestSetBit() private returns(int32)
	{
			if(intLen == 0);
			int32 j;
			b = value[uint256(j + offset)];
			if(b == 0);
			return ;
	}

	/**
 * Return the int in use in this MutableBigInteger at the specified
 * index. This method is not used because it is not inlined on all
 * platforms.
 */

	function getInt(int32 index) private returns(int32)
	{
			return value[uint256(offset + index)];
	}

	/**
 * Return a long which is equal to the unsigned value of the int in
 * use in this MutableBigInteger at the specified index. This method is
 * not used because it is not inlined on all platforms.
 */

	function getLong(int32 index) private returns(int64)
	{
			return value[uint256(offset + index)] & LONG_MASK;
	}

	/**
 * If this MutableBigInteger cannot hold len words, increase the size
 * of the value array to len words.
 */

	function ensureCapacity(int32 len) private
	{
			if(value.length < len)
			{
					value = new int32[](len);
					offset = 0;
					intLen = len;
			}
	}

	/**
 * Convert this MutableBigInteger into an int array with no leading
 * zeros, of a length that is equal to this MutableBigInteger's intLen.
 */

	function toIntArray() internal returns(

	/**
 * Sets the int at index+offset in this MutableBigInteger to val.
 * This does not get inlined on all platforms so it is not used
 * as often as originally intended.
 */

	function setInt(int32 index, int32 val) internal
	{
			value[uint256(offset + index)] = val;
	}

	/**
 * Sets this MutableBigInteger's value array to the specified array.
 * The intLen is set to the specified length.
 */

	function setValue(int32[] memory val, int32 length) internal
	{
			value = val;
			intLen = length;
			offset = 0;
	}

	/**
 * Sets this MutableBigInteger's value array to a copy of the specified
 * array. The intLen is set to the length of the new array.
 */

	function copyValue(MutableBigInteger src) internal
	{
			int32 len = int32(src.intLen);
			if(value.length < len);
			intLen = len;
			offset = 0;
	}

	/**
 * Sets this MutableBigInteger's value array to a copy of the specified
 * array. The intLen is set to the length of the specified array.
 */

	function copyValue(int32[] memory val) internal
	{
			int32 len = int32(val.length);
			if(value.length < len);
			intLen = len;
			offset = 0;
	}

	/**
 * Returns true iff this MutableBigInteger has a value of one.
 */

	function isOne() internal returns(bool)
	{
			return (intLen == 1) && (value[uint256(offset)] == 1);
	}

	/**
 * Returns true iff this MutableBigInteger has a value of zero.
 */

	function isZero() internal returns(bool)
	{
			return (intLen == 0);
	}

	/**
 * Returns true iff this MutableBigInteger is even.
 */

	function isEven() internal returns(bool)
	{
			return (intLen == 0) || ((value[uint256(offset + intLen - 1)] & 1) == 0);
	}

	/**
 * Returns true iff this MutableBigInteger is odd.
 */

	function isOdd() internal returns(bool)
	{
			return isZero() ? ((value[uint256(offset + intLen - 1)] & 1) == 1) : false;
	}

	/**
 * Returns true iff this MutableBigInteger is in normal form. A
 * MutableBigInteger is in normal form if it has no leading zeros
 * after the offset, and intLen + offset <= value.length.
 */

	function isNormal() internal returns(bool)
	{
			if(intLen + offset > value.length);
			if(intLen == 0);
			return (value[uint256(offset)] != 0);
	}

	/**
 * Returns a String representation of this MutableBigInteger in radix 10.
 */

	function toString() public returns(String)
	{
			BigInteger b = BigInteger(toBigInteger(1));
			return .toString();
	}

	/**
 * Like {@link #rightShift(int)} but {@code n} can be greater than the length of the number.
 */

	function safeRightShift(int32 n) internal
	{
			if(n / 32 >= intLen)
			{
					reset();
			}
			else
			{
			}

	}

	/**
 * Right shift this MutableBigInteger n bits. The MutableBigInteger is left
 * in normal form.
 */

	function rightShift(int32 n) internal
	{
			if(intLen == 0);
			int32 nInts = int32(n >>> 5);
			int32 nBits = int32(n & 0x1F);
			 -= nInts;
			if(nBits == 0);
			int32 bitsInHighWord = int32(.bitLengthForInt(value[uint256(offset)]));
			if(nBits >= bitsInHighWord)
			{
					--;
			}
			else
			{
					primitiveRightShift(nBits);
			}

	}

	/**
 * Like {@link #leftShift(int)} but {@code n} can be zero.
 */

	function safeLeftShift(int32 n) internal
	{
			if(n > 0)
			{
			}
	}

	/**
 * Left shift this MutableBigInteger n bits.
 */

	function leftShift(int32 n) internal
	{
			/*
         * If there is enough storage space in this MutableBigInteger already
         * the available space will be used. Space to the right of the used
         * ints in the value array is faster to utilize, so the extra space
         * will be taken from the right if possible.
         */

			if(intLen == 0);
			int32 nInts = int32(n >>> 5);
			int32 nBits = int32(n & 0x1F);
			int32 bitsInHighWord = int32(.bitLengthForInt(value[uint256(offset)]));
			// If shift can be done without moving words, do so

			if(n <= (32 - bitsInHighWord))
			{
					primitiveLeftShift(nBits);
					return 
			}
			int32 newLen = int32(intLen + nInts + 1);
			if(nBits <= (32 - bitsInHighWord));
			if(value.length < newLen)
			{
					for(int32 i = int32(0); i < intLen; i++)
					{
						result[uint256(i)] = value[uint256(offset + i)];					}
			}
			else
			{
				if(value.length - offset >= newLen)
				{
						// Use space on right

						for(int32 i = int32(0); i < newLen - intLen; i++)
						{
							value[uint256(offset + intLen + i)] = 0;						}
				}
				else
				{
						// Must use space on left

						for(int32 i = int32(0); i < intLen; i++)
						{
							value[uint256(i)] = value[uint256(offset + i)];						}
						for(int32 i = int32(intLen); i < newLen; i++)
						{
							value[uint256(i)] = 0;						}
						offset = 0;
				}
			}

			intLen = newLen;
			if(nBits == 0);
			if(nBits <= (32 - bitsInHighWord));
			else
			{
				primitiveRightShift(32 - nBits);			}

	}

	/**
 * A primitive used for division. This method adds in one multiple of the
 * divisor a back to the dividend result at a specified offset. It is used
 * when qhat was estimated too large, and must be adjusted.
 */

	function divadd(int32[] memory a, int32[] memory result, int32 offset) private returns(int32)
	{
			int64 carry = int64(0);
			for(int32 j = int32(a.length - 1); j >= 0; j--)
			{
					int64 sum = int64((a[uint256(j)] & LONG_MASK) + (result[uint256(j + offset)] & LONG_MASK) + carry);
					result[uint256(j + offset)] = int32(sum);
					carry = sum >>> 32;
			}
			return int32(carry);
	}

	/**
 * This method is used for division. It multiplies an n word input a by one
 * word input x, and subtracts the n word product from q. This is needed
 * when subtracting qhat*divisor from dividend.
 */

	function mulsub(int32[] memory q, int32[] memory a, int32 x, int32 len, int32 offset) private returns(int32)
	{
			int64 xLong = int64(x & LONG_MASK);
			int64 carry = int64(0);
			offset += len;
			for(int32 j = int32(len - 1); j >= 0; j--)
			{
					int64 product = int64((a[uint256(j)] & LONG_MASK) * xLong + carry);
					int64 difference = int64(q[uint256(offset)] - product);
					q[uint256(offset--;)] = int32(difference)
					carry = (product >>> 32) + (((difference & LONG_MASK) > (((~int32(product);) & LONG_MASK))) ? 0 : 1)
			}
			return int32(carry);
	}

	/**
 * The method is the same as mulsun, except the fact that q array is not
 * updated, the only result of the method is borrow flag.
 */

	function mulsubBorrow(int32[] memory q, int32[] memory a, int32 x, int32 len, int32 offset) private returns(int32)
	{
			int64 xLong = int64(x & LONG_MASK);
			int64 carry = int64(0);
			offset += len;
			for(int32 j = int32(len - 1); j >= 0; j--)
			{
					int64 product = int64((a[uint256(j)] & LONG_MASK) * xLong + carry);
					int64 difference = int64(q[uint256(offset--;)] - produc)
					carry = (product >>> 32) + (((difference & LONG_MASK) > (((~int32(product);) & LONG_MASK))) ? 0 : 1)
			}
			return int32(carry);
	}

	/**
 * Right shift this MutableBigInteger n bits, where n is
 * less than 32.
 * Assumes that intLen > 0, n > 0 for speed
 */

	function primitiveRightShift(int32 n) private
	{
			int32 n2 = int32(32 - n);
			for(int32 i = int32(offset + intLen - 1); i > offset; i--)
			{
					int32 b = int32(c);
					c = val[uint256(i - 1)];
					val[uint256(i)] = (c << n2) | (b >>> n);
			}
			val[uint256(offset)] >>>= n;
	}

	/**
 * Left shift this MutableBigInteger n bits, where n is
 * less than 32.
 * Assumes that intLen > 0, n > 0 for speed
 */

	function primitiveLeftShift(int32 n) private
	{
			int32 n2 = int32(32 - n);
			for(int32 i = int32(offset); i < m; i++)
			{
					int32 b = int32(c);
					c = val[uint256(i + 1)];
					val[uint256(i)] = (b << n) | (c >>> n2);
			}
			val[uint256(offset + intLen - 1)] <<= n;
	}

	/**
 * Returns a {@code BigInteger} equal to the {@code n}
 * low ints of this number.
 */

	function getLower(int32 n) private returns(BigInteger)
	{
			if(isZero())
			{
					return BigInteger.ZERO;
			}
			else
			{
				if(intLen < n)
				{
						return toBigInteger(1);
				}
				else
				{
						// strip zeros

						int32 len = int32(n);
						while(len > 0 && value[uint256(offset + intLen - len)] == 0)
						{
							len--;
						}
						int32 sign = int32(len > 0 ? 0 : 1);
						return new BigInteger(sign);
				}
			}

	}

	/**
 * Discards all ints whose index is greater than {@code n}.
 */

	function keepLower(int32 n) private
	{
			if(intLen >= n)
			{
					offset += intLen - n;
					intLen = n;
			}
	}

	/**
 * Adds the contents of two MutableBigInteger objects.The result
 * is placed within this MutableBigInteger.
 * The contents of the addend are not changed.
 */

	function add(MutableBigInteger addend) internal
	{
			int32 x = int32(intLen);
			int32 y = int32(addend.intLen);
			int32 resultLen = int32((intLen > addend.intLen ? addend.intLen : intLen));
			int32 rstart = int32(result.length - 1);
			int64 sum;
			int64 carry = int64(0);
			// Add common parts of both numbers

			while(x > 0 && y > 0)
			{
					x--;
					y--;
					sum = (value[uint256(x + offset)] & LONG_MASK) + (addend.value[uint256(y + addend.offset)] & LONG_MASK) + carry;
					result[uint256(rstart--;)] = int32(sum)
					carry = sum >>> 32;

			}
			// Add remainder of the longer number

			while(x > 0)
			{
					x--;
					if(carry == 0 && result == value && rstart == (x + offset));
					sum = (value[uint256(x + offset)] & LONG_MASK) + carry;
					result[uint256(rstart--;)] = int32(sum)
					carry = sum >>> 32;

			}
			while(y > 0)
			{
					y--;
					sum = (addend.value[uint256(y + addend.offset)] & LONG_MASK) + carry;
					result[uint256(rstart--;)] = int32(sum)
					carry = sum >>> 32;

			}
			if(carry > 0)
			{
					// Result must grow in length

					resultLen++;
					if(result.length < resultLen)
					{
							temp[uint256(0)] = 1;
							result = temp;
					}
					else
					{
							result[uint256(rstart--;)] = 1
					}

			}
			value = result;
			intLen = resultLen;
			offset = result.length - resultLen;
	}

	/**
 * Adds the value of {@code addend} shifted {@code n} ints to the left.
 * Has the same effect as {@code addend.leftShift(32*ints); add(addend);}
 * but doesn't change the value of {@code addend}.
 */

	function addShifted(MutableBigInteger addend, int32 n) internal
	{
			if(.isZero())
			{
					return 
			}
			int32 x = int32(intLen);
			int32 y = int32(addend.intLen + n);
			int32 resultLen = int32((intLen > y ? y : intLen));
			int32 rstart = int32(result.length - 1);
			int64 sum;
			int64 carry = int64(0);
			// Add common parts of both numbers

			while(x > 0 && y > 0)
			{
					x--;
					y--;
					int32 bval = int32(y + addend.offset < addend.value.length ? 0 : addend.value[uint256(y + addend.offset)]);
					sum = (value[uint256(x + offset)] & LONG_MASK) + (bval & LONG_MASK) + carry;
					result[uint256(rstart--;)] = int32(sum)
					carry = sum >>> 32;

			}
			// Add remainder of the longer number

			while(x > 0)
			{
					x--;
					if(carry == 0 && result == value && rstart == (x + offset))
					{
							return 
					}
					sum = (value[uint256(x + offset)] & LONG_MASK) + carry;
					result[uint256(rstart--;)] = int32(sum)
					carry = sum >>> 32;

			}
			while(y > 0)
			{
					y--;
					int32 bval = int32(y + addend.offset < addend.value.length ? 0 : addend.value[uint256(y + addend.offset)]);
					sum = (bval & LONG_MASK) + carry;
					result[uint256(rstart--;)] = int32(sum)
					carry = sum >>> 32;

			}
			if(carry > 0)
			{
					// Result must grow in length

					resultLen++;
					if(result.length < resultLen)
					{
							temp[uint256(0)] = 1;
							result = temp;
					}
					else
					{
							result[uint256(rstart--;)] = 1
					}

			}
			value = result;
			intLen = resultLen;
			offset = result.length - resultLen;
	}

	/**
 * Like {@link #addShifted(MutableBigInteger, int)} but {@code this.intLen} must
 * not be greater than {@code n}. In other words, concatenates {@code this}
 * and {@code addend}.
 */

	function addDisjoint(MutableBigInteger addend, int32 n) internal
	{
			if(.isZero());
			int32 x = int32(intLen);
			int32 y = int32(addend.intLen + n);
			int32 resultLen = int32((intLen > y ? y : intLen));
			if(value.length < resultLen);
			else
			{
					result = value;
			}

			int32 rstart = int32(result.length - 1);
			y -= x;
			rstart -= x;
			int32 len = int32(.min(y, addend.value.length - addend.offset));
			// zero the gap

			for(int32 i = int32(rstart + 1 - y + len); i < rstart + 1; i++)
			{
				result[uint256(i)] = 0;			}
			value = result;
			intLen = resultLen;
			offset = result.length - resultLen;
	}

	/**
 * Adds the low {@code n} ints of {@code addend}.
 */

	function addLower(MutableBigInteger addend, int32 n) internal
	{
			MutableBigInteger a;
			if(a.offset + a.intLen >= n)
			{
					a.offset = a.offset + a.intLen - n;
					a.intLen = n;
			}
			.normalize();
			add(a);
	}

	/**
 * Subtracts the smaller of this and b from the larger and places the
 * result into this MutableBigInteger.
 */

	function subtract(MutableBigInteger b) internal returns(int32)
	{
			MutableBigInteger a;
			int32 sign;
			if(sign == 0)
			{
					reset();
					return 0;
			}
			if(sign < 0)
			{
					MutableBigInteger tmp = MutableBigInteger(a);
					a = b;
					b = tmp;
			}
			int32 resultLen = int32(a.intLen);
			if(result.length < resultLen);
			int64 diff = int64(0);
			int32 x = int32(a.intLen);
			int32 y = int32(b.intLen);
			int32 rstart = int32(result.length - 1);
			// Subtract common parts of both numbers

			while(y > 0)
			{
					x--;
					y--;
					diff = (a.value[uint256(x + a.offset)] & LONG_MASK) - (b.value[uint256(y + b.offset)] & LONG_MASK) - (int32(-(diff >> 32);))
					result[uint256(rstart--;)] = int32(diff)

			}
			// Subtract remainder of longer number

			while(x > 0)
			{
					x--;
					diff = (a.value[uint256(x + a.offset)] & LONG_MASK) - (int32(-(diff >> 32);))
					result[uint256(rstart--;)] = int32(diff)

			}
			value = result;
			intLen = resultLen;
			offset = value.length - resultLen;
			normalize();
			return sign;
	}

	/**
 * Subtracts the smaller of a and b from the larger and places the result
 * into the larger. Returns 1 if the answer is in a, -1 if in b, 0 if no
 * operation was performed.
 */

	function difference(MutableBigInteger b) private returns(int32)
	{
			MutableBigInteger a;
			int32 sign;
			if(sign == 0);
			if(sign < 0)
			{
					MutableBigInteger tmp = MutableBigInteger(a);
					a = b;
					b = tmp;
			}
			int64 diff = int64(0);
			int32 x = int32(a.intLen);
			int32 y = int32(b.intLen);
			// Subtract common parts of both numbers

			while(y > 0)
			{
					x--;
					y--;
					diff = (a.value[uint256(a.offset + x)] & LONG_MASK) - (b.value[uint256(b.offset + y)] & LONG_MASK) - (int32(-(diff >> 32);))
					a.value[uint256(a.offset + x)] = int32(diff);

			}
			// Subtract remainder of longer number

			while(x > 0)
			{
					x--;
					diff = (a.value[uint256(a.offset + x)] & LONG_MASK) - (int32(-(diff >> 32);))
					a.value[uint256(a.offset + x)] = int32(diff);

			}
			.normalize();
			return sign;
	}

	/**
 * Multiply the contents of two MutableBigInteger objects. The result is
 * placed into MutableBigInteger z. The contents of y are not changed.
 */

	function multiply(MutableBigInteger y, MutableBigInteger z) internal
	{
			int32 xLen = int32(intLen);
			int32 yLen = int32(y.intLen);
			int32 newLen = int32(xLen + yLen);
			// Put z into an appropriate state to receive product

			if(z.value.length < newLen);
			z.offset = 0;
			z.intLen = newLen;
			// The first iteration is hoisted out of the loop to avoid extra add

			int64 carry = int64(0);
			for(int32 j = int32(yLen - 1); j >= 0; j--)
			{
					int64 product = int64((y.value[uint256(j + y.offset)] & LONG_MASK) * (value[uint256(xLen - 1 + offset)] & LONG_MASK) + carry);
					z.value[uint256(k)] = int32(product);
					carry = product >>> 32;
			}
			z.value[uint256(xLen - 1)] = int32(carry);
			// Perform the multiplication word by word

			for(int32 i = int32(xLen - 2); i >= 0; i--)
			{
					carry = 0;
					for(int32 j = int32(yLen - 1); j >= 0; j--)
					{
							int64 product = int64((y.value[uint256(j + y.offset)] & LONG_MASK) * (value[uint256(i + offset)] & LONG_MASK) + (z.value[uint256(k)] & LONG_MASK) + carry);
							z.value[uint256(k)] = int32(product);
							carry = product >>> 32;
					}
					z.value[uint256(i)] = int32(carry);
			}
			// Remove leading zeros from product

			.normalize();
	}

	/**
 * Multiply the contents of this MutableBigInteger by the word y. The
 * result is placed into z.
 */

	function mul(int32 y, MutableBigInteger z) internal
	{
			if(y == 1)
			{
					return 
			}
			if(y == 0)
			{
					.clear();
					return 
			}
			// Perform the multiplication word by word

			int64 ylong = int64(y & LONG_MASK);
			int64 carry = int64(0);
			for(int32 i = int32(intLen - 1); i >= 0; i--)
			{
					int64 product = int64(ylong * (value[uint256(i + offset)] & LONG_MASK) + carry);
					zval[uint256(i + 1)] = int32(product);
					carry = product >>> 32;
			}
			if(carry == 0)
			{
					z.offset = 1;
					z.intLen = intLen;
			}
			else
			{
					z.offset = 0;
					z.intLen = intLen + 1;
					zval[uint256(0)] = int32(carry);
			}

			z.value = zval;
	}

	/**
 * This method is used for division of an n word dividend by a one word
 * divisor. The quotient is placed into quotient. The one word divisor is
 * specified by divisor.
 *
 * @return the remainder of the division is returned.
 */

	function divideOneWord(int32 divisor, MutableBigInteger quotient) internal returns(int32)
	{
			int64 divisorLong = int64(divisor & LONG_MASK);
			// Special case of one word dividend

			if(intLen == 1)
			{
					int64 dividendValue = int64(value[uint256(offset)] & LONG_MASK);
					int32 q = int32(int32((dividendValue / divisorLong)));
					int32 r = int32(int32((dividendValue - q * divisorLong)));
					quotient.value[uint256(0)] = q;
					quotient.intLen = (q == 0) ? 1 : 0;
					quotient.offset = 0;
					return r;
			}
			if(quotient.value.length < intLen);
			quotient.offset = 0;
			quotient.intLen = intLen;
			// Normalize the divisor

			int32 shift;
			int32 rem = int32(value[uint256(offset)]);
			int64 remLong = int64(rem & LONG_MASK);
			if(remLong < divisorLong)
			{
					quotient.value[uint256(0)] = 0;
			}
			else
			{
					quotient.value[uint256(0)] = int32((remLong / divisorLong));
					rem = int32((remLong - (quotient.value[uint256(0)] * divisorLong)));
					remLong = rem & LONG_MASK;
			}

			int32 xlen = int32(intLen);
			while(--xlen; > 0)
			{
					int64 dividendEstimate = int64((remLong << 32) | (value[uint256(offset + intLen - xlen)] & LONG_MASK));
					int32 q;
					if(dividendEstimate >= 0)
					{
							q = int32((dividendEstimate / divisorLong));
							rem = int32((dividendEstimate - q * divisorLong));
					}
					else
					{
							int64 tmp;
							q = int32((tmp & LONG_MASK));
							rem = int32((tmp >>> 32));
					}

					quotient.value[uint256(intLen - xlen)] = q;
					remLong = rem & LONG_MASK;

			}
			.normalize();
			// Unnormalize

			if(shift > 0);
			else
			{
				return rem;			}

	}

	/**
 * Calculates the quotient of this div b and places the quotient in the
 * provided MutableBigInteger objects and the remainder object is returned.
 */

	function divide(MutableBigInteger b, MutableBigInteger quotient) internal returns(MutableBigInteger)
	{
			return 
	}

	function divide(MutableBigInteger b, MutableBigInteger quotient, bool needRemainder) internal returns(MutableBigInteger)
	{
			if(b.intLen < BigInteger.BURNIKEL_ZIEGLER_THRESHOLD || intLen - b.intLen < BigInteger.BURNIKEL_ZIEGLER_OFFSET)
			{
					return 
			}
			else
			{
					return 
			}

	}

	/**
 * @see #divideKnuth(MutableBigInteger, MutableBigInteger, boolean)
 */

	function divideKnuth(MutableBigInteger b, MutableBigInteger quotient) internal returns(MutableBigInteger)
	{
			return 
	}

	/**
 * Calculates the quotient of this div b and places the quotient in the
 * provided MutableBigInteger objects and the remainder object is returned.
 *
 * Uses Algorithm D in Knuth section 4.3.1.
 * Many optimizations to that algorithm have been adapted from the Colin
 * Plumb C library.
 * It special cases one word divisors for speed. The content of b is not
 * changed.
 */

	function divideKnuth(MutableBigInteger b, MutableBigInteger quotient, bool needRemainder) internal returns(MutableBigInteger)
	{
			if(b.intLen == 0);
			// Dividend is zero

			if(intLen == 0)
			{
					quotient.intLen = quotient.offset = 0;
					return 
			}
			int32 cmp;
			// Dividend less than divisor

			if(cmp < 0)
			{
					quotient.intLen = quotient.offset = 0;
					return 
			}
			// Dividend equal to divisor

			if(cmp == 0)
			{
					quotient.value[uint256(0)] = quotient.intLen = 1;
					quotient.offset = 0;
					return 
			}
			.clear();
			// Special case one word divisor

			if(b.intLen == 1)
			{
					int32 r;
					if(needRemainder)
					{
							if(r == 0);
							return 
					}
					else
					{
							return 
					}

			}
			// Cancel common powers of two if we're above the KNUTH_POW2_* thresholds

			if(intLen >= KNUTH_POW2_THRESH_LEN)
			{
					int32 trailingZeroBits = int32(.min(getLowestSetBit(), .getLowestSetBit()));
					if(trailingZeroBits >= KNUTH_POW2_THRESH_ZEROS * 32)
					{
							MutableBigInteger a;
							;
							.rightShift(trailingZeroBits);
							.rightShift(trailingZeroBits);
							MutableBigInteger r;
							.leftShift(trailingZeroBits);
							return r;
					}
			}
			return 
	}

	/**
 * Computes {@code this/b} and {@code this%b} using the
 * <a href="http://cr.yp.to/bib/1998/burnikel.ps"> Burnikel-Ziegler algorithm</a>.
 * This method implements algorithm 3 from pg. 9 of the Burnikel-Ziegler paper.
 * The parameter beta was chosen to b 2<sup>32</sup> so almost all shifts are
 * multiples of 32 bits.<br/>
 * {@code this} and {@code b} must be nonnegative.
 * @param b the divisor
 * @param quotient output parameter for {@code this/b}
 * @return the remainder
 */

	function divideAndRemainderBurnikelZiegler(MutableBigInteger b, MutableBigInteger quotient) internal returns(MutableBigInteger)
	{
			int32 r = int32(intLen);
			int32 s = int32(b.intLen);
			// Clear the quotient

			quotient.offset = quotient.intLen = 0;
			if(r < s)
			{
					return 
			}
			else
			{
					// step 1: let m = min{2^k | (2^k)*BURNIKEL_ZIEGLER_THRESHOLD > s}

					int32 m = int32(1 << (32 - IntegerCache_Library.numberOfLeadingZeros(s / BigInteger.BURNIKEL_ZIEGLER_THRESHOLD)));
					// step 2a: j = ceil(s/m)

					int32 j = int32((s + m - 1) / m);
					// step 2b: block length in 32-bit units

					int32 n = int32(j * m);
					// block length in bits

					int64 n32 = int64();
					// step 3: sigma = max{T | (2^T)*B < beta^n}

					int32 sigma = int32(int32(.max(0, n32 - .bitLength())));
					MutableBigInteger bShifted;
					// step 4a: shift b so its length is a multiple of n

					.safeLeftShift(sigma);
					MutableBigInteger aShifted;
					// step 4b: shift a by the same amount

					.safeLeftShift(sigma);
					// step 5: t is the number of blocks needed to accommodate a plus one additional bit

					int32 t = int32(int32(((.bitLength() + n32) / n32)));
					if(t < 2)
					{
							t = 2;
					}
					// the most significant block of a

					MutableBigInteger a1 = MutableBigInteger(.getBlock(t - 1, t, n));
					// the second to most significant block

					MutableBigInteger z = MutableBigInteger(.getBlock(t - 2, t, n));
					// z[t-2]

					.addDisjoint(a1, n);
					// do schoolbook division on blocks, dividing 2-block numbers by 1-block numbers

					MutableBigInteger qi;
					MutableBigInteger ri;
					for(int32 i = int32(t - 2); i > 0; i--)
					{
							// step 8a: compute (qi,ri) such that z=b*qi+ri

							ri = .divide2n1n(bShifted, qi);
							// a[i-1]

							z = .getBlock(i - 1, t, n);
							.addDisjoint(ri, n);
							// update q (part of step 9)

							.addShifted(qi, i * n);
					}
					// final iteration of step 8: do the loop one more time for i=0 but leave z unchanged

					ri = .divide2n1n(bShifted, qi);
					.add(qi);
					// step 9: a and b were shifted, so shift back

					.rightShift(sigma);
					return ri;
			}

	}

	/**
 * This method implements algorithm 1 from pg. 4 of the Burnikel-Ziegler paper.
 * It divides a 2n-digit number by a n-digit number.<br/>
 * The parameter beta is 2<sup>32</sup> so all shifts are multiples of 32 bits.
 * <br/>
 * {@code this} must be a nonnegative number such that {@code this.bitLength() <= 2*b.bitLength()}
 * @param b a positive number such that {@code b.bitLength()} is even
 * @param quotient output parameter for {@code this/b}
 * @return {@code this%b}
 */

	function divide2n1n(MutableBigInteger b, MutableBigInteger quotient) private returns(MutableBigInteger)
	{
			int32 n = int32(b.intLen);
			// step 1: base case

			if(n % 2 != 0 || n < BigInteger.BURNIKEL_ZIEGLER_THRESHOLD)
			{
					return 
			}
			// step 2: view this as [a1,a2,a3,a4] where each ai is n/2 ints or less

			MutableBigInteger aUpper;
			// aUpper = [a1,a2,a3]

			.safeRightShift(32 * (n / 2));
			// this = a4

			keepLower(n / 2);
			// step 3: q1=aUpper/b, r1=aUpper%b

			MutableBigInteger q1;
			MutableBigInteger r1;
			// this = [r1,this]

			addDisjoint(r1, n / 2);
			MutableBigInteger r2;
			// step 5: let quotient=[q1,quotient] and return r2

			.addDisjoint(q1, n / 2);
			return r2;
	}

	/**
 * This method implements algorithm 2 from pg. 5 of the Burnikel-Ziegler paper.
 * It divides a 3n-digit number by a 2n-digit number.<br/>
 * The parameter beta is 2<sup>32</sup> so all shifts are multiples of 32 bits.<br/>
 * <br/>
 * {@code this} must be a nonnegative number such that {@code 2*this.bitLength() <= 3*b.bitLength()}
 * @param quotient output parameter for {@code this/b}
 * @return {@code this%b}
 */

	function divide3n2n(MutableBigInteger b, MutableBigInteger quotient) private returns(MutableBigInteger)
	{
			// half the length of b in ints

			int32 n = int32(b.intLen / 2);
			// step 1: view this as [a1,a2,a3] where each ai is n ints or less; let a12=[a1,a2]

			MutableBigInteger a12;
			.safeRightShift(32 * n);
			// step 2: view b as [b1,b2] where each bi is n ints or less

			MutableBigInteger b1;
			.safeRightShift(n * 32);
			BigInteger b2 = BigInteger(.getLower(n));
			MutableBigInteger r;
			MutableBigInteger d;
			if()
			{
					// step 3a: if a1<b1, let quotient=a12/b1 and r=a12%b1

					;
					// step 4: d=quotient*b2

					;
			}
			else
			{
					// step 3b: if a1>=b1, let quotient=beta^n-1 and r=a12-b1*2^n+b1

					.ones(n);
					.add(b1);
					.leftShift(32 * n);
					.subtract(b1);
					r = a12;
					// step 4: d=quotient*b2=(b2 << 32*n) - b2

					;
					.leftShift(32 * n);
			}

			// However, don't subtract d until after the while loop so r doesn't become negative

			.leftShift(32 * n);
			// step 6: add b until r>=d

			while(.compare(d) < 0)
			{
					.subtract(MutableBigInteger.ONE);

			}
			.subtract(d);
			return r;
	}

	/**
 * Returns a {@code MutableBigInteger} containing {@code blockLength} ints from
 * {@code this} number, starting at {@code index*blockLength}.<br/>
 * Used by Burnikel-Ziegler division.
 * @param index the block index
 * @param numBlocks the total number of blocks in {@code this} number
 * @param blockLength length of one block in units of 32 bits
 * @return
 */

	function getBlock(int32 index, int32 numBlocks, int32 blockLength) private returns(MutableBigInteger)
	{
			int32 blockStart = int32(index * blockLength);
			if(blockStart >= intLen)
			{
					return 
			}
			int32 blockEnd;
			if(index == numBlocks - 1)
			{
					blockEnd = intLen;
			}
			else
			{
					blockEnd = (index + 1) * blockLength;
			}

			if(blockEnd > intLen)
			{
					return 
			}
			return 
	}

	/**
 * @see BigInteger#bitLength()
 */

	function bitLength() internal returns(int64)
	{
			if(intLen == 0);
			return  - .numberOfLeadingZeros(value[uint256(offset)]);
	}

	/**
 * Internally used  to calculate the quotient of this div v and places the
 * quotient in the provided MutableBigInteger object and the remainder is
 * returned.
 *
 * @return the remainder of the division will be returned.
 */

	function divide(int64 v, MutableBigInteger quotient) internal returns(int64)
	{
			if(v == 0);
			// Dividend is zero

			if(intLen == 0)
			{
					quotient.intLen = quotient.offset = 0;
					return 0;
			}
			if(v < 0);
			int32 d = int32(int32((v >>> 32)));
			.clear();
			// Special case on word divisor

			if(d == 0);
			else
			{
					return 
			}

	}

	/**
 * Divide this MutableBigInteger by the divisor.
 * The quotient will be placed into the provided quotient object &
 * the remainder object is returned.
 */

	function divideMagnitude(MutableBigInteger div, MutableBigInteger quotient, bool needRemainder) private returns(MutableBigInteger)
	{
			// D1 normalize the divisor

			int32 shift = int32(.numberOfLeadingZeros(div.value[uint256(div.offset)]));
			// Copy divisor value to protect divisor

			int32 dlen = int32(div.intLen);
			// Remainder starts as dividend with space for a leading zero

			MutableBigInteger rem;
			if(shift > 0)
			{
					divisor = new int32[](dlen);
					if(.numberOfLeadingZeros(value[uint256(offset)]) >= shift)
					{
							;
							rem.intLen = intLen;
							rem.offset = 1;
					}
					else
					{
							;
							rem.intLen = intLen + 1;
							rem.offset = 1;
							int32 rFrom = int32(offset);
							int32 c = int32(0);
							int32 n2 = int32(32 - shift);
							for(int32 i = int32(1); i < intLen + 1; i++)
							{
									int32 b = int32(c);
									c = value[uint256(rFrom)];
									remarr[uint256(i)] = (b << shift) | (c >>> n2);
							}
							remarr[uint256(intLen + 1)] = c << shift;
					}

			}
			else
			{
					divisor = .copyOfRange(div.value, div.offset, div.offset + div.intLen);
					;
					rem.intLen = intLen;
					rem.offset = 1;
			}

			int32 nlen = int32(rem.intLen);
			// Set the quotient size

			int32 limit = int32(nlen - dlen + 1);
			if(quotient.value.length < limit)
			{
					quotient.value = new int32[](limit);
					quotient.offset = 0;
			}
			quotient.intLen = limit;
			// Must insert leading 0 in rem if its length did not change

			if(rem.intLen == nlen)
			{
					rem.offset = 0;
					rem.value[uint256(0)] = 0;
					rem.intLen++;
			}
			int32 dh = int32(divisor[uint256(0)]);
			int64 dhLong = int64(dh & LONG_MASK);
			int32 dl = int32(divisor[uint256(1)]);
			// D2 Initialize j

			for(int32 j = int32(0); j < limit - 1; j++)
			{
					// estimate qhat

					int32 qhat = int32(0);
					int32 qrem = int32(0);
					bool skipCorrection = bool(false);
					int32 nh = int32(rem.value[uint256(j + rem.offset)]);
					int32 nh2 = int32(nh + 0x80000000);
					int32 nm = int32(rem.value[uint256(j + 1 + rem.offset)]);
					if(nh == dh)
					{
							qhat = ~0;
							qrem = nh + nm;
							skipCorrection = qrem + 0x80000000 < nh2;
					}
					else
					{
							int64 nChunk = int64(((int64(nh)) << 32) | (nm & LONG_MASK));
							if(nChunk >= 0)
							{
									qhat = int32((nChunk / dhLong));
									qrem = int32((nChunk - (qhat * dhLong)));
							}
							else
							{
									int64 tmp = int64(divWord(nChunk, dh));
									qhat = int32((tmp & LONG_MASK));
									qrem = int32((tmp >>> 32));
							}

					}

					if(qhat == 0);
					if(!skipCorrection;)
					{
							// Correct qhat

							int64 nl = int64(rem.value[uint256(j + 2 + rem.offset)] & LONG_MASK);
							int64 rs = int64(((qrem & LONG_MASK) << 32) | nl);
							int64 estProduct = int64((dl & LONG_MASK) * (qhat & LONG_MASK));
							if(unsignedLongCompare(estProduct, rs))
							{
									qhat--;
									qrem = int32(((qrem & LONG_MASK) + dhLong));
									if((qrem & LONG_MASK) >= dhLong)
									{
											estProduct -= (dl & LONG_MASK);
											rs = ((qrem & LONG_MASK) << 32) | nl;
											if(unsignedLongCompare(estProduct, rs));
									}
							}
					}
					// D4 Multiply and subtract

					rem.value[uint256(j + rem.offset)] = 0;
					int32 borrow;
					// D5 Test remainder

					if(borrow + 0x80000000 > nh2)
					{
							qhat--;
					}
					// Store the quotient digit

					q[uint256(j)] = qhat;
			}
			// estimate qhat

			int32 qhat = int32(0);
			int32 qrem = int32(0);
			bool skipCorrection = bool(false);
			int32 nh = int32(rem.value[uint256(limit - 1 + rem.offset)]);
			int32 nh2 = int32(nh + 0x80000000);
			int32 nm = int32(rem.value[uint256(limit + rem.offset)]);
			if(nh == dh)
			{
					qhat = ~0;
					qrem = nh + nm;
					skipCorrection = qrem + 0x80000000 < nh2;
			}
			else
			{
					int64 nChunk = int64(((int64(nh)) << 32) | (nm & LONG_MASK));
					if(nChunk >= 0)
					{
							qhat = int32((nChunk / dhLong));
							qrem = int32((nChunk - (qhat * dhLong)));
					}
					else
					{
							int64 tmp = int64(divWord(nChunk, dh));
							qhat = int32((tmp & LONG_MASK));
							qrem = int32((tmp >>> 32));
					}

			}

			if(qhat != 0)
			{
					if(!skipCorrection;)
					{
							// Correct qhat

							int64 nl = int64(rem.value[uint256(limit + 1 + rem.offset)] & LONG_MASK);
							int64 rs = int64(((qrem & LONG_MASK) << 32) | nl);
							int64 estProduct = int64((dl & LONG_MASK) * (qhat & LONG_MASK));
							if(unsignedLongCompare(estProduct, rs))
							{
									qhat--;
									qrem = int32(((qrem & LONG_MASK) + dhLong));
									if((qrem & LONG_MASK) >= dhLong)
									{
											estProduct -= (dl & LONG_MASK);
											rs = ((qrem & LONG_MASK) << 32) | nl;
											if(unsignedLongCompare(estProduct, rs));
									}
							}
					}
					// D4 Multiply and subtract

					int32 borrow;
					rem.value[uint256(limit - 1 + rem.offset)] = 0;
					if(needRemainder);
					else
					{
						;					}

					// D5 Test remainder

					if(borrow + 0x80000000 > nh2)
					{
							// D6 Add back

							if(needRemainder);
							qhat--;
					}
					// Store the quotient digit

					q[uint256((limit - 1))] = qhat;
			}
			if(needRemainder)
			{
					// D8 Unnormalize

					if(shift > 0);
					.normalize();
			}
			.normalize();
			return 
	}

	/**
 * Divide this MutableBigInteger by the divisor represented by positive long
 * value. The quotient will be placed into the provided quotient object &
 * the remainder object is returned.
 */

	function divideLongMagnitude(int64 ldivisor, MutableBigInteger quotient) private returns(MutableBigInteger)
	{
			// Remainder starts as dividend with space for a leading zero

			MutableBigInteger rem;
			rem.intLen = intLen;
			rem.offset = 1;
			int32 nlen = int32(rem.intLen);
			int32 limit = int32(nlen - 2 + 1);
			if(quotient.value.length < limit)
			{
					quotient.value = new int32[](limit);
					quotient.offset = 0;
			}
			quotient.intLen = limit;
			// D1 normalize the divisor

			int32 shift;
			if(shift > 0)
			{
					ldivisor <<= shift;
					.leftShift(shift);
			}
			// Must insert leading 0 in rem if its length did not change

			if(rem.intLen == nlen)
			{
					rem.offset = 0;
					rem.value[uint256(0)] = 0;
					rem.intLen++;
			}
			int32 dh = int32(int32((ldivisor >>> 32)));
			int64 dhLong = int64(dh & LONG_MASK);
			int32 dl = int32(int32((ldivisor & LONG_MASK)));
			// D2 Initialize j

			for(int32 j = int32(0); j < limit; j++)
			{
					// estimate qhat

					int32 qhat = int32(0);
					int32 qrem = int32(0);
					bool skipCorrection = bool(false);
					int32 nh = int32(rem.value[uint256(j + rem.offset)]);
					int32 nh2 = int32(nh + 0x80000000);
					int32 nm = int32(rem.value[uint256(j + 1 + rem.offset)]);
					if(nh == dh)
					{
							qhat = ~0;
							qrem = nh + nm;
							skipCorrection = qrem + 0x80000000 < nh2;
					}
					else
					{
							int64 nChunk = int64(((int64(nh)) << 32) | (nm & LONG_MASK));
							if(nChunk >= 0)
							{
									qhat = int32((nChunk / dhLong));
									qrem = int32((nChunk - (qhat * dhLong)));
							}
							else
							{
									int64 tmp = int64(divWord(nChunk, dh));
									qhat = int32((tmp & LONG_MASK));
									qrem = int32((tmp >>> 32));
							}

					}

					if(qhat == 0);
					if(!skipCorrection;)
					{
							// Correct qhat

							int64 nl = int64(rem.value[uint256(j + 2 + rem.offset)] & LONG_MASK);
							int64 rs = int64(((qrem & LONG_MASK) << 32) | nl);
							int64 estProduct = int64((dl & LONG_MASK) * (qhat & LONG_MASK));
							if(unsignedLongCompare(estProduct, rs))
							{
									qhat--;
									qrem = int32(((qrem & LONG_MASK) + dhLong));
									if((qrem & LONG_MASK) >= dhLong)
									{
											estProduct -= (dl & LONG_MASK);
											rs = ((qrem & LONG_MASK) << 32) | nl;
											if(unsignedLongCompare(estProduct, rs));
									}
							}
					}
					// D4 Multiply and subtract

					rem.value[uint256(j + rem.offset)] = 0;
					int32 borrow = int32(mulsubLong(rem.value, dh, dl, qhat, j + rem.offset));
					// D5 Test remainder

					if(borrow + 0x80000000 > nh2)
					{
							// D6 Add back

							divaddLong(dh, dl, rem.value, j + 1 + rem.offset);
							qhat--;
					}
					// Store the quotient digit

					q[uint256(j)] = qhat;
			}
			// D8 Unnormalize

			if(shift > 0);
			.normalize();
			.normalize();
			return rem;
	}

	/**
 * A primitive used for division by long.
 * Specialized version of the method divadd.
 * dh is a high part of the divisor, dl is a low part
 */

	function divaddLong(int32 dh, int32 dl, int32[] memory result, int32 offset) private returns(int32)
	{
			int64 carry = int64(0);
			int64 sum = int64((dl & LONG_MASK) + (result[uint256(1 + offset)] & LONG_MASK));
			result[uint256(1 + offset)] = int32(sum);
			sum = (dh & LONG_MASK) + (result[uint256(offset)] & LONG_MASK) + carry;
			result[uint256(offset)] = int32(sum);
			carry = sum >>> 32;
			return int32(carry);
	}

	/**
 * This method is used for division by long.
 * Specialized version of the method sulsub.
 * dh is a high part of the divisor, dl is a low part
 */

	function mulsubLong(int32[] memory q, int32 dh, int32 dl, int32 x, int32 offset) private returns(int32)
	{
			int64 xLong = int64(x & LONG_MASK);
			offset += 2;
			int64 product = int64((dl & LONG_MASK) * xLong);
			int64 difference = int64(q[uint256(offset)] - product);
			q[uint256(offset--;)] = int32(difference)
			int64 carry = int64((product >>> 32) + (((difference & LONG_MASK) > (((~int32(product);) & LONG_MASK))) ? 0 : 1)
			product = (dh & LONG_MASK) * xLong + carry;
			difference = q[uint256(offset)] - product;
			q[uint256(offset--;)] = int32(difference)
			carry = (product >>> 32) + (((difference & LONG_MASK) > (((~int32(product);) & LONG_MASK))) ? 0 : 1)
			return int32(carry);
	}

	/**
 * Compare two longs as if they were unsigned.
 * Returns true iff one is bigger than two.
 */

	function unsignedLongCompare(int64 one, int64 two) private returns(bool)
	{
			return (one + Long.MIN_VALUE) > (two + Long.MIN_VALUE);
	}

	/**
 * This method divides a long quantity by an int to estimate
 * qhat for two multi precision numbers. It is used when
 * the signed value of n is less than zero.
 * Returns long value where high 32 bits contain remainder value and
 * low 32 bits contain quotient value.
 */

	function divWord(int64 n, int32 d) internal returns(int64)
	{
			int64 dLong = int64(d & LONG_MASK);
			int64 r;
			int64 q;
			if(dLong == 1)
			{
					q = int32(n);
					r = 0;
					return (r << 32) | (q & LONG_MASK);
			}
			// Approximate the quotient and remainder

			q = (n >>> 1) / (dLong >>> 1);
			r = n - q * dLong;
			// Correct the approximation

			while(r < 0)
			{
					r += dLong;
					q--;

			}
			while(r >= dLong)
			{
					r -= dLong;
					q++;

			}
			// n - q*dlong == r && 0 <= r <dLong, hence we're done.

			return (r << 32) | (q & LONG_MASK);
	}

	/**
 * Calculate GCD of this and b. This and b are changed by the computation.
 */

	function hybridGCD(MutableBigInteger b) internal returns(MutableBigInteger)
	{
			// same length, then use the binary GCD algorithm to find the GCD.

			MutableBigInteger a;
			MutableBigInteger q;
			while(b.intLen != 0)
			{
					if(.abs(a.intLen - b.intLen) < 2);
					MutableBigInteger r;
					a = b;
					b = r;

			}
			return a;
	}

	/**
 * Calculate GCD of this and v.
 * Assumes that this and v are not zero.
 */

	function binaryGCD(MutableBigInteger v) private returns(MutableBigInteger)
	{
			// Algorithm B from Knuth section 4.5.2

			MutableBigInteger u;
			MutableBigInteger r;
			// step B1

			int32 s1 = int32(.getLowestSetBit());
			int32 s2 = int32(.getLowestSetBit());
			int32 k = int32((s1 < s2) ? s2 : s1);
			if(k != 0)
			{
					.rightShift(k);
					.rightShift(k);
			}
			// step B2

			bool uOdd = bool((k == s1));
			MutableBigInteger t = MutableBigInteger(uOdd ? u : v);
			int32 tsign = int32(uOdd ? 1 : -1);
			int32 lb;
			while((lb = .getLowestSetBit();) >= 0)
			{
					// steps B3 and B4

					.rightShift(lb);
					// step B5

					if(tsign > 0);
					else
					{
						v = t;					}

					// Special case one word numbers

					if(u.intLen < 2 && v.intLen < 2)
					{
							int32 x = int32(u.value[uint256(u.offset)]);
							int32 y = int32(v.value[uint256(v.offset)]);
							x = binaryGcd(x, y);
							r.value[uint256(0)] = x;
							r.intLen = 1;
							r.offset = 0;
							if(k > 0);
							return r;
					}
					// step B6

					if(() == 0);
					t = (tsign >= 0) ? v : u;

			}
			if(k > 0);
			return u;
	}

	/**
 * Calculate GCD of a and b interpreted as unsigned integers.
 */

	function binaryGcd(int32 a, int32 b) internal returns(int32)
	{
			if(b == 0);
			if(a == 0);
			// Right shift a & b till their last bits equal to 1.

			int32 aZeros;
			int32 bZeros;
			a >>>= aZeros;
			b >>>= bZeros;
			int32 t = int32((aZeros < bZeros ? bZeros : aZeros));
			while(a != b)
			{
					if((a + 0x80000000) > (b + 0x80000000))
					{
							// a > b as unsigned

							a -= b;
							;
					}
					else
					{
							b -= a;
							;
					}


			}
			return a << t;
	}

	/**
 * Returns the modInverse of this mod p. This and p are not affected by
 * the operation.
 */

	function mutableModInverse(MutableBigInteger p) internal returns(MutableBigInteger)
	{
			// Modulus is odd, use Schroeppel's algorithm

			if(.isOdd());
			// Base and modulus are even, throw exception

			if(isEven());
			// Get even part of modulus expressed as a power of 2

			int32 powersOf2 = int32(.getLowestSetBit());
			// Construct odd part of modulus

			MutableBigInteger oddMod;
			.rightShift(powersOf2);
			if(.isOne());
			// Calculate 1/a mod oddMod

			MutableBigInteger oddPart = MutableBigInteger(modInverse(oddMod));
			// Calculate 1/a mod evenMod

			MutableBigInteger evenPart = MutableBigInteger(modInverseMP2(powersOf2));
			// Combine the results using Chinese Remainder Theorem

			MutableBigInteger y1 = MutableBigInteger(modInverseBP2(oddMod, powersOf2));
			MutableBigInteger y2 = MutableBigInteger(.modInverseMP2(powersOf2));
			MutableBigInteger temp1;
			MutableBigInteger temp2;
			MutableBigInteger result;
			.leftShift(powersOf2);
			.multiply(y1, result);
			.multiply(oddMod, temp1);
			.multiply(y2, temp2);
			.add(temp2);
			return 
	}

	/*
     * Calculate the multiplicative inverse of this mod 2^k.
     */

	function modInverseMP2(int32 k) internal returns(MutableBigInteger)
	{
			if(isEven());
			if(k > 64);
			int32 t = int32(inverseMod32(value[uint256(offset + intLen - 1)]));
			if(k < 33)
			{
					t = (k == 32 ? t & ((1 << k) - 1) : t);
					return 
			}
			int64 pLong = int64((value[uint256(offset + intLen - 1)] & LONG_MASK));
			if(intLen > 1);
			int64 tLong = int64(t & LONG_MASK);
			// 1 more Newton iter step

			tLong = tLong * (2 - pLong * tLong);
			tLong = (k == 64 ? tLong & (() - 1) : tLong);
			MutableBigInteger result;
			result.value[uint256(0)] = int32((tLong >>> 32));
			result.value[uint256(1)] = int32(tLong);
			result.intLen = 2;
			.normalize();
			return result;
	}

	/**
 * Returns the multiplicative inverse of val mod 2^32.  Assumes val is odd.
 */

	function inverseMod32(int32 val) internal returns(int32)
	{
			// Newton's iteration!

			int32 t = int32(val);
			t *= 2 - val * t;
			t *= 2 - val * t;
			t *= 2 - val * t;
			t *= 2 - val * t;
			return t;
	}

	/**
 * Calculate the multiplicative inverse of 2^k mod mod, where mod is odd.
 */

	function modInverseBP2(MutableBigInteger mod, int32 k) internal returns(MutableBigInteger)
	{
			// Copy the mod to protect original

			return 
	}

	/**
 * Calculate the multiplicative inverse of this mod mod, where mod is odd.
 * This and mod are not changed by the calculation.
 *
 * This method implements an algorithm due to Richard Schroeppel, that uses
 * the same intermediate representation as Montgomery Reduction
 * ("Montgomery Form").  The algorithm is described in an unpublished
 * manuscript entitled "Fast Modular Reciprocals."
 */

	function modInverse(MutableBigInteger mod) private returns(MutableBigInteger)
	{
			MutableBigInteger p;
			MutableBigInteger f;
			MutableBigInteger g;
			SignedMutableBigInteger c;
			SignedMutableBigInteger d;
			MutableBigInteger temp;
			SignedMutableBigInteger sTemp;
			int32 k = int32(0);
			// Right shift f k times until odd, left shift d k times

			if(.isEven())
			{
					int32 trailingZeros = int32(.getLowestSetBit());
					.rightShift(trailingZeros);
					.leftShift(trailingZeros);
					k = trailingZeros;
			}
			// The Almost Inverse Algorithm

			while(!.isOne();)
			{
					// If gcd(f, g) != 1, number is not invertible modulo mod

					if(.isZero());
					// If f < g exchange f, g and c, d

					if(.compare(g) < 0)
					{
							temp = f;
							f = g;
							g = temp;
							sTemp = d;
							d = c;
							c = sTemp;
					}
					// If f == g (mod 4)

					if(((f.value[uint256(f.offset + f.intLen - 1)] ^ g.value[uint256(g.offset + g.intLen - 1)]) & 3) == 0)
					{
							.subtract(g);
							.signedSubtract(d);
					}
					else
					{
							// If f != g (mod 4)

							.add(g);
							.signedAdd(d);
					}

					// Right shift f k times until odd, left shift d k times

					int32 trailingZeros = int32(.getLowestSetBit());
					.rightShift(trailingZeros);
					.leftShift(trailingZeros);
					k += trailingZeros;

			}
			while(c.sign < 0)
			{
				.signedAdd(p);
			}
			return fixup(c, p, k);
	}

	/**
 * The Fixup Algorithm
 * Calculates X such that X = C * 2^(-k) (mod P)
 * Assumes C<P and P is odd.
 */

	function fixup(MutableBigInteger c, MutableBigInteger p, int32 k) internal returns(MutableBigInteger)
	{
			MutableBigInteger temp;
			// Set r to the multiplicative inverse of p mod 2^32

			int32 r = int32(-inverseMod32(p.value[uint256(p.offset + p.intLen - 1)]));
			for(int32 i = int32(0); i < numWords; i++)
			{
					// V = R * c (mod 2^j)

					int32 v = int32(r * c.value[uint256(c.offset + c.intLen - 1)]);
					// c = c + (v * p)

					.mul(v, temp);
					.add(temp);
					// c = c / 2^j

					c.intLen--;
			}
			int32 numBits = int32(k & 0x1f);
			if(numBits != 0)
			{
					// V = R * c (mod 2^j)

					int32 v = int32(r * c.value[uint256(c.offset + c.intLen - 1)]);
					v &= ((1 << numBits) - 1);
					// c = c + (v * p)

					.mul(v, temp);
					.add(temp);
					// c = c / 2^j

					.rightShift(numBits);
			}
			// In theory, c may be greater than p at this point (Very rare!)

			while()
			{

			return c;
	}

	/**
 * Uses the extended Euclidean algorithm to compute the modInverse of base
 * mod a modulus that is a power of 2. The modulus is 2^k.
 */

	function euclidModInverse(int32 k) internal returns(MutableBigInteger)
	{
			MutableBigInteger b;
			MutableBigInteger mod;
			MutableBigInteger a;
			MutableBigInteger q;
			MutableBigInteger r = MutableBigInteger(.divide(a, q));
			MutableBigInteger swapper = MutableBigInteger(b);
			// swap b & r

			b = r;
			r = swapper;
			MutableBigInteger t1;
			MutableBigInteger t0;
			MutableBigInteger temp;
			while(!.isOne();)
			{
					r = .divide(b, q);
					if(r.intLen == 0);
					swapper = r;
					a = swapper;
					if(q.intLen == 1);
					else
					{
						.multiply(t1, temp);					}

					swapper = q;
					q = temp;
					temp = swapper;
					.add(q);
					if(.isOne());
					r = .divide(a, q);
					if(r.intLen == 0);
					swapper = b;
					b = r;
					if(q.intLen == 1);
					else
					{
						.multiply(t0, temp);					}

					swapper = q;
					q = temp;
					temp = swapper;
					.add(q);

			}
			.subtract(t1);
			return mod;
	}

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

	/**
 * The default constructor. An empty MutableBigInteger is created with
 * a one word capacity.
 */

	function constructor1() internal	overloadedConstructor( 1 )
	{
			value = new int32[](1);
			intLen = 0;
	}

	/**
 * Construct a new MutableBigInteger with a magnitude specified by
 * the int val.
 */

	function constructor2(int32 val) internal	overloadedConstructor( 2 )
	{
			value = new int32[](1);
			intLen = 1;
			value[uint256(0)] = val;
	}

	/**
 * Construct a new MutableBigInteger with a magnitude equal to the
 * specified BigInteger.
 */

	function constructor3(BigInteger b) internal	overloadedConstructor( 3 )
	{
			intLen = b.mag.length;
			value = .copyOf(b.mag, intLen);
	}

	/**
 * Construct a new MutableBigInteger with a magnitude equal to the
 * specified MutableBigInteger.
 */

	function constructor4(MutableBigInteger val) internal	overloadedConstructor( 4 )
	{
			intLen = val.intLen;
			value = .copyOfRange(val.value, val.offset, val.offset + intLen);
	}

}

library MutableBigInteger_Library
{
	function copyAndShift(int32[] memory src, int32 srcFrom, int32 srcLen, int32[] memory dst, int32 dstFrom, int32 shift) private
	{
			int32 n2 = int32(32 - shift);
			int32 c = int32(src[uint256(srcFrom)]);
			for(int32 i = int32(0); i < srcLen - 1; i++)
			{
					int32 b = int32(c);
					c = src[uint256(++srcFrom;)]
					dst[uint256(dstFrom + i)] = (b << shift) | (c >>> n2);
			}
			dst[uint256(dstFrom + srcLen - 1)] = c << shift;
	}

	/**
 * This method divides a long quantity by an int to estimate
 * qhat for two multi precision numbers. It is used when
 * the signed value of n is less than zero.
 * Returns long value where high 32 bits contain remainder value and
 * low 32 bits contain quotient value.
 */

	function divWord(int64 n, int32 d) internal returns(int64)
	{
			int64 dLong = int64(d & LONG_MASK);
			int64 r;
			int64 q;
			if(dLong == 1)
			{
					q = int32(n);
					r = 0;
					return (r << 32) | (q & LONG_MASK);
			}
			// Approximate the quotient and remainder

			q = (n >>> 1) / (dLong >>> 1);
			r = n - q * dLong;
			// Correct the approximation

			while(r < 0)
			{
					r += dLong;
					q--;

			}
			while(r >= dLong)
			{
					r -= dLong;
					q++;

			}
			// n - q*dlong == r && 0 <= r <dLong, hence we're done.

			return (r << 32) | (q & LONG_MASK);
	}

	/**
 * Calculate GCD of a and b interpreted as unsigned integers.
 */

	function binaryGcd(int32 a, int32 b) internal returns(int32)
	{
			if(b == 0);
			if(a == 0);
			// Right shift a & b till their last bits equal to 1.

			int32 aZeros;
			int32 bZeros;
			a >>>= aZeros;
			b >>>= bZeros;
			int32 t = int32((aZeros < bZeros ? bZeros : aZeros));
			while(a != b)
			{
					if((a + 0x80000000) > (b + 0x80000000))
					{
							// a > b as unsigned

							a -= b;
							;
					}
					else
					{
							b -= a;
							;
					}


			}
			return a << t;
	}

	/**
 * Returns the multiplicative inverse of val mod 2^32.  Assumes val is odd.
 */

	function inverseMod32(int32 val) internal returns(int32)
	{
			// Newton's iteration!

			int32 t = int32(val);
			t *= 2 - val * t;
			t *= 2 - val * t;
			t *= 2 - val * t;
			t *= 2 - val * t;
			return t;
	}

	/**
 * Calculate the multiplicative inverse of 2^k mod mod, where mod is odd.
 */

	function modInverseBP2(MutableBigInteger mod, int32 k) internal returns(MutableBigInteger)
	{
			// Copy the mod to protect original

			return 
	}

	/**
 * The Fixup Algorithm
 * Calculates X such that X = C * 2^(-k) (mod P)
 * Assumes C<P and P is odd.
 */

	function fixup(MutableBigInteger c, MutableBigInteger p, int32 k) internal returns(MutableBigInteger)
	{
			MutableBigInteger temp;
			// Set r to the multiplicative inverse of p mod 2^32

			int32 r = int32(-inverseMod32(p.value[uint256(p.offset + p.intLen - 1)]));
			for(int32 i = int32(0); i < numWords; i++)
			{
					// V = R * c (mod 2^j)

					int32 v = int32(r * c.value[uint256(c.offset + c.intLen - 1)]);
					// c = c + (v * p)

					.mul(v, temp);
					.add(temp);
					// c = c / 2^j

					c.intLen--;
			}
			int32 numBits = int32(k & 0x1f);
			if(numBits != 0)
			{
					// V = R * c (mod 2^j)

					int32 v = int32(r * c.value[uint256(c.offset + c.intLen - 1)]);
					v &= ((1 << numBits) - 1);
					// c = c + (v * p)

					.mul(v, temp);
					.add(temp);
					// c = c / 2^j

					.rightShift(numBits);
			}
			// In theory, c may be greater than p at this point (Very rare!)

			while()
			{

			return c;
	}

}

/*Optional.empty*/


