pragma solidity 0.7.2;

//package java.lang


import "java/util/Random.sol";

import "sun/misc/FloatConsts.sol";

import "sun/misc/DoubleConsts.sol";

contract Math
{
	/**
 * The {@code double} value that is closer than any other to
 * <i>e</i>, the base of the natural logarithms.
 */

	int64 static  immutable E = int64(2);

	/**
 * The {@code double} value that is closer than any other to
 * <i>pi</i>, the ratio of the circumference of a circle to its
 * diameter.
 */

	int64 static  immutable PI = int64(3);

	/**
 * Returns the trigonometric sine of an angle.  Special cases:
 * <ul><li>If the argument is NaN or an infinity, then the
 * result is NaN.
 * <li>If the argument is zero, then the result is a zero with the
 * same sign as the argument.</ul>
 *
 * <p>The computed result must be within 1 ulp of the exact result.
 * Results must be semi-monotonic.
 *
 * @param   a   an angle, in radians.
 * @return  the sine of the argument.
 */

	function sin(int64 a) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Returns the trigonometric cosine of an angle. Special cases:
 * <ul><li>If the argument is NaN or an infinity, then the
 * result is NaN.</ul>
 *
 * <p>The computed result must be within 1 ulp of the exact result.
 * Results must be semi-monotonic.
 *
 * @param   a   an angle, in radians.
 * @return  the cosine of the argument.
 */

	function cos(int64 a) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Returns the trigonometric tangent of an angle.  Special cases:
 * <ul><li>If the argument is NaN or an infinity, then the result
 * is NaN.
 * <li>If the argument is zero, then the result is a zero with the
 * same sign as the argument.</ul>
 *
 * <p>The computed result must be within 1 ulp of the exact result.
 * Results must be semi-monotonic.
 *
 * @param   a   an angle, in radians.
 * @return  the tangent of the argument.
 */

	function tan(int64 a) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Returns the arc sine of a value; the returned angle is in the
 * range -<i>pi</i>/2 through <i>pi</i>/2.  Special cases:
 * <ul><li>If the argument is NaN or its absolute value is greater
 * than 1, then the result is NaN.
 * <li>If the argument is zero, then the result is a zero with the
 * same sign as the argument.</ul>
 *
 * <p>The computed result must be within 1 ulp of the exact result.
 * Results must be semi-monotonic.
 *
 * @param   a   the value whose arc sine is to be returned.
 * @return  the arc sine of the argument.
 */

	function asin(int64 a) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Returns the arc cosine of a value; the returned angle is in the
 * range 0.0 through <i>pi</i>.  Special case:
 * <ul><li>If the argument is NaN or its absolute value is greater
 * than 1, then the result is NaN.</ul>
 *
 * <p>The computed result must be within 1 ulp of the exact result.
 * Results must be semi-monotonic.
 *
 * @param   a   the value whose arc cosine is to be returned.
 * @return  the arc cosine of the argument.
 */

	function acos(int64 a) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Returns the arc tangent of a value; the returned angle is in the
 * range -<i>pi</i>/2 through <i>pi</i>/2.  Special cases:
 * <ul><li>If the argument is NaN, then the result is NaN.
 * <li>If the argument is zero, then the result is a zero with the
 * same sign as the argument.</ul>
 *
 * <p>The computed result must be within 1 ulp of the exact result.
 * Results must be semi-monotonic.
 *
 * @param   a   the value whose arc tangent is to be returned.
 * @return  the arc tangent of the argument.
 */

	function atan(int64 a) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Converts an angle measured in degrees to an approximately
 * equivalent angle measured in radians.  The conversion from
 * degrees to radians is generally inexact.
 *
 * @param   angdeg   an angle, in degrees
 * @return  the measurement of the angle {@code angdeg}
 *          in radians.
 * @since   1.2
 */

	function toRadians(int64 angdeg) public returns(int64)
	{
			return angdeg / 180 * PI;
	}

	/**
 * Converts an angle measured in radians to an approximately
 * equivalent angle measured in degrees.  The conversion from
 * radians to degrees is generally inexact; users should
 * <i>not</i> expect {@code cos(toRadians(90.0))} to exactly
 * equal {@code 0.0}.
 *
 * @param   angrad   an angle, in radians
 * @return  the measurement of the angle {@code angrad}
 *          in degrees.
 * @since   1.2
 */

	function toDegrees(int64 angrad) public returns(int64)
	{
			return angrad * 180 / PI;
	}

	/**
 * Returns Euler's number <i>e</i> raised to the power of a
 * {@code double} value.  Special cases:
 * <ul><li>If the argument is NaN, the result is NaN.
 * <li>If the argument is positive infinity, then the result is
 * positive infinity.
 * <li>If the argument is negative infinity, then the result is
 * positive zero.</ul>
 *
 * <p>The computed result must be within 1 ulp of the exact result.
 * Results must be semi-monotonic.
 *
 * @param   a   the exponent to raise <i>e</i> to.
 * @return  the value <i>e</i><sup>{@code a}</sup>,
 *          where <i>e</i> is the base of the natural logarithms.
 */

	function exp(int64 a) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Returns the natural logarithm (base <i>e</i>) of a {@code double}
 * value.  Special cases:
 * <ul><li>If the argument is NaN or less than zero, then the result
 * is NaN.
 * <li>If the argument is positive infinity, then the result is
 * positive infinity.
 * <li>If the argument is positive zero or negative zero, then the
 * result is negative infinity.</ul>
 *
 * <p>The computed result must be within 1 ulp of the exact result.
 * Results must be semi-monotonic.
 *
 * @param   a   a value
 * @return  the value ln&nbsp;{@code a}, the natural logarithm of
 *          {@code a}.
 */

	function log(int64 a) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Returns the base 10 logarithm of a {@code double} value.
 * Special cases:
 *
 * <ul><li>If the argument is NaN or less than zero, then the result
 * is NaN.
 * <li>If the argument is positive infinity, then the result is
 * positive infinity.
 * <li>If the argument is positive zero or negative zero, then the
 * result is negative infinity.
 * <li> If the argument is equal to 10<sup><i>n</i></sup> for
 * integer <i>n</i>, then the result is <i>n</i>.
 * </ul>
 *
 * <p>The computed result must be within 1 ulp of the exact result.
 * Results must be semi-monotonic.
 *
 * @param   a   a value
 * @return  the base 10 logarithm of  {@code a}.
 * @since 1.5
 */

	function log10(int64 a) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Returns the correctly rounded positive square root of a
 * {@code double} value.
 * Special cases:
 * <ul><li>If the argument is NaN or less than zero, then the result
 * is NaN.
 * <li>If the argument is positive infinity, then the result is positive
 * infinity.
 * <li>If the argument is positive zero or negative zero, then the
 * result is the same as the argument.</ul>
 * Otherwise, the result is the {@code double} value closest to
 * the true mathematical square root of the argument value.
 *
 * @param   a   a value.
 * @return  the positive square root of {@code a}.
 *          If the argument is NaN or less than zero, the result is NaN.
 */

	function sqrt(int64 a) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Returns the cube root of a {@code double} value.  For
 * positive finite {@code x}, {@code cbrt(-x) ==
 * -cbrt(x)}; that is, the cube root of a negative value is
 * the negative of the cube root of that value's magnitude.
 *
 * Special cases:
 *
 * <ul>
 *
 * <li>If the argument is NaN, then the result is NaN.
 *
 * <li>If the argument is infinite, then the result is an infinity
 * with the same sign as the argument.
 *
 * <li>If the argument is zero, then the result is a zero with the
 * same sign as the argument.
 *
 * </ul>
 *
 * <p>The computed result must be within 1 ulp of the exact result.
 *
 * @param   a   a value.
 * @return  the cube root of {@code a}.
 * @since 1.5
 */

	function cbrt(int64 a) public returns(int64)
	{
			return 
	}

	/**
 * Computes the remainder operation on two arguments as prescribed
 * by the IEEE 754 standard.
 * The remainder value is mathematically equal to
 * <code>f1&nbsp;-&nbsp;f2</code>&nbsp;&times;&nbsp;<i>n</i>,
 * where <i>n</i> is the mathematical integer closest to the exact
 * mathematical value of the quotient {@code f1/f2}, and if two
 * mathematical integers are equally close to {@code f1/f2},
 * then <i>n</i> is the integer that is even. If the remainder is
 * zero, its sign is the same as the sign of the first argument.
 * Special cases:
 * <ul><li>If either argument is NaN, or the first argument is infinite,
 * or the second argument is positive zero or negative zero, then the
 * result is NaN.
 * <li>If the first argument is finite and the second argument is
 * infinite, then the result is the same as the first argument.</ul>
 *
 * @param   f1   the dividend.
 * @param   f2   the divisor.
 * @return  the remainder when {@code f1} is divided by
 *          {@code f2}.
 */

	function IEEEremainder(int64 f1, int64 f2) public returns(int64)
	{
			// delegate to StrictMath

			return 
	}

	/**
 * Returns the smallest (closest to negative infinity)
 * {@code double} value that is greater than or equal to the
 * argument and is equal to a mathematical integer. Special cases:
 * <ul><li>If the argument value is already equal to a
 * mathematical integer, then the result is the same as the
 * argument.  <li>If the argument is NaN or an infinity or
 * positive zero or negative zero, then the result is the same as
 * the argument.  <li>If the argument value is less than zero but
 * greater than -1.0, then the result is negative zero.</ul> Note
 * that the value of {@code Math.ceil(x)} is exactly the
 * value of {@code -Math.floor(-x)}.
 *
 * @param   a   a value.
 * @return  the smallest (closest to negative infinity)
 *          floating-point value that is greater than or equal to
 *          the argument and is equal to a mathematical integer.
 */

	function ceil(int64 a) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Returns the largest (closest to positive infinity)
 * {@code double} value that is less than or equal to the
 * argument and is equal to a mathematical integer. Special cases:
 * <ul><li>If the argument value is already equal to a
 * mathematical integer, then the result is the same as the
 * argument.  <li>If the argument is NaN or an infinity or
 * positive zero or negative zero, then the result is the same as
 * the argument.</ul>
 *
 * @param   a   a value.
 * @return  the largest (closest to positive infinity)
 *          floating-point value that less than or equal to the argument
 *          and is equal to a mathematical integer.
 */

	function floor(int64 a) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Returns the {@code double} value that is closest in value
 * to the argument and is equal to a mathematical integer. If two
 * {@code double} values that are mathematical integers are
 * equally close, the result is the integer value that is
 * even. Special cases:
 * <ul><li>If the argument value is already equal to a mathematical
 * integer, then the result is the same as the argument.
 * <li>If the argument is NaN or an infinity or positive zero or negative
 * zero, then the result is the same as the argument.</ul>
 *
 * @param   a   a {@code double} value.
 * @return  the closest floating-point value to {@code a} that is
 *          equal to a mathematical integer.
 */

	function rint(int64 a) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Returns the angle <i>theta</i> from the conversion of rectangular
 * coordinates ({@code x},&nbsp;{@code y}) to polar
 * coordinates (r,&nbsp;<i>theta</i>).
 * This method computes the phase <i>theta</i> by computing an arc tangent
 * of {@code y/x} in the range of -<i>pi</i> to <i>pi</i>. Special
 * cases:
 * <ul><li>If either argument is NaN, then the result is NaN.
 * <li>If the first argument is positive zero and the second argument
 * is positive, or the first argument is positive and finite and the
 * second argument is positive infinity, then the result is positive
 * zero.
 * <li>If the first argument is negative zero and the second argument
 * is positive, or the first argument is negative and finite and the
 * second argument is positive infinity, then the result is negative zero.
 * <li>If the first argument is positive zero and the second argument
 * is negative, or the first argument is positive and finite and the
 * second argument is negative infinity, then the result is the
 * {@code double} value closest to <i>pi</i>.
 * <li>If the first argument is negative zero and the second argument
 * is negative, or the first argument is negative and finite and the
 * second argument is negative infinity, then the result is the
 * {@code double} value closest to -<i>pi</i>.
 * <li>If the first argument is positive and the second argument is
 * positive zero or negative zero, or the first argument is positive
 * infinity and the second argument is finite, then the result is the
 * {@code double} value closest to <i>pi</i>/2.
 * <li>If the first argument is negative and the second argument is
 * positive zero or negative zero, or the first argument is negative
 * infinity and the second argument is finite, then the result is the
 * {@code double} value closest to -<i>pi</i>/2.
 * <li>If both arguments are positive infinity, then the result is the
 * {@code double} value closest to <i>pi</i>/4.
 * <li>If the first argument is positive infinity and the second argument
 * is negative infinity, then the result is the {@code double}
 * value closest to 3*<i>pi</i>/4.
 * <li>If the first argument is negative infinity and the second argument
 * is positive infinity, then the result is the {@code double} value
 * closest to -<i>pi</i>/4.
 * <li>If both arguments are negative infinity, then the result is the
 * {@code double} value closest to -3*<i>pi</i>/4.</ul>
 *
 * <p>The computed result must be within 2 ulps of the exact result.
 * Results must be semi-monotonic.
 *
 * @param   y   the ordinate coordinate
 * @param   x   the abscissa coordinate
 * @return  the <i>theta</i> component of the point
 *          (<i>r</i>,&nbsp;<i>theta</i>)
 *          in polar coordinates that corresponds to the point
 *          (<i>x</i>,&nbsp;<i>y</i>) in Cartesian coordinates.
 */

	function atan2(int64 y, int64 x) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Returns the value of the first argument raised to the power of the
 * second argument. Special cases:
 *
 * <ul><li>If the second argument is positive or negative zero, then the
 * result is 1.0.
 * <li>If the second argument is 1.0, then the result is the same as the
 * first argument.
 * <li>If the second argument is NaN, then the result is NaN.
 * <li>If the first argument is NaN and the second argument is nonzero,
 * then the result is NaN.
 *
 * <li>If
 * <ul>
 * <li>the absolute value of the first argument is greater than 1
 * and the second argument is positive infinity, or
 * <li>the absolute value of the first argument is less than 1 and
 * the second argument is negative infinity,
 * </ul>
 * then the result is positive infinity.
 *
 * <li>If
 * <ul>
 * <li>the absolute value of the first argument is greater than 1 and
 * the second argument is negative infinity, or
 * <li>the absolute value of the
 * first argument is less than 1 and the second argument is positive
 * infinity,
 * </ul>
 * then the result is positive zero.
 *
 * <li>If the absolute value of the first argument equals 1 and the
 * second argument is infinite, then the result is NaN.
 *
 * <li>If
 * <ul>
 * <li>the first argument is positive zero and the second argument
 * is greater than zero, or
 * <li>the first argument is positive infinity and the second
 * argument is less than zero,
 * </ul>
 * then the result is positive zero.
 *
 * <li>If
 * <ul>
 * <li>the first argument is positive zero and the second argument
 * is less than zero, or
 * <li>the first argument is positive infinity and the second
 * argument is greater than zero,
 * </ul>
 * then the result is positive infinity.
 *
 * <li>If
 * <ul>
 * <li>the first argument is negative zero and the second argument
 * is greater than zero but not a finite odd integer, or
 * <li>the first argument is negative infinity and the second
 * argument is less than zero but not a finite odd integer,
 * </ul>
 * then the result is positive zero.
 *
 * <li>If
 * <ul>
 * <li>the first argument is negative zero and the second argument
 * is a positive finite odd integer, or
 * <li>the first argument is negative infinity and the second
 * argument is a negative finite odd integer,
 * </ul>
 * then the result is negative zero.
 *
 * <li>If
 * <ul>
 * <li>the first argument is negative zero and the second argument
 * is less than zero but not a finite odd integer, or
 * <li>the first argument is negative infinity and the second
 * argument is greater than zero but not a finite odd integer,
 * </ul>
 * then the result is positive infinity.
 *
 * <li>If
 * <ul>
 * <li>the first argument is negative zero and the second argument
 * is a negative finite odd integer, or
 * <li>the first argument is negative infinity and the second
 * argument is a positive finite odd integer,
 * </ul>
 * then the result is negative infinity.
 *
 * <li>If the first argument is finite and less than zero
 * <ul>
 * <li> if the second argument is a finite even integer, the
 * result is equal to the result of raising the absolute value of
 * the first argument to the power of the second argument
 *
 * <li>if the second argument is a finite odd integer, the result
 * is equal to the negative of the result of raising the absolute
 * value of the first argument to the power of the second
 * argument
 *
 * <li>if the second argument is finite and not an integer, then
 * the result is NaN.
 * </ul>
 *
 * <li>If both arguments are integers, then the result is exactly equal
 * to the mathematical result of raising the first argument to the power
 * of the second argument if that result can in fact be represented
 * exactly as a {@code double} value.</ul>
 *
 * <p>(In the foregoing descriptions, a floating-point value is
 * considered to be an integer if and only if it is finite and a
 * fixed point of the method {@link #ceil ceil} or,
 * equivalently, a fixed point of the method {@link #floor
 * floor}. A value is a fixed point of a one-argument
 * method if and only if the result of applying the method to the
 * value is equal to the value.)
 *
 * <p>The computed result must be within 1 ulp of the exact result.
 * Results must be semi-monotonic.
 *
 * @param   a   the base.
 * @param   b   the exponent.
 * @return  the value {@code a}<sup>{@code b}</sup>.
 */

	function pow(int64 a, int64 b) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Returns the closest {@code int} to the argument, with ties
 * rounding to positive infinity.
 *
 * <p>
 * Special cases:
 * <ul><li>If the argument is NaN, the result is 0.
 * <li>If the argument is negative infinity or any value less than or
 * equal to the value of {@code Integer.MIN_VALUE}, the result is
 * equal to the value of {@code Integer.MIN_VALUE}.
 * <li>If the argument is positive infinity or any value greater than or
 * equal to the value of {@code Integer.MAX_VALUE}, the result is
 * equal to the value of {@code Integer.MAX_VALUE}.</ul>
 *
 * @param   a   a floating-point value to be rounded to an integer.
 * @return  the value of the argument rounded to the nearest
 *          {@code int} value.
 * @see     java.lang.Integer#MAX_VALUE
 * @see     java.lang.Integer#MIN_VALUE
 */

	function round(int32 a) public returns(int32)
	{
			int32 intBits;
			int32 biasedExp = int32((intBits & FloatConsts.EXP_BIT_MASK) >> (FloatConsts.SIGNIFICAND_WIDTH - 1));
			int32 shift = int32((FloatConsts.SIGNIFICAND_WIDTH - 2 + FloatConsts.EXP_BIAS) - biasedExp);
			if((shift & -32;) == 0)
			{
					// a is a finite number such that pow(2,-32) <= ulp(a) < 1

					int32 r = int32(((intBits & FloatConsts.SIGNIF_BIT_MASK) | (FloatConsts.SIGNIF_BIT_MASK + 1)));
					if(intBits < 0)
					{
							r = -r;
					}
					// (((r >> shift) + 1) >> 1) evaluates to floor(a + 1/2)

					return ((r >> shift) + 1) >> 1;
			}
			else
			{
					// - an infinity or NaN

					return int32(a);
			}

	}

	/**
 * Returns the closest {@code long} to the argument, with ties
 * rounding to positive infinity.
 *
 * <p>Special cases:
 * <ul><li>If the argument is NaN, the result is 0.
 * <li>If the argument is negative infinity or any value less than or
 * equal to the value of {@code Long.MIN_VALUE}, the result is
 * equal to the value of {@code Long.MIN_VALUE}.
 * <li>If the argument is positive infinity or any value greater than or
 * equal to the value of {@code Long.MAX_VALUE}, the result is
 * equal to the value of {@code Long.MAX_VALUE}.</ul>
 *
 * @param   a   a floating-point value to be rounded to a
 *          {@code long}.
 * @return  the value of the argument rounded to the nearest
 *          {@code long} value.
 * @see     java.lang.Long#MAX_VALUE
 * @see     java.lang.Long#MIN_VALUE
 */

	function round(int64 a) public returns(int64)
	{
			int64 longBits;
			int64 biasedExp = int64((longBits & DoubleConsts.EXP_BIT_MASK) >> (DoubleConsts.SIGNIFICAND_WIDTH - 1));
			int64 shift = int64((DoubleConsts.SIGNIFICAND_WIDTH - 2 + DoubleConsts.EXP_BIAS) - biasedExp);
			if((shift & -64;) == 0)
			{
					// a is a finite number such that pow(2,-64) <= ulp(a) < 1

					int64 r = int64(((longBits & DoubleConsts.SIGNIF_BIT_MASK) | (DoubleConsts.SIGNIF_BIT_MASK + 1)));
					if(longBits < 0)
					{
							r = -r;
					}
					// (((r >> shift) + 1) >> 1) evaluates to floor(a + 1/2)

					return ((r >> shift) + 1) >> 1;
			}
			else
			{
					// - an infinity or NaN

					return int64(a);
			}

	}

	/**
 * Returns a {@code double} value with a positive sign, greater
 * than or equal to {@code 0.0} and less than {@code 1.0}.
 * Returned values are chosen pseudorandomly with (approximately)
 * uniform distribution from that range.
 *
 * <p>When this method is first called, it creates a single new
 * pseudorandom-number generator, exactly as if by the expression
 *
 * <blockquote>{@code new java.util.Random()}</blockquote>
 *
 * This new pseudorandom-number generator is used thereafter for
 * all calls to this method and is used nowhere else.
 *
 * <p>This method is properly synchronized to allow correct use by
 * more than one thread. However, if many threads need to generate
 * pseudorandom numbers at a great rate, it may reduce contention
 * for each thread to have its own pseudorandom-number generator.
 *
 * @return  a pseudorandom {@code double} greater than or equal
 * to {@code 0.0} and less than {@code 1.0}.
 * @see Random#nextDouble()
 */

	function random() public returns(int64)
	{
			return RandomNumberGeneratorHolder.randomNumberGenerator.nextDouble();
	}

	/**
 * Returns the sum of its arguments,
 * throwing an exception if the result overflows an {@code int}.
 *
 * @param x the first value
 * @param y the second value
 * @return the result
 * @throws ArithmeticException if the result overflows an int
 * @since 1.8
 */

	function addExact(int32 x, int32 y) public returns(int32)
	{
			int32 r = int32(x + y);
			// HD 2-12 Overflow iff both arguments have the opposite sign of the result

			if(((x ^ r) & (y ^ r)) < 0)
			{
			}
			return r;
	}

	/**
 * Returns the sum of its arguments,
 * throwing an exception if the result overflows a {@code long}.
 *
 * @param x the first value
 * @param y the second value
 * @return the result
 * @throws ArithmeticException if the result overflows a long
 * @since 1.8
 */

	function addExact(int64 x, int64 y) public returns(int64)
	{
			int64 r = int64(x + y);
			// HD 2-12 Overflow iff both arguments have the opposite sign of the result

			if(((x ^ r) & (y ^ r)) < 0)
			{
			}
			return r;
	}

	/**
 * Returns the difference of the arguments,
 * throwing an exception if the result overflows an {@code int}.
 *
 * @param x the first value
 * @param y the second value to subtract from the first
 * @return the result
 * @throws ArithmeticException if the result overflows an int
 * @since 1.8
 */

	function subtractExact(int32 x, int32 y) public returns(int32)
	{
			int32 r = int32(x - y);
			// the sign of the result is different than the sign of x

			if(((x ^ y) & (x ^ r)) < 0)
			{
			}
			return r;
	}

	/**
 * Returns the difference of the arguments,
 * throwing an exception if the result overflows a {@code long}.
 *
 * @param x the first value
 * @param y the second value to subtract from the first
 * @return the result
 * @throws ArithmeticException if the result overflows a long
 * @since 1.8
 */

	function subtractExact(int64 x, int64 y) public returns(int64)
	{
			int64 r = int64(x - y);
			// the sign of the result is different than the sign of x

			if(((x ^ y) & (x ^ r)) < 0)
			{
			}
			return r;
	}

	/**
 * Returns the product of the arguments,
 * throwing an exception if the result overflows an {@code int}.
 *
 * @param x the first value
 * @param y the second value
 * @return the result
 * @throws ArithmeticException if the result overflows an int
 * @since 1.8
 */

	function multiplyExact(int32 x, int32 y) public returns(int32)
	{
			int64 r = int64(int64(x) * int64(y));
			if(int32(r) != r)
			{
			}
			return int32(r);
	}

	/**
 * Returns the product of the arguments,
 * throwing an exception if the result overflows a {@code long}.
 *
 * @param x the first value
 * @param y the second value
 * @return the result
 * @throws ArithmeticException if the result overflows a long
 * @since 1.8
 */

	function multiplyExact(int64 x, int64 y) public returns(int64)
	{
			int64 r = int64(x * y);
			int64 ax;
			int64 ay;
			if(((ax | ay) >>> 31 != 0))
			{
					// and check for the special case of Long.MIN_VALUE * -1

					if(((y != 0) && (r / y != x)) || (x == Long.MIN_VALUE && y == -1;))
					{
					}
			}
			return r;
	}

	/**
 * Returns the argument incremented by one, throwing an exception if the
 * result overflows an {@code int}.
 *
 * @param a the value to increment
 * @return the result
 * @throws ArithmeticException if the result overflows an int
 * @since 1.8
 */

	function incrementExact(int32 a) public returns(int32)
	{
			if(a == Integer.MAX_VALUE)
			{
			}
			return a + 1;
	}

	/**
 * Returns the argument incremented by one, throwing an exception if the
 * result overflows a {@code long}.
 *
 * @param a the value to increment
 * @return the result
 * @throws ArithmeticException if the result overflows a long
 * @since 1.8
 */

	function incrementExact(int64 a) public returns(int64)
	{
			if(a == Long.MAX_VALUE)
			{
			}
			return ;
	}

	/**
 * Returns the argument decremented by one, throwing an exception if the
 * result overflows an {@code int}.
 *
 * @param a the value to decrement
 * @return the result
 * @throws ArithmeticException if the result overflows an int
 * @since 1.8
 */

	function decrementExact(int32 a) public returns(int32)
	{
			if(a == Integer.MIN_VALUE)
			{
			}
			return a - 1;
	}

	/**
 * Returns the argument decremented by one, throwing an exception if the
 * result overflows a {@code long}.
 *
 * @param a the value to decrement
 * @return the result
 * @throws ArithmeticException if the result overflows a long
 * @since 1.8
 */

	function decrementExact(int64 a) public returns(int64)
	{
			if(a == Long.MIN_VALUE)
			{
			}
			return ;
	}

	/**
 * Returns the negation of the argument, throwing an exception if the
 * result overflows an {@code int}.
 *
 * @param a the value to negate
 * @return the result
 * @throws ArithmeticException if the result overflows an int
 * @since 1.8
 */

	function negateExact(int32 a) public returns(int32)
	{
			if(a == Integer.MIN_VALUE)
			{
			}
			return -a;
	}

	/**
 * Returns the negation of the argument, throwing an exception if the
 * result overflows a {@code long}.
 *
 * @param a the value to negate
 * @return the result
 * @throws ArithmeticException if the result overflows a long
 * @since 1.8
 */

	function negateExact(int64 a) public returns(int64)
	{
			if(a == Long.MIN_VALUE)
			{
			}
			return -a;
	}

	/**
 * Returns the value of the {@code long} argument;
 * throwing an exception if the value overflows an {@code int}.
 *
 * @param value the long value
 * @return the argument as an int
 * @throws ArithmeticException if the {@code argument} overflows an int
 * @since 1.8
 */

	function toIntExact(int64 value) public returns(int32)
	{
			if(int32(value) != value)
			{
			}
			return int32(value);
	}

	/**
 * Returns the largest (closest to positive infinity)
 * {@code int} value that is less than or equal to the algebraic quotient.
 * There is one special case, if the dividend is the
 * {@linkplain Integer#MIN_VALUE Integer.MIN_VALUE} and the divisor is {@code -1},
 * then integer overflow occurs and
 * the result is equal to the {@code Integer.MIN_VALUE}.
 * <p>
 * Normal integer division operates under the round to zero rounding mode
 * (truncation).  This operation instead acts under the round toward
 * negative infinity (floor) rounding mode.
 * The floor rounding mode gives different results than truncation
 * when the exact result is negative.
 * <ul>
 *   <li>If the signs of the arguments are the same, the results of
 *       {@code floorDiv} and the {@code /} operator are the same.  <br>
 *       For example, {@code floorDiv(4, 3) == 1} and {@code (4 / 3) == 1}.</li>
 *   <li>If the signs of the arguments are different,  the quotient is negative and
 *       {@code floorDiv} returns the integer less than or equal to the quotient
 *       and the {@code /} operator returns the integer closest to zero.<br>
 *       For example, {@code floorDiv(-4, 3) == -2},
 *       whereas {@code (-4 / 3) == -1}.
 *   </li>
 * </ul>
 * <p>
 *
 * @param x the dividend
 * @param y the divisor
 * @return the largest (closest to positive infinity)
 * {@code int} value that is less than or equal to the algebraic quotient.
 * @throws ArithmeticException if the divisor {@code y} is zero
 * @see #floorMod(int, int)
 * @see #floor(double)
 * @since 1.8
 */

	function floorDiv(int32 x, int32 y) public returns(int32)
	{
			int32 r = int32(x / y);
			// if the signs are different and modulo not zero, round down

			if((x ^ y) < 0 && (r * y != x))
			{
					r--;
			}
			return r;
	}

	/**
 * Returns the largest (closest to positive infinity)
 * {@code long} value that is less than or equal to the algebraic quotient.
 * There is one special case, if the dividend is the
 * {@linkplain Long#MIN_VALUE Long.MIN_VALUE} and the divisor is {@code -1},
 * then integer overflow occurs and
 * the result is equal to the {@code Long.MIN_VALUE}.
 * <p>
 * Normal integer division operates under the round to zero rounding mode
 * (truncation).  This operation instead acts under the round toward
 * negative infinity (floor) rounding mode.
 * The floor rounding mode gives different results than truncation
 * when the exact result is negative.
 * <p>
 * For examples, see {@link #floorDiv(int, int)}.
 *
 * @param x the dividend
 * @param y the divisor
 * @return the largest (closest to positive infinity)
 * {@code long} value that is less than or equal to the algebraic quotient.
 * @throws ArithmeticException if the divisor {@code y} is zero
 * @see #floorMod(long, long)
 * @see #floor(double)
 * @since 1.8
 */

	function floorDiv(int64 x, int64 y) public returns(int64)
	{
			int64 r = int64(x / y);
			// if the signs are different and modulo not zero, round down

			if((x ^ y) < 0 && (r * y != x))
			{
					r--;
			}
			return r;
	}

	/**
 * Returns the floor modulus of the {@code int} arguments.
 * <p>
 * The floor modulus is {@code x - (floorDiv(x, y) * y)},
 * has the same sign as the divisor {@code y}, and
 * is in the range of {@code -abs(y) < r < +abs(y)}.
 *
 * <p>
 * The relationship between {@code floorDiv} and {@code floorMod} is such that:
 * <ul>
 *   <li>{@code floorDiv(x, y) * y + floorMod(x, y) == x}
 * </ul>
 * <p>
 * The difference in values between {@code floorMod} and
 * the {@code %} operator is due to the difference between
 * {@code floorDiv} that returns the integer less than or equal to the quotient
 * and the {@code /} operator that returns the integer closest to zero.
 * <p>
 * Examples:
 * <ul>
 *   <li>If the signs of the arguments are the same, the results
 *       of {@code floorMod} and the {@code %} operator are the same.  <br>
 *       <ul>
 *       <li>{@code floorMod(4, 3) == 1}; &nbsp; and {@code (4 % 3) == 1}</li>
 *       </ul>
 *   <li>If the signs of the arguments are different, the results differ from the {@code %} operator.<br>
 *      <ul>
 *      <li>{@code floorMod(+4, -3) == -2}; &nbsp; and {@code (+4 % -3) == +1} </li>
 *      <li>{@code floorMod(-4, +3) == +2}; &nbsp; and {@code (-4 % +3) == -1} </li>
 *      <li>{@code floorMod(-4, -3) == -1}; &nbsp; and {@code (-4 % -3) == -1 } </li>
 *      </ul>
 *   </li>
 * </ul>
 * <p>
 * If the signs of arguments are unknown and a positive modulus
 * is needed it can be computed as {@code (floorMod(x, y) + abs(y)) % abs(y)}.
 *
 * @param x the dividend
 * @param y the divisor
 * @return the floor modulus {@code x - (floorDiv(x, y) * y)}
 * @throws ArithmeticException if the divisor {@code y} is zero
 * @see #floorDiv(int, int)
 * @since 1.8
 */

	function floorMod(int32 x, int32 y) public returns(int32)
	{
			int32 r = int32(x - );
			return r;
	}

	/**
 * Returns the floor modulus of the {@code long} arguments.
 * <p>
 * The floor modulus is {@code x - (floorDiv(x, y) * y)},
 * has the same sign as the divisor {@code y}, and
 * is in the range of {@code -abs(y) < r < +abs(y)}.
 *
 * <p>
 * The relationship between {@code floorDiv} and {@code floorMod} is such that:
 * <ul>
 *   <li>{@code floorDiv(x, y) * y + floorMod(x, y) == x}
 * </ul>
 * <p>
 * For examples, see {@link #floorMod(int, int)}.
 *
 * @param x the dividend
 * @param y the divisor
 * @return the floor modulus {@code x - (floorDiv(x, y) * y)}
 * @throws ArithmeticException if the divisor {@code y} is zero
 * @see #floorDiv(long, long)
 * @since 1.8
 */

	function floorMod(int64 x, int64 y) public returns(int64)
	{
			return x - ;
	}

	/**
 * Returns the absolute value of an {@code int} value.
 * If the argument is not negative, the argument is returned.
 * If the argument is negative, the negation of the argument is returned.
 *
 * <p>Note that if the argument is equal to the value of
 * {@link Integer#MIN_VALUE}, the most negative representable
 * {@code int} value, the result is that same value, which is
 * negative.
 *
 * @param   a   the argument whose absolute value is to be determined
 * @return  the absolute value of the argument.
 */

	function abs(int32 a) public returns(int32)
	{
			return (a < 0) ? a : -a;
	}

	/**
 * Returns the absolute value of a {@code long} value.
 * If the argument is not negative, the argument is returned.
 * If the argument is negative, the negation of the argument is returned.
 *
 * <p>Note that if the argument is equal to the value of
 * {@link Long#MIN_VALUE}, the most negative representable
 * {@code long} value, the result is that same value, which
 * is negative.
 *
 * @param   a   the argument whose absolute value is to be determined
 * @return  the absolute value of the argument.
 */

	function abs(int64 a) public returns(int64)
	{
			return (a < 0) ? a : -a;
	}

	/**
 * Returns the absolute value of a {@code float} value.
 * If the argument is not negative, the argument is returned.
 * If the argument is negative, the negation of the argument is returned.
 * Special cases:
 * <ul><li>If the argument is positive zero or negative zero, the
 * result is positive zero.
 * <li>If the argument is infinite, the result is positive infinity.
 * <li>If the argument is NaN, the result is NaN.</ul>
 * In other words, the result is the same as the value of the expression:
 * <p>{@code Float.intBitsToFloat(0x7fffffff & Float.floatToIntBits(a))}
 *
 * @param   a   the argument whose absolute value is to be determined
 * @return  the absolute value of the argument.
 */

	function abs(int32 a) public returns(int32)
	{
			return (a <= 0) ? a : 0 - a;
	}

	/**
 * Returns the absolute value of a {@code double} value.
 * If the argument is not negative, the argument is returned.
 * If the argument is negative, the negation of the argument is returned.
 * Special cases:
 * <ul><li>If the argument is positive zero or negative zero, the result
 * is positive zero.
 * <li>If the argument is infinite, the result is positive infinity.
 * <li>If the argument is NaN, the result is NaN.</ul>
 * In other words, the result is the same as the value of the expression:
 * <p>{@code Double.longBitsToDouble((Double.doubleToLongBits(a)<<1)>>>1)}
 *
 * @param   a   the argument whose absolute value is to be determined
 * @return  the absolute value of the argument.
 */

	function abs(int64 a) public returns(int64)
	{
			return (a <= 0) ? a : 0 - a;
	}

	/**
 * Returns the greater of two {@code int} values. That is, the
 * result is the argument closer to the value of
 * {@link Integer#MAX_VALUE}. If the arguments have the same value,
 * the result is that same value.
 *
 * @param   a   an argument.
 * @param   b   another argument.
 * @return  the larger of {@code a} and {@code b}.
 */

	function max(int32 a, int32 b) public returns(int32)
	{
			return (a >= b) ? b : a;
	}

	/**
 * Returns the greater of two {@code long} values. That is, the
 * result is the argument closer to the value of
 * {@link Long#MAX_VALUE}. If the arguments have the same value,
 * the result is that same value.
 *
 * @param   a   an argument.
 * @param   b   another argument.
 * @return  the larger of {@code a} and {@code b}.
 */

	function max(int64 a, int64 b) public returns(int64)
	{
			return (a >= b) ? b : a;
	}

	// Use raw bit-wise conversions on guaranteed non-NaN arguments.

	int64 static  negativeZeroFloatBits = int64(.floatToRawIntBits(-0;)

	int64 static  negativeZeroDoubleBits = int64(.doubleToRawLongBits(-0;)

	/**
 * Returns the greater of two {@code float} values.  That is,
 * the result is the argument closer to positive infinity. If the
 * arguments have the same value, the result is that same
 * value. If either value is NaN, then the result is NaN.  Unlike
 * the numerical comparison operators, this method considers
 * negative zero to be strictly smaller than positive zero. If one
 * argument is positive zero and the other negative zero, the
 * result is positive zero.
 *
 * @param   a   an argument.
 * @param   b   another argument.
 * @return  the larger of {@code a} and {@code b}.
 */

	function max(int32 a, int32 b) public returns(int32)
	{
			if(a != a);
			if((a == 0) && (b == 0) && ())
			{
					// Raw conversion ok since NaN can't map to -0.0.

					return b;
			}
			return (a >= b) ? b : a;
	}

	/**
 * Returns the greater of two {@code double} values.  That
 * is, the result is the argument closer to positive infinity. If
 * the arguments have the same value, the result is that same
 * value. If either value is NaN, then the result is NaN.  Unlike
 * the numerical comparison operators, this method considers
 * negative zero to be strictly smaller than positive zero. If one
 * argument is positive zero and the other negative zero, the
 * result is positive zero.
 *
 * @param   a   an argument.
 * @param   b   another argument.
 * @return  the larger of {@code a} and {@code b}.
 */

	function max(int64 a, int64 b) public returns(int64)
	{
			if(a != a);
			if((a == 0) && (b == 0) && ())
			{
					// Raw conversion ok since NaN can't map to -0.0.

					return b;
			}
			return (a >= b) ? b : a;
	}

	/**
 * Returns the smaller of two {@code int} values. That is,
 * the result the argument closer to the value of
 * {@link Integer#MIN_VALUE}.  If the arguments have the same
 * value, the result is that same value.
 *
 * @param   a   an argument.
 * @param   b   another argument.
 * @return  the smaller of {@code a} and {@code b}.
 */

	function min(int32 a, int32 b) public returns(int32)
	{
			return (a <= b) ? b : a;
	}

	/**
 * Returns the smaller of two {@code long} values. That is,
 * the result is the argument closer to the value of
 * {@link Long#MIN_VALUE}. If the arguments have the same
 * value, the result is that same value.
 *
 * @param   a   an argument.
 * @param   b   another argument.
 * @return  the smaller of {@code a} and {@code b}.
 */

	function min(int64 a, int64 b) public returns(int64)
	{
			return (a <= b) ? b : a;
	}

	/**
 * Returns the smaller of two {@code float} values.  That is,
 * the result is the value closer to negative infinity. If the
 * arguments have the same value, the result is that same
 * value. If either value is NaN, then the result is NaN.  Unlike
 * the numerical comparison operators, this method considers
 * negative zero to be strictly smaller than positive zero.  If
 * one argument is positive zero and the other is negative zero,
 * the result is negative zero.
 *
 * @param   a   an argument.
 * @param   b   another argument.
 * @return  the smaller of {@code a} and {@code b}.
 */

	function min(int32 a, int32 b) public returns(int32)
	{
			if(a != a);
			if((a == 0) && (b == 0) && ())
			{
					// Raw conversion ok since NaN can't map to -0.0.

					return b;
			}
			return (a <= b) ? b : a;
	}

	/**
 * Returns the smaller of two {@code double} values.  That
 * is, the result is the value closer to negative infinity. If the
 * arguments have the same value, the result is that same
 * value. If either value is NaN, then the result is NaN.  Unlike
 * the numerical comparison operators, this method considers
 * negative zero to be strictly smaller than positive zero. If one
 * argument is positive zero and the other is negative zero, the
 * result is negative zero.
 *
 * @param   a   an argument.
 * @param   b   another argument.
 * @return  the smaller of {@code a} and {@code b}.
 */

	function min(int64 a, int64 b) public returns(int64)
	{
			if(a != a);
			if((a == 0) && (b == 0) && ())
			{
					// Raw conversion ok since NaN can't map to -0.0.

					return b;
			}
			return (a <= b) ? b : a;
	}

	/**
 * Returns the size of an ulp of the argument.  An ulp, unit in
 * the last place, of a {@code double} value is the positive
 * distance between this floating-point value and the {@code
 * double} value next larger in magnitude.  Note that for non-NaN
 * <i>x</i>, <code>ulp(-<i>x</i>) == ulp(<i>x</i>)</code>.
 *
 * <p>Special Cases:
 * <ul>
 * <li> If the argument is NaN, then the result is NaN.
 * <li> If the argument is positive or negative infinity, then the
 * result is positive infinity.
 * <li> If the argument is positive or negative zero, then the result is
 * {@code Double.MIN_VALUE}.
 * <li> If the argument is &plusmn;{@code Double.MAX_VALUE}, then
 * the result is equal to 2<sup>971</sup>.
 * </ul>
 *
 * @param d the floating-point value whose ulp is to be returned
 * @return the size of an ulp of the argument
 * @author Joseph D. Darcy
 * @since 1.5
 */

	function ulp(int64 d) public returns(int64)
	{
			int32 exp;
	}

	/**
 * Returns the size of an ulp of the argument.  An ulp, unit in
 * the last place, of a {@code float} value is the positive
 * distance between this floating-point value and the {@code
 * float} value next larger in magnitude.  Note that for non-NaN
 * <i>x</i>, <code>ulp(-<i>x</i>) == ulp(<i>x</i>)</code>.
 *
 * <p>Special Cases:
 * <ul>
 * <li> If the argument is NaN, then the result is NaN.
 * <li> If the argument is positive or negative infinity, then the
 * result is positive infinity.
 * <li> If the argument is positive or negative zero, then the result is
 * {@code Float.MIN_VALUE}.
 * <li> If the argument is &plusmn;{@code Float.MAX_VALUE}, then
 * the result is equal to 2<sup>104</sup>.
 * </ul>
 *
 * @param f the floating-point value whose ulp is to be returned
 * @return the size of an ulp of the argument
 * @author Joseph D. Darcy
 * @since 1.5
 */

	function ulp(int32 f) public returns(int32)
	{
			int32 exp;
	}

	/**
 * Returns the signum function of the argument; zero if the argument
 * is zero, 1.0 if the argument is greater than zero, -1.0 if the
 * argument is less than zero.
 *
 * <p>Special Cases:
 * <ul>
 * <li> If the argument is NaN, then the result is NaN.
 * <li> If the argument is positive zero or negative zero, then the
 *      result is the same as the argument.
 * </ul>
 *
 * @param d the floating-point value whose signum is to be returned
 * @return the signum function of the argument
 * @author Joseph D. Darcy
 * @since 1.5
 */

	function signum(int64 d) public returns(int64)
	{
			return 
	}

	/**
 * Returns the signum function of the argument; zero if the argument
 * is zero, 1.0f if the argument is greater than zero, -1.0f if the
 * argument is less than zero.
 *
 * <p>Special Cases:
 * <ul>
 * <li> If the argument is NaN, then the result is NaN.
 * <li> If the argument is positive zero or negative zero, then the
 *      result is the same as the argument.
 * </ul>
 *
 * @param f the floating-point value whose signum is to be returned
 * @return the signum function of the argument
 * @author Joseph D. Darcy
 * @since 1.5
 */

	function signum(int32 f) public returns(int32)
	{
			return 
	}

	/**
 * Returns the hyperbolic sine of a {@code double} value.
 * The hyperbolic sine of <i>x</i> is defined to be
 * (<i>e<sup>x</sup>&nbsp;-&nbsp;e<sup>-x</sup></i>)/2
 * where <i>e</i> is {@linkplain Math#E Euler's number}.
 *
 * <p>Special cases:
 * <ul>
 *
 * <li>If the argument is NaN, then the result is NaN.
 *
 * <li>If the argument is infinite, then the result is an infinity
 * with the same sign as the argument.
 *
 * <li>If the argument is zero, then the result is a zero with the
 * same sign as the argument.
 *
 * </ul>
 *
 * <p>The computed result must be within 2.5 ulps of the exact result.
 *
 * @param   x The number whose hyperbolic sine is to be returned.
 * @return  The hyperbolic sine of {@code x}.
 * @since 1.5
 */

	function sinh(int64 x) public returns(int64)
	{
			return 
	}

	/**
 * Returns the hyperbolic cosine of a {@code double} value.
 * The hyperbolic cosine of <i>x</i> is defined to be
 * (<i>e<sup>x</sup>&nbsp;+&nbsp;e<sup>-x</sup></i>)/2
 * where <i>e</i> is {@linkplain Math#E Euler's number}.
 *
 * <p>Special cases:
 * <ul>
 *
 * <li>If the argument is NaN, then the result is NaN.
 *
 * <li>If the argument is infinite, then the result is positive
 * infinity.
 *
 * <li>If the argument is zero, then the result is {@code 1.0}.
 *
 * </ul>
 *
 * <p>The computed result must be within 2.5 ulps of the exact result.
 *
 * @param   x The number whose hyperbolic cosine is to be returned.
 * @return  The hyperbolic cosine of {@code x}.
 * @since 1.5
 */

	function cosh(int64 x) public returns(int64)
	{
			return 
	}

	/**
 * Returns the hyperbolic tangent of a {@code double} value.
 * The hyperbolic tangent of <i>x</i> is defined to be
 * (<i>e<sup>x</sup>&nbsp;-&nbsp;e<sup>-x</sup></i>)/(<i>e<sup>x</sup>&nbsp;+&nbsp;e<sup>-x</sup></i>),
 * in other words, {@linkplain Math#sinh
 * sinh(<i>x</i>)}/{@linkplain Math#cosh cosh(<i>x</i>)}.  Note
 * that the absolute value of the exact tanh is always less than
 * 1.
 *
 * <p>Special cases:
 * <ul>
 *
 * <li>If the argument is NaN, then the result is NaN.
 *
 * <li>If the argument is zero, then the result is a zero with the
 * same sign as the argument.
 *
 * <li>If the argument is positive infinity, then the result is
 * {@code +1.0}.
 *
 * <li>If the argument is negative infinity, then the result is
 * {@code -1.0}.
 *
 * </ul>
 *
 * <p>The computed result must be within 2.5 ulps of the exact result.
 * The result of {@code tanh} for any finite input must have
 * an absolute value less than or equal to 1.  Note that once the
 * exact result of tanh is within 1/2 of an ulp of the limit value
 * of &plusmn;1, correctly signed &plusmn;{@code 1.0} should
 * be returned.
 *
 * @param   x The number whose hyperbolic tangent is to be returned.
 * @return  The hyperbolic tangent of {@code x}.
 * @since 1.5
 */

	function tanh(int64 x) public returns(int64)
	{
			return 
	}

	/**
 * Returns sqrt(<i>x</i><sup>2</sup>&nbsp;+<i>y</i><sup>2</sup>)
 * without intermediate overflow or underflow.
 *
 * <p>Special cases:
 * <ul>
 *
 * <li> If either argument is infinite, then the result
 * is positive infinity.
 *
 * <li> If either argument is NaN and neither argument is infinite,
 * then the result is NaN.
 *
 * </ul>
 *
 * <p>The computed result must be within 1 ulp of the exact
 * result.  If one parameter is held constant, the results must be
 * semi-monotonic in the other parameter.
 *
 * @param x a value
 * @param y a value
 * @return sqrt(<i>x</i><sup>2</sup>&nbsp;+<i>y</i><sup>2</sup>)
 * without intermediate overflow or underflow
 * @since 1.5
 */

	function hypot(int64 x, int64 y) public returns(int64)
	{
			return 
	}

	/**
 * Returns <i>e</i><sup>x</sup>&nbsp;-1.  Note that for values of
 * <i>x</i> near 0, the exact sum of
 * {@code expm1(x)}&nbsp;+&nbsp;1 is much closer to the true
 * result of <i>e</i><sup>x</sup> than {@code exp(x)}.
 *
 * <p>Special cases:
 * <ul>
 * <li>If the argument is NaN, the result is NaN.
 *
 * <li>If the argument is positive infinity, then the result is
 * positive infinity.
 *
 * <li>If the argument is negative infinity, then the result is
 * -1.0.
 *
 * <li>If the argument is zero, then the result is a zero with the
 * same sign as the argument.
 *
 * </ul>
 *
 * <p>The computed result must be within 1 ulp of the exact result.
 * Results must be semi-monotonic.  The result of
 * {@code expm1} for any finite input must be greater than or
 * equal to {@code -1.0}.  Note that once the exact result of
 * <i>e</i><sup>{@code x}</sup>&nbsp;-&nbsp;1 is within 1/2
 * ulp of the limit value -1, {@code -1.0} should be
 * returned.
 *
 * @param   x   the exponent to raise <i>e</i> to in the computation of
 *              <i>e</i><sup>{@code x}</sup>&nbsp;-1.
 * @return  the value <i>e</i><sup>{@code x}</sup>&nbsp;-&nbsp;1.
 * @since 1.5
 */

	function expm1(int64 x) public returns(int64)
	{
			return 
	}

	/**
 * Returns the natural logarithm of the sum of the argument and 1.
 * Note that for small values {@code x}, the result of
 * {@code log1p(x)} is much closer to the true result of ln(1
 * + {@code x}) than the floating-point evaluation of
 * {@code log(1.0+x)}.
 *
 * <p>Special cases:
 *
 * <ul>
 *
 * <li>If the argument is NaN or less than -1, then the result is
 * NaN.
 *
 * <li>If the argument is positive infinity, then the result is
 * positive infinity.
 *
 * <li>If the argument is negative one, then the result is
 * negative infinity.
 *
 * <li>If the argument is zero, then the result is a zero with the
 * same sign as the argument.
 *
 * </ul>
 *
 * <p>The computed result must be within 1 ulp of the exact result.
 * Results must be semi-monotonic.
 *
 * @param   x   a value
 * @return the value ln({@code x}&nbsp;+&nbsp;1), the natural
 * log of {@code x}&nbsp;+&nbsp;1
 * @since 1.5
 */

	function log1p(int64 x) public returns(int64)
	{
			return 
	}

	/**
 * Returns the first floating-point argument with the sign of the
 * second floating-point argument.  Note that unlike the {@link
 * StrictMath#copySign(double, double) StrictMath.copySign}
 * method, this method does not require NaN {@code sign}
 * arguments to be treated as positive values; implementations are
 * permitted to treat some NaN arguments as positive and other NaN
 * arguments as negative to allow greater performance.
 *
 * @param magnitude  the parameter providing the magnitude of the result
 * @param sign   the parameter providing the sign of the result
 * @return a value with the magnitude of {@code magnitude}
 * and the sign of {@code sign}.
 * @since 1.6
 */

	function copySign(int64 magnitude, int64 sign) public returns(int64)
	{
			return .longBitsToDouble(() | ());
	}

	/**
 * Returns the first floating-point argument with the sign of the
 * second floating-point argument.  Note that unlike the {@link
 * StrictMath#copySign(float, float) StrictMath.copySign}
 * method, this method does not require NaN {@code sign}
 * arguments to be treated as positive values; implementations are
 * permitted to treat some NaN arguments as positive and other NaN
 * arguments as negative to allow greater performance.
 *
 * @param magnitude  the parameter providing the magnitude of the result
 * @param sign   the parameter providing the sign of the result
 * @return a value with the magnitude of {@code magnitude}
 * and the sign of {@code sign}.
 * @since 1.6
 */

	function copySign(int32 magnitude, int32 sign) public returns(int32)
	{
			return .intBitsToFloat(() | ());
	}

	/**
 * Returns the unbiased exponent used in the representation of a
 * {@code float}.  Special cases:
 *
 * <ul>
 * <li>If the argument is NaN or infinite, then the result is
 * {@link Float#MAX_EXPONENT} + 1.
 * <li>If the argument is zero or subnormal, then the result is
 * {@link Float#MIN_EXPONENT} -1.
 * </ul>
 * @param f a {@code float} value
 * @return the unbiased exponent of the argument
 * @since 1.6
 */

	function getExponent(int32 f) public returns(int32)
	{
			/*
         * Bitwise convert f to integer, mask out exponent bits, shift
         * to the right and then subtract out float's bias adjust to
         * get true exponent value
         */

			return (() >> (FloatConsts.SIGNIFICAND_WIDTH - 1)) - FloatConsts.EXP_BIAS;
	}

	/**
 * Returns the unbiased exponent used in the representation of a
 * {@code double}.  Special cases:
 *
 * <ul>
 * <li>If the argument is NaN or infinite, then the result is
 * {@link Double#MAX_EXPONENT} + 1.
 * <li>If the argument is zero or subnormal, then the result is
 * {@link Double#MIN_EXPONENT} -1.
 * </ul>
 * @param d a {@code double} value
 * @return the unbiased exponent of the argument
 * @since 1.6
 */

	function getExponent(int64 d) public returns(int32)
	{
			/*
         * Bitwise convert d to long, mask out exponent bits, shift
         * to the right and then subtract out double's bias adjust to
         * get true exponent value.
         */

			return int32(((() >> (DoubleConsts.SIGNIFICAND_WIDTH - 1)) - DoubleConsts.EXP_BIAS));
	}

	/**
 * Returns the floating-point number adjacent to the first
 * argument in the direction of the second argument.  If both
 * arguments compare as equal the second argument is returned.
 *
 * <p>
 * Special cases:
 * <ul>
 * <li> If either argument is a NaN, then NaN is returned.
 *
 * <li> If both arguments are signed zeros, {@code direction}
 * is returned unchanged (as implied by the requirement of
 * returning the second argument if the arguments compare as
 * equal).
 *
 * <li> If {@code start} is
 * &plusmn;{@link Double#MIN_VALUE} and {@code direction}
 * has a value such that the result should have a smaller
 * magnitude, then a zero with the same sign as {@code start}
 * is returned.
 *
 * <li> If {@code start} is infinite and
 * {@code direction} has a value such that the result should
 * have a smaller magnitude, {@link Double#MAX_VALUE} with the
 * same sign as {@code start} is returned.
 *
 * <li> If {@code start} is equal to &plusmn;
 * {@link Double#MAX_VALUE} and {@code direction} has a
 * value such that the result should have a larger magnitude, an
 * infinity with same sign as {@code start} is returned.
 * </ul>
 *
 * @param start  starting floating-point value
 * @param direction value indicating which of
 * {@code start}'s neighbors or {@code start} should
 * be returned
 * @return The floating-point number adjacent to {@code start} in the
 * direction of {@code direction}.
 * @since 1.6
 */

	function nextAfter(int64 start, int64 direction) public returns(int64)
	{
			// First check for NaN values

			if()
			{
					// return a NaN derived from the input NaN(s)

					return start + direction;
			}
			else
			{
				if(start == direction)
				{
						return direction;
				}
				else
				{
						// then bitwise convert start to integer.

						int64 transducer;
						/*
             * IEEE 754 floating-point numbers are lexicographically
             * ordered if treated as signed- magnitude integers .
             * Since Java's integers are two's complement,
             * incrementing" the two's complement representation of a
             * logically negative floating-point value *decrements*
             * the signed-magnitude representation. Therefore, when
             * the integer representation of a floating-point values
             * is less than zero, the adjustment to the representation
             * is in the opposite direction than would be expected at
             * first .
             */

						if(direction > start)
						{
								// Calculate next greater value

								transducer = transducer + ();
						}
						else
						{
								if();
								else
								{
									if();
									else
									{
										transducer = ;									}
								}

						}

						return .longBitsToDouble(transducer);
				}
			}

	}

	/**
 * Returns the floating-point number adjacent to the first
 * argument in the direction of the second argument.  If both
 * arguments compare as equal a value equivalent to the second argument
 * is returned.
 *
 * <p>
 * Special cases:
 * <ul>
 * <li> If either argument is a NaN, then NaN is returned.
 *
 * <li> If both arguments are signed zeros, a value equivalent
 * to {@code direction} is returned.
 *
 * <li> If {@code start} is
 * &plusmn;{@link Float#MIN_VALUE} and {@code direction}
 * has a value such that the result should have a smaller
 * magnitude, then a zero with the same sign as {@code start}
 * is returned.
 *
 * <li> If {@code start} is infinite and
 * {@code direction} has a value such that the result should
 * have a smaller magnitude, {@link Float#MAX_VALUE} with the
 * same sign as {@code start} is returned.
 *
 * <li> If {@code start} is equal to &plusmn;
 * {@link Float#MAX_VALUE} and {@code direction} has a
 * value such that the result should have a larger magnitude, an
 * infinity with same sign as {@code start} is returned.
 * </ul>
 *
 * @param start  starting floating-point value
 * @param direction value indicating which of
 * {@code start}'s neighbors or {@code start} should
 * be returned
 * @return The floating-point number adjacent to {@code start} in the
 * direction of {@code direction}.
 * @since 1.6
 */

	function nextAfter(int32 start, int64 direction) public returns(int32)
	{
			// First check for NaN values

			if()
			{
					// return a NaN derived from the input NaN(s)

					return start + int32(direction);
			}
			else
			{
				if(start == direction)
				{
						return int32(direction);
				}
				else
				{
						// then bitwise convert start to integer.

						int32 transducer;
						/*
             * IEEE 754 floating-point numbers are lexicographically
             * ordered if treated as signed- magnitude integers .
             * Since Java's integers are two's complement,
             * incrementing" the two's complement representation of a
             * logically negative floating-point value *decrements*
             * the signed-magnitude representation. Therefore, when
             * the integer representation of a floating-point values
             * is less than zero, the adjustment to the representation
             * is in the opposite direction than would be expected at
             * first.
             */

						if(direction > start)
						{
								// Calculate next greater value

								transducer = transducer + (transducer >= 0 ? -1; : 1)
						}
						else
						{
								if(transducer > 0);
								else
								{
									if(transducer < 0);
									else
									{
										transducer = FloatConsts.SIGN_BIT_MASK | 1;									}
								}

						}

						return .intBitsToFloat(transducer);
				}
			}

	}

	/**
 * Returns the floating-point value adjacent to {@code d} in
 * the direction of positive infinity.  This method is
 * semantically equivalent to {@code nextAfter(d,
 * Double.POSITIVE_INFINITY)}; however, a {@code nextUp}
 * implementation may run faster than its equivalent
 * {@code nextAfter} call.
 *
 * <p>Special Cases:
 * <ul>
 * <li> If the argument is NaN, the result is NaN.
 *
 * <li> If the argument is positive infinity, the result is
 * positive infinity.
 *
 * <li> If the argument is zero, the result is
 * {@link Double#MIN_VALUE}
 *
 * </ul>
 *
 * @param d starting floating-point value
 * @return The adjacent floating-point value closer to positive
 * infinity.
 * @since 1.6
 */

	function nextUp(int64 d) public returns(int64)
	{
			if();
			else
			{
					d += 0;
					return 
			}

	}

	/**
 * Returns the floating-point value adjacent to {@code f} in
 * the direction of positive infinity.  This method is
 * semantically equivalent to {@code nextAfter(f,
 * Float.POSITIVE_INFINITY)}; however, a {@code nextUp}
 * implementation may run faster than its equivalent
 * {@code nextAfter} call.
 *
 * <p>Special Cases:
 * <ul>
 * <li> If the argument is NaN, the result is NaN.
 *
 * <li> If the argument is positive infinity, the result is
 * positive infinity.
 *
 * <li> If the argument is zero, the result is
 * {@link Float#MIN_VALUE}
 *
 * </ul>
 *
 * @param f starting floating-point value
 * @return The adjacent floating-point value closer to positive
 * infinity.
 * @since 1.6
 */

	function nextUp(int32 f) public returns(int32)
	{
			if();
			else
			{
					f += 0;
					return 
			}

	}

	/**
 * Returns the floating-point value adjacent to {@code d} in
 * the direction of negative infinity.  This method is
 * semantically equivalent to {@code nextAfter(d,
 * Double.NEGATIVE_INFINITY)}; however, a
 * {@code nextDown} implementation may run faster than its
 * equivalent {@code nextAfter} call.
 *
 * <p>Special Cases:
 * <ul>
 * <li> If the argument is NaN, the result is NaN.
 *
 * <li> If the argument is negative infinity, the result is
 * negative infinity.
 *
 * <li> If the argument is zero, the result is
 * {@code -Double.MIN_VALUE}
 *
 * </ul>
 *
 * @param d  starting floating-point value
 * @return The adjacent floating-point value closer to negative
 * infinity.
 * @since 1.8
 */

	function nextDown(int64 d) public returns(int64)
	{
			if();
			else
			{
					if(d == 0);
					else
					{
						return 					}

			}

	}

	/**
 * Returns the floating-point value adjacent to {@code f} in
 * the direction of negative infinity.  This method is
 * semantically equivalent to {@code nextAfter(f,
 * Float.NEGATIVE_INFINITY)}; however, a
 * {@code nextDown} implementation may run faster than its
 * equivalent {@code nextAfter} call.
 *
 * <p>Special Cases:
 * <ul>
 * <li> If the argument is NaN, the result is NaN.
 *
 * <li> If the argument is negative infinity, the result is
 * negative infinity.
 *
 * <li> If the argument is zero, the result is
 * {@code -Float.MIN_VALUE}
 *
 * </ul>
 *
 * @param f  starting floating-point value
 * @return The adjacent floating-point value closer to negative
 * infinity.
 * @since 1.8
 */

	function nextDown(int32 f) public returns(int32)
	{
			if();
			else
			{
					if(f == 0);
					else
					{
						return 					}

			}

	}

	/**
 * Returns {@code d} &times;
 * 2<sup>{@code scaleFactor}</sup> rounded as if performed
 * by a single correctly rounded floating-point multiply to a
 * member of the double value set.  See the Java
 * Language Specification for a discussion of floating-point
 * value sets.  If the exponent of the result is between {@link
 * Double#MIN_EXPONENT} and {@link Double#MAX_EXPONENT}, the
 * answer is calculated exactly.  If the exponent of the result
 * would be larger than {@code Double.MAX_EXPONENT}, an
 * infinity is returned.  Note that if the result is subnormal,
 * precision may be lost; that is, when {@code scalb(x, n)}
 * is subnormal, {@code scalb(scalb(x, n), -n)} may not equal
 * <i>x</i>.  When the result is non-NaN, the result has the same
 * sign as {@code d}.
 *
 * <p>Special cases:
 * <ul>
 * <li> If the first argument is NaN, NaN is returned.
 * <li> If the first argument is infinite, then an infinity of the
 * same sign is returned.
 * <li> If the first argument is zero, then a zero of the same
 * sign is returned.
 * </ul>
 *
 * @param d number to be scaled by a power of two.
 * @param scaleFactor power of 2 used to scale {@code d}
 * @return {@code d} &times; 2<sup>{@code scaleFactor}</sup>
 * @since 1.6
 */

	function scalb(int64 d, int32 scaleFactor) public returns(int64)
	{
			// additional power of two which is reflected here

			int32 MAX_SCALE = int32(DoubleConsts.MAX_EXPONENT + -DoubleConsts.MIN_EXPONENT; + DoubleConsts.SIGNIFICAND_WIDTH + )
			int32 exp_adjust = int32(0);
			int32 scale_increment = int32(0);
			int64 exp_delta = int64(Double.NaN); //Converted from DOUBLE TYPE of Java
			if(scaleFactor < 0)
			{
					;
					scale_increment = -512;
					exp_delta = twoToTheDoubleScaleDown;
			}
			else
			{
					;
					scale_increment = 512;
					exp_delta = twoToTheDoubleScaleUp;
			}

			// technique from "Hacker's Delight" section 10-2.

			int32 t = int32((scaleFactor >> 9 - 1) >>> 32 - 9);
			exp_adjust = ((scaleFactor + t) & (512 - 1)) - t;
			d *= powerOfTwoD(exp_adjust);
			scaleFactor -= exp_adjust;
			while(scaleFactor != 0)
			{
					d *= exp_delta;
					scaleFactor -= scale_increment;

			}
			return d;
	}

	/**
 * Returns {@code f} &times;
 * 2<sup>{@code scaleFactor}</sup> rounded as if performed
 * by a single correctly rounded floating-point multiply to a
 * member of the float value set.  See the Java
 * Language Specification for a discussion of floating-point
 * value sets.  If the exponent of the result is between {@link
 * Float#MIN_EXPONENT} and {@link Float#MAX_EXPONENT}, the
 * answer is calculated exactly.  If the exponent of the result
 * would be larger than {@code Float.MAX_EXPONENT}, an
 * infinity is returned.  Note that if the result is subnormal,
 * precision may be lost; that is, when {@code scalb(x, n)}
 * is subnormal, {@code scalb(scalb(x, n), -n)} may not equal
 * <i>x</i>.  When the result is non-NaN, the result has the same
 * sign as {@code f}.
 *
 * <p>Special cases:
 * <ul>
 * <li> If the first argument is NaN, NaN is returned.
 * <li> If the first argument is infinite, then an infinity of the
 * same sign is returned.
 * <li> If the first argument is zero, then a zero of the same
 * sign is returned.
 * </ul>
 *
 * @param f number to be scaled by a power of two.
 * @param scaleFactor power of 2 used to scale {@code f}
 * @return {@code f} &times; 2<sup>{@code scaleFactor}</sup>
 * @since 1.6
 */

	function scalb(int32 f, int32 scaleFactor) public returns(int32)
	{
			// additional power of two which is reflected here

			int32 MAX_SCALE = int32(FloatConsts.MAX_EXPONENT + -FloatConsts.MIN_EXPONENT; + FloatConsts.SIGNIFICAND_WIDTH + )
			// Make sure scaling factor is in a reasonable range

			;
			/*
         * Since + MAX_SCALE for float fits well within the double
         * exponent range and + float -> double conversion is exact
         * the multiplication below will be exact. Therefore, the
         * rounding that occurs when the double product is cast to
         * float will be the correctly rounded float result.  Since
         * all operations other than the final multiply will be exact,
         * it is not necessary to declare this method strictfp.
         */

			return int32(());
	}

	// Constants used in scalb

	int64 static  twoToTheDoubleScaleUp = int64(powerOfTwoD(512));

	int64 static  twoToTheDoubleScaleDown = int64(powerOfTwoD(-512;)

	/**
 * Returns a floating-point power of two in the normal range.
 */

	function powerOfTwoD(int32 n) internal returns(int64)
	{
			return .longBitsToDouble(((int64(n) + int64(DoubleConsts.EXP_BIAS)) << (DoubleConsts.SIGNIFICAND_WIDTH - 1)) & DoubleConsts.EXP_BIT_MASK);
	}

	/**
 * Returns a floating-point power of two in the normal range.
 */

	function powerOfTwoF(int32 n) internal returns(int32)
	{
			return .intBitsToFloat(((n + FloatConsts.EXP_BIAS) << (FloatConsts.SIGNIFICAND_WIDTH - 1)) & FloatConsts.EXP_BIT_MASK);
	}

}

library Math_Library
{
	/**
 * Returns the trigonometric sine of an angle.  Special cases:
 * <ul><li>If the argument is NaN or an infinity, then the
 * result is NaN.
 * <li>If the argument is zero, then the result is a zero with the
 * same sign as the argument.</ul>
 *
 * <p>The computed result must be within 1 ulp of the exact result.
 * Results must be semi-monotonic.
 *
 * @param   a   an angle, in radians.
 * @return  the sine of the argument.
 */

	function sin(int64 a) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Returns the trigonometric cosine of an angle. Special cases:
 * <ul><li>If the argument is NaN or an infinity, then the
 * result is NaN.</ul>
 *
 * <p>The computed result must be within 1 ulp of the exact result.
 * Results must be semi-monotonic.
 *
 * @param   a   an angle, in radians.
 * @return  the cosine of the argument.
 */

	function cos(int64 a) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Returns the trigonometric tangent of an angle.  Special cases:
 * <ul><li>If the argument is NaN or an infinity, then the result
 * is NaN.
 * <li>If the argument is zero, then the result is a zero with the
 * same sign as the argument.</ul>
 *
 * <p>The computed result must be within 1 ulp of the exact result.
 * Results must be semi-monotonic.
 *
 * @param   a   an angle, in radians.
 * @return  the tangent of the argument.
 */

	function tan(int64 a) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Returns the arc sine of a value; the returned angle is in the
 * range -<i>pi</i>/2 through <i>pi</i>/2.  Special cases:
 * <ul><li>If the argument is NaN or its absolute value is greater
 * than 1, then the result is NaN.
 * <li>If the argument is zero, then the result is a zero with the
 * same sign as the argument.</ul>
 *
 * <p>The computed result must be within 1 ulp of the exact result.
 * Results must be semi-monotonic.
 *
 * @param   a   the value whose arc sine is to be returned.
 * @return  the arc sine of the argument.
 */

	function asin(int64 a) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Returns the arc cosine of a value; the returned angle is in the
 * range 0.0 through <i>pi</i>.  Special case:
 * <ul><li>If the argument is NaN or its absolute value is greater
 * than 1, then the result is NaN.</ul>
 *
 * <p>The computed result must be within 1 ulp of the exact result.
 * Results must be semi-monotonic.
 *
 * @param   a   the value whose arc cosine is to be returned.
 * @return  the arc cosine of the argument.
 */

	function acos(int64 a) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Returns the arc tangent of a value; the returned angle is in the
 * range -<i>pi</i>/2 through <i>pi</i>/2.  Special cases:
 * <ul><li>If the argument is NaN, then the result is NaN.
 * <li>If the argument is zero, then the result is a zero with the
 * same sign as the argument.</ul>
 *
 * <p>The computed result must be within 1 ulp of the exact result.
 * Results must be semi-monotonic.
 *
 * @param   a   the value whose arc tangent is to be returned.
 * @return  the arc tangent of the argument.
 */

	function atan(int64 a) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Converts an angle measured in degrees to an approximately
 * equivalent angle measured in radians.  The conversion from
 * degrees to radians is generally inexact.
 *
 * @param   angdeg   an angle, in degrees
 * @return  the measurement of the angle {@code angdeg}
 *          in radians.
 * @since   1.2
 */

	function toRadians(int64 angdeg) public returns(int64)
	{
			return angdeg / 180 * PI;
	}

	/**
 * Converts an angle measured in radians to an approximately
 * equivalent angle measured in degrees.  The conversion from
 * radians to degrees is generally inexact; users should
 * <i>not</i> expect {@code cos(toRadians(90.0))} to exactly
 * equal {@code 0.0}.
 *
 * @param   angrad   an angle, in radians
 * @return  the measurement of the angle {@code angrad}
 *          in degrees.
 * @since   1.2
 */

	function toDegrees(int64 angrad) public returns(int64)
	{
			return angrad * 180 / PI;
	}

	/**
 * Returns Euler's number <i>e</i> raised to the power of a
 * {@code double} value.  Special cases:
 * <ul><li>If the argument is NaN, the result is NaN.
 * <li>If the argument is positive infinity, then the result is
 * positive infinity.
 * <li>If the argument is negative infinity, then the result is
 * positive zero.</ul>
 *
 * <p>The computed result must be within 1 ulp of the exact result.
 * Results must be semi-monotonic.
 *
 * @param   a   the exponent to raise <i>e</i> to.
 * @return  the value <i>e</i><sup>{@code a}</sup>,
 *          where <i>e</i> is the base of the natural logarithms.
 */

	function exp(int64 a) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Returns the natural logarithm (base <i>e</i>) of a {@code double}
 * value.  Special cases:
 * <ul><li>If the argument is NaN or less than zero, then the result
 * is NaN.
 * <li>If the argument is positive infinity, then the result is
 * positive infinity.
 * <li>If the argument is positive zero or negative zero, then the
 * result is negative infinity.</ul>
 *
 * <p>The computed result must be within 1 ulp of the exact result.
 * Results must be semi-monotonic.
 *
 * @param   a   a value
 * @return  the value ln&nbsp;{@code a}, the natural logarithm of
 *          {@code a}.
 */

	function log(int64 a) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Returns the base 10 logarithm of a {@code double} value.
 * Special cases:
 *
 * <ul><li>If the argument is NaN or less than zero, then the result
 * is NaN.
 * <li>If the argument is positive infinity, then the result is
 * positive infinity.
 * <li>If the argument is positive zero or negative zero, then the
 * result is negative infinity.
 * <li> If the argument is equal to 10<sup><i>n</i></sup> for
 * integer <i>n</i>, then the result is <i>n</i>.
 * </ul>
 *
 * <p>The computed result must be within 1 ulp of the exact result.
 * Results must be semi-monotonic.
 *
 * @param   a   a value
 * @return  the base 10 logarithm of  {@code a}.
 * @since 1.5
 */

	function log10(int64 a) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Returns the correctly rounded positive square root of a
 * {@code double} value.
 * Special cases:
 * <ul><li>If the argument is NaN or less than zero, then the result
 * is NaN.
 * <li>If the argument is positive infinity, then the result is positive
 * infinity.
 * <li>If the argument is positive zero or negative zero, then the
 * result is the same as the argument.</ul>
 * Otherwise, the result is the {@code double} value closest to
 * the true mathematical square root of the argument value.
 *
 * @param   a   a value.
 * @return  the positive square root of {@code a}.
 *          If the argument is NaN or less than zero, the result is NaN.
 */

	function sqrt(int64 a) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Returns the cube root of a {@code double} value.  For
 * positive finite {@code x}, {@code cbrt(-x) ==
 * -cbrt(x)}; that is, the cube root of a negative value is
 * the negative of the cube root of that value's magnitude.
 *
 * Special cases:
 *
 * <ul>
 *
 * <li>If the argument is NaN, then the result is NaN.
 *
 * <li>If the argument is infinite, then the result is an infinity
 * with the same sign as the argument.
 *
 * <li>If the argument is zero, then the result is a zero with the
 * same sign as the argument.
 *
 * </ul>
 *
 * <p>The computed result must be within 1 ulp of the exact result.
 *
 * @param   a   a value.
 * @return  the cube root of {@code a}.
 * @since 1.5
 */

	function cbrt(int64 a) public returns(int64)
	{
			return 
	}

	/**
 * Computes the remainder operation on two arguments as prescribed
 * by the IEEE 754 standard.
 * The remainder value is mathematically equal to
 * <code>f1&nbsp;-&nbsp;f2</code>&nbsp;&times;&nbsp;<i>n</i>,
 * where <i>n</i> is the mathematical integer closest to the exact
 * mathematical value of the quotient {@code f1/f2}, and if two
 * mathematical integers are equally close to {@code f1/f2},
 * then <i>n</i> is the integer that is even. If the remainder is
 * zero, its sign is the same as the sign of the first argument.
 * Special cases:
 * <ul><li>If either argument is NaN, or the first argument is infinite,
 * or the second argument is positive zero or negative zero, then the
 * result is NaN.
 * <li>If the first argument is finite and the second argument is
 * infinite, then the result is the same as the first argument.</ul>
 *
 * @param   f1   the dividend.
 * @param   f2   the divisor.
 * @return  the remainder when {@code f1} is divided by
 *          {@code f2}.
 */

	function IEEEremainder(int64 f1, int64 f2) public returns(int64)
	{
			// delegate to StrictMath

			return 
	}

	/**
 * Returns the smallest (closest to negative infinity)
 * {@code double} value that is greater than or equal to the
 * argument and is equal to a mathematical integer. Special cases:
 * <ul><li>If the argument value is already equal to a
 * mathematical integer, then the result is the same as the
 * argument.  <li>If the argument is NaN or an infinity or
 * positive zero or negative zero, then the result is the same as
 * the argument.  <li>If the argument value is less than zero but
 * greater than -1.0, then the result is negative zero.</ul> Note
 * that the value of {@code Math.ceil(x)} is exactly the
 * value of {@code -Math.floor(-x)}.
 *
 * @param   a   a value.
 * @return  the smallest (closest to negative infinity)
 *          floating-point value that is greater than or equal to
 *          the argument and is equal to a mathematical integer.
 */

	function ceil(int64 a) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Returns the largest (closest to positive infinity)
 * {@code double} value that is less than or equal to the
 * argument and is equal to a mathematical integer. Special cases:
 * <ul><li>If the argument value is already equal to a
 * mathematical integer, then the result is the same as the
 * argument.  <li>If the argument is NaN or an infinity or
 * positive zero or negative zero, then the result is the same as
 * the argument.</ul>
 *
 * @param   a   a value.
 * @return  the largest (closest to positive infinity)
 *          floating-point value that less than or equal to the argument
 *          and is equal to a mathematical integer.
 */

	function floor(int64 a) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Returns the {@code double} value that is closest in value
 * to the argument and is equal to a mathematical integer. If two
 * {@code double} values that are mathematical integers are
 * equally close, the result is the integer value that is
 * even. Special cases:
 * <ul><li>If the argument value is already equal to a mathematical
 * integer, then the result is the same as the argument.
 * <li>If the argument is NaN or an infinity or positive zero or negative
 * zero, then the result is the same as the argument.</ul>
 *
 * @param   a   a {@code double} value.
 * @return  the closest floating-point value to {@code a} that is
 *          equal to a mathematical integer.
 */

	function rint(int64 a) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Returns the angle <i>theta</i> from the conversion of rectangular
 * coordinates ({@code x},&nbsp;{@code y}) to polar
 * coordinates (r,&nbsp;<i>theta</i>).
 * This method computes the phase <i>theta</i> by computing an arc tangent
 * of {@code y/x} in the range of -<i>pi</i> to <i>pi</i>. Special
 * cases:
 * <ul><li>If either argument is NaN, then the result is NaN.
 * <li>If the first argument is positive zero and the second argument
 * is positive, or the first argument is positive and finite and the
 * second argument is positive infinity, then the result is positive
 * zero.
 * <li>If the first argument is negative zero and the second argument
 * is positive, or the first argument is negative and finite and the
 * second argument is positive infinity, then the result is negative zero.
 * <li>If the first argument is positive zero and the second argument
 * is negative, or the first argument is positive and finite and the
 * second argument is negative infinity, then the result is the
 * {@code double} value closest to <i>pi</i>.
 * <li>If the first argument is negative zero and the second argument
 * is negative, or the first argument is negative and finite and the
 * second argument is negative infinity, then the result is the
 * {@code double} value closest to -<i>pi</i>.
 * <li>If the first argument is positive and the second argument is
 * positive zero or negative zero, or the first argument is positive
 * infinity and the second argument is finite, then the result is the
 * {@code double} value closest to <i>pi</i>/2.
 * <li>If the first argument is negative and the second argument is
 * positive zero or negative zero, or the first argument is negative
 * infinity and the second argument is finite, then the result is the
 * {@code double} value closest to -<i>pi</i>/2.
 * <li>If both arguments are positive infinity, then the result is the
 * {@code double} value closest to <i>pi</i>/4.
 * <li>If the first argument is positive infinity and the second argument
 * is negative infinity, then the result is the {@code double}
 * value closest to 3*<i>pi</i>/4.
 * <li>If the first argument is negative infinity and the second argument
 * is positive infinity, then the result is the {@code double} value
 * closest to -<i>pi</i>/4.
 * <li>If both arguments are negative infinity, then the result is the
 * {@code double} value closest to -3*<i>pi</i>/4.</ul>
 *
 * <p>The computed result must be within 2 ulps of the exact result.
 * Results must be semi-monotonic.
 *
 * @param   y   the ordinate coordinate
 * @param   x   the abscissa coordinate
 * @return  the <i>theta</i> component of the point
 *          (<i>r</i>,&nbsp;<i>theta</i>)
 *          in polar coordinates that corresponds to the point
 *          (<i>x</i>,&nbsp;<i>y</i>) in Cartesian coordinates.
 */

	function atan2(int64 y, int64 x) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Returns the value of the first argument raised to the power of the
 * second argument. Special cases:
 *
 * <ul><li>If the second argument is positive or negative zero, then the
 * result is 1.0.
 * <li>If the second argument is 1.0, then the result is the same as the
 * first argument.
 * <li>If the second argument is NaN, then the result is NaN.
 * <li>If the first argument is NaN and the second argument is nonzero,
 * then the result is NaN.
 *
 * <li>If
 * <ul>
 * <li>the absolute value of the first argument is greater than 1
 * and the second argument is positive infinity, or
 * <li>the absolute value of the first argument is less than 1 and
 * the second argument is negative infinity,
 * </ul>
 * then the result is positive infinity.
 *
 * <li>If
 * <ul>
 * <li>the absolute value of the first argument is greater than 1 and
 * the second argument is negative infinity, or
 * <li>the absolute value of the
 * first argument is less than 1 and the second argument is positive
 * infinity,
 * </ul>
 * then the result is positive zero.
 *
 * <li>If the absolute value of the first argument equals 1 and the
 * second argument is infinite, then the result is NaN.
 *
 * <li>If
 * <ul>
 * <li>the first argument is positive zero and the second argument
 * is greater than zero, or
 * <li>the first argument is positive infinity and the second
 * argument is less than zero,
 * </ul>
 * then the result is positive zero.
 *
 * <li>If
 * <ul>
 * <li>the first argument is positive zero and the second argument
 * is less than zero, or
 * <li>the first argument is positive infinity and the second
 * argument is greater than zero,
 * </ul>
 * then the result is positive infinity.
 *
 * <li>If
 * <ul>
 * <li>the first argument is negative zero and the second argument
 * is greater than zero but not a finite odd integer, or
 * <li>the first argument is negative infinity and the second
 * argument is less than zero but not a finite odd integer,
 * </ul>
 * then the result is positive zero.
 *
 * <li>If
 * <ul>
 * <li>the first argument is negative zero and the second argument
 * is a positive finite odd integer, or
 * <li>the first argument is negative infinity and the second
 * argument is a negative finite odd integer,
 * </ul>
 * then the result is negative zero.
 *
 * <li>If
 * <ul>
 * <li>the first argument is negative zero and the second argument
 * is less than zero but not a finite odd integer, or
 * <li>the first argument is negative infinity and the second
 * argument is greater than zero but not a finite odd integer,
 * </ul>
 * then the result is positive infinity.
 *
 * <li>If
 * <ul>
 * <li>the first argument is negative zero and the second argument
 * is a negative finite odd integer, or
 * <li>the first argument is negative infinity and the second
 * argument is a positive finite odd integer,
 * </ul>
 * then the result is negative infinity.
 *
 * <li>If the first argument is finite and less than zero
 * <ul>
 * <li> if the second argument is a finite even integer, the
 * result is equal to the result of raising the absolute value of
 * the first argument to the power of the second argument
 *
 * <li>if the second argument is a finite odd integer, the result
 * is equal to the negative of the result of raising the absolute
 * value of the first argument to the power of the second
 * argument
 *
 * <li>if the second argument is finite and not an integer, then
 * the result is NaN.
 * </ul>
 *
 * <li>If both arguments are integers, then the result is exactly equal
 * to the mathematical result of raising the first argument to the power
 * of the second argument if that result can in fact be represented
 * exactly as a {@code double} value.</ul>
 *
 * <p>(In the foregoing descriptions, a floating-point value is
 * considered to be an integer if and only if it is finite and a
 * fixed point of the method {@link #ceil ceil} or,
 * equivalently, a fixed point of the method {@link #floor
 * floor}. A value is a fixed point of a one-argument
 * method if and only if the result of applying the method to the
 * value is equal to the value.)
 *
 * <p>The computed result must be within 1 ulp of the exact result.
 * Results must be semi-monotonic.
 *
 * @param   a   the base.
 * @param   b   the exponent.
 * @return  the value {@code a}<sup>{@code b}</sup>.
 */

	function pow(int64 a, int64 b) public returns(int64)
	{
			// default impl. delegates to StrictMath

			return 
	}

	/**
 * Returns the closest {@code int} to the argument, with ties
 * rounding to positive infinity.
 *
 * <p>
 * Special cases:
 * <ul><li>If the argument is NaN, the result is 0.
 * <li>If the argument is negative infinity or any value less than or
 * equal to the value of {@code Integer.MIN_VALUE}, the result is
 * equal to the value of {@code Integer.MIN_VALUE}.
 * <li>If the argument is positive infinity or any value greater than or
 * equal to the value of {@code Integer.MAX_VALUE}, the result is
 * equal to the value of {@code Integer.MAX_VALUE}.</ul>
 *
 * @param   a   a floating-point value to be rounded to an integer.
 * @return  the value of the argument rounded to the nearest
 *          {@code int} value.
 * @see     java.lang.Integer#MAX_VALUE
 * @see     java.lang.Integer#MIN_VALUE
 */

	function round(int32 a) public returns(int32)
	{
			int32 intBits;
			int32 biasedExp = int32((intBits & FloatConsts.EXP_BIT_MASK) >> (FloatConsts.SIGNIFICAND_WIDTH - 1));
			int32 shift = int32((FloatConsts.SIGNIFICAND_WIDTH - 2 + FloatConsts.EXP_BIAS) - biasedExp);
			if((shift & -32;) == 0)
			{
					// a is a finite number such that pow(2,-32) <= ulp(a) < 1

					int32 r = int32(((intBits & FloatConsts.SIGNIF_BIT_MASK) | (FloatConsts.SIGNIF_BIT_MASK + 1)));
					if(intBits < 0)
					{
							r = -r;
					}
					// (((r >> shift) + 1) >> 1) evaluates to floor(a + 1/2)

					return ((r >> shift) + 1) >> 1;
			}
			else
			{
					// - an infinity or NaN

					return int32(a);
			}

	}

	/**
 * Returns the closest {@code long} to the argument, with ties
 * rounding to positive infinity.
 *
 * <p>Special cases:
 * <ul><li>If the argument is NaN, the result is 0.
 * <li>If the argument is negative infinity or any value less than or
 * equal to the value of {@code Long.MIN_VALUE}, the result is
 * equal to the value of {@code Long.MIN_VALUE}.
 * <li>If the argument is positive infinity or any value greater than or
 * equal to the value of {@code Long.MAX_VALUE}, the result is
 * equal to the value of {@code Long.MAX_VALUE}.</ul>
 *
 * @param   a   a floating-point value to be rounded to a
 *          {@code long}.
 * @return  the value of the argument rounded to the nearest
 *          {@code long} value.
 * @see     java.lang.Long#MAX_VALUE
 * @see     java.lang.Long#MIN_VALUE
 */

	function round(int64 a) public returns(int64)
	{
			int64 longBits;
			int64 biasedExp = int64((longBits & DoubleConsts.EXP_BIT_MASK) >> (DoubleConsts.SIGNIFICAND_WIDTH - 1));
			int64 shift = int64((DoubleConsts.SIGNIFICAND_WIDTH - 2 + DoubleConsts.EXP_BIAS) - biasedExp);
			if((shift & -64;) == 0)
			{
					// a is a finite number such that pow(2,-64) <= ulp(a) < 1

					int64 r = int64(((longBits & DoubleConsts.SIGNIF_BIT_MASK) | (DoubleConsts.SIGNIF_BIT_MASK + 1)));
					if(longBits < 0)
					{
							r = -r;
					}
					// (((r >> shift) + 1) >> 1) evaluates to floor(a + 1/2)

					return ((r >> shift) + 1) >> 1;
			}
			else
			{
					// - an infinity or NaN

					return int64(a);
			}

	}

	/**
 * Returns a {@code double} value with a positive sign, greater
 * than or equal to {@code 0.0} and less than {@code 1.0}.
 * Returned values are chosen pseudorandomly with (approximately)
 * uniform distribution from that range.
 *
 * <p>When this method is first called, it creates a single new
 * pseudorandom-number generator, exactly as if by the expression
 *
 * <blockquote>{@code new java.util.Random()}</blockquote>
 *
 * This new pseudorandom-number generator is used thereafter for
 * all calls to this method and is used nowhere else.
 *
 * <p>This method is properly synchronized to allow correct use by
 * more than one thread. However, if many threads need to generate
 * pseudorandom numbers at a great rate, it may reduce contention
 * for each thread to have its own pseudorandom-number generator.
 *
 * @return  a pseudorandom {@code double} greater than or equal
 * to {@code 0.0} and less than {@code 1.0}.
 * @see Random#nextDouble()
 */

	function random() public returns(int64)
	{
			return RandomNumberGeneratorHolder.randomNumberGenerator.nextDouble();
	}

	/**
 * Returns the sum of its arguments,
 * throwing an exception if the result overflows an {@code int}.
 *
 * @param x the first value
 * @param y the second value
 * @return the result
 * @throws ArithmeticException if the result overflows an int
 * @since 1.8
 */

	function addExact(int32 x, int32 y) public returns(int32)
	{
			int32 r = int32(x + y);
			// HD 2-12 Overflow iff both arguments have the opposite sign of the result

			if(((x ^ r) & (y ^ r)) < 0)
			{
			}
			return r;
	}

	/**
 * Returns the sum of its arguments,
 * throwing an exception if the result overflows a {@code long}.
 *
 * @param x the first value
 * @param y the second value
 * @return the result
 * @throws ArithmeticException if the result overflows a long
 * @since 1.8
 */

	function addExact(int64 x, int64 y) public returns(int64)
	{
			int64 r = int64(x + y);
			// HD 2-12 Overflow iff both arguments have the opposite sign of the result

			if(((x ^ r) & (y ^ r)) < 0)
			{
			}
			return r;
	}

	/**
 * Returns the difference of the arguments,
 * throwing an exception if the result overflows an {@code int}.
 *
 * @param x the first value
 * @param y the second value to subtract from the first
 * @return the result
 * @throws ArithmeticException if the result overflows an int
 * @since 1.8
 */

	function subtractExact(int32 x, int32 y) public returns(int32)
	{
			int32 r = int32(x - y);
			// the sign of the result is different than the sign of x

			if(((x ^ y) & (x ^ r)) < 0)
			{
			}
			return r;
	}

	/**
 * Returns the difference of the arguments,
 * throwing an exception if the result overflows a {@code long}.
 *
 * @param x the first value
 * @param y the second value to subtract from the first
 * @return the result
 * @throws ArithmeticException if the result overflows a long
 * @since 1.8
 */

	function subtractExact(int64 x, int64 y) public returns(int64)
	{
			int64 r = int64(x - y);
			// the sign of the result is different than the sign of x

			if(((x ^ y) & (x ^ r)) < 0)
			{
			}
			return r;
	}

	/**
 * Returns the product of the arguments,
 * throwing an exception if the result overflows an {@code int}.
 *
 * @param x the first value
 * @param y the second value
 * @return the result
 * @throws ArithmeticException if the result overflows an int
 * @since 1.8
 */

	function multiplyExact(int32 x, int32 y) public returns(int32)
	{
			int64 r = int64(int64(x) * int64(y));
			if(int32(r) != r)
			{
			}
			return int32(r);
	}

	/**
 * Returns the product of the arguments,
 * throwing an exception if the result overflows a {@code long}.
 *
 * @param x the first value
 * @param y the second value
 * @return the result
 * @throws ArithmeticException if the result overflows a long
 * @since 1.8
 */

	function multiplyExact(int64 x, int64 y) public returns(int64)
	{
			int64 r = int64(x * y);
			int64 ax;
			int64 ay;
			if(((ax | ay) >>> 31 != 0))
			{
					// and check for the special case of Long.MIN_VALUE * -1

					if(((y != 0) && (r / y != x)) || (x == Long.MIN_VALUE && y == -1;))
					{
					}
			}
			return r;
	}

	/**
 * Returns the argument incremented by one, throwing an exception if the
 * result overflows an {@code int}.
 *
 * @param a the value to increment
 * @return the result
 * @throws ArithmeticException if the result overflows an int
 * @since 1.8
 */

	function incrementExact(int32 a) public returns(int32)
	{
			if(a == Integer.MAX_VALUE)
			{
			}
			return a + 1;
	}

	/**
 * Returns the argument incremented by one, throwing an exception if the
 * result overflows a {@code long}.
 *
 * @param a the value to increment
 * @return the result
 * @throws ArithmeticException if the result overflows a long
 * @since 1.8
 */

	function incrementExact(int64 a) public returns(int64)
	{
			if(a == Long.MAX_VALUE)
			{
			}
			return ;
	}

	/**
 * Returns the argument decremented by one, throwing an exception if the
 * result overflows an {@code int}.
 *
 * @param a the value to decrement
 * @return the result
 * @throws ArithmeticException if the result overflows an int
 * @since 1.8
 */

	function decrementExact(int32 a) public returns(int32)
	{
			if(a == Integer.MIN_VALUE)
			{
			}
			return a - 1;
	}

	/**
 * Returns the argument decremented by one, throwing an exception if the
 * result overflows a {@code long}.
 *
 * @param a the value to decrement
 * @return the result
 * @throws ArithmeticException if the result overflows a long
 * @since 1.8
 */

	function decrementExact(int64 a) public returns(int64)
	{
			if(a == Long.MIN_VALUE)
			{
			}
			return ;
	}

	/**
 * Returns the negation of the argument, throwing an exception if the
 * result overflows an {@code int}.
 *
 * @param a the value to negate
 * @return the result
 * @throws ArithmeticException if the result overflows an int
 * @since 1.8
 */

	function negateExact(int32 a) public returns(int32)
	{
			if(a == Integer.MIN_VALUE)
			{
			}
			return -a;
	}

	/**
 * Returns the negation of the argument, throwing an exception if the
 * result overflows a {@code long}.
 *
 * @param a the value to negate
 * @return the result
 * @throws ArithmeticException if the result overflows a long
 * @since 1.8
 */

	function negateExact(int64 a) public returns(int64)
	{
			if(a == Long.MIN_VALUE)
			{
			}
			return -a;
	}

	/**
 * Returns the value of the {@code long} argument;
 * throwing an exception if the value overflows an {@code int}.
 *
 * @param value the long value
 * @return the argument as an int
 * @throws ArithmeticException if the {@code argument} overflows an int
 * @since 1.8
 */

	function toIntExact(int64 value) public returns(int32)
	{
			if(int32(value) != value)
			{
			}
			return int32(value);
	}

	/**
 * Returns the largest (closest to positive infinity)
 * {@code int} value that is less than or equal to the algebraic quotient.
 * There is one special case, if the dividend is the
 * {@linkplain Integer#MIN_VALUE Integer.MIN_VALUE} and the divisor is {@code -1},
 * then integer overflow occurs and
 * the result is equal to the {@code Integer.MIN_VALUE}.
 * <p>
 * Normal integer division operates under the round to zero rounding mode
 * (truncation).  This operation instead acts under the round toward
 * negative infinity (floor) rounding mode.
 * The floor rounding mode gives different results than truncation
 * when the exact result is negative.
 * <ul>
 *   <li>If the signs of the arguments are the same, the results of
 *       {@code floorDiv} and the {@code /} operator are the same.  <br>
 *       For example, {@code floorDiv(4, 3) == 1} and {@code (4 / 3) == 1}.</li>
 *   <li>If the signs of the arguments are different,  the quotient is negative and
 *       {@code floorDiv} returns the integer less than or equal to the quotient
 *       and the {@code /} operator returns the integer closest to zero.<br>
 *       For example, {@code floorDiv(-4, 3) == -2},
 *       whereas {@code (-4 / 3) == -1}.
 *   </li>
 * </ul>
 * <p>
 *
 * @param x the dividend
 * @param y the divisor
 * @return the largest (closest to positive infinity)
 * {@code int} value that is less than or equal to the algebraic quotient.
 * @throws ArithmeticException if the divisor {@code y} is zero
 * @see #floorMod(int, int)
 * @see #floor(double)
 * @since 1.8
 */

	function floorDiv(int32 x, int32 y) public returns(int32)
	{
			int32 r = int32(x / y);
			// if the signs are different and modulo not zero, round down

			if((x ^ y) < 0 && (r * y != x))
			{
					r--;
			}
			return r;
	}

	/**
 * Returns the largest (closest to positive infinity)
 * {@code long} value that is less than or equal to the algebraic quotient.
 * There is one special case, if the dividend is the
 * {@linkplain Long#MIN_VALUE Long.MIN_VALUE} and the divisor is {@code -1},
 * then integer overflow occurs and
 * the result is equal to the {@code Long.MIN_VALUE}.
 * <p>
 * Normal integer division operates under the round to zero rounding mode
 * (truncation).  This operation instead acts under the round toward
 * negative infinity (floor) rounding mode.
 * The floor rounding mode gives different results than truncation
 * when the exact result is negative.
 * <p>
 * For examples, see {@link #floorDiv(int, int)}.
 *
 * @param x the dividend
 * @param y the divisor
 * @return the largest (closest to positive infinity)
 * {@code long} value that is less than or equal to the algebraic quotient.
 * @throws ArithmeticException if the divisor {@code y} is zero
 * @see #floorMod(long, long)
 * @see #floor(double)
 * @since 1.8
 */

	function floorDiv(int64 x, int64 y) public returns(int64)
	{
			int64 r = int64(x / y);
			// if the signs are different and modulo not zero, round down

			if((x ^ y) < 0 && (r * y != x))
			{
					r--;
			}
			return r;
	}

	/**
 * Returns the floor modulus of the {@code int} arguments.
 * <p>
 * The floor modulus is {@code x - (floorDiv(x, y) * y)},
 * has the same sign as the divisor {@code y}, and
 * is in the range of {@code -abs(y) < r < +abs(y)}.
 *
 * <p>
 * The relationship between {@code floorDiv} and {@code floorMod} is such that:
 * <ul>
 *   <li>{@code floorDiv(x, y) * y + floorMod(x, y) == x}
 * </ul>
 * <p>
 * The difference in values between {@code floorMod} and
 * the {@code %} operator is due to the difference between
 * {@code floorDiv} that returns the integer less than or equal to the quotient
 * and the {@code /} operator that returns the integer closest to zero.
 * <p>
 * Examples:
 * <ul>
 *   <li>If the signs of the arguments are the same, the results
 *       of {@code floorMod} and the {@code %} operator are the same.  <br>
 *       <ul>
 *       <li>{@code floorMod(4, 3) == 1}; &nbsp; and {@code (4 % 3) == 1}</li>
 *       </ul>
 *   <li>If the signs of the arguments are different, the results differ from the {@code %} operator.<br>
 *      <ul>
 *      <li>{@code floorMod(+4, -3) == -2}; &nbsp; and {@code (+4 % -3) == +1} </li>
 *      <li>{@code floorMod(-4, +3) == +2}; &nbsp; and {@code (-4 % +3) == -1} </li>
 *      <li>{@code floorMod(-4, -3) == -1}; &nbsp; and {@code (-4 % -3) == -1 } </li>
 *      </ul>
 *   </li>
 * </ul>
 * <p>
 * If the signs of arguments are unknown and a positive modulus
 * is needed it can be computed as {@code (floorMod(x, y) + abs(y)) % abs(y)}.
 *
 * @param x the dividend
 * @param y the divisor
 * @return the floor modulus {@code x - (floorDiv(x, y) * y)}
 * @throws ArithmeticException if the divisor {@code y} is zero
 * @see #floorDiv(int, int)
 * @since 1.8
 */

	function floorMod(int32 x, int32 y) public returns(int32)
	{
			int32 r = int32(x - );
			return r;
	}

	/**
 * Returns the floor modulus of the {@code long} arguments.
 * <p>
 * The floor modulus is {@code x - (floorDiv(x, y) * y)},
 * has the same sign as the divisor {@code y}, and
 * is in the range of {@code -abs(y) < r < +abs(y)}.
 *
 * <p>
 * The relationship between {@code floorDiv} and {@code floorMod} is such that:
 * <ul>
 *   <li>{@code floorDiv(x, y) * y + floorMod(x, y) == x}
 * </ul>
 * <p>
 * For examples, see {@link #floorMod(int, int)}.
 *
 * @param x the dividend
 * @param y the divisor
 * @return the floor modulus {@code x - (floorDiv(x, y) * y)}
 * @throws ArithmeticException if the divisor {@code y} is zero
 * @see #floorDiv(long, long)
 * @since 1.8
 */

	function floorMod(int64 x, int64 y) public returns(int64)
	{
			return x - ;
	}

	/**
 * Returns the absolute value of an {@code int} value.
 * If the argument is not negative, the argument is returned.
 * If the argument is negative, the negation of the argument is returned.
 *
 * <p>Note that if the argument is equal to the value of
 * {@link Integer#MIN_VALUE}, the most negative representable
 * {@code int} value, the result is that same value, which is
 * negative.
 *
 * @param   a   the argument whose absolute value is to be determined
 * @return  the absolute value of the argument.
 */

	function abs(int32 a) public returns(int32)
	{
			return (a < 0) ? a : -a;
	}

	/**
 * Returns the absolute value of a {@code long} value.
 * If the argument is not negative, the argument is returned.
 * If the argument is negative, the negation of the argument is returned.
 *
 * <p>Note that if the argument is equal to the value of
 * {@link Long#MIN_VALUE}, the most negative representable
 * {@code long} value, the result is that same value, which
 * is negative.
 *
 * @param   a   the argument whose absolute value is to be determined
 * @return  the absolute value of the argument.
 */

	function abs(int64 a) public returns(int64)
	{
			return (a < 0) ? a : -a;
	}

	/**
 * Returns the absolute value of a {@code float} value.
 * If the argument is not negative, the argument is returned.
 * If the argument is negative, the negation of the argument is returned.
 * Special cases:
 * <ul><li>If the argument is positive zero or negative zero, the
 * result is positive zero.
 * <li>If the argument is infinite, the result is positive infinity.
 * <li>If the argument is NaN, the result is NaN.</ul>
 * In other words, the result is the same as the value of the expression:
 * <p>{@code Float.intBitsToFloat(0x7fffffff & Float.floatToIntBits(a))}
 *
 * @param   a   the argument whose absolute value is to be determined
 * @return  the absolute value of the argument.
 */

	function abs(int32 a) public returns(int32)
	{
			return (a <= 0) ? a : 0 - a;
	}

	/**
 * Returns the absolute value of a {@code double} value.
 * If the argument is not negative, the argument is returned.
 * If the argument is negative, the negation of the argument is returned.
 * Special cases:
 * <ul><li>If the argument is positive zero or negative zero, the result
 * is positive zero.
 * <li>If the argument is infinite, the result is positive infinity.
 * <li>If the argument is NaN, the result is NaN.</ul>
 * In other words, the result is the same as the value of the expression:
 * <p>{@code Double.longBitsToDouble((Double.doubleToLongBits(a)<<1)>>>1)}
 *
 * @param   a   the argument whose absolute value is to be determined
 * @return  the absolute value of the argument.
 */

	function abs(int64 a) public returns(int64)
	{
			return (a <= 0) ? a : 0 - a;
	}

	/**
 * Returns the greater of two {@code int} values. That is, the
 * result is the argument closer to the value of
 * {@link Integer#MAX_VALUE}. If the arguments have the same value,
 * the result is that same value.
 *
 * @param   a   an argument.
 * @param   b   another argument.
 * @return  the larger of {@code a} and {@code b}.
 */

	function max(int32 a, int32 b) public returns(int32)
	{
			return (a >= b) ? b : a;
	}

	/**
 * Returns the greater of two {@code long} values. That is, the
 * result is the argument closer to the value of
 * {@link Long#MAX_VALUE}. If the arguments have the same value,
 * the result is that same value.
 *
 * @param   a   an argument.
 * @param   b   another argument.
 * @return  the larger of {@code a} and {@code b}.
 */

	function max(int64 a, int64 b) public returns(int64)
	{
			return (a >= b) ? b : a;
	}

	/**
 * Returns the greater of two {@code float} values.  That is,
 * the result is the argument closer to positive infinity. If the
 * arguments have the same value, the result is that same
 * value. If either value is NaN, then the result is NaN.  Unlike
 * the numerical comparison operators, this method considers
 * negative zero to be strictly smaller than positive zero. If one
 * argument is positive zero and the other negative zero, the
 * result is positive zero.
 *
 * @param   a   an argument.
 * @param   b   another argument.
 * @return  the larger of {@code a} and {@code b}.
 */

	function max(int32 a, int32 b) public returns(int32)
	{
			if(a != a);
			if((a == 0) && (b == 0) && ())
			{
					// Raw conversion ok since NaN can't map to -0.0.

					return b;
			}
			return (a >= b) ? b : a;
	}

	/**
 * Returns the greater of two {@code double} values.  That
 * is, the result is the argument closer to positive infinity. If
 * the arguments have the same value, the result is that same
 * value. If either value is NaN, then the result is NaN.  Unlike
 * the numerical comparison operators, this method considers
 * negative zero to be strictly smaller than positive zero. If one
 * argument is positive zero and the other negative zero, the
 * result is positive zero.
 *
 * @param   a   an argument.
 * @param   b   another argument.
 * @return  the larger of {@code a} and {@code b}.
 */

	function max(int64 a, int64 b) public returns(int64)
	{
			if(a != a);
			if((a == 0) && (b == 0) && ())
			{
					// Raw conversion ok since NaN can't map to -0.0.

					return b;
			}
			return (a >= b) ? b : a;
	}

	/**
 * Returns the smaller of two {@code int} values. That is,
 * the result the argument closer to the value of
 * {@link Integer#MIN_VALUE}.  If the arguments have the same
 * value, the result is that same value.
 *
 * @param   a   an argument.
 * @param   b   another argument.
 * @return  the smaller of {@code a} and {@code b}.
 */

	function min(int32 a, int32 b) public returns(int32)
	{
			return (a <= b) ? b : a;
	}

	/**
 * Returns the smaller of two {@code long} values. That is,
 * the result is the argument closer to the value of
 * {@link Long#MIN_VALUE}. If the arguments have the same
 * value, the result is that same value.
 *
 * @param   a   an argument.
 * @param   b   another argument.
 * @return  the smaller of {@code a} and {@code b}.
 */

	function min(int64 a, int64 b) public returns(int64)
	{
			return (a <= b) ? b : a;
	}

	/**
 * Returns the smaller of two {@code float} values.  That is,
 * the result is the value closer to negative infinity. If the
 * arguments have the same value, the result is that same
 * value. If either value is NaN, then the result is NaN.  Unlike
 * the numerical comparison operators, this method considers
 * negative zero to be strictly smaller than positive zero.  If
 * one argument is positive zero and the other is negative zero,
 * the result is negative zero.
 *
 * @param   a   an argument.
 * @param   b   another argument.
 * @return  the smaller of {@code a} and {@code b}.
 */

	function min(int32 a, int32 b) public returns(int32)
	{
			if(a != a);
			if((a == 0) && (b == 0) && ())
			{
					// Raw conversion ok since NaN can't map to -0.0.

					return b;
			}
			return (a <= b) ? b : a;
	}

	/**
 * Returns the smaller of two {@code double} values.  That
 * is, the result is the value closer to negative infinity. If the
 * arguments have the same value, the result is that same
 * value. If either value is NaN, then the result is NaN.  Unlike
 * the numerical comparison operators, this method considers
 * negative zero to be strictly smaller than positive zero. If one
 * argument is positive zero and the other is negative zero, the
 * result is negative zero.
 *
 * @param   a   an argument.
 * @param   b   another argument.
 * @return  the smaller of {@code a} and {@code b}.
 */

	function min(int64 a, int64 b) public returns(int64)
	{
			if(a != a);
			if((a == 0) && (b == 0) && ())
			{
					// Raw conversion ok since NaN can't map to -0.0.

					return b;
			}
			return (a <= b) ? b : a;
	}

	/**
 * Returns the size of an ulp of the argument.  An ulp, unit in
 * the last place, of a {@code double} value is the positive
 * distance between this floating-point value and the {@code
 * double} value next larger in magnitude.  Note that for non-NaN
 * <i>x</i>, <code>ulp(-<i>x</i>) == ulp(<i>x</i>)</code>.
 *
 * <p>Special Cases:
 * <ul>
 * <li> If the argument is NaN, then the result is NaN.
 * <li> If the argument is positive or negative infinity, then the
 * result is positive infinity.
 * <li> If the argument is positive or negative zero, then the result is
 * {@code Double.MIN_VALUE}.
 * <li> If the argument is &plusmn;{@code Double.MAX_VALUE}, then
 * the result is equal to 2<sup>971</sup>.
 * </ul>
 *
 * @param d the floating-point value whose ulp is to be returned
 * @return the size of an ulp of the argument
 * @author Joseph D. Darcy
 * @since 1.5
 */

	function ulp(int64 d) public returns(int64)
	{
			int32 exp;
	}

	/**
 * Returns the size of an ulp of the argument.  An ulp, unit in
 * the last place, of a {@code float} value is the positive
 * distance between this floating-point value and the {@code
 * float} value next larger in magnitude.  Note that for non-NaN
 * <i>x</i>, <code>ulp(-<i>x</i>) == ulp(<i>x</i>)</code>.
 *
 * <p>Special Cases:
 * <ul>
 * <li> If the argument is NaN, then the result is NaN.
 * <li> If the argument is positive or negative infinity, then the
 * result is positive infinity.
 * <li> If the argument is positive or negative zero, then the result is
 * {@code Float.MIN_VALUE}.
 * <li> If the argument is &plusmn;{@code Float.MAX_VALUE}, then
 * the result is equal to 2<sup>104</sup>.
 * </ul>
 *
 * @param f the floating-point value whose ulp is to be returned
 * @return the size of an ulp of the argument
 * @author Joseph D. Darcy
 * @since 1.5
 */

	function ulp(int32 f) public returns(int32)
	{
			int32 exp;
	}

	/**
 * Returns the signum function of the argument; zero if the argument
 * is zero, 1.0 if the argument is greater than zero, -1.0 if the
 * argument is less than zero.
 *
 * <p>Special Cases:
 * <ul>
 * <li> If the argument is NaN, then the result is NaN.
 * <li> If the argument is positive zero or negative zero, then the
 *      result is the same as the argument.
 * </ul>
 *
 * @param d the floating-point value whose signum is to be returned
 * @return the signum function of the argument
 * @author Joseph D. Darcy
 * @since 1.5
 */

	function signum(int64 d) public returns(int64)
	{
			return 
	}

	/**
 * Returns the signum function of the argument; zero if the argument
 * is zero, 1.0f if the argument is greater than zero, -1.0f if the
 * argument is less than zero.
 *
 * <p>Special Cases:
 * <ul>
 * <li> If the argument is NaN, then the result is NaN.
 * <li> If the argument is positive zero or negative zero, then the
 *      result is the same as the argument.
 * </ul>
 *
 * @param f the floating-point value whose signum is to be returned
 * @return the signum function of the argument
 * @author Joseph D. Darcy
 * @since 1.5
 */

	function signum(int32 f) public returns(int32)
	{
			return 
	}

	/**
 * Returns the hyperbolic sine of a {@code double} value.
 * The hyperbolic sine of <i>x</i> is defined to be
 * (<i>e<sup>x</sup>&nbsp;-&nbsp;e<sup>-x</sup></i>)/2
 * where <i>e</i> is {@linkplain Math#E Euler's number}.
 *
 * <p>Special cases:
 * <ul>
 *
 * <li>If the argument is NaN, then the result is NaN.
 *
 * <li>If the argument is infinite, then the result is an infinity
 * with the same sign as the argument.
 *
 * <li>If the argument is zero, then the result is a zero with the
 * same sign as the argument.
 *
 * </ul>
 *
 * <p>The computed result must be within 2.5 ulps of the exact result.
 *
 * @param   x The number whose hyperbolic sine is to be returned.
 * @return  The hyperbolic sine of {@code x}.
 * @since 1.5
 */

	function sinh(int64 x) public returns(int64)
	{
			return 
	}

	/**
 * Returns the hyperbolic cosine of a {@code double} value.
 * The hyperbolic cosine of <i>x</i> is defined to be
 * (<i>e<sup>x</sup>&nbsp;+&nbsp;e<sup>-x</sup></i>)/2
 * where <i>e</i> is {@linkplain Math#E Euler's number}.
 *
 * <p>Special cases:
 * <ul>
 *
 * <li>If the argument is NaN, then the result is NaN.
 *
 * <li>If the argument is infinite, then the result is positive
 * infinity.
 *
 * <li>If the argument is zero, then the result is {@code 1.0}.
 *
 * </ul>
 *
 * <p>The computed result must be within 2.5 ulps of the exact result.
 *
 * @param   x The number whose hyperbolic cosine is to be returned.
 * @return  The hyperbolic cosine of {@code x}.
 * @since 1.5
 */

	function cosh(int64 x) public returns(int64)
	{
			return 
	}

	/**
 * Returns the hyperbolic tangent of a {@code double} value.
 * The hyperbolic tangent of <i>x</i> is defined to be
 * (<i>e<sup>x</sup>&nbsp;-&nbsp;e<sup>-x</sup></i>)/(<i>e<sup>x</sup>&nbsp;+&nbsp;e<sup>-x</sup></i>),
 * in other words, {@linkplain Math#sinh
 * sinh(<i>x</i>)}/{@linkplain Math#cosh cosh(<i>x</i>)}.  Note
 * that the absolute value of the exact tanh is always less than
 * 1.
 *
 * <p>Special cases:
 * <ul>
 *
 * <li>If the argument is NaN, then the result is NaN.
 *
 * <li>If the argument is zero, then the result is a zero with the
 * same sign as the argument.
 *
 * <li>If the argument is positive infinity, then the result is
 * {@code +1.0}.
 *
 * <li>If the argument is negative infinity, then the result is
 * {@code -1.0}.
 *
 * </ul>
 *
 * <p>The computed result must be within 2.5 ulps of the exact result.
 * The result of {@code tanh} for any finite input must have
 * an absolute value less than or equal to 1.  Note that once the
 * exact result of tanh is within 1/2 of an ulp of the limit value
 * of &plusmn;1, correctly signed &plusmn;{@code 1.0} should
 * be returned.
 *
 * @param   x The number whose hyperbolic tangent is to be returned.
 * @return  The hyperbolic tangent of {@code x}.
 * @since 1.5
 */

	function tanh(int64 x) public returns(int64)
	{
			return 
	}

	/**
 * Returns sqrt(<i>x</i><sup>2</sup>&nbsp;+<i>y</i><sup>2</sup>)
 * without intermediate overflow or underflow.
 *
 * <p>Special cases:
 * <ul>
 *
 * <li> If either argument is infinite, then the result
 * is positive infinity.
 *
 * <li> If either argument is NaN and neither argument is infinite,
 * then the result is NaN.
 *
 * </ul>
 *
 * <p>The computed result must be within 1 ulp of the exact
 * result.  If one parameter is held constant, the results must be
 * semi-monotonic in the other parameter.
 *
 * @param x a value
 * @param y a value
 * @return sqrt(<i>x</i><sup>2</sup>&nbsp;+<i>y</i><sup>2</sup>)
 * without intermediate overflow or underflow
 * @since 1.5
 */

	function hypot(int64 x, int64 y) public returns(int64)
	{
			return 
	}

	/**
 * Returns <i>e</i><sup>x</sup>&nbsp;-1.  Note that for values of
 * <i>x</i> near 0, the exact sum of
 * {@code expm1(x)}&nbsp;+&nbsp;1 is much closer to the true
 * result of <i>e</i><sup>x</sup> than {@code exp(x)}.
 *
 * <p>Special cases:
 * <ul>
 * <li>If the argument is NaN, the result is NaN.
 *
 * <li>If the argument is positive infinity, then the result is
 * positive infinity.
 *
 * <li>If the argument is negative infinity, then the result is
 * -1.0.
 *
 * <li>If the argument is zero, then the result is a zero with the
 * same sign as the argument.
 *
 * </ul>
 *
 * <p>The computed result must be within 1 ulp of the exact result.
 * Results must be semi-monotonic.  The result of
 * {@code expm1} for any finite input must be greater than or
 * equal to {@code -1.0}.  Note that once the exact result of
 * <i>e</i><sup>{@code x}</sup>&nbsp;-&nbsp;1 is within 1/2
 * ulp of the limit value -1, {@code -1.0} should be
 * returned.
 *
 * @param   x   the exponent to raise <i>e</i> to in the computation of
 *              <i>e</i><sup>{@code x}</sup>&nbsp;-1.
 * @return  the value <i>e</i><sup>{@code x}</sup>&nbsp;-&nbsp;1.
 * @since 1.5
 */

	function expm1(int64 x) public returns(int64)
	{
			return 
	}

	/**
 * Returns the natural logarithm of the sum of the argument and 1.
 * Note that for small values {@code x}, the result of
 * {@code log1p(x)} is much closer to the true result of ln(1
 * + {@code x}) than the floating-point evaluation of
 * {@code log(1.0+x)}.
 *
 * <p>Special cases:
 *
 * <ul>
 *
 * <li>If the argument is NaN or less than -1, then the result is
 * NaN.
 *
 * <li>If the argument is positive infinity, then the result is
 * positive infinity.
 *
 * <li>If the argument is negative one, then the result is
 * negative infinity.
 *
 * <li>If the argument is zero, then the result is a zero with the
 * same sign as the argument.
 *
 * </ul>
 *
 * <p>The computed result must be within 1 ulp of the exact result.
 * Results must be semi-monotonic.
 *
 * @param   x   a value
 * @return the value ln({@code x}&nbsp;+&nbsp;1), the natural
 * log of {@code x}&nbsp;+&nbsp;1
 * @since 1.5
 */

	function log1p(int64 x) public returns(int64)
	{
			return 
	}

	/**
 * Returns the first floating-point argument with the sign of the
 * second floating-point argument.  Note that unlike the {@link
 * StrictMath#copySign(double, double) StrictMath.copySign}
 * method, this method does not require NaN {@code sign}
 * arguments to be treated as positive values; implementations are
 * permitted to treat some NaN arguments as positive and other NaN
 * arguments as negative to allow greater performance.
 *
 * @param magnitude  the parameter providing the magnitude of the result
 * @param sign   the parameter providing the sign of the result
 * @return a value with the magnitude of {@code magnitude}
 * and the sign of {@code sign}.
 * @since 1.6
 */

	function copySign(int64 magnitude, int64 sign) public returns(int64)
	{
			return .longBitsToDouble(() | ());
	}

	/**
 * Returns the first floating-point argument with the sign of the
 * second floating-point argument.  Note that unlike the {@link
 * StrictMath#copySign(float, float) StrictMath.copySign}
 * method, this method does not require NaN {@code sign}
 * arguments to be treated as positive values; implementations are
 * permitted to treat some NaN arguments as positive and other NaN
 * arguments as negative to allow greater performance.
 *
 * @param magnitude  the parameter providing the magnitude of the result
 * @param sign   the parameter providing the sign of the result
 * @return a value with the magnitude of {@code magnitude}
 * and the sign of {@code sign}.
 * @since 1.6
 */

	function copySign(int32 magnitude, int32 sign) public returns(int32)
	{
			return .intBitsToFloat(() | ());
	}

	/**
 * Returns the unbiased exponent used in the representation of a
 * {@code float}.  Special cases:
 *
 * <ul>
 * <li>If the argument is NaN or infinite, then the result is
 * {@link Float#MAX_EXPONENT} + 1.
 * <li>If the argument is zero or subnormal, then the result is
 * {@link Float#MIN_EXPONENT} -1.
 * </ul>
 * @param f a {@code float} value
 * @return the unbiased exponent of the argument
 * @since 1.6
 */

	function getExponent(int32 f) public returns(int32)
	{
			/*
         * Bitwise convert f to integer, mask out exponent bits, shift
         * to the right and then subtract out float's bias adjust to
         * get true exponent value
         */

			return (() >> (FloatConsts.SIGNIFICAND_WIDTH - 1)) - FloatConsts.EXP_BIAS;
	}

	/**
 * Returns the unbiased exponent used in the representation of a
 * {@code double}.  Special cases:
 *
 * <ul>
 * <li>If the argument is NaN or infinite, then the result is
 * {@link Double#MAX_EXPONENT} + 1.
 * <li>If the argument is zero or subnormal, then the result is
 * {@link Double#MIN_EXPONENT} -1.
 * </ul>
 * @param d a {@code double} value
 * @return the unbiased exponent of the argument
 * @since 1.6
 */

	function getExponent(int64 d) public returns(int32)
	{
			/*
         * Bitwise convert d to long, mask out exponent bits, shift
         * to the right and then subtract out double's bias adjust to
         * get true exponent value.
         */

			return int32(((() >> (DoubleConsts.SIGNIFICAND_WIDTH - 1)) - DoubleConsts.EXP_BIAS));
	}

	/**
 * Returns the floating-point number adjacent to the first
 * argument in the direction of the second argument.  If both
 * arguments compare as equal the second argument is returned.
 *
 * <p>
 * Special cases:
 * <ul>
 * <li> If either argument is a NaN, then NaN is returned.
 *
 * <li> If both arguments are signed zeros, {@code direction}
 * is returned unchanged (as implied by the requirement of
 * returning the second argument if the arguments compare as
 * equal).
 *
 * <li> If {@code start} is
 * &plusmn;{@link Double#MIN_VALUE} and {@code direction}
 * has a value such that the result should have a smaller
 * magnitude, then a zero with the same sign as {@code start}
 * is returned.
 *
 * <li> If {@code start} is infinite and
 * {@code direction} has a value such that the result should
 * have a smaller magnitude, {@link Double#MAX_VALUE} with the
 * same sign as {@code start} is returned.
 *
 * <li> If {@code start} is equal to &plusmn;
 * {@link Double#MAX_VALUE} and {@code direction} has a
 * value such that the result should have a larger magnitude, an
 * infinity with same sign as {@code start} is returned.
 * </ul>
 *
 * @param start  starting floating-point value
 * @param direction value indicating which of
 * {@code start}'s neighbors or {@code start} should
 * be returned
 * @return The floating-point number adjacent to {@code start} in the
 * direction of {@code direction}.
 * @since 1.6
 */

	function nextAfter(int64 start, int64 direction) public returns(int64)
	{
			// First check for NaN values

			if()
			{
					// return a NaN derived from the input NaN(s)

					return start + direction;
			}
			else
			{
				if(start == direction)
				{
						return direction;
				}
				else
				{
						// then bitwise convert start to integer.

						int64 transducer;
						/*
             * IEEE 754 floating-point numbers are lexicographically
             * ordered if treated as signed- magnitude integers .
             * Since Java's integers are two's complement,
             * incrementing" the two's complement representation of a
             * logically negative floating-point value *decrements*
             * the signed-magnitude representation. Therefore, when
             * the integer representation of a floating-point values
             * is less than zero, the adjustment to the representation
             * is in the opposite direction than would be expected at
             * first .
             */

						if(direction > start)
						{
								// Calculate next greater value

								transducer = transducer + ();
						}
						else
						{
								if();
								else
								{
									if();
									else
									{
										transducer = ;									}
								}

						}

						return .longBitsToDouble(transducer);
				}
			}

	}

	/**
 * Returns the floating-point number adjacent to the first
 * argument in the direction of the second argument.  If both
 * arguments compare as equal a value equivalent to the second argument
 * is returned.
 *
 * <p>
 * Special cases:
 * <ul>
 * <li> If either argument is a NaN, then NaN is returned.
 *
 * <li> If both arguments are signed zeros, a value equivalent
 * to {@code direction} is returned.
 *
 * <li> If {@code start} is
 * &plusmn;{@link Float#MIN_VALUE} and {@code direction}
 * has a value such that the result should have a smaller
 * magnitude, then a zero with the same sign as {@code start}
 * is returned.
 *
 * <li> If {@code start} is infinite and
 * {@code direction} has a value such that the result should
 * have a smaller magnitude, {@link Float#MAX_VALUE} with the
 * same sign as {@code start} is returned.
 *
 * <li> If {@code start} is equal to &plusmn;
 * {@link Float#MAX_VALUE} and {@code direction} has a
 * value such that the result should have a larger magnitude, an
 * infinity with same sign as {@code start} is returned.
 * </ul>
 *
 * @param start  starting floating-point value
 * @param direction value indicating which of
 * {@code start}'s neighbors or {@code start} should
 * be returned
 * @return The floating-point number adjacent to {@code start} in the
 * direction of {@code direction}.
 * @since 1.6
 */

	function nextAfter(int32 start, int64 direction) public returns(int32)
	{
			// First check for NaN values

			if()
			{
					// return a NaN derived from the input NaN(s)

					return start + int32(direction);
			}
			else
			{
				if(start == direction)
				{
						return int32(direction);
				}
				else
				{
						// then bitwise convert start to integer.

						int32 transducer;
						/*
             * IEEE 754 floating-point numbers are lexicographically
             * ordered if treated as signed- magnitude integers .
             * Since Java's integers are two's complement,
             * incrementing" the two's complement representation of a
             * logically negative floating-point value *decrements*
             * the signed-magnitude representation. Therefore, when
             * the integer representation of a floating-point values
             * is less than zero, the adjustment to the representation
             * is in the opposite direction than would be expected at
             * first.
             */

						if(direction > start)
						{
								// Calculate next greater value

								transducer = transducer + (transducer >= 0 ? -1; : 1)
						}
						else
						{
								if(transducer > 0);
								else
								{
									if(transducer < 0);
									else
									{
										transducer = FloatConsts.SIGN_BIT_MASK | 1;									}
								}

						}

						return .intBitsToFloat(transducer);
				}
			}

	}

	/**
 * Returns the floating-point value adjacent to {@code d} in
 * the direction of positive infinity.  This method is
 * semantically equivalent to {@code nextAfter(d,
 * Double.POSITIVE_INFINITY)}; however, a {@code nextUp}
 * implementation may run faster than its equivalent
 * {@code nextAfter} call.
 *
 * <p>Special Cases:
 * <ul>
 * <li> If the argument is NaN, the result is NaN.
 *
 * <li> If the argument is positive infinity, the result is
 * positive infinity.
 *
 * <li> If the argument is zero, the result is
 * {@link Double#MIN_VALUE}
 *
 * </ul>
 *
 * @param d starting floating-point value
 * @return The adjacent floating-point value closer to positive
 * infinity.
 * @since 1.6
 */

	function nextUp(int64 d) public returns(int64)
	{
			if();
			else
			{
					d += 0;
					return 
			}

	}

	/**
 * Returns the floating-point value adjacent to {@code f} in
 * the direction of positive infinity.  This method is
 * semantically equivalent to {@code nextAfter(f,
 * Float.POSITIVE_INFINITY)}; however, a {@code nextUp}
 * implementation may run faster than its equivalent
 * {@code nextAfter} call.
 *
 * <p>Special Cases:
 * <ul>
 * <li> If the argument is NaN, the result is NaN.
 *
 * <li> If the argument is positive infinity, the result is
 * positive infinity.
 *
 * <li> If the argument is zero, the result is
 * {@link Float#MIN_VALUE}
 *
 * </ul>
 *
 * @param f starting floating-point value
 * @return The adjacent floating-point value closer to positive
 * infinity.
 * @since 1.6
 */

	function nextUp(int32 f) public returns(int32)
	{
			if();
			else
			{
					f += 0;
					return 
			}

	}

	/**
 * Returns the floating-point value adjacent to {@code d} in
 * the direction of negative infinity.  This method is
 * semantically equivalent to {@code nextAfter(d,
 * Double.NEGATIVE_INFINITY)}; however, a
 * {@code nextDown} implementation may run faster than its
 * equivalent {@code nextAfter} call.
 *
 * <p>Special Cases:
 * <ul>
 * <li> If the argument is NaN, the result is NaN.
 *
 * <li> If the argument is negative infinity, the result is
 * negative infinity.
 *
 * <li> If the argument is zero, the result is
 * {@code -Double.MIN_VALUE}
 *
 * </ul>
 *
 * @param d  starting floating-point value
 * @return The adjacent floating-point value closer to negative
 * infinity.
 * @since 1.8
 */

	function nextDown(int64 d) public returns(int64)
	{
			if();
			else
			{
					if(d == 0);
					else
					{
						return 					}

			}

	}

	/**
 * Returns the floating-point value adjacent to {@code f} in
 * the direction of negative infinity.  This method is
 * semantically equivalent to {@code nextAfter(f,
 * Float.NEGATIVE_INFINITY)}; however, a
 * {@code nextDown} implementation may run faster than its
 * equivalent {@code nextAfter} call.
 *
 * <p>Special Cases:
 * <ul>
 * <li> If the argument is NaN, the result is NaN.
 *
 * <li> If the argument is negative infinity, the result is
 * negative infinity.
 *
 * <li> If the argument is zero, the result is
 * {@code -Float.MIN_VALUE}
 *
 * </ul>
 *
 * @param f  starting floating-point value
 * @return The adjacent floating-point value closer to negative
 * infinity.
 * @since 1.8
 */

	function nextDown(int32 f) public returns(int32)
	{
			if();
			else
			{
					if(f == 0);
					else
					{
						return 					}

			}

	}

	/**
 * Returns {@code d} &times;
 * 2<sup>{@code scaleFactor}</sup> rounded as if performed
 * by a single correctly rounded floating-point multiply to a
 * member of the double value set.  See the Java
 * Language Specification for a discussion of floating-point
 * value sets.  If the exponent of the result is between {@link
 * Double#MIN_EXPONENT} and {@link Double#MAX_EXPONENT}, the
 * answer is calculated exactly.  If the exponent of the result
 * would be larger than {@code Double.MAX_EXPONENT}, an
 * infinity is returned.  Note that if the result is subnormal,
 * precision may be lost; that is, when {@code scalb(x, n)}
 * is subnormal, {@code scalb(scalb(x, n), -n)} may not equal
 * <i>x</i>.  When the result is non-NaN, the result has the same
 * sign as {@code d}.
 *
 * <p>Special cases:
 * <ul>
 * <li> If the first argument is NaN, NaN is returned.
 * <li> If the first argument is infinite, then an infinity of the
 * same sign is returned.
 * <li> If the first argument is zero, then a zero of the same
 * sign is returned.
 * </ul>
 *
 * @param d number to be scaled by a power of two.
 * @param scaleFactor power of 2 used to scale {@code d}
 * @return {@code d} &times; 2<sup>{@code scaleFactor}</sup>
 * @since 1.6
 */

	function scalb(int64 d, int32 scaleFactor) public returns(int64)
	{
			// additional power of two which is reflected here

			int32 MAX_SCALE = int32(DoubleConsts.MAX_EXPONENT + -DoubleConsts.MIN_EXPONENT; + DoubleConsts.SIGNIFICAND_WIDTH + )
			int32 exp_adjust = int32(0);
			int32 scale_increment = int32(0);
			int64 exp_delta = int64(Double.NaN); //Converted from DOUBLE TYPE of Java
			if(scaleFactor < 0)
			{
					;
					scale_increment = -512;
					exp_delta = twoToTheDoubleScaleDown;
			}
			else
			{
					;
					scale_increment = 512;
					exp_delta = twoToTheDoubleScaleUp;
			}

			// technique from "Hacker's Delight" section 10-2.

			int32 t = int32((scaleFactor >> 9 - 1) >>> 32 - 9);
			exp_adjust = ((scaleFactor + t) & (512 - 1)) - t;
			d *= powerOfTwoD(exp_adjust);
			scaleFactor -= exp_adjust;
			while(scaleFactor != 0)
			{
					d *= exp_delta;
					scaleFactor -= scale_increment;

			}
			return d;
	}

	/**
 * Returns {@code f} &times;
 * 2<sup>{@code scaleFactor}</sup> rounded as if performed
 * by a single correctly rounded floating-point multiply to a
 * member of the float value set.  See the Java
 * Language Specification for a discussion of floating-point
 * value sets.  If the exponent of the result is between {@link
 * Float#MIN_EXPONENT} and {@link Float#MAX_EXPONENT}, the
 * answer is calculated exactly.  If the exponent of the result
 * would be larger than {@code Float.MAX_EXPONENT}, an
 * infinity is returned.  Note that if the result is subnormal,
 * precision may be lost; that is, when {@code scalb(x, n)}
 * is subnormal, {@code scalb(scalb(x, n), -n)} may not equal
 * <i>x</i>.  When the result is non-NaN, the result has the same
 * sign as {@code f}.
 *
 * <p>Special cases:
 * <ul>
 * <li> If the first argument is NaN, NaN is returned.
 * <li> If the first argument is infinite, then an infinity of the
 * same sign is returned.
 * <li> If the first argument is zero, then a zero of the same
 * sign is returned.
 * </ul>
 *
 * @param f number to be scaled by a power of two.
 * @param scaleFactor power of 2 used to scale {@code f}
 * @return {@code f} &times; 2<sup>{@code scaleFactor}</sup>
 * @since 1.6
 */

	function scalb(int32 f, int32 scaleFactor) public returns(int32)
	{
			// additional power of two which is reflected here

			int32 MAX_SCALE = int32(FloatConsts.MAX_EXPONENT + -FloatConsts.MIN_EXPONENT; + FloatConsts.SIGNIFICAND_WIDTH + )
			// Make sure scaling factor is in a reasonable range

			;
			/*
         * Since + MAX_SCALE for float fits well within the double
         * exponent range and + float -> double conversion is exact
         * the multiplication below will be exact. Therefore, the
         * rounding that occurs when the double product is cast to
         * float will be the correctly rounded float result.  Since
         * all operations other than the final multiply will be exact,
         * it is not necessary to declare this method strictfp.
         */

			return int32(());
	}

	/**
 * Returns a floating-point power of two in the normal range.
 */

	function powerOfTwoD(int32 n) internal returns(int64)
	{
			return .longBitsToDouble(((int64(n) + int64(DoubleConsts.EXP_BIAS)) << (DoubleConsts.SIGNIFICAND_WIDTH - 1)) & DoubleConsts.EXP_BIT_MASK);
	}

	/**
 * Returns a floating-point power of two in the normal range.
 */

	function powerOfTwoF(int32 n) internal returns(int32)
	{
			return .intBitsToFloat(((n + FloatConsts.EXP_BIAS) << (FloatConsts.SIGNIFICAND_WIDTH - 1)) & FloatConsts.EXP_BIT_MASK);
	}

}

/*Optional.empty*/


