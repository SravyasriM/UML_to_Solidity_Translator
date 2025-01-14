pragma solidity 0.7.2;

//package java.lang


import "sun/misc/FloatingDecimal.sol";

import "sun/misc/FpUtils.sol";

import "sun/misc/DoubleConsts.sol";

/**
 * The {@code Double} class wraps a value of the primitive type
 * {@code double} in an object. An object of type
 * {@code Double} contains a single field whose type is
 * {@code double}.
 *
 * <p>In addition, this class provides several methods for converting a
 * {@code double} to a {@code String} and a
 * {@code String} to a {@code double}, as well as other
 * constants and methods useful when dealing with a
 * {@code double}.
 *
 * @author  Lee Boynton
 * @author  Arthur van Hoff
 * @author  Joseph D. Darcy
 * @since JDK1.0
 */

contract Double
{
	/**
 * A constant holding the positive infinity of type
 * {@code double}. It is equal to the value returned by
 * {@code Double.longBitsToDouble(0x7ff0000000000000L)}.
 */

	int64 static  immutable POSITIVE_INFINITY = int64(1 / 0);

	/**
 * A constant holding the negative infinity of type
 * {@code double}. It is equal to the value returned by
 * {@code Double.longBitsToDouble(0xfff0000000000000L)}.
 */

	int64 static  immutable NEGATIVE_INFINITY = int64(-1; / )

	/**
 * A constant holding a Not-a-Number (NaN) value of type
 * {@code double}. It is equivalent to the value returned by
 * {@code Double.longBitsToDouble(0x7ff8000000000000L)}.
 */

	int64 static  immutable NaN = int64(0 / 0);

	// 1.7976931348623157e+308

	int64 static  immutable MAX_VALUE = int64(9223372036854775807);

	// 2.2250738585072014E-308

	int64 static  immutable MIN_NORMAL = int64(0);

	// 4.9e-324

	int64 static  immutable MIN_VALUE = int64(0);

	/**
 * Maximum exponent a finite {@code double} variable may have.
 * It is equal to the value returned by
 * {@code Math.getExponent(Double.MAX_VALUE)}.
 *
 * @since 1.6
 */

	int32 static  immutable MAX_EXPONENT = int32(1023);

	/**
 * Minimum exponent a normalized {@code double} variable may
 * have.  It is equal to the value returned by
 * {@code Math.getExponent(Double.MIN_NORMAL)}.
 *
 * @since 1.6
 */

	int32 static  immutable MIN_EXPONENT = int32(-1022);

	/**
 * The number of bits used to represent a {@code double} value.
 *
 * @since 1.5
 */

	int32 static  immutable SIZE = int32(64);

	/**
 * The number of bytes used to represent a {@code double} value.
 *
 * @since 1.8
 */

	int32 static  immutable BYTES = int32(SIZE / Byte.SIZE);

	/**
 * The {@code Class} instance representing the primitive type
 * {@code double}.
 *
 * @since JDK1.1
 */

	Class static  immutable TYPE = Class(Class(.getPrimitiveClass("double")));

	/**
 * Returns a string representation of the {@code double}
 * argument. All characters mentioned below are ASCII characters.
 * <ul>
 * <li>If the argument is NaN, the result is the string
 *     "{@code NaN}".
 * <li>Otherwise, the result is a string that represents the sign and
 * magnitude (absolute value) of the argument. If the sign is negative,
 * the first character of the result is '{@code -}'
 * ({@code '\u005Cu002D'}); if the sign is positive, no sign character
 * appears in the result. As for the magnitude <i>m</i>:
 * <ul>
 * <li>If <i>m</i> is infinity, it is represented by the characters
 * {@code "Infinity"}; thus, positive infinity produces the result
 * {@code "Infinity"} and negative infinity produces the result
 * {@code "-Infinity"}.
 *
 * <li>If <i>m</i> is zero, it is represented by the characters
 * {@code "0.0"}; thus, negative zero produces the result
 * {@code "-0.0"} and positive zero produces the result
 * {@code "0.0"}.
 *
 * <li>If <i>m</i> is greater than or equal to 10<sup>-3</sup> but less
 * than 10<sup>7</sup>, then it is represented as the integer part of
 * <i>m</i>, in decimal form with no leading zeroes, followed by
 * '{@code .}' ({@code '\u005Cu002E'}), followed by one or
 * more decimal digits representing the fractional part of <i>m</i>.
 *
 * <li>If <i>m</i> is less than 10<sup>-3</sup> or greater than or
 * equal to 10<sup>7</sup>, then it is represented in so-called
 * "computerized scientific notation." Let <i>n</i> be the unique
 * integer such that 10<sup><i>n</i></sup> &le; <i>m</i> {@literal <}
 * 10<sup><i>n</i>+1</sup>; then let <i>a</i> be the
 * mathematically exact quotient of <i>m</i> and
 * 10<sup><i>n</i></sup> so that 1 &le; <i>a</i> {@literal <} 10. The
 * magnitude is then represented as the integer part of <i>a</i>,
 * as a single decimal digit, followed by '{@code .}'
 * ({@code '\u005Cu002E'}), followed by decimal digits
 * representing the fractional part of <i>a</i>, followed by the
 * letter '{@code E}' ({@code '\u005Cu0045'}), followed
 * by a representation of <i>n</i> as a decimal integer, as
 * produced by the method {@link Integer#toString(int)}.
 * </ul>
 * </ul>
 * How many digits must be printed for the fractional part of
 * <i>m</i> or <i>a</i>? There must be at least one digit to represent
 * the fractional part, and beyond that as many, but only as many, more
 * digits as are needed to uniquely distinguish the argument value from
 * adjacent values of type {@code double}. That is, suppose that
 * <i>x</i> is the exact mathematical value represented by the decimal
 * representation produced by this method for a finite nonzero argument
 * <i>d</i>. Then <i>d</i> must be the {@code double} value nearest
 * to <i>x</i>; or if two {@code double} values are equally close
 * to <i>x</i>, then <i>d</i> must be one of them and the least
 * significant bit of the significand of <i>d</i> must be {@code 0}.
 *
 * <p>To create localize                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     d string representations of a floating-point
 * value, use subclasses of {@link java.text.NumberFormat}.
 *
 * @param   d   the {@code double} to be converted.
 * @return a string representation of the argument.
 */

	function toString(int64 d) public returns(String)
	{
			return 
	}

	/**
 * Returns a hexadecimal string representation of the
 * {@code double} argument. All characters mentioned below
 * are ASCII characters.
 *
 * <ul>
 * <li>If the argument is NaN, the result is the string
 *     "{@code NaN}".
 * <li>Otherwise, the result is a string that represents the sign
 * and magnitude of the argument. If the sign is negative, the
 * first character of the result is '{@code -}'
 * ({@code '\u005Cu002D'}); if the sign is positive, no sign
 * character appears in the result. As for the magnitude <i>m</i>:
 *
 * <ul>
 * <li>If <i>m</i> is infinity, it is represented by the string
 * {@code "Infinity"}; thus, positive infinity produces the
 * result {@code "Infinity"} and negative infinity produces
 * the result {@code "-Infinity"}.
 *
 * <li>If <i>m</i> is zero, it is represented by the string
 * {@code "0x0.0p0"}; thus, negative zero produces the result
 * {@code "-0x0.0p0"} and positive zero produces the result
 * {@code "0x0.0p0"}.
 *
 * <li>If <i>m</i> is a {@code double} value with a
 * normalized representation, substrings are used to represent the
 * significand and exponent fields.  The significand is
 * represented by the characters {@code "0x1."}
 * followed by a lowercase hexadecimal representation of the rest
 * of the significand as a fraction.  Trailing zeros in the
 * hexadecimal representation are removed unless all the digits
 * are zero, in which case a single zero is used. Next, the
 * exponent is represented by {@code "p"} followed
 * by a decimal string of the unbiased exponent as if produced by
 * a call to {@link Integer#toString(int) Integer.toString} on the
 * exponent value.
 *
 * <li>If <i>m</i> is a {@code double} value with a subnormal
 * representation, the significand is represented by the
 * characters {@code "0x0."} followed by a
 * hexadecimal representation of the rest of the significand as a
 * fraction.  Trailing zeros in the hexadecimal representation are
 * removed. Next, the exponent is represented by
 * {@code "p-1022"}.  Note that there must be at
 * least one nonzero digit in a subnormal significand.
 *
 * </ul>
 *
 * </ul>
 *
 * <table border>
 * <caption>Examples</caption>
 * <tr><th>Floating-point Value</th><th>Hexadecimal String</th>
 * <tr><td>{@code 1.0}</td> <td>{@code 0x1.0p0}</td>
 * <tr><td>{@code -1.0}</td>        <td>{@code -0x1.0p0}</td>
 * <tr><td>{@code 2.0}</td> <td>{@code 0x1.0p1}</td>
 * <tr><td>{@code 3.0}</td> <td>{@code 0x1.8p1}</td>
 * <tr><td>{@code 0.5}</td> <td>{@code 0x1.0p-1}</td>
 * <tr><td>{@code 0.25}</td>        <td>{@code 0x1.0p-2}</td>
 * <tr><td>{@code Double.MAX_VALUE}</td>
 *     <td>{@code 0x1.fffffffffffffp1023}</td>
 * <tr><td>{@code Minimum Normal Value}</td>
 *     <td>{@code 0x1.0p-1022}</td>
 * <tr><td>{@code Maximum Subnormal Value}</td>
 *     <td>{@code 0x0.fffffffffffffp-1022}</td>
 * <tr><td>{@code Double.MIN_VALUE}</td>
 *     <td>{@code 0x0.0000000000001p-1022}</td>
 * </table>
 * @param   d   the {@code double} to be converted.
 * @return a hex string representation of the argument.
 * @since 1.5
 * @author Joseph D. Darcy
 */

	function toHexString(int64 d) public returns(String)
	{
			/*
         * Modeled after the "a" conversion specifier in C99, section
         * 7.19.6.1; however, the output of this method is more
         * tightly specified.
         */

			if(
	}

	/**
 *  Returns a {@code Double} object holding the
 *  {@code double} value represented by the argument string
 *  {@code s}.
 *
 *  <p>If {@code s} is {@code null}, then a
 *  {@code NullPointerException} is thrown.
 *
 *  <p>Leading and trailing whitespace characters in {@code s}
 *  are ignored.  Whitespace is removed as if by the {@link
 *  String#trim} method; that is, both ASCII space and control
 *  characters are removed. The rest of {@code s} should
 *  constitute a <i>FloatValue</i> as described by the lexical
 *  syntax rules:
 *
 *  <blockquote>
 *  <dl>
 *  <dt><i>FloatValue:</i>
 *  <dd><i>Sign<sub>opt</sub></i> {@code NaN}
 *  <dd><i>Sign<sub>opt</sub></i> {@code Infinity}
 *  <dd><i>Sign<sub>opt</sub> FloatingPointLiteral</i>
 *  <dd><i>Sign<sub>opt</sub> HexFloatingPointLiteral</i>
 *  <dd><i>SignedInteger</i>
 *  </dl>
 *
 *  <dl>
 *  <dt><i>HexFloatingPointLiteral</i>:
 *  <dd> <i>HexSignificand BinaryExponent FloatTypeSuffix<sub>opt</sub></i>
 *  </dl>
 *
 *  <dl>
 *  <dt><i>HexSignificand:</i>
 *  <dd><i>HexNumeral</i>
 *  <dd><i>HexNumeral</i> {@code .}
 *  <dd>{@code 0x} <i>HexDigits<sub>opt</sub>
 *      </i>{@code .}<i> HexDigits</i>
 *  <dd>{@code 0X}<i> HexDigits<sub>opt</sub>
 *      </i>{@code .} <i>HexDigits</i>
 *  </dl>
 *
 *  <dl>
 *  <dt><i>BinaryExponent:</i>
 *  <dd><i>BinaryExponentIndicator SignedInteger</i>
 *  </dl>
 *
 *  <dl>
 *  <dt><i>BinaryExponentIndicator:</i>
 *  <dd>{@code p}
 *  <dd>{@code P}
 *  </dl>
 *
 *  </blockquote>
 *
 *  where <i>Sign</i>, <i>FloatingPointLiteral</i>,
 *  <i>HexNumeral</i>, <i>HexDigits</i>, <i>SignedInteger</i> and
 *  <i>FloatTypeSuffix</i> are as defined in the lexical structure
 *  sections of
 *  <cite>The Java&trade; Language Specification</cite>,
 *  except that underscores are not accepted between digits.
 *  If {@code s} does not have the form of
 *  a <i>FloatValue</i>, then a {@code NumberFormatException}
 *  is thrown. Otherwise, {@code s} is regarded as
 *  representing an exact decimal value in the usual
 *  "computerized scientific notation" or as an exact
 *  hexadecimal value; this exact numerical value is then
 *  conceptually converted to an "infinitely precise"
 *  binary value that is then rounded to type {@code double}
 *  by the usual round-to-nearest rule of IEEE 754 floating-point
 *  arithmetic, which includes preserving the sign of a zero
 *  value.
 *
 *  Note that the round-to-nearest rule also implies overflow and
 *  underflow behaviour; if the exact value of {@code s} is large
 *  enough in magnitude (greater than or equal to ({@link
 *  #MAX_VALUE} + {@link Math#ulp(double) ulp(MAX_VALUE)}/2),
 *  rounding to {@code double} will result in an infinity and if the
 *  exact value of {@code s} is small enough in magnitude (less
 *  than or equal to {@link #MIN_VALUE}/2), rounding to float will
 *  result in a zero.
 *
 *  Finally, after rounding a {@code Double} object representing
 *  this {@code double} value is returned.
 *
 *  <p> To interpret localized string representations of a
 *  floating-point value, use subclasses of {@link
 *  java.text.NumberFormat}.
 *
 *  <p>Note that trailing format specifiers, specifiers that
 *  determine the type of a floating-point literal
 *  ({@code 1.0f} is a {@code float} value;
 *  {@code 1.0d} is a {@code double} value), do
 *  <em>not</em> influence the results of this method.  In other
 *  words, the numerical value of the input string is converted
 *  directly to the target floating-point type.  The two-step
 *  sequence of conversions, string to {@code float} followed
 *  by {@code float} to {@code double}, is <em>not</em>
 *  equivalent to converting a string directly to
 *  {@code double}. For example, the {@code fl   // 0[xX] HexDigits_opt . HexDigits BinaryExponent FloatTypeSuffix_opt
 *         "(0[xX]" + HexDigits + "?(\\.)" + HexDigits + ")" +
 *
 *         ")[pP][+-]?" + Digits + "))" +
 *        "[fFdD]?))" +
 *        "[\\x00-\\x20]*");// Optional trailing "whitespace"
 *
 *   if (Pattern.matches(fpRegex, myString))
 *       Double.valueOf(myString); // Will not throw NumberFormatException
 *   else {
 *       // Perform suitable alternative action
 *   }
 *  }</pre>
 *
 *  @param      s   the string to be parsed.
 *  @return     a {@code Double} object holding the value
 *              represented by the {@code String} argument.
 *  @throws     NumberFormatException  if the string does not contain a
 *              parsable number.
 * /
 *     public static Double valueOf(String s) throws NumberFormatException {
 *         return new Double(parseDouble(s));
 *     }
 *
 *     /**
 *  Returns a {@code Double} instance representing the specified
 *  {@code double} value.
 *  If a new {@code Double} instance is not required, this method
 *  should generally be used in preference to the constructor
 *  {@link #Double(double)}, as this method is likely to yield
 *  significantly better space and time performance by caching
 *  frequently requested values.
 *
 *  @param  d a double value.
 *  @return a {@code Double} instance representing {@code d}.
 *  @since  1.5
 * /
 *     public static Double valueOf(double d) {
 *         return new Double(d);
 *     }
 *
 *     /**
 *  Returns a new {@code double} initialized to the value
 *  represented by the specified {@code String}, as performed
 *  by the {@code valueOf} method of class
 *  {@code Double}.
 *
 *  @param  s   the string to be parsed.
 *  @return the {@code double} value represented by the string
 *          argument.
 *  @throws NullPointerException  if the string is null
 *  @throws NumberFormatException if the string does not contain
 *          a parsable {@code double}.
 *  @see    java.lang.Double#valueOf(String)
 *  @since 1.2
 */

	function parseDouble(string s) public returns(int64)
	{
			return 
	}

	/**
 * Returns {@code true} if the specified number is a
 * Not-a-Number (NaN) value, {@code false} otherwise.
 *
 * @param   v   the value to be tested.
 * @return  {@code true} if the value of the argument is NaN;
 *          {@code false} otherwise.
 */

	function isNaN(int64 v) public returns(bool)
	{
			return (v != v);
	}

	/**
 * Returns {@code true} if the specified number is infinitely
 * large in magnitude, {@code false} otherwise.
 *
 * @param   v   the value to be tested.
 * @return  {@code true} if the value of the argument is positive
 *          infinity or negative infinity; {@code false} otherwise.
 */

	function isInfinite(int64 v) public returns(bool)
	{
			return (v == POSITIVE_INFINITY) || (v == NEGATIVE_INFINITY);
	}

	/**
 * Returns {@code true} if the argument is a finite floating-point
 * value; returns {@code false} otherwise (for NaN and infinity
 * arguments).
 *
 * @param d the {@code double} value to be tested
 * @return {@code true} if the argument is a finite
 * floating-point value, {@code false} otherwise.
 * @since 1.8
 */

	function isFinite(int64 d) public returns(bool)
	{
			return ;
	}

	/**
 * The value of the Double.
 *
 * @serial
 */

	int64 private  immutable value;

	/**
 * Returns {@code true} if this {@code Double} value is
 * a Not-a-Number (NaN), {@code false} otherwise.
 *
 * @return  {@code true} if the value represented by this object is
 *          NaN; {@code false} otherwise.
 */

	function isNaN() public returns(bool)
	{
			return isNaN(value);
	}

	/**
 * Returns {@code true} if this {@code Double} value is
 * infinitely large in magnitude, {@code false} otherwise.
 *
 * @return  {@code true} if the value represented by this object is
 *          positive infinity or negative infinity;
 *          {@code false} otherwise.
 */

	function isInfinite() public returns(bool)
	{
			return isInfinite(value);
	}

	/**
 * Returns a string representation of this {@code Double} object.
 * The primitive {@code double} value represented by this
 * object is converted to a string exactly as if by the method
 * {@code toString} of one argument.
 *
 * @return  a {@code String} representation of this object.
 * @see java.lang.Double#toString(double)
 */

	function toString() public returns(String)
	{
			return toString(value);
	}

	/**
 * Returns the value of this {@code Double} as a {@code byte}
 * after a narrowing primitive conversion.
 *
 * @return  the {@code double} value represented by this object
 *          converted to type {@code byte}
 * @jls 5.1.3 Narrowing Primitive Conversions
 * @since JDK1.1
 */

	function byteValue() public returns(int8)
	{
			return int8(value);
	}

	/**
 * Returns the value of this {@code Double} as a {@code short}
 * after a narrowing primitive conversion.
 *
 * @return  the {@code double} value represented by this object
 *          converted to type {@code short}
 * @jls 5.1.3 Narrowing Primitive Conversions
 * @since JDK1.1
 */

	function shortValue() public returns(int16)
	{
			return int16(value);
	}

	/**
 * Returns the value of this {@code Double} as an {@code int}
 * after a narrowing primitive conversion.
 * @jls 5.1.3 Narrowing Primitive Conversions
 *
 * @return  the {@code double} value represented by this object
 *          converted to type {@code int}
 */

	function intValue() public returns(int32)
	{
			return int32(value);
	}

	/**
 * Returns the value of this {@code Double} as a {@code long}
 * after a narrowing primitive conversion.
 *
 * @return  the {@code double} value represented by this object
 *          converted to type {@code long}
 * @jls 5.1.3 Narrowing Primitive Conversions
 */

	function longValue() public returns(int64)
	{
			return int64(value);
	}

	/**
 * Returns the value of this {@code Double} as a {@code float}
 * after a narrowing primitive conversion.
 *
 * @return  the {@code double} value represented by this object
 *          converted to type {@code float}
 * @jls 5.1.3 Narrowing Primitive Conversions
 * @since JDK1.0
 */

	function floatValue() public returns(int32)
	{
			return int32(value);
	}

	/**
 * Returns the {@code double} value of this {@code Double} object.
 *
 * @return the {@code double} value represented by this object
 */

	function doubleValue() public returns(int64)
	{
			return value;
	}

	/**
 * Returns a hash code for this {@code Double} object. The
 * result is the exclusive OR of the two halves of the
 * {@code long} integer bit representation, exactly as
 * produced by the method {@link #doubleToLongBits(double)}, of
 * the primitive {@code double} value represented by this
 * {@code Double} object. That is, the hash code is the value
 * of the expression:
 *
 * <blockquote>
 *  {@code (int)(v^(v>>>32))}
 * </blockquote>
 *
 * where {@code v} is defined by:
 *
 * <blockquote>
 *  {@code long v = Double.doubleToLongBits(this.doubleValue());}
 * </blockquote>
 *
 * @return  a {@code hash code} value for this object.
 */

	function hashCode() public returns(int32)
	{
			return .hashCode(value);
	}

	/**
 * Returns a hash code for a {@code double} value; compatible with
 * {@code Double.hashCode()}.
 *
 * @param value the value to hash
 * @return a hash code value for a {@code double} value.
 * @since 1.8
 */

	function hashCode(int64 value) public returns(int32)
	{
			int64 bits = int64(doubleToLongBits(value));
			return int32((bits ^ (bits >>> 32)));
	}

	/**
 * Compares this object against the specified object.  The result
 * is {@code true} if and only if the argument is not
 * {@code null} and is a {@code Double} object that
 * represents a {@code double} that has the same value as the
 * {@code double} represented by this object. For this
 * purpose, two {@code double} values are considered to be
 * the same if and only if the method {@link
 * #doubleToLongBits(double)} returns the identical
 * {@code long} value when applied to each.
 *
 * <p>Note that in most cases, for two instances of class
 * {@code Double}, {@code d1} and {@code d2}, the
 * value of {@code d1.equals(d2)} is {@code true} if and
 * only if
 *
 * <blockquote>
 *  {@code d1.doubleValue() == d2.doubleValue()}
 * </blockquote>
 *
 * <p>also has the value {@code true}. However, there are two
 * exceptions:
 * <ul>
 * <li>If {@code d1} and {@code d2} both represent
 *     {@code Double.NaN}, then the {@code equals} method
 *     returns {@code true}, even though
 *     {@code Double.NaN==Double.NaN} has the value
 *     {@code false}.
 * <li>If {@code d1} represents {@code +0.0} while
 *     {@code d2} represents {@code -0.0}, or vice versa,
 *     the {@code equal} test has the value {@code false},
 *     even though {@code +0.0==-0.0} has the value {@code true}.
 * </ul>
 * This definition allows hash tables to operate properly.
 * @param   obj   the object to compare with.
 * @return  {@code true} if the objects are the same;
 *          {@code false} otherwise.
 * @see java.lang.Double#doubleToLongBits(double)
 */

	function equals(Object obj) public returns(bool)
	{
			return () && (doubleToLongBits((Double(obj)).value) == doubleToLongBits(value));
	}

	/**
 * Returns a representation of the specified floating-point value
 * according to the IEEE 754 floating-point "double
 * format" bit layout.
 *
 * <p>Bit 63 (the bit that is selected by the mask
 * {@code 0x8000000000000000L}) represents the sign of the
 * floating-point number. Bits
 * 62-52 (the bits that are selected by the mask
 * {@code 0x7ff0000000000000L}) represent the exponent. Bits 51-0
 * (the bits that are selected by the mask
 * {@code 0x000fffffffffffffL}) represent the significand
 * (sometimes called the mantissa) of the floating-point number.
 *
 * <p>If the argument is positive infinity, the result is
 * {@code 0x7ff0000000000000L}.
 *
 * <p>If the argument is negative infinity, the result is
 * {@code 0xfff0000000000000L}.
 *
 * <p>If the argument is NaN, the result is
 * {@code 0x7ff8000000000000L}.
 *
 * <p>In all cases, the result is a {@code long} integer that, when
 * given to the {@link #longBitsToDouble(long)} method, will produce a
 * floating-point value the same as the argument to
 * {@code doubleToLongBits} (except all NaN values are
 * collapsed to a single "canonical" NaN value).
 *
 * @param   value   a {@code double} precision floating-point number.
 * @return the bits that represent the floating-point number.
 */

	function doubleToLongBits(int64 value) public returns(int64)
	{
			int64 result = int64(doubleToRawLongBits(value));
			// exponent and nonzero significand.

			if(((result & DoubleConsts.EXP_BIT_MASK) == DoubleConsts.EXP_BIT_MASK) && );
			return result;
	}

	/**
 * Returns a representation of the specified floating-point value
 * according to the IEEE 754 floating-point "double
 * format" bit layout, preserving Not-a-Number (NaN) values.
 *
 * <p>Bit 63 (the bit that is selected by the mask
 * {@code 0x8000000000000000L}) represents the sign of the
 * floating-point number. Bits
 * 62-52 (the bits that are selected by the mask
 * {@code 0x7ff0000000000000L}) represent the exponent. Bits 51-0
 * (the bits that are selected by the mask
 * {@code 0x000fffffffffffffL}) represent the significand
 * (sometimes called the mantissa) of the floating-point number.
 *
 * <p>If the argument is positive infinity, the result is
 * {@code 0x7ff0000000000000L}.
 *
 * <p>If the argument is negative infinity, the result is
 * {@code 0xfff0000000000000L}.
 *
 * <p>If the argument is NaN, the result is the {@code long}
 * integer representing the actual NaN value.  Unlike the
 * {@code doubleToLongBits} method,
 * {@code doubleToRawLongBits} does not collapse all the bit
 * patterns encoding a NaN to a single "canonical" NaN
 * value.
 *
 * <p>In all cases, the result is a {@code long} integer that,
 * when given to the {@link #longBitsToDouble(long)} method, will
 * produce a floating-point value the same as the argument to
 * {@code doubleToRawLongBits}.
 *
 * @param   value   a {@code double} precision floating-point number.
 * @return the bits that represent the floating-point number.
 * @since 1.3
 */

	function doubleToRawLongBits(int64 value) virtual external returns(int64);

	/**
 * Returns the {@code double} value corresponding to a given
 * bit representation.
 * The argument is considered to be a representation of a
 * floating-point value according to the IEEE 754 floating-point
 * "double format" bit layout.
 *
 * <p>If the argument is {@code 0x7ff0000000000000L}, the result
 * is positive infinity.
 *
 * <p>If the argument is {@code 0xfff0000000000000L}, the result
 * is negative infinity.
 *
 * <p>If the argument is any value in the range
 * {@code 0x7ff0000000000001L} through
 * {@code 0x7fffffffffffffffL} or in the range
 * {@code 0xfff0000000000001L} through
 * {@code 0xffffffffffffffffL}, the result is a NaN.  No IEEE
 * 754 floating-point operation provided by Java can distinguish
 * between two NaN values of the same type with different bit
 * patterns.  Distinct values of NaN are only distinguishable by
 * use of the {@code Double.doubleToRawLongBits} method.
 *
 * <p>In all other cases, let <i>s</i>, <i>e</i>, and <i>m</i> be three
 * values that can be computed from the argument:
 *
 * <blockquote><pre>{@code
 * int s = ((bits >> 63) == 0) ? 1 : -1;
 * int e = (int)((bits >> 52) & 0x7ffL);
 * long m = (e == 0) ?
 *                 (bits & 0xfffffffffffffL) << 1 :
 *                 (bits & 0xfffffffffffffL) | 0x10000000000000L;
 * }</pre></blockquote>
 *
 * Then the floating-point result equals the value of the mathematical
 * expression <i>s</i>&middot;<i>m</i>&middot;2<sup><i>e</i>-1075</sup>.
 *
 * <p>Note that this method may not be able to return a
 * {@code double} NaN with exactly same bit pattern as the
 * {@code long} argument.  IEEE 754 distinguishes between two
 * kinds of NaNs, quiet NaNs and <i>signaling NaNs</i>.  The
 * differences between the two kinds of NaN are generally not
 * visible in Java.  Arithmetic operations on signaling NaNs turn
 * them into quiet NaNs with a different, but often similar, bit
 * pattern.  However, on some processors merely copying a
 * signaling NaN also performs that conversion.  In particular,
 * copying a signaling NaN to return it to the calling method
 * may perform this conversion.  So {@code longBitsToDouble}
 * may not be able to return a {@code double} with a
 * signaling NaN bit pattern.  Consequently, for some
 * {@code long} values,
 * {@code doubleToRawLongBits(longBitsToDouble(start))} may
 * <i>not</i> equal {@code start}.  Moreover, which
 * particular bit patterns represent signaling NaNs is platform
 * dependent; although all NaN bit patterns, quiet or signaling,
 * must be in the NaN range identified above.
 *
 * @param   bits   any {@code long} integer.
 * @return  the {@code double} floating-point value with the same
 *          bit pattern.
 */

	function longBitsToDouble(int64 bits) virtual external returns(int64);

	/**
 * Compares two {@code Double} objects numerically.  There
 * are two ways in which comparisons performed by this method
 * differ from those performed by the Java language numerical
 * comparison operators ({@code <, <=, ==, >=, >})
 * when applied to primitive {@code double} values:
 * <ul><li>
 *          {@code Double.NaN} is considered by this method
 *          to be equal to itself and greater than all other
 *          {@code double} values (including
 *          {@code Double.POSITIVE_INFINITY}).
 * <li>
 *          {@code 0.0d} is considered by this method to be greater
 *          than {@code -0.0d}.
 * </ul>
 * This ensures that the <i>natural ordering</i> of
 * {@code Double} objects imposed by this method is <i>consistent
 * with equals</i>.
 *
 * @param   anotherDouble   the {@code Double} to be compared.
 * @return  the value {@code 0} if {@code anotherDouble} is
 *          numerically equal to this {@code Double}; a value
 *          less than {@code 0} if this {@code Double}
 *          is numerically less than {@code anotherDouble};
 *          and a value greater than {@code 0} if this
 *          {@code Double} is numerically greater than
 *          {@code anotherDouble}.
 *
 * @since   1.2
 */

	function compareTo(Double anotherDouble) public returns(int32)
	{
			return .compare(value, anotherDouble.value);
	}

	/**
 * Compares the two specified {@code double} values. The sign
 * of the integer value returned is the same as that of the
 * integer that would be returned by the call:
 * <pre>
 *    new Double(d1).compareTo(new Double(d2))
 * </pre>
 *
 * @param   d1        the first {@code double} to compare
 * @param   d2        the second {@code double} to compare
 * @return  the value {@code 0} if {@code d1} is
 *          numerically equal to {@code d2}; a value less than
 *          {@code 0} if {@code d1} is numerically less than
 *          {@code d2}; and a value greater than {@code 0}
 *          if {@code d1} is numerically greater than
 *          {@code d2}.
 * @since 1.4
 */

	function compare(int64 d1, int64 d2) public returns(int32)
	{
			if(d1 < d2);
			if(d1 > d2);
			// Cannot use doubleToRawLongBits because of possibility of NaNs.

			int64 thisBits;
			int64 anotherBits;
			return (// Values are equal

thisBits == anotherBits ? (// (-0.0, 0.0) or (!NaN, NaN)

thisBits < anotherBits ? 1 : // (-0.0, 0.0) or (!NaN, NaN)

-1;) : 0)
	}

	/**
 * Adds two {@code double} values together as per the + operator.
 *
 * @param a the first operand
 * @param b the second operand
 * @return the sum of {@code a} and {@code b}
 * @jls 4.2.4 Floating-Point Operations
 * @see java.util.function.BinaryOperator
 * @since 1.8
 */

	function sum(int64 a, int64 b) public returns(int64)
	{
			return a + b;
	}

	/**
 * Returns the greater of two {@code double} values
 * as if by calling {@link Math#max(double, double) Math.max}.
 *
 * @param a the first operand
 * @param b the second operand
 * @return the greater of {@code a} and {@code b}
 * @see java.util.function.BinaryOperator
 * @since 1.8
 */

	function max(int64 a, int64 b) public returns(int64)
	{
			return 
	}

	/**
 * Returns the smaller of two {@code double} values
 * as if by calling {@link Math#min(double, double) Math.min}.
 *
 * @param a the first operand
 * @param b the second operand
 * @return the smaller of {@code a} and {@code b}.
 * @see java.util.function.BinaryOperator
 * @since 1.8
 */

	function min(int64 a, int64 b) public returns(int64)
	{
			return 
	}

	/**
 * use serialVersionUID from JDK 1.0.2 for interoperability
 */

	int64 static  immutable serialVersionUID

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
 * Constructs a newly allocated {@code Double} object that
 * represents the primitive {@code double} argument.
 *
 * @param   value   the value to be represented by the {@code Double}.
 */

	function constructor1(int64 value) public	overloadedConstructor( 1 )
	{
			 = value;
	}

	/**
 * Constructs a newly allocated {@code Double} object that
 * represents the floating-point value of type {@code double}
 * represented by the string. The string is converted to a
 * {@code double} value as if by the {@code valueOf} method.
 *
 * @param  s  a string to be converted to a {@code Double}.
 * @throws    NumberFormatException  if the string does not contain a
 *            parsable number.
 * @see       java.lang.Double#valueOf(java.lang.String)
 */

	function constructor2(string s) public	overloadedConstructor( 2 )
	{
			;
	}

}

library Double_Library
{
	/**
 * Returns a string representation of the {@code double}
 * argument. All characters mentioned below are ASCII characters.
 * <ul>
 * <li>If the argument is NaN, the result is the string
 *     "{@code NaN}".
 * <li>Otherwise, the result is a string that represents the sign and
 * magnitude (absolute value) of the argument. If the sign is negative,
 * the first character of the result is '{@code -}'
 * ({@code '\u005Cu002D'}); if the sign is positive, no sign character
 * appears in the result. As for the magnitude <i>m</i>:
 * <ul>
 * <li>If <i>m</i> is infinity, it is represented by the characters
 * {@code "Infinity"}; thus, positive infinity produces the result
 * {@code "Infinity"} and negative infinity produces the result
 * {@code "-Infinity"}.
 *
 * <li>If <i>m</i> is zero, it is represented by the characters
 * {@code "0.0"}; thus, negative zero produces the result
 * {@code "-0.0"} and positive zero produces the result
 * {@code "0.0"}.
 *
 * <li>If <i>m</i> is greater than or equal to 10<sup>-3</sup> but less
 * than 10<sup>7</sup>, then it is represented as the integer part of
 * <i>m</i>, in decimal form with no leading zeroes, followed by
 * '{@code .}' ({@code '\u005Cu002E'}), followed by one or
 * more decimal digits representing the fractional part of <i>m</i>.
 *
 * <li>If <i>m</i> is less than 10<sup>-3</sup> or greater than or
 * equal to 10<sup>7</sup>, then it is represented in so-called
 * "computerized scientific notation." Let <i>n</i> be the unique
 * integer such that 10<sup><i>n</i></sup> &le; <i>m</i> {@literal <}
 * 10<sup><i>n</i>+1</sup>; then let <i>a</i> be the
 * mathematically exact quotient of <i>m</i> and
 * 10<sup><i>n</i></sup> so that 1 &le; <i>a</i> {@literal <} 10. The
 * magnitude is then represented as the integer part of <i>a</i>,
 * as a single decimal digit, followed by '{@code .}'
 * ({@code '\u005Cu002E'}), followed by decimal digits
 * representing the fractional part of <i>a</i>, followed by the
 * letter '{@code E}' ({@code '\u005Cu0045'}), followed
 * by a representation of <i>n</i> as a decimal integer, as
 * produced by the method {@link Integer#toString(int)}.
 * </ul>
 * </ul>
 * How many digits must be printed for the fractional part of
 * <i>m</i> or <i>a</i>? There must be at least one digit to represent
 * the fractional part, and beyond that as many, but only as many, more
 * digits as are needed to uniquely distinguish the argument value from
 * adjacent values of type {@code double}. That is, suppose that
 * <i>x</i> is the exact mathematical value represented by the decimal
 * representation produced by this method for a finite nonzero argument
 * <i>d</i>. Then <i>d</i> must be the {@code double} value nearest
 * to <i>x</i>; or if two {@code double} values are equally close
 * to <i>x</i>, then <i>d</i> must be one of them and the least
 * significant bit of the significand of <i>d</i> must be {@code 0}.
 *
 * <p>To create localize                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     d string representations of a floating-point
 * value, use subclasses of {@link java.text.NumberFormat}.
 *
 * @param   d   the {@code double} to be converted.
 * @return a string representation of the argument.
 */

	function toString(int64 d) public returns(String)
	{
			return 
	}

	/**
 * Returns a hexadecimal string representation of the
 * {@code double} argument. All characters mentioned below
 * are ASCII characters.
 *
 * <ul>
 * <li>If the argument is NaN, the result is the string
 *     "{@code NaN}".
 * <li>Otherwise, the result is a string that represents the sign
 * and magnitude of the argument. If the sign is negative, the
 * first character of the result is '{@code -}'
 * ({@code '\u005Cu002D'}); if the sign is positive, no sign
 * character appears in the result. As for the magnitude <i>m</i>:
 *
 * <ul>
 * <li>If <i>m</i> is infinity, it is represented by the string
 * {@code "Infinity"}; thus, positive infinity produces the
 * result {@code "Infinity"} and negative infinity produces
 * the result {@code "-Infinity"}.
 *
 * <li>If <i>m</i> is zero, it is represented by the string
 * {@code "0x0.0p0"}; thus, negative zero produces the result
 * {@code "-0x0.0p0"} and positive zero produces the result
 * {@code "0x0.0p0"}.
 *
 * <li>If <i>m</i> is a {@code double} value with a
 * normalized representation, substrings are used to represent the
 * significand and exponent fields.  The significand is
 * represented by the characters {@code "0x1."}
 * followed by a lowercase hexadecimal representation of the rest
 * of the significand as a fraction.  Trailing zeros in the
 * hexadecimal representation are removed unless all the digits
 * are zero, in which case a single zero is used. Next, the
 * exponent is represented by {@code "p"} followed
 * by a decimal string of the unbiased exponent as if produced by
 * a call to {@link Integer#toString(int) Integer.toString} on the
 * exponent value.
 *
 * <li>If <i>m</i> is a {@code double} value with a subnormal
 * representation, the significand is represented by the
 * characters {@code "0x0."} followed by a
 * hexadecimal representation of the rest of the significand as a
 * fraction.  Trailing zeros in the hexadecimal representation are
 * removed. Next, the exponent is represented by
 * {@code "p-1022"}.  Note that there must be at
 * least one nonzero digit in a subnormal significand.
 *
 * </ul>
 *
 * </ul>
 *
 * <table border>
 * <caption>Examples</caption>
 * <tr><th>Floating-point Value</th><th>Hexadecimal String</th>
 * <tr><td>{@code 1.0}</td> <td>{@code 0x1.0p0}</td>
 * <tr><td>{@code -1.0}</td>        <td>{@code -0x1.0p0}</td>
 * <tr><td>{@code 2.0}</td> <td>{@code 0x1.0p1}</td>
 * <tr><td>{@code 3.0}</td> <td>{@code 0x1.8p1}</td>
 * <tr><td>{@code 0.5}</td> <td>{@code 0x1.0p-1}</td>
 * <tr><td>{@code 0.25}</td>        <td>{@code 0x1.0p-2}</td>
 * <tr><td>{@code Double.MAX_VALUE}</td>
 *     <td>{@code 0x1.fffffffffffffp1023}</td>
 * <tr><td>{@code Minimum Normal Value}</td>
 *     <td>{@code 0x1.0p-1022}</td>
 * <tr><td>{@code Maximum Subnormal Value}</td>
 *     <td>{@code 0x0.fffffffffffffp-1022}</td>
 * <tr><td>{@code Double.MIN_VALUE}</td>
 *     <td>{@code 0x0.0000000000001p-1022}</td>
 * </table>
 * @param   d   the {@code double} to be converted.
 * @return a hex string representation of the argument.
 * @since 1.5
 * @author Joseph D. Darcy
 */

	function toHexString(int64 d) public returns(String)
	{
			/*
         * Modeled after the "a" conversion specifier in C99, section
         * 7.19.6.1; however, the output of this method is more
         * tightly specified.
         */

			if(
	}

	/**
 *  Returns a {@code Double} object holding the
 *  {@code double} value represented by the argument string
 *  {@code s}.
 *
 *  <p>If {@code s} is {@code null}, then a
 *  {@code NullPointerException} is thrown.
 *
 *  <p>Leading and trailing whitespace characters in {@code s}
 *  are ignored.  Whitespace is removed as if by the {@link
 *  String#trim} method; that is, both ASCII space and control
 *  characters are removed. The rest of {@code s} should
 *  constitute a <i>FloatValue</i> as described by the lexical
 *  syntax rules:
 *
 *  <blockquote>
 *  <dl>
 *  <dt><i>FloatValue:</i>
 *  <dd><i>Sign<sub>opt</sub></i> {@code NaN}
 *  <dd><i>Sign<sub>opt</sub></i> {@code Infinity}
 *  <dd><i>Sign<sub>opt</sub> FloatingPointLiteral</i>
 *  <dd><i>Sign<sub>opt</sub> HexFloatingPointLiteral</i>
 *  <dd><i>SignedInteger</i>
 *  </dl>
 *
 *  <dl>
 *  <dt><i>HexFloatingPointLiteral</i>:
 *  <dd> <i>HexSignificand BinaryExponent FloatTypeSuffix<sub>opt</sub></i>
 *  </dl>
 *
 *  <dl>
 *  <dt><i>HexSignificand:</i>
 *  <dd><i>HexNumeral</i>
 *  <dd><i>HexNumeral</i> {@code .}
 *  <dd>{@code 0x} <i>HexDigits<sub>opt</sub>
 *      </i>{@code .}<i> HexDigits</i>
 *  <dd>{@code 0X}<i> HexDigits<sub>opt</sub>
 *      </i>{@code .} <i>HexDigits</i>
 *  </dl>
 *
 *  <dl>
 *  <dt><i>BinaryExponent:</i>
 *  <dd><i>BinaryExponentIndicator SignedInteger</i>
 *  </dl>
 *
 *  <dl>
 *  <dt><i>BinaryExponentIndicator:</i>
 *  <dd>{@code p}
 *  <dd>{@code P}
 *  </dl>
 *
 *  </blockquote>
 *
 *  where <i>Sign</i>, <i>FloatingPointLiteral</i>,
 *  <i>HexNumeral</i>, <i>HexDigits</i>, <i>SignedInteger</i> and
 *  <i>FloatTypeSuffix</i> are as defined in the lexical structure
 *  sections of
 *  <cite>The Java&trade; Language Specification</cite>,
 *  except that underscores are not accepted between digits.
 *  If {@code s} does not have the form of
 *  a <i>FloatValue</i>, then a {@code NumberFormatException}
 *  is thrown. Otherwise, {@code s} is regarded as
 *  representing an exact decimal value in the usual
 *  "computerized scientific notation" or as an exact
 *  hexadecimal value; this exact numerical value is then
 *  conceptually converted to an "infinitely precise"
 *  binary value that is then rounded to type {@code double}
 *  by the usual round-to-nearest rule of IEEE 754 floating-point
 *  arithmetic, which includes preserving the sign of a zero
 *  value.
 *
 *  Note that the round-to-nearest rule also implies overflow and
 *  underflow behaviour; if the exact value of {@code s} is large
 *  enough in magnitude (greater than or equal to ({@link
 *  #MAX_VALUE} + {@link Math#ulp(double) ulp(MAX_VALUE)}/2),
 *  rounding to {@code double} will result in an infinity and if the
 *  exact value of {@code s} is small enough in magnitude (less
 *  than or equal to {@link #MIN_VALUE}/2), rounding to float will
 *  result in a zero.
 *
 *  Finally, after rounding a {@code Double} object representing
 *  this {@code double} value is returned.
 *
 *  <p> To interpret localized string representations of a
 *  floating-point value, use subclasses of {@link
 *  java.text.NumberFormat}.
 *
 *  <p>Note that trailing format specifiers, specifiers that
 *  determine the type of a floating-point literal
 *  ({@code 1.0f} is a {@code float} value;
 *  {@code 1.0d} is a {@code double} value), do
 *  <em>not</em> influence the results of this method.  In other
 *  words, the numerical value of the input string is converted
 *  directly to the target floating-point type.  The two-step
 *  sequence of conversions, string to {@code float} followed
 *  by {@code float} to {@code double}, is <em>not</em>
 *  equivalent to converting a string directly to
 *  {@code double}. For example, the {@code fl   // 0[xX] HexDigits_opt . HexDigits BinaryExponent FloatTypeSuffix_opt
 *         "(0[xX]" + HexDigits + "?(\\.)" + HexDigits + ")" +
 *
 *         ")[pP][+-]?" + Digits + "))" +
 *        "[fFdD]?))" +
 *        "[\\x00-\\x20]*");// Optional trailing "whitespace"
 *
 *   if (Pattern.matches(fpRegex, myString))
 *       Double.valueOf(myString); // Will not throw NumberFormatException
 *   else {
 *       // Perform suitable alternative action
 *   }
 *  }</pre>
 *
 *  @param      s   the string to be parsed.
 *  @return     a {@code Double} object holding the value
 *              represented by the {@code String} argument.
 *  @throws     NumberFormatException  if the string does not contain a
 *              parsable number.
 * /
 *     public static Double valueOf(String s) throws NumberFormatException {
 *         return new Double(parseDouble(s));
 *     }
 *
 *     /**
 *  Returns a {@code Double} instance representing the specified
 *  {@code double} value.
 *  If a new {@code Double} instance is not required, this method
 *  should generally be used in preference to the constructor
 *  {@link #Double(double)}, as this method is likely to yield
 *  significantly better space and time performance by caching
 *  frequently requested values.
 *
 *  @param  d a double value.
 *  @return a {@code Double} instance representing {@code d}.
 *  @since  1.5
 * /
 *     public static Double valueOf(double d) {
 *         return new Double(d);
 *     }
 *
 *     /**
 *  Returns a new {@code double} initialized to the value
 *  represented by the specified {@code String}, as performed
 *  by the {@code valueOf} method of class
 *  {@code Double}.
 *
 *  @param  s   the string to be parsed.
 *  @return the {@code double} value represented by the string
 *          argument.
 *  @throws NullPointerException  if the string is null
 *  @throws NumberFormatException if the string does not contain
 *          a parsable {@code double}.
 *  @see    java.lang.Double#valueOf(String)
 *  @since 1.2
 */

	function parseDouble(string s) public returns(int64)
	{
			return 
	}

	/**
 * Returns {@code true} if the specified number is a
 * Not-a-Number (NaN) value, {@code false} otherwise.
 *
 * @param   v   the value to be tested.
 * @return  {@code true} if the value of the argument is NaN;
 *          {@code false} otherwise.
 */

	function isNaN(int64 v) public returns(bool)
	{
			return (v != v);
	}

	/**
 * Returns {@code true} if the specified number is infinitely
 * large in magnitude, {@code false} otherwise.
 *
 * @param   v   the value to be tested.
 * @return  {@code true} if the value of the argument is positive
 *          infinity or negative infinity; {@code false} otherwise.
 */

	function isInfinite(int64 v) public returns(bool)
	{
			return (v == POSITIVE_INFINITY) || (v == NEGATIVE_INFINITY);
	}

	/**
 * Returns {@code true} if the argument is a finite floating-point
 * value; returns {@code false} otherwise (for NaN and infinity
 * arguments).
 *
 * @param d the {@code double} value to be tested
 * @return {@code true} if the argument is a finite
 * floating-point value, {@code false} otherwise.
 * @since 1.8
 */

	function isFinite(int64 d) public returns(bool)
	{
			return ;
	}

	/**
 * Returns a hash code for a {@code double} value; compatible with
 * {@code Double.hashCode()}.
 *
 * @param value the value to hash
 * @return a hash code value for a {@code double} value.
 * @since 1.8
 */

	function hashCode(int64 value) public returns(int32)
	{
			int64 bits = int64(doubleToLongBits(value));
			return int32((bits ^ (bits >>> 32)));
	}

	/**
 * Returns a representation of the specified floating-point value
 * according to the IEEE 754 floating-point "double
 * format" bit layout.
 *
 * <p>Bit 63 (the bit that is selected by the mask
 * {@code 0x8000000000000000L}) represents the sign of the
 * floating-point number. Bits
 * 62-52 (the bits that are selected by the mask
 * {@code 0x7ff0000000000000L}) represent the exponent. Bits 51-0
 * (the bits that are selected by the mask
 * {@code 0x000fffffffffffffL}) represent the significand
 * (sometimes called the mantissa) of the floating-point number.
 *
 * <p>If the argument is positive infinity, the result is
 * {@code 0x7ff0000000000000L}.
 *
 * <p>If the argument is negative infinity, the result is
 * {@code 0xfff0000000000000L}.
 *
 * <p>If the argument is NaN, the result is
 * {@code 0x7ff8000000000000L}.
 *
 * <p>In all cases, the result is a {@code long} integer that, when
 * given to the {@link #longBitsToDouble(long)} method, will produce a
 * floating-point value the same as the argument to
 * {@code doubleToLongBits} (except all NaN values are
 * collapsed to a single "canonical" NaN value).
 *
 * @param   value   a {@code double} precision floating-point number.
 * @return the bits that represent the floating-point number.
 */

	function doubleToLongBits(int64 value) public returns(int64)
	{
			int64 result = int64(doubleToRawLongBits(value));
			// exponent and nonzero significand.

			if(((result & DoubleConsts.EXP_BIT_MASK) == DoubleConsts.EXP_BIT_MASK) && );
			return result;
	}

	/**
 * Returns a representation of the specified floating-point value
 * according to the IEEE 754 floating-point "double
 * format" bit layout, preserving Not-a-Number (NaN) values.
 *
 * <p>Bit 63 (the bit that is selected by the mask
 * {@code 0x8000000000000000L}) represents the sign of the
 * floating-point number. Bits
 * 62-52 (the bits that are selected by the mask
 * {@code 0x7ff0000000000000L}) represent the exponent. Bits 51-0
 * (the bits that are selected by the mask
 * {@code 0x000fffffffffffffL}) represent the significand
 * (sometimes called the mantissa) of the floating-point number.
 *
 * <p>If the argument is positive infinity, the result is
 * {@code 0x7ff0000000000000L}.
 *
 * <p>If the argument is negative infinity, the result is
 * {@code 0xfff0000000000000L}.
 *
 * <p>If the argument is NaN, the result is the {@code long}
 * integer representing the actual NaN value.  Unlike the
 * {@code doubleToLongBits} method,
 * {@code doubleToRawLongBits} does not collapse all the bit
 * patterns encoding a NaN to a single "canonical" NaN
 * value.
 *
 * <p>In all cases, the result is a {@code long} integer that,
 * when given to the {@link #longBitsToDouble(long)} method, will
 * produce a floating-point value the same as the argument to
 * {@code doubleToRawLongBits}.
 *
 * @param   value   a {@code double} precision floating-point number.
 * @return the bits that represent the floating-point number.
 * @since 1.3
 */

	function doubleToRawLongBits(int64 value) virtual external returns(int64);

	/**
 * Returns the {@code double} value corresponding to a given
 * bit representation.
 * The argument is considered to be a representation of a
 * floating-point value according to the IEEE 754 floating-point
 * "double format" bit layout.
 *
 * <p>If the argument is {@code 0x7ff0000000000000L}, the result
 * is positive infinity.
 *
 * <p>If the argument is {@code 0xfff0000000000000L}, the result
 * is negative infinity.
 *
 * <p>If the argument is any value in the range
 * {@code 0x7ff0000000000001L} through
 * {@code 0x7fffffffffffffffL} or in the range
 * {@code 0xfff0000000000001L} through
 * {@code 0xffffffffffffffffL}, the result is a NaN.  No IEEE
 * 754 floating-point operation provided by Java can distinguish
 * between two NaN values of the same type with different bit
 * patterns.  Distinct values of NaN are only distinguishable by
 * use of the {@code Double.doubleToRawLongBits} method.
 *
 * <p>In all other cases, let <i>s</i>, <i>e</i>, and <i>m</i> be three
 * values that can be computed from the argument:
 *
 * <blockquote><pre>{@code
 * int s = ((bits >> 63) == 0) ? 1 : -1;
 * int e = (int)((bits >> 52) & 0x7ffL);
 * long m = (e == 0) ?
 *                 (bits & 0xfffffffffffffL) << 1 :
 *                 (bits & 0xfffffffffffffL) | 0x10000000000000L;
 * }</pre></blockquote>
 *
 * Then the floating-point result equals the value of the mathematical
 * expression <i>s</i>&middot;<i>m</i>&middot;2<sup><i>e</i>-1075</sup>.
 *
 * <p>Note that this method may not be able to return a
 * {@code double} NaN with exactly same bit pattern as the
 * {@code long} argument.  IEEE 754 distinguishes between two
 * kinds of NaNs, quiet NaNs and <i>signaling NaNs</i>.  The
 * differences between the two kinds of NaN are generally not
 * visible in Java.  Arithmetic operations on signaling NaNs turn
 * them into quiet NaNs with a different, but often similar, bit
 * pattern.  However, on some processors merely copying a
 * signaling NaN also performs that conversion.  In particular,
 * copying a signaling NaN to return it to the calling method
 * may perform this conversion.  So {@code longBitsToDouble}
 * may not be able to return a {@code double} with a
 * signaling NaN bit pattern.  Consequently, for some
 * {@code long} values,
 * {@code doubleToRawLongBits(longBitsToDouble(start))} may
 * <i>not</i> equal {@code start}.  Moreover, which
 * particular bit patterns represent signaling NaNs is platform
 * dependent; although all NaN bit patterns, quiet or signaling,
 * must be in the NaN range identified above.
 *
 * @param   bits   any {@code long} integer.
 * @return  the {@code double} floating-point value with the same
 *          bit pattern.
 */

	function longBitsToDouble(int64 bits) virtual external returns(int64);

	/**
 * Compares the two specified {@code double} values. The sign
 * of the integer value returned is the same as that of the
 * integer that would be returned by the call:
 * <pre>
 *    new Double(d1).compareTo(new Double(d2))
 * </pre>
 *
 * @param   d1        the first {@code double} to compare
 * @param   d2        the second {@code double} to compare
 * @return  the value {@code 0} if {@code d1} is
 *          numerically equal to {@code d2}; a value less than
 *          {@code 0} if {@code d1} is numerically less than
 *          {@code d2}; and a value greater than {@code 0}
 *          if {@code d1} is numerically greater than
 *          {@code d2}.
 * @since 1.4
 */

	function compare(int64 d1, int64 d2) public returns(int32)
	{
			if(d1 < d2);
			if(d1 > d2);
			// Cannot use doubleToRawLongBits because of possibility of NaNs.

			int64 thisBits;
			int64 anotherBits;
			return (// Values are equal

thisBits == anotherBits ? (// (-0.0, 0.0) or (!NaN, NaN)

thisBits < anotherBits ? 1 : // (-0.0, 0.0) or (!NaN, NaN)

-1;) : 0)
	}

	/**
 * Adds two {@code double} values together as per the + operator.
 *
 * @param a the first operand
 * @param b the second operand
 * @return the sum of {@code a} and {@code b}
 * @jls 4.2.4 Floating-Point Operations
 * @see java.util.function.BinaryOperator
 * @since 1.8
 */

	function sum(int64 a, int64 b) public returns(int64)
	{
			return a + b;
	}

	/**
 * Returns the greater of two {@code double} values
 * as if by calling {@link Math#max(double, double) Math.max}.
 *
 * @param a the first operand
 * @param b the second operand
 * @return the greater of {@code a} and {@code b}
 * @see java.util.function.BinaryOperator
 * @since 1.8
 */

	function max(int64 a, int64 b) public returns(int64)
	{
			return 
	}

	/**
 * Returns the smaller of two {@code double} values
 * as if by calling {@link Math#min(double, double) Math.min}.
 *
 * @param a the first operand
 * @param b the second operand
 * @return the smaller of {@code a} and {@code b}.
 * @see java.util.function.BinaryOperator
 * @since 1.8
 */

	function min(int64 a, int64 b) public returns(int64)
	{
			return 
	}

}

