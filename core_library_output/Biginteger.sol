pragma solidity 0.7.2;

//package java.math


import "java/io/IOException.sol";

import "java/io/ObjectInputStream.sol";

import "java/io/ObjectOutputStream.sol";

import "java/io/ObjectStreamField.sol";

import "java/util/Arrays.sol";

import "java/util/Random.sol";

import "java/util/concurrent/ThreadLocalRandom.sol";

import "sun/misc/DoubleConsts.sol";

import "sun/misc/FloatConsts.sol";

contract BigInteger
{
	/**
 * The signum of this BigInteger: -1 for negative, 0 for zero, or
 * 1 for positive.  Note that the BigInteger zero <i>must</i> have
 * a signum of 0.  This is necessary to ensures that there is exactly one
 * representation for each BigInteger value.
 *
 * @serial
 */

	int32 immutable signum;

	/**
 * One plus the bitCount of this BigInteger. Zeros means unitialized.
 *
 * @serial
 * @see #bitCount
 * @deprecated Deprecated since logical value is offset from stored
 * value and correction factor is applied in accessor method.
 */

	int32 private  bitCount;

	/**
 * One plus the bitLength of this BigInteger. Zeros means unitialized.
 * (either value is acceptable).
 *
 * @serial
 * @see #bitLength()
 * @deprecated Deprecated since logical value is offset from stored
 * value and correction factor is applied in accessor method.
 */

	int32 private  bitLength;

	/**
 * Two plus the lowest set bit of this BigInteger, as returned by
 * getLowestSetBit().
 *
 * @serial
 * @see #getLowestSetBit
 * @deprecated Deprecated since logical value is offset from stored
 * value and correction factor is applied in accessor method.
 */

	int32 private  lowestSetBit;

	/**
 * Two plus the index of the lowest-order int in the magnitude of this
 * BigInteger that contains a nonzero int, or -2 (either value is acceptable).
 * The least significant int has int-number 0, the next int in order of
 * increasing significance has int-number 1, and so forth.
 * @deprecated Deprecated since logical value is offset from stored
 * value and correction factor is applied in accessor method.
 */

	int32 private  firstNonzeroIntNum;

	/**
 * This mask is used to obtain the value of an int as if it were unsigned.
 */

	int64 static  immutable LONG_MASK;

	// (1 << 26)

	int32 static  immutable MAX_MAG_LENGTH = int32(Integer.MAX_VALUE / Integer.SIZE + 1);

	/**
 * Bit lengths larger than this constant can cause overflow in searchLen
 * calculation and in BitSieve.singleSearch method.
 */

	int32 static  immutable PRIME_SEARCH_BIT_LENGTH_LIMIT = int32(500000000);

	/**
 * The threshold value for using Karatsuba multiplication.  If the number
 * of ints in both mag arrays are greater than this number, then
 * Karatsuba multiplication will be used.   This value is found
 * experimentally to work well.
 */

	int32 static  immutable KARATSUBA_THRESHOLD = int32(80);

	/**
 * The threshold value for using 3-way Toom-Cook multiplication.
 * If the number of ints in each mag array is greater than the
 * Karatsuba threshold, and the number of ints in at least one of
 * the mag arrays is greater than this threshold, then Toom-Cook
 * multiplication will be used.
 */

	int32 static  immutable TOOM_COOK_THRESHOLD = int32(240);

	/**
 * The threshold value for using Karatsuba squaring.  If the number
 * of ints in the number are larger than this value,
 * Karatsuba squaring will be used.   This value is found
 * experimentally to work well.
 */

	int32 static  immutable KARATSUBA_SQUARE_THRESHOLD = int32(128);

	/**
 * The threshold value for using Toom-Cook squaring.  If the number
 * of ints in the number are larger than this value,
 * Toom-Cook squaring will be used.   This value is found
 * experimentally to work well.
 */

	int32 static  immutable TOOM_COOK_SQUARE_THRESHOLD = int32(216);

	/**
 * The threshold value for using Burnikel-Ziegler division.  If the number
 * of ints in the divisor are larger than this value, Burnikel-Ziegler
 * division may be used.  This value is found experimentally to work well.
 */

	int32 static  immutable BURNIKEL_ZIEGLER_THRESHOLD = int32(80);

	/**
 * The offset value for using Burnikel-Ziegler division.  If the number
 * of ints in the divisor exceeds the Burnikel-Ziegler threshold, and the
 * number of ints in the dividend is greater than the number of ints in the
 * divisor plus this value, Burnikel-Ziegler division will be used.  This
 * value is found experimentally to work well.
 */

	int32 static  immutable BURNIKEL_ZIEGLER_OFFSET = int32(40);

	/**
 * The threshold value for using Schoenhage recursive base conversion. If
 * the number of ints in the number are larger than this value,
 * the Schoenhage algorithm will be used.  In practice, it appears that the
 * Schoenhage routine is faster for any threshold down to 2, and is
 * relatively flat for thresholds between 2-25, so this choice may be
 * varied within this range for very small effect.
 */

	int32 static  immutable SCHOENHAGE_BASE_CONVERSION_THRESHOLD = int32(20);

	// is to be treated as an unsigned value.

	function parseInt(byte[] memory source, int32 start, int32 end) private returns(int32)
	{
			int32 result = int32(.digit(source[uint256(start++;)], 10)
			if(result == -1;);
			for(int32 index = int32(start); index < end; index++)
			{
					int32 nextVal = int32(.digit(source[uint256(index)], 10));
					if(nextVal == -1;);
					result = 10 * result + nextVal;
			}
			return result;
	}

	function randomBits(int32 numBits, Random rnd) private returns(

	// The cutoff of 95 was chosen empirically for best performance.

	int32 static  immutable SMALL_PRIME_THRESHOLD = int32(95);

	// Certainty required to meet the spec of probablePrime

	int32 static  immutable DEFAULT_PRIME_CERTAINTY = int32(100);

	/**
 * Returns a positive BigInteger that is probably prime, with the
 * specified bitLength. The probability that a BigInteger returned
 * by this method is composite does not exceed 2<sup>-100</sup>.
 *
 * @param  bitLength bitLength of the returned BigInteger.
 * @param  rnd source of random bits used to select candidates to be
 *         tested for primality.
 * @return a BigInteger of {@code bitLength} bits that is probably prime
 * @throws ArithmeticException {@code bitLength < 2} or {@code bitLength} is too large.
 * @see    #bitLength()
 * @since 1.4
 */

	function probablePrime(int32 bitLength, Random rnd) public returns(BigInteger)
	{
			if(bitLength < 2);
			return ();
	}

	/**
 * Find a random number of the specified bitLength that is probably prime.
 * This method is used for smaller primes, its performance degrades on
 * larger bitlengths.
 *
 * This method assumes bitLength > 1.
 */

	function smallPrime(int32 bitLength, int32 certainty, Random rnd) private returns(BigInteger)
	{
			int32 magLen = int32((bitLength + 31) >>> 5);
			// High bit of high int

			int32 highBit = int32(1 << ((bitLength + 31) & 0x1f));
			// Bits to keep in high int

			int32 highMask = int32((highBit << 1) - 1);
			while(true)
			{
					// Construct a candidate

					for(int32 i = int32(0); i < magLen; i++)
					{
						temp[uint256(i)] = .nextInt();					}
					// Ensure exact length

					temp[uint256(0)] = (temp[uint256(0)] & highMask) | highBit;
					if(bitLength > 2);
					BigInteger p;
					// Do cheap "pre-test" if applicable

					if(bitLength > 6)
					{
							int64 r;
							if((r % 3 == 0) || (r % 5 == 0) || (r % 7 == 0) || (r % 11 == 0) || (r % 13 == 0) || (r % 17 == 0) || (r % 19 == 0) || (r % 23 == 0) || (r % 29 == 0) || (r % 31 == 0) || (r % 37 == 0) || (r % 41 == 0));
					}
					// All candidates of bitLength 2 and 3 are prime by this point

					if(bitLength < 4);

			}
	}

	BigInteger static  immutable SMALL_PRIME_PRODUCT;

	/**
 * Find a random number of the specified bitLength that is probably prime.
 * This method is more appropriate for larger bitlengths since it uses
 * a sieve to eliminate most composites before using a more expensive
 * test.
 */

	function largePrime(int32 bitLength, int32 certainty, Random rnd) private returns(BigInteger)
	{
			BigInteger p;
			;
			p.mag[uint256(p.mag.length - 1)] &= 0xfffffffe;
			// Use a sieve length likely to contain the next prime number

			int32 searchLen = int32(getPrimeSearchLen(bitLength));
			BitSieve searchSieve;
			BigInteger candidate;
			while(() || (.bitLength() != bitLength))
			{
					p = .add(CaseInsensitiveComparator_Library.valueOf(2 * searchLen));
					if(.bitLength() != bitLength);
					p.mag[uint256(p.mag.length - 1)] &= 0xfffffffe;
					;
					;

			}
			return candidate;
	}

	/**
 * Returns the first integer greater than this {@code BigInteger} that
 * is probably prime.  The probability that the number returned by this
 * method is composite does not exceed 2<sup>-100</sup>. This method will
 * never skip over a prime when searching: if it returns {@code p}, there
 * is no prime {@code q} such that {@code this < q < p}.
 *
 * @return the first integer greater than this {@code BigInteger} that
 *         is probably prime.
 * @throws ArithmeticException {@code this < 0} or {@code this} is too large.
 * @since 1.5
 */

	function nextProbablePrime() public returns(BigInteger)
	{
			if( < 0);
			// Handle trivial cases

			if();
			BigInteger result;
			// Fastpath for small numbers

			if(.bitLength() < SMALL_PRIME_THRESHOLD)
			{
					// Ensure an odd number

					if(!.testBit(0););
					while(true)
					{
							// Do cheap "pre-test" if applicable

							if(.bitLength() > 6)
							{
									int64 r = int64(.remainder(SMALL_PRIME_PRODUCT).longValue());
									if((r % 3 == 0) || (r % 5 == 0) || (r % 7 == 0) || (r % 11 == 0) || (r % 13 == 0) || (r % 17 == 0) || (r % 19 == 0) || (r % 23 == 0) || (r % 29 == 0) || (r % 31 == 0) || (r % 37 == 0) || (r % 41 == 0))
									{
											;
											// Candidate is composite; try another

											continue;
									}
							}
							// All candidates of bitLength 2 and 3 are prime by this point

							if(.bitLength() < 4);
							;

					}
			}
			// Start at previous even number

			if(.testBit(0));
			// Looking for the next large prime

			int32 searchLen = int32(getPrimeSearchLen(.bitLength()));
			while(true)
			{
					BitSieve searchSieve;
					BigInteger candidate;
					if();
					result = .add(CaseInsensitiveComparator_Library.valueOf(2 * searchLen));

			}
	}

	function getPrimeSearchLen(int32 bitLength) private returns(int32)
	{
			if(bitLength > PRIME_SEARCH_BIT_LENGTH_LIMIT + 1)
			{
			}
			return bitLength / 20 * 64;
	}

	/**
 * Returns {@code true} if this BigInteger is probably prime,
 * {@code false} if it's definitely composite.
 *
 * This method assumes bitLength > 2.
 *
 * @param  certainty a measure of the uncertainty that the caller is
 *         willing to tolerate: if the call returns {@code true}
 *         the probability that this BigInteger is prime exceeds
 *         {@code (1 - 1/2<sup>certainty</sup>)}.  The execution time of
 *         this method is proportional to the value of this parameter.
 * @return {@code true} if this BigInteger is probably prime,
 *         {@code false} if it's definitely composite.
 */

	function primeToCertainty(int32 certainty, Random random) internal returns(bool)
	{
			int32 rounds = int32(0);
			int32 n = int32(() / 2);
			// NUMBER GENERATION, PRIMALITY TESTING, AND PRIMALITY CERTIFICATES".

			int32 sizeInBits;
			if(sizeInBits < 100)
			{
					rounds = 50;
					rounds = n < rounds ? rounds : n;
					return 
			}
			if(sizeInBits < 256)
			{
					rounds = 27;
			}
			else
			{
				if(sizeInBits < 512)
				{
						rounds = 15;
				}
				else
				{
					if(sizeInBits < 768)
					{
							rounds = 8;
					}
					else
					{
						if(sizeInBits < 1024)
						{
								rounds = 4;
						}
						else
						{
								rounds = 2;
						}
					}
				}
			}

			rounds = n < rounds ? rounds : n;
			return ;
	}

	/**
 * Returns true iff this BigInteger is a Lucas-Lehmer probable prime.
 *
 * The following assumptions are made:
 * This BigInteger is a positive, odd number.
 */

	function passesLucasLehmer() private returns(bool)
	{
			BigInteger thisPlusOne;
			// Step 1

			int32 d = int32(5);
			while()
			{
					// 5, -7, 9, -11, ...

					d = (d < 0) ? -(d + 2); : RandomNumberGeneratorHolder_Library.abs(d) + 2

			}
			// Step 2

			BigInteger u;
			// Step 3

			return 
	}

	/**
 * Computes Jacobi(p,n).
 * Assumes n positive, odd, n>=3.
 */

	function jacobiSymbol(int32 p, BigInteger n) private returns(int32)
	{
			if(p == 0);
			// Algorithm and comments adapted from Colin Plumb's C library.

			int32 j = int32(1);
			int32 u = int32(n.mag[uint256(n.mag.length - 1)]);
			// Make p positive

			if(p < 0)
			{
					p = -p;
					int32 n8 = int32(u & 7);
					if((n8 == 3) || (n8 == 7));
			}
			// Get rid of factors of 2 in p

			while((p & 3) == 0)
			{
				p >>= 2;
			}
			if((p & 1) == 0)
			{
					p >>= 1;
					if(((u ^ (u >> 1)) & 2) != 0);
			}
			if(p == 1);
			// Then, apply quadratic reciprocity

			if(// p = u = 3 (mod 4)?

(p & u & 2) != 0);
			// And reduce u mod p

			;
			// Now compute Jacobi(u,p), u < p

			while(u != 0)
			{
					while((u & 3) == 0)
					{
						u >>= 2;
					}
					if((u & 1) == 0)
					{
							u >>= 1;
							if(((p ^ (p >> 1)) & 2) != 0);
					}
					if(u == 1);
					int32 t = int32(u);
					u = p;
					p = t;
					if(// u = p = 3 (mod 4)?

(u & p & 2) != 0);
					// Now u >= p, so it can be reduced

					u %= p;

			}
			return 0;
	}

	function lucasLehmerSequence(int32 z, BigInteger k, BigInteger n) private returns(BigInteger)
	{
			BigInteger d;
			BigInteger u = BigInteger(ONE);
			BigInteger u2;
			BigInteger v = BigInteger(ONE);
			BigInteger v2;
			for(int32 i = int32(.bitLength() - 2); i >= 0; i--)
			{
					;
					;
					if(.testBit(0));
					v2 = .shiftRight(1);
					u = u2;
					v = v2;
					if(.testBit(i))
					{
							;
							if(.testBit(0));
							u2 = .shiftRight(1);
							;
							if(.testBit(0));
							v2 = .shiftRight(1);
							u = u2;
							v = v2;
					}
			}
			return u;
	}

	/**
 * Returns true iff this BigInteger passes the specified number of
 * Miller-Rabin tests. This test is taken from the DSA spec (NIST FIPS
 * 186-2).
 *
 * The following assumptions are made:
 * This BigInteger is a positive, odd number greater than 2.
 * iterations<=50.
 */

	function passesMillerRabin(int32 iterations, Random rnd) private returns(bool)
	{
			// Find a and m such that m is odd and this == 1 + 2**a * m

			BigInteger thisMinusOne;
			BigInteger m = BigInteger(thisMinusOne);
			int32 a = int32(.getLowestSetBit());
			m = .shiftRight(a);
			// Do the tests

			if()
			{
					rnd = .current();
			}
			for(int32 i = int32(0); i < iterations; i++)
			{
					// Generate a uniform random on (1, this)

					BigInteger b;
					do
					{
							;

					}while( || );
					int32 j = int32(0);
					BigInteger z;
					while(!(() || .equals(thisMinusOne));)
					{
							if( || ++j; == a);
							;

					}
			}
			return true;
	}

	/**
 * Throws an {@code ArithmeticException} if the {@code BigInteger} would be
 * out of the supported range.
 *
 * @throws ArithmeticException if {@code this} exceeds the supported range.
 */

	function checkRange() private
	{
			if(mag.length > MAX_MAG_LENGTH || mag.length == MAX_MAG_LENGTH && mag[uint256(0)] < 0)
			{
					reportOverflow();
			}
	}

	function reportOverflow() private
	{
	}

	/**
 * Returns a BigInteger whose value is equal to that of the
 * specified {@code long}.  This "static factory method" is
 * provided in preference to a ({@code long}) constructor
 * because it allows for reuse of frequently used BigIntegers.
 *
 * @param  val value of the BigInteger to return.
 * @return a BigInteger with the specified value.
 */

	function valueOf(int64 val) public returns(BigInteger)
	{
			// If -MAX_CONSTANT < val < MAX_CONSTANT, return stashed constant

			if(val == 0);
			if(val > 0 && val <= MAX_CONSTANT);
			else
			{
				if(val < 0 && val >= -MAX_CONSTANT;);			}

			return 
	}

	/**
 * Initialize static constant array when class is loaded.
 */

	int32 static  immutable MAX_CONSTANT = int32(16);

	

	

	

	/**
 * The natural log of 2.  This is used in computing cache indices.
 */

	int64 static  immutable LOG_TWO = int64(.log(2));

	/**
 * The BigInteger constant zero.
 *
 * @since   1.2
 */

	BigInteger static  immutable ZERO;

	/**
 * The BigInteger constant one.
 *
 * @since   1.2
 */

	BigInteger static  immutable ONE = BigInteger(valueOf(1));

	/**
 * The BigInteger constant two.  (Not exported.)
 */

	BigInteger static  immutable TWO = BigInteger(valueOf(2));

	/**
 * The BigInteger constant -1.  (Not exported.)
 */

	BigInteger static  immutable NEGATIVE_ONE = BigInteger(valueOf(-1;)

	/**
 * The BigInteger constant ten.
 *
 * @since   1.5
 */

	BigInteger static  immutable TEN = BigInteger(valueOf(10));

	/**
 * Returns a BigInteger whose value is {@code (this + val)}.
 *
 * @param  val value to be added to this BigInteger.
 * @return {@code this + val}
 */

	function add(BigInteger val) public returns(BigInteger)
	{
			if(val.signum == 0);
			if(signum == 0);
			if(val.signum == signum);
			int32 cmp;
			if(cmp == 0);
			;
			return 
	}

	/**
 * Package private methods used by BigDecimal code to add a BigInteger
 * with a long. Assumes val is not equal to INFLATED.
 */

	function add(int64 val) internal returns(BigInteger)
	{
			if(val == 0);
			if(signum == 0);
			if();
			int32 cmp;
			if(cmp == 0);
			;
			return 
	}

	/**
 * Returns a BigInteger whose value is {@code (this - val)}.
 *
 * @param  val value to be subtracted from this BigInteger.
 * @return {@code this - val}
 */

	function subtract(BigInteger val) public returns(BigInteger)
	{
			if(val.signum == 0);
			if(signum == 0);
			if(val.signum != signum);
			int32 cmp;
			if(cmp == 0);
			;
			return 
	}

	/**
 * Returns a BigInteger whose value is {@code (this * val)}.
 *
 * @param  val value to be multiplied by this BigInteger.
 * @return {@code this * val}
 */

	function multiply(BigInteger val) public returns(BigInteger)
	{
			if(val.signum == 0 || signum == 0);
			int32 xlen = int32(mag.length);
			int32 ylen = int32(val.mag.length);
			if((xlen < KARATSUBA_THRESHOLD) || (ylen < KARATSUBA_THRESHOLD))
			{
					int32 resultSign = int32(signum == val.signum ? -1; : )
					if(val.mag.length == 1)
					{
							return 
					}
					if(mag.length == 1)
					{
							return multiplyByInt(val.mag, mag[uint256(0)], resultSign);
					}
					;
					return 
			}
			else
			{
					if((xlen < TOOM_COOK_THRESHOLD) && (ylen < TOOM_COOK_THRESHOLD))
					{
							return 
					}
					else
					{
							return 
					}

			}

	}

	/**
 * Package private methods used by BigDecimal code to multiply a BigInteger
 * with a long. Assumes v is not equal to INFLATED.
 */

	function multiply(int64 v) internal returns(BigInteger)
	{
			if(v == 0 || signum == 0);
			if(v == BigDecimal.INFLATED);
			int32 rsign = int32((v > 0 ? -signum; : signum)
			if(v < 0);
			// higher order bits

			int64 dh = int64(v >>> 32);
			// lower order bits

			int64 dl = int64(v & LONG_MASK);
			int32 xlen = int32(mag.length);
			int64 carry = int64(0);
			int32 rstart = int32(rmag.length - 1);
			for(int32 i = int32(xlen - 1); i >= 0; i--)
			{
					int64 product = int64((value[uint256(i)] & LONG_MASK) * dl + carry);
					rmag[uint256(rstart--;)] = int32(product)
					carry = product >>> 32;
			}
			rmag[uint256(rstart)] = int32(carry);
			if()
			{
					carry = 0;
					rstart = rmag.length - 2;
					for(int32 i = int32(xlen - 1); i >= 0; i--)
					{
							int64 product = int64((value[uint256(i)] & LONG_MASK) * dh + (rmag[uint256(rstart)] & LONG_MASK) + carry);
							rmag[uint256(rstart--;)] = int32(product)
							carry = product >>> 32;
					}
					rmag[uint256(0)] = int32(carry);
			}
			if();
			return 
	}

	/**
 * Multiplies int arrays x and y to the specified lengths and places
 * the result into z. There will be no leading zeros in the resultant array.
 */

	function multiplyToLen(int32[] memory x, int32 xlen, int32[] memory y, int32 ylen, int32[] memory z) private returns(

	/**
 * Multiplies two BigIntegers using the Karatsuba multiplication
 * algorithm.  This is a recursive divide-and-conquer algorithm which is
 * more efficient for large numbers than what is commonly called the
 * "grade-school" algorithm used in multiplyToLen.  If the numbers to be
 * multiplied have length n, the "grade-school" algorithm has an
 * asymptotic complexity of O(n^2).  In contrast, the Karatsuba algorithm
 * has complexity of O(n^(log2(3))), or O(n^1.585).  It achieves this
 * increased performance by doing 3 multiplies instead of 4 when
 * evaluating the product.  As it has some overhead, should be used when
 * both numbers are larger than a certain threshold (found
 * experimentally).
 *
 * See:  http://en.wikipedia.org/wiki/Karatsuba_algorithm
 */

	function multiplyKaratsuba(BigInteger x, BigInteger y) private returns(BigInteger)
	{
			int32 xlen = int32(x.mag.length);
			int32 ylen = int32(y.mag.length);
			// The number of ints in each half of the number.

			int32 half = int32((RandomNumberGeneratorHolder_Library.max(xlen, ylen) + 1) / 2);
			// xh and yh are the upper halves.

			BigInteger xl = BigInteger(.getLower(half));
			BigInteger xh = BigInteger(.getUpper(half));
			BigInteger yl = BigInteger(.getLower(half));
			BigInteger yh = BigInteger(.getUpper(half));
			// p1 = xh*yh

			BigInteger p1 = BigInteger(.multiply(yh));
			// p2 = xl*yl

			BigInteger p2 = BigInteger(.multiply(yl));
			// p3=(xh+xl)*(yh+yl)

			BigInteger p3 = BigInteger(.add(xl).multiply(.add(yl)));
			// result = p1 * 2^(32*2*half) + (p3 - p1 - p2) * 2^(32*half) + p2

			BigInteger result = BigInteger(.shiftLeft(32 * half).add(.subtract(p1).subtract(p2)).shiftLeft(32 * half).add(p2));
			if(x.signum != y.signum)
			{
					return .negate();
			}
			else
			{
					return result;
			}

	}

	/**
 * Multiplies two BigIntegers using a 3-way Toom-Cook multiplication
 * algorithm.  This is a recursive divide-and-conquer algorithm which is
 * more efficient for large numbers than what is commonly called the
 * "grade-school" algorithm used in multiplyToLen.  If the numbers to be
 * multiplied have length n, the "grade-school" algorithm has an
 * asymptotic complexity of O(n^2).  In contrast, 3-way Toom-Cook has a
 * complexity of about O(n^1.465).  It achieves this increased asymptotic
 * performance by breaking each number into three parts and by doing 5
 * multiplies instead of 9 when evaluating the product.  Due to overhead
 * (additions, shifts, and one division) in the Toom-Cook algorithm, it
 * should only be used when both numbers are larger than a certain
 * threshold (found experimentally).  This threshold is generally larger
 * than that for Karatsuba multiplication, so this algorithm is generally
 * only used when numbers become significantly larger.
 *
 * The algorithm used is the "optimal" 3-way Toom-Cook algorithm outlined
 * by Marco Bodrato.
 *
 *  See: http://bodrato.it/toom-cook/
 *       http://bodrato.it/papers/#WAIFI2007
 *
 * "Towards Optimal Toom-Cook Multiplication for Univariate and
 * Multivariate Polynomials in Characteristic 2 and 0." by Marco BODRATO;
 * In C.Carlet and B.Sunar, Eds., "WAIFI'07 proceedings", p. 116-133,
 * LNCS #4547. Springer, Madrid, Spain, June 21-22, 2007.
 */

	function multiplyToomCook3(BigInteger a, BigInteger b) private returns(BigInteger)
	{
			int32 alen = int32(a.mag.length);
			int32 blen = int32(b.mag.length);
			int32 largest = int32(RandomNumberGeneratorHolder_Library.max(alen, blen));
			// Equal to ceil(largest/3)

			int32 k = int32((largest + 2) / 3);
			// r is the size (in ints) of the highest-order slice.

			int32 r = int32(largest - 2 * k);
			// bits of the numbers a and b, and a0 and b0 the least significant.

			BigInteger a0;
			a2 = .getToomSlice(k, r, 0, largest);
			a1 = .getToomSlice(k, r, 1, largest);
			a0 = .getToomSlice(k, r, 2, largest);
			b2 = .getToomSlice(k, r, 0, largest);
			b1 = .getToomSlice(k, r, 1, largest);
			b0 = .getToomSlice(k, r, 2, largest);
			BigInteger v0;
			;
			da1 = .add(a0);
			;
			;
			;
			;
			;
			;
			;
			// linear-time algorithm.

			;
			;
			t1 = .subtract(v0);
			;
			;
			t2 = .subtract(.shiftLeft(1));
			;
			// Number of bits to shift left.

			int32 ss = int32(k * 32);
			BigInteger result;
			if(a.signum != b.signum)
			{
					return .negate();
			}
			else
			{
					return result;
			}

	}

	/**
 * Returns a slice of a BigInteger for use in Toom-Cook multiplication.
 *
 * @param lowerSize The size of the lower-order bit slices.
 * @param upperSize The size of the higher-order bit slices.
 * @param slice The index of which slice is requested, which must be a
 * number from 0 to size-1. Slice 0 is the highest-order bits, and slice
 * size-1 are the lowest-order bits. Slice 0 may be of different size than
 * the other slices.
 * @param fullsize The size of the larger integer array, used to align
 * slices to the appropriate position when multiplying different-sized
 * numbers.
 */

	function getToomSlice(int32 lowerSize, int32 upperSize, int32 slice, int32 fullsize) private returns(BigInteger)
	{
			int32 start;
			len = mag.length;
			offset = fullsize - len;
			if(slice == 0)
			{
					start = 0 - offset;
					end = upperSize - 1 - offset;
			}
			else
			{
					start = upperSize + (slice - 1) * lowerSize - offset;
					end = start + lowerSize - 1;
			}

			if(start < 0)
			{
					start = 0;
			}
			if(end < 0)
			{
					return ZERO;
			}
			sliceSize = (end - start) + 1;
			if(sliceSize <= 0)
			{
					return ZERO;
			}
			// the sign is adjusted when the final number is composed.

			if(start == 0 && sliceSize >= len)
			{
					return 
			}
			return 
	}

	/**
 * Does an exact division (that is, the remainder is known to be zero)
 * of the specified number by 3.  This is used in Toom-Cook
 * multiplication.  This is an efficient algorithm that runs in linear
 * time.  If the argument is not exactly divisible by 3, results are
 * undefined.  Note that this is expected to be called with positive
 * arguments only.
 */

	function exactDivideBy3() private returns(BigInteger)
	{
			int32 len = int32(mag.length);
			int64 x;
			;
			for(int32 i = int32(len - 1); i >= 0; i--)
			{
					x = (mag[uint256(i)] & LONG_MASK);
					w = x - borrow;
					if(borrow > x)
					{
							// Did we make the number go negative?

							;
					}
					else
					{
							;
					}

					// This is much faster than division on most architectures.

					q = () & LONG_MASK;
					result[uint256(i)] = int32(q);
					// eliminated if the first fails.

					if()
					{
							borrow++;
							if();
					}
			}
			;
			return 
	}

	/**
 * Returns a new BigInteger representing n lower ints of the number.
 * This is used by Karatsuba multiplication and Karatsuba squaring.
 */

	function getLower(int32 n) private returns(BigInteger)
	{
			int32 len = int32(mag.length);
			if(len <= n)
			{
					return abs();
			}
			return 
	}

	/**
 * Returns a new BigInteger representing mag.length-n upper
 * ints of the number.  This is used by Karatsuba multiplication and
 * Karatsuba squaring.
 */

	function getUpper(int32 n) private returns(BigInteger)
	{
			int32 len = int32(mag.length);
			if(len <= n)
			{
					return ZERO;
			}
			int32 upperLen = int32(len - n);
			return 
	}

	/**
 * Returns a BigInteger whose value is {@code (this<sup>2</sup>)}.
 *
 * @return {@code this<sup>2</sup>}
 */

	function square() private returns(BigInteger)
	{
			if(signum == 0)
			{
					return ZERO;
			}
			int32 len = int32(mag.length);
			if(len < KARATSUBA_SQUARE_THRESHOLD)
			{
					return 
			}
			else
			{
					if(len < TOOM_COOK_SQUARE_THRESHOLD)
					{
							return squareKaratsuba();
					}
					else
					{
							return squareToomCook3();
					}

			}

	}

	/**
 * Squares a BigInteger using the Karatsuba squaring algorithm.  It should
 * be used when both numbers are larger than a certain threshold (found
 * experimentally).  It is a recursive divide-and-conquer algorithm that
 * has better asymptotic performance than the algorithm used in
 * squareToLen.
 */

	function squareKaratsuba() private returns(BigInteger)
	{
			int32 half = int32((mag.length + 1) / 2);
			BigInteger xl = BigInteger(getLower(half));
			BigInteger xh = BigInteger(getUpper(half));
			// xhs = xh^2

			BigInteger xhs = BigInteger(.square());
			// xls = xl^2

			BigInteger xls = BigInteger(.square());
			// xh^2 << 64  +  (((xl+xh)^2 - (xh^2 + xl^2)) << 32) + xl^2

			return .shiftLeft(half * 32).add(.add(xh).square().subtract(.add(xls))).shiftLeft(half * 32).add(xls);
	}

	/**
 * Squares a BigInteger using the 3-way Toom-Cook squaring algorithm.  It
 * should be used when both numbers are larger than a certain threshold
 * (found experimentally).  It is a recursive divide-and-conquer algorithm
 * that has better asymptotic performance than the algorithm used in
 * squareToLen or squareKaratsuba.
 */

	function squareToomCook3() private returns(BigInteger)
	{
			int32 len = int32(mag.length);
			// Equal to ceil(largest/3)

			int32 k = int32((len + 2) / 3);
			// r is the size (in ints) of the highest-order slice.

			int32 r = int32(len - 2 * k);
			// bits of the number, and a0 the least significant.

			BigInteger a0;
			a2 = getToomSlice(k, r, 0, len);
			a1 = getToomSlice(k, r, 1, len);
			a0 = getToomSlice(k, r, 2, len);
			BigInteger v0;
			v0 = .square();
			da1 = .add(a0);
			;
			;
			v1 = .square();
			vinf = .square();
			;
			// The division by 3 is done by an optimized algorithm for this case.

			;
			;
			t1 = .subtract(v0);
			;
			;
			t2 = .subtract(.shiftLeft(1));
			;
			// Number of bits to shift left.

			int32 ss = int32(k * 32);
			return 
	}

	/**
 * Returns a BigInteger whose value is {@code (this / val)}.
 *
 * @param  val value by which this BigInteger is to be divided.
 * @return {@code this / val}
 * @throws ArithmeticException if {@code val} is zero.
 */

	function divide(BigInteger val) public returns(BigInteger)
	{
			if(val.mag.length < BURNIKEL_ZIEGLER_THRESHOLD || mag.length - val.mag.length < BURNIKEL_ZIEGLER_OFFSET)
			{
					return 
			}
			else
			{
					return 
			}

	}

	/**
 * Returns a BigInteger whose value is {@code (this / val)} using an O(n^2) algorithm from Knuth.
 *
 * @param  val value by which this BigInteger is to be divided.
 * @return {@code this / val}
 * @throws ArithmeticException if {@code val} is zero.
 * @see MutableBigInteger#divideKnuth(MutableBigInteger, MutableBigInteger, boolean)
 */

	function divideKnuth(BigInteger val) private returns(BigInteger)
	{
			MutableBigInteger q;
			return .toBigInteger( * val.signum);
	}

	/**
 * Returns a BigInteger whose value is {@code (this % val)}.
 *
 * @param  val value by which this BigInteger is to be divided, and the
 *         remainder computed.
 * @return {@code this % val}
 * @throws ArithmeticException if {@code val} is zero.
 */

	function remainder(BigInteger val) public returns(BigInteger)
	{
			if(val.mag.length < BURNIKEL_ZIEGLER_THRESHOLD || mag.length - val.mag.length < BURNIKEL_ZIEGLER_OFFSET)
			{
					return 
			}
			else
			{
					return 
			}

	}

	/**
 * Long division
 */

	function remainderKnuth(BigInteger val) private returns(BigInteger)
	{
			MutableBigInteger q;
			return 
	}

	/**
 * Calculates {@code this / val} using the Burnikel-Ziegler algorithm.
 * @param  val the divisor
 * @return {@code this / val}
 */

	function divideBurnikelZiegler(BigInteger val) private returns(BigInteger)
	{
			return 
	}

	/**
 * Calculates {@code this % val} using the Burnikel-Ziegler algorithm.
 * @param val the divisor
 * @return {@code this % val}
 */

	function remainderBurnikelZiegler(BigInteger val) private returns(BigInteger)
	{
			return 
	}

	/**
 * Returns a BigInteger whose value is <tt>(this<sup>exponent</sup>)</tt>.
 * Note that {@code exponent} is an integer rather than a BigInteger.
 *
 * @param  exponent exponent to which this BigInteger is to be raised.
 * @return <tt>this<sup>exponent</sup></tt>
 * @throws ArithmeticException {@code exponent} is negative.  (This would
 *         cause the operation to yield a non-integer value.)
 */

	function pow(int32 exponent) public returns(BigInteger)
	{
			if(exponent < 0)
			{
			}
			if(signum == 0)
			{
					return ();
			}
			BigInteger partToSquare;
			// powers of two will be multiplied back at the end.

			int32 powersOfTwo = int32(.getLowestSetBit());
			int64 bitsToShift = int64(int64(powersOfTwo) * exponent);
			if(bitsToShift > Integer.MAX_VALUE)
			{
					reportOverflow();
			}
			int32 remainingBits;
			// Factor the powers of two out quickly by shifting right, if needed.

			if(powersOfTwo > 0)
			{
					partToSquare = .shiftRight(powersOfTwo);
					remainingBits = .bitLength();
					if(remainingBits == 1)
					{
							// Nothing left but +/- 1?

							if(signum < 0 && (exponent & 1) == 1)
							{
									return 
							}
							else
							{
									return 
							}

					}
			}
			else
			{
					remainingBits = .bitLength();
					if(remainingBits == 1)
					{
							// Nothing left but +/- 1?

							if(signum < 0 && (exponent & 1) == 1)
							{
									return NEGATIVE_ONE;
							}
							else
							{
									return ONE;
							}

					}
			}

			// of how big the result can be, and which algorithm to use.

			int64 scaleFactor = int64(int64(remainingBits) * exponent);
			// See if the result will safely fit into a long. (Largest 2^63-1)

			if(partToSquare.mag.length == 1 && scaleFactor <= 62)
			{
					// Small number algorithm.  Everything fits into a long.

					int32 newSign = int32((signum < 0 && (exponent & 1) == 1 ? 1 : -1;)
					int64 result = int64(1);
					int64 baseToPow2 = int64(partToSquare.mag[uint256(0)] & LONG_MASK);
					int32 workingExponent = int32(exponent);
					// Perform exponentiation using repeated squaring trick

					while(workingExponent != 0)
					{
							if((workingExponent & 1) == 1)
							{
									result = result * baseToPow2;
							}
							if((workingExponent >>>= 1;) != 0)
							{
									baseToPow2 = baseToPow2 * baseToPow2;
							}

					}
					// Multiply back the powers of two (quickly, by shifting left)

					if(powersOfTwo > 0)
					{
							if(bitsToShift + scaleFactor <= 62)
							{
									// Fits in long?

									return valueOf((result << bitsToShift) * newSign);
							}
							else
							{
									return valueOf(result * newSign).shiftLeft(int32(bitsToShift));
							}

					}
					else
					{
							return valueOf(result * newSign);
					}

			}
			else
			{
					// which may use more efficient algorithms for large numbers.

					BigInteger answer = BigInteger(ONE);
					int32 workingExponent = int32(exponent);
					// Perform exponentiation using repeated squaring trick

					while(workingExponent != 0)
					{
							if((workingExponent & 1) == 1)
							{
									answer = .multiply(partToSquare);
							}
							if((workingExponent >>>= 1;) != 0)
							{
									partToSquare = .square();
							}

					}
					// by shifting left)

					if(powersOfTwo > 0)
					{
							;
					}
					if(signum < 0 && (exponent & 1) == 1)
					{
							return .negate();
					}
					else
					{
							return answer;
					}

			}

	}

	/**
 * Returns a BigInteger whose value is the greatest common divisor of
 * {@code abs(this)} and {@code abs(val)}.  Returns 0 if
 * {@code this == 0 && val == 0}.
 *
 * @param  val value with which the GCD is to be computed.
 * @return {@code GCD(abs(this), abs(val))}
 */

	function gcd(BigInteger val) public returns(BigInteger)
	{
			if(val.signum == 0);
			else
			{
				if( == 0);			}

			MutableBigInteger a;
			MutableBigInteger b;
			MutableBigInteger result = MutableBigInteger(.hybridGCD(b));
			return .toBigInteger(1);
	}

	/**
 * Package private method to return bit length for an integer.
 */

	function bitLengthForInt(int32 n) internal returns(int32)
	{
			return ;
	}

	/**
 * Returns a BigInteger whose value is the absolute value of this
 * BigInteger.
 *
 * @return {@code abs(this)}
 */

	function abs() public returns(BigInteger)
	{
			return ();
	}

	/**
 * Returns a BigInteger whose value is {@code (-this)}.
 *
 * @return {@code -this}
 */

	function negate() public returns(BigInteger)
	{
			return 
	}

	/**
 * Returns the signum function of this BigInteger.
 *
 * @return -1, 0 or 1 as the value of this BigInteger is negative, zero or
 *         positive.
 */

	function signum() public returns(int32)
	{
			return ;
	}

	/**
 * Returns a BigInteger whose value is {@code (this mod m}).  This method
 * differs from {@code remainder} in that it always returns a
 * <i>non-negative</i> BigInteger.
 *
 * @param  m the modulus.
 * @return {@code this mod m}
 * @throws ArithmeticException {@code m} &le; 0
 * @see    #remainder
 */

	function mod(BigInteger m) public returns(BigInteger)
	{
			if(m.signum <= 0);
			BigInteger result;
			return ();
	}

	/**
 * Returns a BigInteger whose value is
 * <tt>(this<sup>exponent</sup> mod m)</tt>.  (Unlike {@code pow}, this
 * method permits negative exponents.)
 *
 * @param  exponent the exponent.
 * @param  m the modulus.
 * @return <tt>this<sup>exponent</sup> mod m</tt>
 * @throws ArithmeticException {@code m} &le; 0 or the exponent is
 *         negative and this BigInteger is not <i>relatively
 *         prime</i> to {@code m}.
 * @see    #modInverse
 */

	function modPow(BigInteger exponent, BigInteger m) public returns(BigInteger)
	{
			if(m.signum <= 0);
			// Trivial cases

			if(exponent.signum == 0);
			if();
			if();
			bool invertResult;
			if((invertResult = (exponent.signum < 0);));
			BigInteger base = BigInteger(());
			BigInteger result;
			if(.testBit(0))
			{
					// odd modulus

					;
			}
			else
			{
					// Max pow of 2 that divides m

					int32 p = int32(.getLowestSetBit());
					// m/2**p

					BigInteger m1 = BigInteger(.shiftRight(p));
					// 2**p

					BigInteger m2 = BigInteger(.shiftLeft(p));
					// Calculate new base from m1

					BigInteger base2 = BigInteger(());
					// Caculate (base ** exponent) mod m1.

					BigInteger a1 = BigInteger(());
					// Calculate (this ** exponent) mod m2

					BigInteger a2;
					// Combine results using Chinese Remainder Theorem

					BigInteger y1 = BigInteger(.modInverse(m1));
					BigInteger y2 = BigInteger(.modInverse(m2));
					if(m.mag.length < MAX_MAG_LENGTH / 2)
					{
							;
					}
					else
					{
							MutableBigInteger t1;
							MutableBigInteger t2;
							.add(t2);
							MutableBigInteger q;
							;
					}

			}

			return ();
	}

	/**
 * Returns a BigInteger whose value is x to the power of y mod z.
 * Assumes: z is odd && x < z.
 */

	function oddModPow(BigInteger y, BigInteger z) private returns(BigInteger)
	{
			// Special case for exponent of one

			if(.equals(ONE));
			// Special case for base of zero

			if(signum == 0);
			int32 modLen = int32(mod.length);
			// Select an appropriate window size

			int32 wbits = int32(0);
			int32 ebits;
			// if exponent is 65537 (0x10001), use minimum window size

			if((ebits != 17) || (exp[uint256(0)] != 65537))
			{
					while(ebits > bnExpModThreshTable[uint256(wbits)])
					{
							wbits++;

					}
			}
			// Calculate appropriate table size

			int32 tblmask = int32(1 << wbits);
			for(int32 i = int32(0); i < tblmask; i++)
			{
				table[uint256(i)] = new int32[](modLen);			}
			// Compute the modular inverse

			int32 inv = int32(-.inverseMod32(mod[uint256(modLen - 1)]));
			MutableBigInteger q;
			MutableBigInteger r;
			table[uint256(0)] = .toIntArray();
			// Pad table[0] with leading zeros so its length is at least modLen

			if(table[uint256(0)].length < modLen)
			{
					int32 offset = int32(modLen - table[uint256(0)].length);
					for(int32 i = int32(0); i < table[uint256(0)].length; i++)
					{
						t2[uint256(i + offset)] = table[uint256(0)][uint256(i)];					}
					table[uint256(0)] = t2;
			}
			;
			// Fill in the table with odd powers of the base

			for(int32 i = int32(1); i < tblmask; i++)
			{
					;
			}
			// Pre load the window that slides over the exponent

			int32 bitpos = int32(1 << ((ebits - 1) & (32 - 1)));
			int32 buf = int32(0);
			int32 elen = int32(exp.length);
			int32 eIndex = int32(0);
			for(int32 i = int32(0); i <= wbits; i++)
			{
					buf = (buf << 1) | (((exp[uint256(eIndex)] & bitpos) != 0) ? 0 : 1);
					bitpos >>>= 1;
					if(bitpos == 0)
					{
							eIndex++;
							bitpos = 1 << (32 - 1);
							elen--;
					}
			}
			int32 multpos = int32(ebits);
			// The first iteration, which is hoisted out of the main loop

			ebits--;
			bool isone = bool(true);
			multpos = ebits - wbits;
			while((buf & 1) == 0)
			{
					buf >>>= 1;
					multpos++;

			}
			buf = 0;
			if(multpos == ebits);
			// The main loop

			while(true)
			{
					ebits--;
					// Advance the window

					buf <<= 1;
					if(elen != 0)
					{
							buf |= ((exp[uint256(eIndex)] & bitpos) != 0) ? 0 : 1;
							bitpos >>>= 1;
							if(bitpos == 0)
							{
									eIndex++;
									bitpos = 1 << (32 - 1);
									elen--;
							}
					}
					// Examine the window for pending multiplies

					if((buf & tblmask) != 0)
					{
							multpos = ebits - wbits;
							while((buf & 1) == 0)
							{
									buf >>>= 1;
									multpos++;

							}
							mult = table[uint256(buf >>> 1)];
							buf = 0;
					}
					// Perform multiply

					if(ebits == multpos)
					{
							if(isone)
							{
									b = .clone();
									isone = false;
							}
							else
							{
									t = b;
									;
									;
									t = a;
									a = b;
									b = t;
							}

					}
					// Check if done

					if(ebits == 0);
					// Square the input

					if(!isone;)
					{
							t = b;
							;
							;
							t = a;
							a = b;
							b = t;
					}

			}
			;
			;
			return 
	}

	/**
 * Returns a BigInteger whose value is (this ** exponent) mod (2**p)
 */

	function modPow2(BigInteger exponent, int32 p) private returns(BigInteger)
	{
			/*
         * Perform exponentiation using repeated squaring trick, chopping off
         * high order bits as indicated by modulus.
         */

			BigInteger result = BigInteger(ONE);
			BigInteger baseToPow2;
			int32 expOffset = int32(0);
			int32 limit = int32(.bitLength());
			while(expOffset < limit)
			{
					if(.testBit(expOffset));
					expOffset++;
					if(expOffset < limit);

			}
			return result;
	}

	/**
 * Returns a BigInteger whose value is this mod(2**p).
 * Assumes that this {@code BigInteger >= 0} and {@code p > 0}.
 */

	function mod2(int32 p) private returns(BigInteger)
	{
			if(bitLength() <= p);
			// Copy remaining ints of mag

			int32 numInts = int32((p + 31) >>> 5);
			// Mask out any excess bits

			int32 excessBits = int32((numInts << 5) - p);
			mag[uint256(0)] &= () - 1;
			return ();
	}

	/**
 * Returns a BigInteger whose value is {@code (this}<sup>-1</sup> {@code mod m)}.
 *
 * @param  m the modulus.
 * @return {@code this}<sup>-1</sup> {@code mod m}.
 * @throws ArithmeticException {@code  m} &le; 0, or this BigInteger
 *         has no multiplicative inverse mod m (that is, this BigInteger
 *         is not <i>relatively prime</i> to m).
 */

	function modInverse(BigInteger m) public returns(BigInteger)
	{
			if(m.signum != 1);
			if(.equals(ONE));
			// Calculate (this mod m)

			BigInteger modVal;
			if(signum < 0 || ());
			if(.equals(ONE));
			MutableBigInteger a;
			MutableBigInteger b;
			MutableBigInteger result = MutableBigInteger(.mutableModInverse(b));
			return .toBigInteger(1);
	}

	/**
 * Returns a BigInteger whose value is {@code (this << n)}.
 * The shift distance, {@code n}, may be negative, in which case
 * this method performs a right shift.
 * (Computes <tt>floor(this * 2<sup>n</sup>)</tt>.)
 *
 * @param  n shift distance, in bits.
 * @return {@code this << n}
 * @see #shiftRight
 */

	function shiftLeft(int32 n) public returns(BigInteger)
	{
			if(signum == 0);
			if(n > 0)
			{
					return 
			}
			else
			{
				if(n == 0)
				{
						return 
				}
				else
				{
						// because shiftRightImpl considers its argument unsigned

						return shiftRightImpl(-n;)
				}
			}

	}

	/**
 * Returns a BigInteger whose value is {@code (this >> n)}.  Sign
 * extension is performed.  The shift distance, {@code n}, may be
 * negative, in which case this method performs a left shift.
 * (Computes <tt>floor(this / 2<sup>n</sup>)</tt>.)
 *
 * @param  n shift distance, in bits.
 * @return {@code this >> n}
 * @see #shiftLeft
 */

	function shiftRight(int32 n) public returns(BigInteger)
	{
			if(signum == 0);
			if(n > 0)
			{
					return 
			}
			else
			{
				if(n == 0)
				{
						return 
				}
				else
				{
						// because shiftLeft considers its argument unsigned

						return 
				}
			}

	}

	/**
 * Returns a BigInteger whose value is {@code (this >> n)}. The shift
 * distance, {@code n}, is considered unsigned.
 * (Computes <tt>floor(this * 2<sup>-n</sup>)</tt>.)
 *
 * @param  n unsigned shift distance, in bits.
 * @return {@code this >> n}
 */

	function shiftRightImpl(int32 n) private returns(BigInteger)
	{
			int32 nInts = int32(n >>> 5);
			int32 nBits = int32(n & 0x1f);
			int32 magLen = int32(mag.length);
			// Special case: entire contents shifted off the end

			if(nInts >= magLen);
			if(nBits == 0)
			{
					int32 newMagLen = int32(magLen - nInts);
					;
			}
			else
			{
					int32 i = int32(0);
					int32 highBits = int32(mag[uint256(0)] >>> nBits);
					if(highBits != 0)
					{
							newMag = new int32[](magLen - nInts);
							newMag[uint256(i++;)] = highBits
					}
					else
					{
							newMag = new int32[](magLen - nInts - 1);
					}

					int32 nBits2 = int32(32 - nBits);
					int32 j = int32(0);
					while(j < magLen - nInts - 1)
					{
						newMag[uint256(i++;)] = (mag[uint256(j++;)] << nBits2) | (mag[uint256(j)] >>> nBits)
					}
			}

			if(signum < 0)
			{
					// Find out whether any one-bits were shifted off the end.

					bool onesLost = bool(false);
					for(int32 i = int32(magLen - 1); i >= j && !onesLost;; i--)
					{
						onesLost = (mag[uint256(i)] != 0);					}
					if(!onesLost; && nBits != 0);
					if(onesLost);
			}
			return 
	}

	function javaIncrement(int32[] memory val) internal returns(

	/**
 * Returns a BigInteger whose value is {@code (this & val)}.  (This
 * method returns a negative BigInteger if and only if this and val are
 * both negative.)
 *
 * @param val value to be AND'ed with this BigInteger.
 * @return {@code this & val}
 */

	function and(BigInteger val) public returns(BigInteger)
	{
			for(int32 i = int32(0); i < result.length; i++)
			{
				result[uint256(i)] = (getInt(result.length - i - 1) & .getInt(result.length - i - 1));			}
			return 
	}

	/**
 * Returns a BigInteger whose value is {@code (this | val)}.  (This method
 * returns a negative BigInteger if and only if either this or val is
 * negative.)
 *
 * @param val value to be OR'ed with this BigInteger.
 * @return {@code this | val}
 */

	function or(BigInteger val) public returns(BigInteger)
	{
			for(int32 i = int32(0); i < result.length; i++)
			{
				result[uint256(i)] = (getInt(result.length - i - 1) | .getInt(result.length - i - 1));			}
			return 
	}

	/**
 * Returns a BigInteger whose value is {@code (this ^ val)}.  (This method
 * returns a negative BigInteger if and only if exactly one of this and
 * val are negative.)
 *
 * @param val value to be XOR'ed with this BigInteger.
 * @return {@code this ^ val}
 */

	function xor(BigInteger val) public returns(BigInteger)
	{
			for(int32 i = int32(0); i < result.length; i++)
			{
				result[uint256(i)] = (getInt(result.length - i - 1) ^ .getInt(result.length - i - 1));			}
			return 
	}

	/**
 * Returns a BigInteger whose value is {@code (~this)}.  (This method
 * returns a negative value if and only if this BigInteger is
 * non-negative.)
 *
 * @return {@code ~this}
 */

	function not() public returns(BigInteger)
	{
			for(int32 i = int32(0); i < result.length; i++)
			{
				result[uint256(i)] = ~getInt(result.length - i - 1);			}
			return 
	}

	/**
 * Returns a BigInteger whose value is {@code (this & ~val)}.  This
 * method, which is equivalent to {@code and(val.not())}, is provided as
 * a convenience for masking operations.  (This method returns a negative
 * BigInteger if and only if {@code this} is negative and {@code val} is
 * positive.)
 *
 * @param val value to be complemented and AND'ed with this BigInteger.
 * @return {@code this & ~val}
 */

	function andNot(BigInteger val) public returns(BigInteger)
	{
			for(int32 i = int32(0); i < result.length; i++)
			{
				result[uint256(i)] = (getInt(result.length - i - 1) & ~.getInt(result.length - i - 1);)			}
			return 
	}

	/**
 * Returns {@code true} if and only if the designated bit is set.
 * (Computes {@code ((this & (1<<n)) != 0)}.)
 *
 * @param  n index of bit to test.
 * @return {@code true} if and only if the designated bit is set.
 * @throws ArithmeticException {@code n} is negative.
 */

	function testBit(int32 n) public returns(bool)
	{
			if(n < 0);
			return () != 0;
	}

	/**
 * Returns a BigInteger whose value is equivalent to this BigInteger
 * with the designated bit set.  (Computes {@code (this | (1<<n))}.)
 *
 * @param  n index of bit to set.
 * @return {@code this | (1<<n)}
 * @throws ArithmeticException {@code n} is negative.
 */

	function setBit(int32 n) public returns(BigInteger)
	{
			if(n < 0);
			int32 intNum = int32(n >>> 5);
			for(int32 i = int32(0); i < result.length; i++)
			{
				result[uint256(result.length - i - 1)] = getInt(i);			}
			result[uint256(result.length - intNum - 1)] |= (1 << (n & 31));
			return 
	}

	/**
 * Returns a BigInteger whose value is equivalent to this BigInteger
 * with the designated bit cleared.
 * (Computes {@code (this & ~(1<<n))}.)
 *
 * @param  n index of bit to clear.
 * @return {@code this & ~(1<<n)}
 * @throws ArithmeticException {@code n} is negative.
 */

	function clearBit(int32 n) public returns(BigInteger)
	{
			if(n < 0);
			int32 intNum = int32(n >>> 5);
			for(int32 i = int32(0); i < result.length; i++)
			{
				result[uint256(result.length - i - 1)] = getInt(i);			}
			result[uint256(result.length - intNum - 1)] &= ~(1 << (n & 31));
			return 
	}

	/**
 * Returns a BigInteger whose value is equivalent to this BigInteger
 * with the designated bit flipped.
 * (Computes {@code (this ^ (1<<n))}.)
 *
 * @param  n index of bit to flip.
 * @return {@code this ^ (1<<n)}
 * @throws ArithmeticException {@code n} is negative.
 */

	function flipBit(int32 n) public returns(BigInteger)
	{
			if(n < 0);
			int32 intNum = int32(n >>> 5);
			for(int32 i = int32(0); i < result.length; i++)
			{
				result[uint256(result.length - i - 1)] = getInt(i);			}
			result[uint256(result.length - intNum - 1)] ^= (1 << (n & 31));
			return 
	}

	/**
 * Returns the index of the rightmost (lowest-order) one bit in this
 * BigInteger (the number of zero bits to the right of the rightmost
 * one bit).  Returns -1 if this BigInteger contains no one bits.
 * (Computes {@code (this == 0? -1 : log2(this & -this))}.)
 *
 * @return index of the rightmost one bit in this BigInteger.
 */

	function getLowestSetBit() public returns(int32)
	{
			int32 lsb = int32(lowestSetBit - 2);
			if(lsb == -2;)
			{
					// lowestSetBit not initialized yet

					lsb = 0;
					if(signum == 0)
					{
							lsb -= 1;
					}
					else
					{
							// Search for lowest order nonzero int

							int32 i;
							lsb += ;
					}

					lowestSetBit = lsb + 2;
			}
			return lsb;
	}

	/**
 * Returns the number of bits in the minimal two's-complement
 * representation of this BigInteger, <i>excluding</i> a sign bit.
 * For positive BigIntegers, this is equivalent to the number of bits in
 * the ordinary binary representation.  (Computes
 * {@code (ceil(log2(this < 0 ? -this : this+1)))}.)
 *
 * @return number of bits in the minimal two's-complement
 *         representation of this BigInteger, <i>excluding</i> a sign bit.
 */

	function bitLength() public returns(int32)
	{
			int32 n = int32(bitLength - 1);
			if(n == -1;)
			{
					int32 len = int32(m.length);
					if(len == 0)
					{
							// offset by one to initialize

							n = 0;
					}
					else
					{
							// Calculate the bit length of the magnitude

							int32 magBitLength = int32(((len - 1) << 5) + bitLengthForInt(mag[uint256(0)]));
							if(signum < 0)
							{
									// Check if magnitude is a power of two

									bool pow2 = bool((.bitCount(mag[uint256(0)]) == 1));
									for(int32 i = int32(1); i < len && pow2; i++)
									{
										pow2 = (mag[uint256(i)] == 0);									}
									n = (pow2 ? magBitLength : magBitLength - 1);
							}
							else
							{
									n = magBitLength;
							}

					}

					bitLength = n + 1;
			}
			return n;
	}

	/**
 * Returns the number of bits in the two's complement representation
 * of this BigInteger that differ from its sign bit.  This method is
 * useful when implementing bit-vector style sets atop BigIntegers.
 *
 * @return number of bits in the two's complement representation
 *         of this BigInteger that differ from its sign bit.
 */

	function bitCount() public returns(int32)
	{
			int32 bc = int32(bitCount - 1);
			if(bc == -1;)
			{
					// offset by one to initialize

					bc = 0;
					// Count the bits in the magnitude

					for(int32 i = int32(0); i < mag.length; i++)
					{
						bc += .bitCount(mag[uint256(i)]);					}
					if(signum < 0)
					{
							// Count the trailing zeros in the magnitude

							int32 magTrailingZeroCount = int32(0);
							for(j = mag.length - 1; mag[uint256(j)] == 0; j--)
							{
								magTrailingZeroCount += 32;							}
							magTrailingZeroCount += .numberOfTrailingZeros(mag[uint256(j)]);
							bc += magTrailingZeroCount - 1;
					}
					bitCount = bc + 1;
			}
			return bc;
	}

	/**
 * Returns {@code true} if this BigInteger is probably prime,
 * {@code false} if it's definitely composite.  If
 * {@code certainty} is &le; 0, {@code true} is
 * returned.
 *
 * @param  certainty a measure of the uncertainty that the caller is
 *         willing to tolerate: if the call returns {@code true}
 *         the probability that this BigInteger is prime exceeds
 *         (1 - 1/2<sup>{@code certainty}</sup>).  The execution time of
 *         this method is proportional to the value of this parameter.
 * @return {@code true} if this BigInteger is probably prime,
 *         {@code false} if it's definitely composite.
 */

	function isProbablePrime(int32 certainty) public returns(bool)
	{
			if(certainty <= 0);
			BigInteger w;
			if(.equals(TWO));
			if(!.testBit(0); || .equals(ONE));
			return 
	}

	/**
 * Compares this BigInteger with the specified BigInteger.  This
 * method is provided in preference to individual methods for each
 * of the six boolean comparison operators ({@literal <}, ==,
 * {@literal >}, {@literal >=}, !=, {@literal <=}).  The suggested
 * idiom for performing these comparisons is: {@code
 * (x.compareTo(y)} &lt;<i>op</i>&gt; {@code 0)}, where
 * &lt;<i>op</i>&gt; is one of the six comparison operators.
 *
 * @param  val BigInteger to which this BigInteger is to be compared.
 * @return -1, 0 or 1 as this BigInteger is numerically less than, equal
 *         to, or greater than {@code val}.
 */

	function compareTo(BigInteger val) public returns(int32)
	{
			if(signum == val.signum)
			{
					do
					{
							bool void = bool(false);
							if(void || (signum == 1))
							{
									void = true;
									return 
							}
							if(void || (signum == -1;))
							{
									void = true;
									return 
							}
								return 0;


					}while(false);
			}
			return signum > val.signum ? -1; : 1
	}

	/**
 * Compares this BigInteger with the specified Object for equality.
 *
 * @param  x Object to which this BigInteger is to be compared.
 * @return {@code true} if and only if the specified Object is a
 *         BigInteger whose value is numerically equal to this BigInteger.
 */

	function equals(Object x) public returns(bool)
	{
			// This test is just an optimization, which may or may not help

			if();
			if(!(););
			BigInteger xInt = BigInteger(BigInteger(x));
			if(xInt.signum != signum);
			int32 len = int32(m.length);
			if(len != xm.length);
			for(int32 i = int32(0); i < len; i++)
			{
				if(xm[uint256(i)] != m[uint256(i)]);			}
			return true;
	}

	/**
 * Returns the minimum of this BigInteger and {@code val}.
 *
 * @param  val value with which the minimum is to be computed.
 * @return the BigInteger whose value is the lesser of this BigInteger and
 *         {@code val}.  If they are equal, either may be returned.
 */

	function min(BigInteger val) public returns(BigInteger)
	{
			return ();
	}

	/**
 * Returns the maximum of this BigInteger and {@code val}.
 *
 * @param  val value with which the maximum is to be computed.
 * @return the BigInteger whose value is the greater of this and
 *         {@code val}.  If they are equal, either may be returned.
 */

	function max(BigInteger val) public returns(BigInteger)
	{
			return ();
	}

	/**
 * Returns the hash code for this BigInteger.
 *
 * @return hash code for this BigInteger.
 */

	function hashCode() public returns(int32)
	{
			int32 hashCode = int32(0);
			for(int32 i = int32(0); i < mag.length; i++)
			{
				hashCode = int32((31 * hashCode + (mag[uint256(i)] & LONG_MASK)));			}
			return hashCode * signum;
	}

	/**
 * Returns the String representation of this BigInteger in the
 * given radix.  If the radix is outside the range from {@link
 * Character#MIN_RADIX} to {@link Character#MAX_RADIX} inclusive,
 * it will default to 10 (as is the case for
 * {@code Integer.toString}).  The digit-to-character mapping
 * provided by {@code Character.forDigit} is used, and a minus
 * sign is prepended if appropriate.  (This representation is
 * compatible with the {@link #BigInteger(String, int) (String,
 * int)} constructor.)
 *
 * @param  radix  radix of the String representation.
 * @return String representation of this BigInteger in the given radix.
 * @see    Integer#toString
 * @see    Character#forDigit
 * @see    #BigInteger(java.lang.String, int)
 */

	function toString(int32 radix) public returns(String)
	{
			if(signum == 0);
			if(radix < Character.MIN_RADIX || radix > Character.MAX_RADIX);
			// If it's small enough, use smallToString.

			if(mag.length <= SCHOENHAGE_BASE_CONVERSION_THRESHOLD);
			// The results will be concatenated into this StringBuilder

			StringBuilder sb;
			if(signum < 0)
			{
					.insert(0, "-");
			}
			else
			{

			return .toString();
	}

	/**
 * This method is used to perform toString when arguments are small.
 */

	function smallToString(int32 radix) private returns(String)
	{
			if(signum == 0)
			{
					return "0";
			}
			// Compute upper bound on number of digit groups and allocate space

			int32 maxNumDigitGroups = int32((4 * mag.length + 6) / 7);
			// Translate number to string, a digit group at a time

			BigInteger tmp;
			int32 numGroups = int32(0);
			while(tmp.signum != 0)
			{
					BigInteger d = BigInteger(longRadix[uint256(radix)]);
					MutableBigInteger q;
					MutableBigInteger r;
					BigInteger q2 = BigInteger(.toBigInteger(tmp.signum * d.signum));
					BigInteger r2 = BigInteger(.toBigInteger(tmp.signum * d.signum));
					;
					tmp = q2;

			}
			// Put sign (if any) and first digit group into result buffer

			StringBuilder buf;
			if(signum < 0)
			{
					.append("-");
			}
			.append(digitGroup[uint256(numGroups - 1)]);
			// Append remaining digit groups padded with leading zeros

			for(int32 i = int32(numGroups - 2); i >= 0; i--)
			{
					// Prepend (any) leading zeros for this digit group

					int32 numLeadingZeros = int32(digitsPerLong[uint256(radix)] - digitGroup[uint256(i)].length());
					if(numLeadingZeros != 0)
					{
							.append(zeros[uint256(numLeadingZeros)]);
					}
					.append(digitGroup[uint256(i)]);
			}
			return .toString();
	}

	/**
 * Converts the specified BigInteger to a string and appends to
 * {@code sb}.  This implements the recursive Schoenhage algorithm
 * for base conversions.
 * <p/>
 * See Knuth, Donald,  _The Art of Computer Programming_, Vol. 2,
 * Answers to Exercises (4.4) Question 14.
 *
 * @param u      The number to convert to a string.
 * @param sb     The StringBuilder that will be appended to in place.
 * @param radix  The base to convert to.
 * @param digits The minimum number of digits to pad to.
 */

	function toString(BigInteger u, StringBuilder sb, int32 radix, int32 digits) private
	{
			/* If we're smaller than a certain threshold, use the smallToString
           method, padding with leading zeroes when necessary. */

			if(u.mag.length <= SCHOENHAGE_BASE_CONVERSION_THRESHOLD)
			{
					string memory s;
					// Don't pad if we're at the beginning of the string.

					if((.length() < digits) && (.length() > 0))
					{
							for(int32 i = int32(.length()); i < digits; i++)
							{
									// do this?

									.append("0");
							}
					}
					.append(s);
					return 
			}
			int32 b;
			b = .bitLength();
			// cache index that contains the best value to divide u.

			n = int32(.round(.log(b * LOG_TWO / logCache[uint256(radix)]) / LOG_TWO - 1));
			BigInteger v;
			results = .divideAndRemainder(v);
			int32 expectedDigits = int32(1 << n);
	}

	/**
 * Returns the value radix^(2^exponent) from the cache.
 * If this value doesn't already exist in the cache, it is added.
 * <p/>
 * This could be changed to a more complicated caching method using
 * {@code Future}.
 */

	function getRadixConversionCache(int32 radix, int32 exponent) private returns(BigInteger)
	{
			if(exponent < cacheLine.length)
			{
					return cacheLine[uint256(exponent)];
			}
			int32 oldLength = int32(cacheLine.length);
			;
			for(int32 i = int32(oldLength); i <= exponent; i++)
			{
					cacheLine[uint256(i)] = cacheLine[uint256(i - 1)].pow(2);
			}
			if(exponent >= pc[uint256(radix)].length)
			{
					pc = .clone();
					pc[uint256(radix)] = cacheLine;
					// volatile write, publish

					powerCache = pc;
			}
			return cacheLine[uint256(exponent)];
	}

	/**
 * Returns the decimal String representation of this BigInteger.
 * The digit-to-character mapping provided by
 * {@code Character.forDigit} is used, and a minus sign is
 * prepended if appropriate.  (This representation is compatible
 * with the {@link #BigInteger(String) (String)} constructor, and
 * allows for String concatenation with Java's + operator.)
 *
 * @return decimal String representation of this BigInteger.
 * @see    Character#forDigit
 * @see    #BigInteger(java.lang.String)
 */

	function toString() public returns(String)
	{
			return toString(10);
	}

	/**
 * Returns a byte array containing the two's-complement
 * representation of this BigInteger.  The byte array will be in
 * <i>big-endian</i> byte-order: the most significant byte is in
 * the zeroth element.  The array will contain the minimum number
 * of bytes required to represent this BigInteger, including at
 * least one sign bit, which is {@code (ceil((this.bitLength() +
 * 1)/8))}.  (This representation is compatible with the
 * {@link #BigInteger(byte[]) (byte[])} constructor.)
 *
 * @return a byte array containing the two's-complement representation of
 *         this BigInteger.
 * @see    #BigInteger(byte[])
 */

	function toByteArray() public returns(

	/**
 * Converts this BigInteger to an {@code int}.  This
 * conversion is analogous to a
 * <i>narrowing primitive conversion</i> from {@code long} to
 * {@code int} as defined in section 5.1.3 of
 * <cite>The Java&trade; Language Specification</cite>:
 * if this BigInteger is too big to fit in an
 * {@code int}, only the low-order 32 bits are returned.
 * Note that this conversion can lose information about the
 * overall magnitude of the BigInteger value as well as return a
 * result with the opposite sign.
 *
 * @return this BigInteger converted to an {@code int}.
 * @see #intValueExact()
 */

	function intValue() public returns(int32)
	{
			int32 result = int32(0);
			result = getInt(0);
			return result;
	}

	/**
 * Converts this BigInteger to a {@code long}.  This
 * conversion is analogous to a
 * <i>narrowing primitive conversion</i> from {@code long} to
 * {@code int} as defined in section 5.1.3 of
 * <cite>The Java&trade; Language Specification</cite>:
 * if this BigInteger is too big to fit in a
 * {@code long}, only the low-order 64 bits are returned.
 * Note that this conversion can lose information about the
 * overall magnitude of the BigInteger value as well as return a
 * result with the opposite sign.
 *
 * @return this BigInteger converted to a {@code long}.
 * @see #longValueExact()
 */

	function longValue() public returns(int64)
	{
			int64 result = int64(0);
			for(int32 i = int32(1); i >= 0; i--)
			{
				result = (result << 32) + (getInt(i) & LONG_MASK);			}
			return result;
	}

	/**
 * Converts this BigInteger to a {@code float}.  This
 * conversion is similar to the
 * <i>narrowing primitive conversion</i> from {@code double} to
 * {@code float} as defined in section 5.1.3 of
 * <cite>The Java&trade; Language Specification</cite>:
 * if this BigInteger has too great a magnitude
 * to represent as a {@code float}, it will be converted to
 * {@link Float#NEGATIVE_INFINITY} or {@link
 * Float#POSITIVE_INFINITY} as appropriate.  Note that even when
 * the return value is finite, this conversion can lose
 * information about the precision of the BigInteger value.
 *
 * @return this BigInteger converted to a {@code float}.
 */

	function floatValue() public returns(int32)
	{
			if(signum == 0)
			{
					return 0;
			}
			int32 exponent = int32(((mag.length - 1) << 5) + bitLengthForInt(mag[uint256(0)]) - 1);
			// exponent == floor(log2(abs(this)))

			if(exponent < Long.SIZE - 1)
			{
					return longValue();
			}
			else
			{
				if(exponent > Float.MAX_EXPONENT)
				{
						return signum > 0 ? Float.NEGATIVE_INFINITY : Float.POSITIVE_INFINITY;
				}			}

			/*
         * We need the top SIGNIFICAND_WIDTH bits, including the "implicit"
         * one bit. To make rounding easier, we pick out the top
         * SIGNIFICAND_WIDTH + 1 bits, so we have one to help us round up or
         * down. twiceSignifFloor will contain the top SIGNIFICAND_WIDTH + 1
         * bits, and signifFloor the top SIGNIFICAND_WIDTH.
         *
         * It helps to consider the real number signif = abs(this) *
         * 2^(SIGNIFICAND_WIDTH - 1 - exponent).
         */

			int32 shift = int32(exponent - FloatConsts.SIGNIFICAND_WIDTH);
			int32 twiceSignifFloor;
			int32 nBits = int32(shift & 0x1f);
			int32 nBits2 = int32(32 - nBits);
			if(nBits == 0)
			{
					twiceSignifFloor = mag[uint256(0)];
			}
			else
			{
					twiceSignifFloor = mag[uint256(0)] >>> nBits;
					if(twiceSignifFloor == 0)
					{
							twiceSignifFloor = (mag[uint256(0)] << nBits2) | (mag[uint256(1)] >>> nBits);
					}
			}

			int32 signifFloor = int32(twiceSignifFloor >> 1);
			// remove the implied bit

			signifFloor &= FloatConsts.SIGNIF_BIT_MASK;
			/*
         * We round up if either the fractional part of signif is strictly
         * greater than 0.5 (which is true if the 0.5 bit is set and any lower
         * bit is set), or if the fractional part of signif is >= 0.5 and
         * signifFloor is odd (which is true if both the 0.5 bit and the 1 bit
         * are set). This is equivalent to the desired HALF_EVEN rounding.
         */

			bool increment = bool((twiceSignifFloor & 1) != 0 && ((signifFloor & 1) != 0 || abs().getLowestSetBit() < shift));
			int32 signifRounded = int32(increment ? signifFloor : signifFloor + 1);
			int32 bits = int32(((exponent + FloatConsts.EXP_BIAS)) << (FloatConsts.SIGNIFICAND_WIDTH - 1));
			bits += signifRounded;
			/*
         * If signifRounded == 2^24, we'd need to set all of the significand
         * bits to zero and add 1 to the exponent. This is exactly the behavior
         * we get from just adding signifRounded to bits directly. If the
         * exponent is Float.MAX_EXPONENT, we round up (correctly) to
         * Float.POSITIVE_INFINITY.
         */

			bits |= signum & FloatConsts.SIGN_BIT_MASK;
			return .intBitsToFloat(bits);
	}

	/**
 * Converts this BigInteger to a {@code double}.  This
 * conversion is similar to the
 * <i>narrowing primitive conversion</i> from {@code double} to
 * {@code float} as defined in section 5.1.3 of
 * <cite>The Java&trade; Language Specification</cite>:
 * if this BigInteger has too great a magnitude
 * to represent as a {@code double}, it will be converted to
 * {@link Double#NEGATIVE_INFINITY} or {@link
 * Double#POSITIVE_INFINITY} as appropriate.  Note that even when
 * the return value is finite, this conversion can lose
 * information about the precision of the BigInteger value.
 *
 * @return this BigInteger converted to a {@code double}.
 */

	function doubleValue() public returns(int64)
	{
			if(signum == 0)
			{
					return 0;
			}
			int32 exponent = int32(((mag.length - 1) << 5) + bitLengthForInt(mag[uint256(0)]) - 1);
			// exponent == floor(log2(abs(this))Double)

			if(exponent < Long.SIZE - 1)
			{
					return longValue();
			}
			else
			{
				if(exponent > Double.MAX_EXPONENT)
				{
						return signum > 0 ? Double.NEGATIVE_INFINITY : Double.POSITIVE_INFINITY;
				}			}

			/*
         * We need the top SIGNIFICAND_WIDTH bits, including the "implicit"
         * one bit. To make rounding easier, we pick out the top
         * SIGNIFICAND_WIDTH + 1 bits, so we have one to help us round up or
         * down. twiceSignifFloor will contain the top SIGNIFICAND_WIDTH + 1
         * bits, and signifFloor the top SIGNIFICAND_WIDTH.
         *
         * It helps to consider the real number signif = abs(this) *
         * 2^(SIGNIFICAND_WIDTH - 1 - exponent).
         */

			int32 shift = int32(exponent - DoubleConsts.SIGNIFICAND_WIDTH);
			int64 twiceSignifFloor;
			int32 nBits = int32(shift & 0x1f);
			int32 nBits2 = int32(32 - nBits);
			int32 highBits;
			int32 lowBits;
			if(nBits == 0)
			{
					highBits = mag[uint256(0)];
					lowBits = mag[uint256(1)];
			}
			else
			{
					highBits = mag[uint256(0)] >>> nBits;
					lowBits = (mag[uint256(0)] << nBits2) | (mag[uint256(1)] >>> nBits);
					if(highBits == 0)
					{
							highBits = lowBits;
							lowBits = (mag[uint256(1)] << nBits2) | (mag[uint256(2)] >>> nBits);
					}
			}

			twiceSignifFloor = ((highBits & LONG_MASK) << 32) | (lowBits & LONG_MASK);
			int64 signifFloor = int64(twiceSignifFloor >> 1);
			// remove the implied bit

			signifFloor &= DoubleConsts.SIGNIF_BIT_MASK;
			/*
         * We round up if either the fractional part of signif is strictly
         * greater than 0.5 (which is true if the 0.5 bit is set and any lower
         * bit is set), or if the fractional part of signif is >= 0.5 and
         * signifFloor is odd (which is true if both the 0.5 bit and the 1 bit
         * are set). This is equivalent to the desired HALF_EVEN rounding.
         */

			bool increment = bool((twiceSignifFloor & 1) != 0 && ((signifFloor & 1) != 0 || abs().getLowestSetBit() < shift));
			int64 signifRounded = int64(increment ? signifFloor : signifFloor + 1);
			int64 bits = int64(int64(((exponent + DoubleConsts.EXP_BIAS))) << (DoubleConsts.SIGNIFICAND_WIDTH - 1));
			bits += signifRounded;
			/*
         * If signifRounded == 2^53, we'd need to set all of the significand
         * bits to zero and add 1 to the exponent. This is exactly the behavior
         * we get from just adding signifRounded to bits directly. If the
         * exponent is Double.MAX_EXPONENT, we round up (correctly) to
         * Double.POSITIVE_INFINITY.
         */

			bits |= signum & DoubleConsts.SIGN_BIT_MASK;
			return .longBitsToDouble(bits);
	}

	

	/**
 * Returns the length of the two's complement representation in ints,
 * including space for at least one sign bit.
 */

	function intLength() private returns(int32)
	{
			return (bitLength() >>> 5) + 1;
	}

	/* Returns sign bit */

	function signBit() private returns(int32)
	{
			return signum < 0 ? 0 : 1;
	}

	/* Returns an int of sign bits */

	function signInt() private returns(int32)
	{
			return signum < 0 ? 0 : -1;
	}

	/**
 * Returns the specified int of the little-endian two's complement
 * representation (int 0 is the least significant).  The int number can
 * be arbitrarily high (values are logically preceded by infinitely many
 * sign ints).
 */

	function getInt(int32 n) private returns(int32)
	{
			if(n < 0);
			if(n >= mag.length);
			int32 magInt = int32(mag[uint256(mag.length - n - 1)]);
			return (signum >= 0 ? (n <= firstNonzeroIntNum() ? ~magInt; : -magInt;) : magInt)
	}

	/**
 * Returns the index of the int that contains the first nonzero int in the
 * little-endian binary representation of the magnitude (int 0 is the
 * least significant). If the magnitude is zero, return value is undefined.
 */

	function firstNonzeroIntNum() private returns(int32)
	{
			int32 fn = int32(firstNonzeroIntNum - 2);
			if(fn == -2;)
			{
					// firstNonzeroIntNum not initialized yet

					fn = 0;
					// Search for the first nonzero int

					int32 i;
					int32 mlen = int32(mag.length);
					fn = mlen - i - 1;
					// offset by two to initialize

					firstNonzeroIntNum = fn + 2;
			}
			return fn;
	}

	/**
 * use serialVersionUID from JDK 1.1. for interoperability
 */

	int64 static  immutable serialVersionUID

	

	/**
 * Reconstitute the {@code BigInteger} instance from a stream (that is,
 * deserialize it). The magnitude is read in as an array of bytes
 * for historical reasons, but it is converted to an array of ints
 * and the byte array is discarded.
 * Note:
 * The current convention is to initialize the cache fields, bitCount,
 * bitLength and lowestSetBit, to 0 rather than some other marker value.
 * Therefore, no explicit action to set these fields needs to be taken in
 * readObject because those fields already have a 0 value be default since
 * defaultReadObject is not being used.
 */

	function readObject(ObjectInputStream s) private
	{
			// prepare to read the alternate persistent fields

			GetField fields = GetField(.readFields());
			// Read the alternate persistent fields that we care about

			int32 sign = int32(.get("signum", -2;)
			// Validate signum

			if(sign < -1; || sign > 1)
			{
					string memory message = string("BigInteger: Invalid signum value");
					if(.defaulted("signum"));
			}
			if((mag.length == 0) != (sign == 0))
			{
					string memory message = string("BigInteger: signum-magnitude mismatch");
					if(.defaulted("magnitude"));
			}
			if(mag.length >= MAX_MAG_LENGTH)
			{
						//try

							checkRange();

						/* catch (ArithmeticException e) {
    throw new java.io.StreamCorruptedException("BigInteger: Out of the supported range");
}*/


			}
	}

	/**
 * Save the {@code BigInteger} instance to a stream.
 * The magnitude of a BigInteger is serialized as a byte array for
 * historical reasons.
 *
 * @serialData two necessary fields are written as well as obsolete
 *             fields for compatibility with older versions.
 */

	function writeObject(ObjectOutputStream s) private
	{
			// set the values of the Serializable fields

			PutField fields = PutField(.putFields());
			.put("magnitude", magSerializedForm());
			// versions, but are ignored in readObject so don't otherwise matter.

			.put("bitCount", -1;)
			.put("bitLength", -1;)
			.put("lowestSetBit", -2;)
			.put("firstNonzeroByteNum", -2;)
			// save them

			.writeFields();
	}

	/**
 * Returns the mag array as an array of bytes.
 */

	function magSerializedForm() private returns(

	/**
 * Converts this {@code BigInteger} to a {@code long}, checking
 * for lost information.  If the value of this {@code BigInteger}
 * is out of the range of the {@code long} type, then an
 * {@code ArithmeticException} is thrown.
 *
 * @return this {@code BigInteger} converted to a {@code long}.
 * @throws ArithmeticException if the value of {@code this} will
 * not exactly fit in a {@code long}.
 * @see BigInteger#longValue
 * @since  1.8
 */

	function longValueExact() public returns(int64)
	{
	}

	/**
 * Converts this {@code BigInteger} to an {@code int}, checking
 * for lost information.  If the value of this {@code BigInteger}
 * is out of the range of the {@code int} type, then an
 * {@code ArithmeticException} is thrown.
 *
 * @return this {@code BigInteger} converted to an {@code int}.
 * @throws ArithmeticException if the value of {@code this} will
 * not exactly fit in a {@code int}.
 * @see BigInteger#intValue
 * @since  1.8
 */

	function intValueExact() public returns(int32)
	{
	}

	/**
 * Converts this {@code BigInteger} to a {@code short}, checking
 * for lost information.  If the value of this {@code BigInteger}
 * is out of the range of the {@code short} type, then an
 * {@code ArithmeticException} is thrown.
 *
 * @return this {@code BigInteger} converted to a {@code short}.
 * @throws ArithmeticException if the value of {@code this} will
 * not exactly fit in a {@code short}.
 * @see BigInteger#shortValue
 * @since  1.8
 */

	function shortValueExact() public returns(int16)
	{
			if(mag.length <= 1 && bitLength() <= 31)
			{
					int32 value = int32(intValue());
					if(value >= Short.MIN_VALUE && value <= Short.MAX_VALUE);
			}
	}

	/**
 * Converts this {@code BigInteger} to a {@code byte}, checking
 * for lost information.  If the value of this {@code BigInteger}
 * is out of the range of the {@code byte} type, then an
 * {@code ArithmeticException} is thrown.
 *
 * @return this {@code BigInteger} converted to a {@code byte}.
 * @throws ArithmeticException if the value of {@code this} will
 * not exactly fit in a {@code byte}.
 * @see BigInteger#byteValue
 * @since  1.8
 */

	function byteValueExact() public returns(int8)
	{
			if(mag.length <= 1 && bitLength() <= 31)
			{
					int32 value = int32(intValue());
					if(value >= Byte.MIN_VALUE && value <= Byte.MAX_VALUE);
			}
	}

}

library BigInteger_Library
{
	// Multiply x array times word y in place, and add word z

	function destructiveMulAdd(int32[] memory x, int32 y, int32 z) private
	{
			// Perform the multiplication word by word

			int64 ylong = int64(y & LONG_MASK);
			int64 zlong = int64(z & LONG_MASK);
			int32 len = int32(x.length);
			int64 product = int64(0);
			int64 carry = int64(0);
			for(int32 i = int32(len - 1); i >= 0; i--)
			{
					product = ylong * (x[uint256(i)] & LONG_MASK) + carry;
					x[uint256(i)] = int32(product);
					carry = product >>> 32;
			}
			// Perform the addition

			int64 sum = int64((x[uint256(len - 1)] & LONG_MASK) + zlong);
			x[uint256(len - 1)] = int32(sum);
			carry = sum >>> 32;
			for(int32 i = int32(len - 2); i >= 0; i--)
			{
					sum = (x[uint256(i)] & LONG_MASK) + carry;
					x[uint256(i)] = int32(sum);
					carry = sum >>> 32;
			}
	}

	function randomBits(int32 numBits, Random rnd) private returns(

	/**
 * Returns a positive BigInteger that is probably prime, with the
 * specified bitLength. The probability that a BigInteger returned
 * by this method is composite does not exceed 2<sup>-100</sup>.
 *
 * @param  bitLength bitLength of the returned BigInteger.
 * @param  rnd source of random bits used to select candidates to be
 *         tested for primality.
 * @return a BigInteger of {@code bitLength} bits that is probably prime
 * @throws ArithmeticException {@code bitLength < 2} or {@code bitLength} is too large.
 * @see    #bitLength()
 * @since 1.4
 */

	function probablePrime(int32 bitLength, Random rnd) public returns(BigInteger)
	{
			if(bitLength < 2);
			return ();
	}

	/**
 * Find a random number of the specified bitLength that is probably prime.
 * This method is used for smaller primes, its performance degrades on
 * larger bitlengths.
 *
 * This method assumes bitLength > 1.
 */

	function smallPrime(int32 bitLength, int32 certainty, Random rnd) private returns(BigInteger)
	{
			int32 magLen = int32((bitLength + 31) >>> 5);
			// High bit of high int

			int32 highBit = int32(1 << ((bitLength + 31) & 0x1f));
			// Bits to keep in high int

			int32 highMask = int32((highBit << 1) - 1);
			while(true)
			{
					// Construct a candidate

					for(int32 i = int32(0); i < magLen; i++)
					{
						temp[uint256(i)] = .nextInt();					}
					// Ensure exact length

					temp[uint256(0)] = (temp[uint256(0)] & highMask) | highBit;
					if(bitLength > 2);
					BigInteger p;
					// Do cheap "pre-test" if applicable

					if(bitLength > 6)
					{
							int64 r;
							if((r % 3 == 0) || (r % 5 == 0) || (r % 7 == 0) || (r % 11 == 0) || (r % 13 == 0) || (r % 17 == 0) || (r % 19 == 0) || (r % 23 == 0) || (r % 29 == 0) || (r % 31 == 0) || (r % 37 == 0) || (r % 41 == 0));
					}
					// All candidates of bitLength 2 and 3 are prime by this point

					if(bitLength < 4);

			}
	}

	/**
 * Find a random number of the specified bitLength that is probably prime.
 * This method is more appropriate for larger bitlengths since it uses
 * a sieve to eliminate most composites before using a more expensive
 * test.
 */

	function largePrime(int32 bitLength, int32 certainty, Random rnd) private returns(BigInteger)
	{
			BigInteger p;
			;
			p.mag[uint256(p.mag.length - 1)] &= 0xfffffffe;
			// Use a sieve length likely to contain the next prime number

			int32 searchLen = int32(getPrimeSearchLen(bitLength));
			BitSieve searchSieve;
			BigInteger candidate;
			while(() || (.bitLength() != bitLength))
			{
					p = .add(CaseInsensitiveComparator_Library.valueOf(2 * searchLen));
					if(.bitLength() != bitLength);
					p.mag[uint256(p.mag.length - 1)] &= 0xfffffffe;
					;
					;

			}
			return candidate;
	}

	function getPrimeSearchLen(int32 bitLength) private returns(int32)
	{
			if(bitLength > PRIME_SEARCH_BIT_LENGTH_LIMIT + 1)
			{
			}
			return bitLength / 20 * 64;
	}

	/**
 * Computes Jacobi(p,n).
 * Assumes n positive, odd, n>=3.
 */

	function jacobiSymbol(int32 p, BigInteger n) private returns(int32)
	{
			if(p == 0);
			// Algorithm and comments adapted from Colin Plumb's C library.

			int32 j = int32(1);
			int32 u = int32(n.mag[uint256(n.mag.length - 1)]);
			// Make p positive

			if(p < 0)
			{
					p = -p;
					int32 n8 = int32(u & 7);
					if((n8 == 3) || (n8 == 7));
			}
			// Get rid of factors of 2 in p

			while((p & 3) == 0)
			{
				p >>= 2;
			}
			if((p & 1) == 0)
			{
					p >>= 1;
					if(((u ^ (u >> 1)) & 2) != 0);
			}
			if(p == 1);
			// Then, apply quadratic reciprocity

			if(// p = u = 3 (mod 4)?

(p & u & 2) != 0);
			// And reduce u mod p

			;
			// Now compute Jacobi(u,p), u < p

			while(u != 0)
			{
					while((u & 3) == 0)
					{
						u >>= 2;
					}
					if((u & 1) == 0)
					{
							u >>= 1;
							if(((p ^ (p >> 1)) & 2) != 0);
					}
					if(u == 1);
					int32 t = int32(u);
					u = p;
					p = t;
					if(// u = p = 3 (mod 4)?

(u & p & 2) != 0);
					// Now u >= p, so it can be reduced

					u %= p;

			}
			return 0;
	}

	function lucasLehmerSequence(int32 z, BigInteger k, BigInteger n) private returns(BigInteger)
	{
			BigInteger d;
			BigInteger u = BigInteger(ONE);
			BigInteger u2;
			BigInteger v = BigInteger(ONE);
			BigInteger v2;
			for(int32 i = int32(.bitLength() - 2); i >= 0; i--)
			{
					;
					;
					if(.testBit(0));
					v2 = .shiftRight(1);
					u = u2;
					v = v2;
					if(.testBit(i))
					{
							;
							if(.testBit(0));
							u2 = .shiftRight(1);
							;
							if(.testBit(0));
							v2 = .shiftRight(1);
							u = u2;
							v = v2;
					}
			}
			return u;
	}

	function reportOverflow() private
	{
	}

	/**
 * Returns a BigInteger whose value is equal to that of the
 * specified {@code long}.  This "static factory method" is
 * provided in preference to a ({@code long}) constructor
 * because it allows for reuse of frequently used BigIntegers.
 *
 * @param  val value of the BigInteger to return.
 * @return a BigInteger with the specified value.
 */

	function valueOf(int64 val) public returns(BigInteger)
	{
			// If -MAX_CONSTANT < val < MAX_CONSTANT, return stashed constant

			if(val == 0);
			if(val > 0 && val <= MAX_CONSTANT);
			else
			{
				if(val < 0 && val >= -MAX_CONSTANT;);			}

			return 
	}

	/**
 * Returns a BigInteger with the given two's complement representation.
 * Assumes that the input array will not be modified (the returned
 * BigInteger will reference the input array if feasible).
 */

	function valueOf(int32[] memory val) private returns(BigInteger)
	{
			return ();
	}

	/**
 * Adds the contents of the int array x and long value val. This
 * method allocates a new int array to hold the answer and returns
 * a reference to that array.  Assumes x.length &gt; 0 and val is
 * non-negative
 */

	function add(int32[] memory x, int64 val) private returns(

	/**
 * Adds the contents of the int arrays x and y. This method allocates
 * a new int array to hold the answer and returns a reference to that
 * array.
 */

	function add(int32[] memory x, int32[] memory y) private returns(

	function subtract(int64 val, int32[] memory little) private returns(

	/**
 * Subtracts the contents of the second argument (val) from the
 * first (big).  The first int array (big) must represent a larger number
 * than the second.  This method allocates the space necessary to hold the
 * answer.
 * assumes val &gt;= 0
 */

	function subtract(int32[] memory big, int64 val) private returns(

	/**
 * Subtracts the contents of the second int arrays (little) from the
 * first (big).  The first int array (big) must represent a larger number
 * than the second.  This method allocates the space necessary to hold the
 * answer.
 */

	function subtract(int32[] memory big, int32[] memory little) private returns(

	function multiplyByInt(int32[] memory x, int32 y, int32 sign) private returns(BigInteger)
	{
			if()
			{
					return 
			}
			int32 xlen = int32(x.length);
			int64 carry = int64(0);
			int64 yl = int64(y & LONG_MASK);
			int32 rstart = int32(rmag.length - 1);
			for(int32 i = int32(xlen - 1); i >= 0; i--)
			{
					int64 product = int64((x[uint256(i)] & LONG_MASK) * yl + carry);
					rmag[uint256(rstart--;)] = int32(product)
					carry = product >>> 32;
			}
			if()
			{
					;
			}
			else
			{
					rmag[uint256(rstart)] = int32(carry);
			}

			return 
	}

	/**
 * Multiplies two BigIntegers using the Karatsuba multiplication
 * algorithm.  This is a recursive divide-and-conquer algorithm which is
 * more efficient for large numbers than what is commonly called the
 * "grade-school" algorithm used in multiplyToLen.  If the numbers to be
 * multiplied have length n, the "grade-school" algorithm has an
 * asymptotic complexity of O(n^2).  In contrast, the Karatsuba algorithm
 * has complexity of O(n^(log2(3))), or O(n^1.585).  It achieves this
 * increased performance by doing 3 multiplies instead of 4 when
 * evaluating the product.  As it has some overhead, should be used when
 * both numbers are larger than a certain threshold (found
 * experimentally).
 *
 * See:  http://en.wikipedia.org/wiki/Karatsuba_algorithm
 */

	function multiplyKaratsuba(BigInteger x, BigInteger y) private returns(BigInteger)
	{
			int32 xlen = int32(x.mag.length);
			int32 ylen = int32(y.mag.length);
			// The number of ints in each half of the number.

			int32 half = int32((RandomNumberGeneratorHolder_Library.max(xlen, ylen) + 1) / 2);
			// xh and yh are the upper halves.

			BigInteger xl = BigInteger(.getLower(half));
			BigInteger xh = BigInteger(.getUpper(half));
			BigInteger yl = BigInteger(.getLower(half));
			BigInteger yh = BigInteger(.getUpper(half));
			// p1 = xh*yh

			BigInteger p1 = BigInteger(.multiply(yh));
			// p2 = xl*yl

			BigInteger p2 = BigInteger(.multiply(yl));
			// p3=(xh+xl)*(yh+yl)

			BigInteger p3 = BigInteger(.add(xl).multiply(.add(yl)));
			// result = p1 * 2^(32*2*half) + (p3 - p1 - p2) * 2^(32*half) + p2

			BigInteger result = BigInteger(.shiftLeft(32 * half).add(.subtract(p1).subtract(p2)).shiftLeft(32 * half).add(p2));
			if(x.signum != y.signum)
			{
					return .negate();
			}
			else
			{
					return result;
			}

	}

	/**
 * Multiplies two BigIntegers using a 3-way Toom-Cook multiplication
 * algorithm.  This is a recursive divide-and-conquer algorithm which is
 * more efficient for large numbers than what is commonly called the
 * "grade-school" algorithm used in multiplyToLen.  If the numbers to be
 * multiplied have length n, the "grade-school" algorithm has an
 * asymptotic complexity of O(n^2).  In contrast, 3-way Toom-Cook has a
 * complexity of about O(n^1.465).  It achieves this increased asymptotic
 * performance by breaking each number into three parts and by doing 5
 * multiplies instead of 9 when evaluating the product.  Due to overhead
 * (additions, shifts, and one division) in the Toom-Cook algorithm, it
 * should only be used when both numbers are larger than a certain
 * threshold (found experimentally).  This threshold is generally larger
 * than that for Karatsuba multiplication, so this algorithm is generally
 * only used when numbers become significantly larger.
 *
 * The algorithm used is the "optimal" 3-way Toom-Cook algorithm outlined
 * by Marco Bodrato.
 *
 *  See: http://bodrato.it/toom-cook/
 *       http://bodrato.it/papers/#WAIFI2007
 *
 * "Towards Optimal Toom-Cook Multiplication for Univariate and
 * Multivariate Polynomials in Characteristic 2 and 0." by Marco BODRATO;
 * In C.Carlet and B.Sunar, Eds., "WAIFI'07 proceedings", p. 116-133,
 * LNCS #4547. Springer, Madrid, Spain, June 21-22, 2007.
 */

	function multiplyToomCook3(BigInteger a, BigInteger b) private returns(BigInteger)
	{
			int32 alen = int32(a.mag.length);
			int32 blen = int32(b.mag.length);
			int32 largest = int32(RandomNumberGeneratorHolder_Library.max(alen, blen));
			// Equal to ceil(largest/3)

			int32 k = int32((largest + 2) / 3);
			// r is the size (in ints) of the highest-order slice.

			int32 r = int32(largest - 2 * k);
			// bits of the numbers a and b, and a0 and b0 the least significant.

			BigInteger a0;
			a2 = .getToomSlice(k, r, 0, largest);
			a1 = .getToomSlice(k, r, 1, largest);
			a0 = .getToomSlice(k, r, 2, largest);
			b2 = .getToomSlice(k, r, 0, largest);
			b1 = .getToomSlice(k, r, 1, largest);
			b0 = .getToomSlice(k, r, 2, largest);
			BigInteger v0;
			;
			da1 = .add(a0);
			;
			;
			;
			;
			;
			;
			;
			// linear-time algorithm.

			;
			;
			t1 = .subtract(v0);
			;
			;
			t2 = .subtract(.shiftLeft(1));
			;
			// Number of bits to shift left.

			int32 ss = int32(k * 32);
			BigInteger result;
			if(a.signum != b.signum)
			{
					return .negate();
			}
			else
			{
					return result;
			}

	}

	/**
 * Squares the contents of the int array x. The result is placed into the
 * int array z.  The contents of x are not changed.
 */

	function squareToLen(int32[] memory x, int32 len, int32[] memory z) private returns(

	/**
 * Package private method to return bit length for an integer.
 */

	function bitLengthForInt(int32 n) internal returns(int32)
	{
			return ;
	}

	/**
 * Left shift int array a up to len by n bits. Returns the array that
 * results from the shift since space may have to be reallocated.
 */

	function leftShift(int32[] memory a, int32 len, int32 n) private returns(

	// shifts a up to len right n bits assumes no leading zeros, 0<n<32

	function primitiveRightShift(int32[] memory a, int32 len, int32 n) internal
	{
			int32 n2 = int32(32 - n);
			for(int32 i = int32(len - 1); i > 0; i--)
			{
					int32 b = int32(c);
					c = a[uint256(i - 1)];
					a[uint256(i)] = (c << n2) | (b >>> n);
			}
			a[uint256(0)] >>>= n;
	}

	// shifts a up to len left n bits assumes no leading zeros, 0<=n<32

	function primitiveLeftShift(int32[] memory a, int32 len, int32 n) internal
	{
			if(len == 0 || n == 0);
			int32 n2 = int32(32 - n);
			for(int32 i = int32(0); i < m; i++)
			{
					int32 b = int32(c);
					c = a[uint256(i + 1)];
					a[uint256(i)] = (b << n) | (c >>> n2);
			}
			a[uint256(len - 1)] <<= n;
	}

	/**
 * Calculate bitlength of contents of the first len elements an int array,
 * assuming there are no leading zero ints.
 */

	function bitLength(int32[] memory val, int32 len) private returns(int32)
	{
			if(len == 0);
			return ((len - 1) << 5) + bitLengthForInt(val[uint256(0)]);
	}

	/**
 * Montgomery reduce n, modulo mod.  This reduces modulo mod and divides
 * by 2^(32*mlen). Adapted from Colin Plumb's C library.
 */

	function montReduce(int32[] memory n, int32[] memory mod, int32 mlen, int32 inv) private returns(

	/*
     * Returns -1, 0 or +1 as big-endian unsigned int array arg1 is less than,
     * equal to, or greater than arg2 up to length len.
     */

	function intArrayCmpToLen(int32[] memory arg1, int32[] memory arg2, int32 len) private returns(int32)
	{
			for(int32 i = int32(0); i < len; i++)
			{
					int64 b1 = int64(arg1[uint256(i)] & LONG_MASK);
					int64 b2 = int64(arg2[uint256(i)] & LONG_MASK);
					if(b1 < b2);
					if(b1 > b2);
			}
			return 0;
	}

	/**
 * Subtracts two numbers of same length, returning borrow.
 */

	function subN(int32[] memory a, int32[] memory b, int32 len) private returns(int32)
	{
			int64 sum = int64(0);
			while(--len; >= 0)
			{
					sum = (a[uint256(len)] & LONG_MASK) - (b[uint256(len)] & LONG_MASK) + (sum >> 32);
					a[uint256(len)] = int32(sum);

			}
			return int32((sum >> 32));
	}

	/**
 * Multiply an array by one word k and add to result, return the carry
 */

	function mulAdd(int32[] memory out, int32[] memory in, int32 offset, int32 len, int32 k) internal returns(int32)
	{
			int64 kLong = int64(k & LONG_MASK);
			int64 carry = int64(0);
			offset = out.length - offset - 1;
			for(int32 j = int32(len - 1); j >= 0; j--)
			{
					int64 product = int64((in[uint256(j)] & LONG_MASK) * kLong + (out[uint256(offset)] & LONG_MASK) + carry);
					out[uint256(offset--;)] = int32(product)
					carry = product >>> 32;
			}
			return int32(carry);
	}

	/**
 * Add one word to the number a mlen words into a. Return the resulting
 * carry.
 */

	function addOne(int32[] memory a, int32 offset, int32 mlen, int32 carry) internal returns(int32)
	{
			offset = a.length - 1 - mlen - offset;
			int64 t = int64((a[uint256(offset)] & LONG_MASK) + (carry & LONG_MASK));
			a[uint256(offset)] = int32(t);
			if((t >>> 32) == 0);
			while(--mlen; >= 0)
			{
					if(--offset; < 0)
					{
							// Carry out of number

							return 1;
					}
					else
					{
							a[uint256(offset)]++;
							if(a[uint256(offset)] != 0);
					}


			}
			return 1;
	}

	/**
 * Returns a magnitude array whose value is {@code (mag << n)}.
 * The shift distance, {@code n}, is considered unnsigned.
 * (Computes <tt>this * 2<sup>n</sup></tt>.)
 *
 * @param mag magnitude, the most-significant int ({@code mag[0]}) must be non-zero.
 * @param  n unsigned shift distance, in bits.
 * @return {@code mag << n}
 */

	function shiftLeft(int32[] memory mag, int32 n) private returns(

	/**
 * Converts the specified BigInteger to a string and appends to
 * {@code sb}.  This implements the recursive Schoenhage algorithm
 * for base conversions.
 * <p/>
 * See Knuth, Donald,  _The Art of Computer Programming_, Vol. 2,
 * Answers to Exercises (4.4) Question 14.
 *
 * @param u      The number to convert to a string.
 * @param sb     The StringBuilder that will be appended to in place.
 * @param radix  The base to convert to.
 * @param digits The minimum number of digits to pad to.
 */

	function toString(BigInteger u, StringBuilder sb, int32 radix, int32 digits) private
	{
			/* If we're smaller than a certain threshold, use the smallToString
           method, padding with leading zeroes when necessary. */

			if(u.mag.length <= SCHOENHAGE_BASE_CONVERSION_THRESHOLD)
			{
					string memory s;
					// Don't pad if we're at the beginning of the string.

					if((.length() < digits) && (.length() > 0))
					{
							for(int32 i = int32(.length()); i < digits; i++)
							{
									// do this?

									.append("0");
							}
					}
					.append(s);
					return 
			}
			int32 b;
			b = .bitLength();
			// cache index that contains the best value to divide u.

			n = int32(.round(.log(b * LOG_TWO / logCache[uint256(radix)]) / LOG_TWO - 1));
			BigInteger v;
			results = .divideAndRemainder(v);
			int32 expectedDigits = int32(1 << n);
	}

	/**
 * Returns the value radix^(2^exponent) from the cache.
 * If this value doesn't already exist in the cache, it is added.
 * <p/>
 * This could be changed to a more complicated caching method using
 * {@code Future}.
 */

	function getRadixConversionCache(int32 radix, int32 exponent) private returns(BigInteger)
	{
			if(exponent < cacheLine.length)
			{
					return cacheLine[uint256(exponent)];
			}
			int32 oldLength = int32(cacheLine.length);
			;
			for(int32 i = int32(oldLength); i <= exponent; i++)
			{
					cacheLine[uint256(i)] = cacheLine[uint256(i - 1)].pow(2);
			}
			if(exponent >= pc[uint256(radix)].length)
			{
					pc = .clone();
					pc[uint256(radix)] = cacheLine;
					// volatile write, publish

					powerCache = pc;
			}
			return cacheLine[uint256(exponent)];
	}

	/**
 * Returns a copy of the input array stripped of any leading zero bytes.
 */

	function stripLeadingZeroInts(int32[] memory val) private returns(

	/**
 * Returns the input array stripped of any leading zero bytes.
 * Since the source is trusted the copying may be skipped.
 */

	function trustedStripLeadingZeroInts(int32[] memory val) private returns(

	/**
 * Returns a copy of the input array stripped of any leading zero bytes.
 */

	function stripLeadingZeroBytes(int8[] memory a) private returns(

	/**
 * Takes an array a representing a negative 2's-complement number and
 * returns the minimal (no leading zero bytes) unsigned whose value is -a.
 */

	function makePositive(int8[] memory a) private returns(

	/**
 * Takes an array a representing a negative 2's-complement number and
 * returns the minimal (no leading zero ints) unsigned whose value is -a.
 */

	function makePositive(int32[] memory a) private returns(

	function putSign(BigInteger bi, int32 sign) internal
	{
	}

	function putMag(BigInteger bi, int32[] memory magnitude) internal
	{
	}

}

/*Optional.empty*/


/*Optional.empty*/


