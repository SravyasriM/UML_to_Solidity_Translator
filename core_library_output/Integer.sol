pragma solidity 0.7.2;

//package java.lang


import "java/lang/annotation/Native.sol";

/**
 * The {@code Integer} class wraps a value of the primitive type
 * {@code int} in an object. An object of type {@code Integer}
 * contains a single field whose type is {@code int}.
 *
 * <p>In addition, this class provides several methods for converting
 * an {@code int} to a {@code String} and a {@code String} to an
 * {@code int}, as well as other constants and methods useful when
 * dealing with an {@code int}.
 *
 * <p>Implementation note: The implementations of the "bit twiddling"
 * methods (such as {@link #highestOneBit(int) highestOneBit} and
 * {@link #numberOfTrailingZeros(int) numberOfTrailingZeros}) are
 * based on material from Henry S. Warren, Jr.'s <i>Hacker's
 * Delight</i>, (Addison Wesley, 2002).
 *
 * @author  Lee Boynton
 * @author  Arthur van Hoff
 * @author  Josh Bloch
 * @author  Joseph D. Darcy
 * @since JDK1.0
 */

contract Integer
{
	/**
 * A constant holding the minimum value an {@code int} can
 * have, -2<sup>31</sup>.
 */

	int32 static  immutable MIN_VALUE = int32(0x80000000);

	/**
 * A constant holding the maximum value an {@code int} can
 * have, 2<sup>31</sup>-1.
 */

	int32 static  immutable MAX_VALUE = int32(0x7fffffff);

	/**
 * The {@code Class} instance representing the primitive type
 * {@code int}.
 *
 * @since   JDK1.1
 */

	Class static  immutable TYPE = Class(Class(.getPrimitiveClass("int")));

	/**
 * Returns a string representation of the first argument in the
 * radix specified by the second argument.
 *
 * <p>If the radix is smaller than {@code Character.MIN_RADIX}
 * or larger than {@code Character.MAX_RADIX}, then the radix
 * {@code 10} is used instead.
 *
 * <p>If the first argument is negative, the first element of the
 * result is the ASCII minus character {@code '-'}
 * ({@code '\u005Cu002D'}). If the first argument is not
 * negative, no sign character appears in the result.
 *
 * <p>The remaining characters of the result represent the magnitude
 * of the first argument. If the magnitude is zero, it is
 * represented by a single zero character {@code '0'}
 * ({@code '\u005Cu0030'}); otherwise, the first character of
 * the representation of the magnitude will not be the zero
 * character.  The following ASCII characters are used as digits:
 *
 * <blockquote>
 *   {@code 0123456789abcdefghijklmnopqrstuvwxyz}
 * </blockquote>
 *
 * These are {@code '\u005Cu0030'} through
 * {@code '\u005Cu0039'} and {@code '\u005Cu0061'} through
 * {@code '\u005Cu007A'}. If {@code radix} is
 * <var>N</var>, then the first <var>N</var> of these characters
 * are used as radix-<var>N</var> digits in the order shown. Thus,
 * the digits for hexadecimal (radix 16) are
 * {@code 0123456789abcdef}. If uppercase letters are
 * desired, the {@link java.lang.String#toUpperCase()} method may
 * be called on the result:
 *
 * <blockquote>
 *  {@code Integer.toString(n, 16).toUpperCase()}
 * </blockquote>
 *
 * @param   i       an integer to be converted to a string.
 * @param   radix   the radix to use in the string representation.
 * @return  a string representation of the argument in the specified radix.
 * @see     java.lang.Character#MAX_RADIX
 * @see     java.lang.Character#MIN_RADIX
 */

	function toString(int32 i, int32 radix) public returns(String)
	{
			if(radix < Character.MIN_RADIX || radix > Character.MAX_RADIX);
			/* Use the faster version */

			if(radix == 10)
			{
					return 
			}
			bool negative = bool((i < 0));
			int32 charPos = int32(32);
			if(!negative;)
			{
					i = -i;
			}
			while(i <= -radix;)
			{
					buf[uint256(charPos--;)] = digits[uint256(-(i % radix);)]
					i = i / radix;

			}
			buf[uint256(charPos)] = digits[uint256(-i;)]
			if(negative)
			{
					buf[uint256(--charPos;)] = "-"
			}
			return 
	}

	/**
 * Returns a string representation of the first argument as an
 * unsigned integer value in the radix specified by the second
 * argument.
 *
 * <p>If the radix is smaller than {@code Character.MIN_RADIX}
 * or larger than {@code Character.MAX_RADIX}, then the radix
 * {@code 10} is used instead.
 *
 * <p>Note that since the first argument is treated as an unsigned
 * value, no leading sign character is printed.
 *
 * <p>If the magnitude is zero, it is represented by a single zero
 * character {@code '0'} ({@code '\u005Cu0030'}); otherwise,
 * the first character of the representation of the magnitude will
 * not be the zero character.
 *
 * <p>The behavior of radixes and the characters used as digits
 * are the same as {@link #toString(int, int) toString}.
 *
 * @param   i       an integer to be converted to an unsigned string.
 * @param   radix   the radix to use in the string representation.
 * @return  an unsigned string representation of the argument in the specified radix.
 * @see     #toString(int, int)
 * @since 1.8
 */

	function toUnsignedString(int32 i, int32 radix) public returns(String)
	{
			return 
	}

	/**
 * Returns a string representation of the integer argument as an
 * unsigned integer in base&nbsp;16.
 *
 * <p>The unsigned integer value is the argument plus 2<sup>32</sup>
 * if the argument is negative; otherwise, it is equal to the
 * argument.  This value is converted to a string of ASCII digits
 * in hexadecimal (base&nbsp;16) with no extra leading
 * {@code 0}s.
 *
 * <p>The value of the argument can be recovered from the returned
 * string {@code s} by calling {@link
 * Integer#parseUnsignedInt(String, int)
 * Integer.parseUnsignedInt(s, 16)}.
 *
 * <p>If the unsigned magnitude is zero, it is represented by a
 * single zero character {@code '0'} ({@code '\u005Cu0030'});
 * otherwise, the first character of the representation of the
 * unsigned magnitude will not be the zero character. The
 * following characters are used as hexadecimal digits:
 *
 * <blockquote>
 *  {@code 0123456789abcdef}
 * </blockquote>
 *
 * These are the characters {@code '\u005Cu0030'} through
 * {@code '\u005Cu0039'} and {@code '\u005Cu0061'} through
 * {@code '\u005Cu0066'}. If uppercase letters are
 * desired, the {@link java.lang.String#toUpperCase()} method may
 * be called on the result:
 *
 * <blockquote>
 *  {@code Integer.toHexString(n).toUpperCase()}
 * </blockquote>
 *
 * @param   i   an integer to be converted to a string.
 * @return  the string representation of the unsigned integer value
 *          represented by the argument in hexadecimal (base&nbsp;16).
 * @see #parseUnsignedInt(String, int)
 * @see #toUnsignedString(int, int)
 * @since   JDK1.0.2
 */

	function toHexString(int32 i) public returns(String)
	{
			return 
	}

	/**
 * Returns a string representation of the integer argument as an
 * unsigned integer in base&nbsp;8.
 *
 * <p>The unsigned integer value is the argument plus 2<sup>32</sup>
 * if the argument is negative; otherwise, it is equal to the
 * argument.  This value is converted to a string of ASCII digits
 * in octal (base&nbsp;8) with no extra leading {@code 0}s.
 *
 * <p>The value of the argument can be recovered from the returned
 * string {@code s} by calling {@link
 * Integer#parseUnsignedInt(String, int)
 * Integer.parseUnsignedInt(s, 8)}.
 *
 * <p>If the unsigned magnitude is zero, it is represented by a
 * single zero character {@code '0'} ({@code '\u005Cu0030'});
 * otherwise, the first character of the representation of the
 * unsigned magnitude will not be the zero character. The
 * following characters are used as octal digits:
 *
 * <blockquote>
 * {@code 01234567}
 * </blockquote>
 *
 * These are the characters {@code '\u005Cu0030'} through
 * {@code '\u005Cu0037'}.
 *
 * @param   i   an integer to be converted to a string.
 * @return  the string representation of the unsigned integer value
 *          represented by the argument in octal (base&nbsp;8).
 * @see #parseUnsignedInt(String, int)
 * @see #toUnsignedString(int, int)
 * @since   JDK1.0.2
 */

	function toOctalString(int32 i) public returns(String)
	{
			return 
	}

	/**
 * Returns a string representation of the integer argument as an
 * unsigned integer in base&nbsp;2.
 *
 * <p>The unsigned integer value is the argument plus 2<sup>32</sup>
 * if the argument is negative; otherwise it is equal to the
 * argument.  This value is converted to a string of ASCII digits
 * in binary (base&nbsp;2) with no extra leading {@code 0}s.
 *
 * <p>The value of the argument can be recovered from the returned
 * string {@code s} by calling {@link
 * Integer#parseUnsignedInt(String, int)
 * Integer.parseUnsignedInt(s, 2)}.
 *
 * <p>If the unsigned magnitude is zero, it is represented by a
 * single zero character {@code '0'} ({@code '\u005Cu0030'});
 * otherwise, the first character of the representation of the
 * unsigned magnitude will not be the zero character. The
 * characters {@code '0'} ({@code '\u005Cu0030'}) and {@code
 * '1'} ({@code '\u005Cu0031'}) are used as binary digits.
 *
 * @param   i   an integer to be converted to a string.
 * @return  the string representation of the unsigned integer value
 *          represented by the argument in binary (base&nbsp;2).
 * @see #parseUnsignedInt(String, int)
 * @see #toUnsignedString(int, int)
 * @since   JDK1.0.2
 */

	function toBinaryString(int32 i) public returns(String)
	{
			return 
	}

	/**
 * Convert the integer to an unsigned number.
 */

	function toUnsignedString0(int32 val, int32 shift) private returns(String)
	{
			// assert shift > 0 && shift <=5 : "Illegal shift value";

			int32 mag = int32();
			int32 chars = int32(.max(((mag + (shift - 1)) / shift), 1));
			// Use special constructor which takes over "buf".

			return 
	}

	/**
 * Returns a {@code String} object representing the
 * specified integer. The argument is converted to signed decimal
 * representation and returned as a string, exactly as if the
 * argument and radix 10 were given as arguments to the {@link
 * #toString(int, int)} method.
 *
 * @param   i   an integer to be converted.
 * @return  a string representation of the argument in base&nbsp;10.
 */

	function toString(int32 i) public returns(String)
	{
			if(i == Integer.MIN_VALUE);
			int32 size;
			return 
	}

	/**
 * Returns a string representation of the argument as an unsigned
 * decimal value.
 *
 * The argument is converted to unsigned decimal representation
 * and returned as a string exactly as if the argument and radix
 * 10 were given as arguments to the {@link #toUnsignedString(int,
 * int)} method.
 *
 * @param   i  an integer to be converted to an unsigned string.
 * @return  an unsigned string representation of the argument.
 * @see     #toUnsignedString(int, int)
 * @since 1.8
 */

	function toUnsignedString(int32 i) public returns(String)
	{
			return 
	}

	// Requires positive x

	function stringSize(int32 x) internal returns(int32)
	{
			for(
	}

	/**
 * Parses the string argument as a signed integer in the radix
 * specified by the second argument. The characters in the string
 * must all be digits of the specified radix (as determined by
 * whether {@link java.lang.Character#digit(char, int)} returns a
 * nonnegative value), except that the first character may be an
 * ASCII minus sign {@code '-'} ({@code '\u005Cu002D'}) to
 * indicate a negative value or an ASCII plus sign {@code '+'}
 * ({@code '\u005Cu002B'}) to indicate a positive value. The
 * resulting integer value is returned.
 *
 * <p>An exception of type {@code NumberFormatException} is
 * thrown if any of the following situations occurs:
 * <ul>
 * <li>The first argument is {@code null} or is a string of
 * length zero.
 *
 * <li>The radix is either smaller than
 * {@link java.lang.Character#MIN_RADIX} or
 * larger than {@link java.lang.Character#MAX_RADIX}.
 *
 * <li>Any character of the string is not a digit of the specified
 * radix, except that the first character may be a minus sign
 * {@code '-'} ({@code '\u005Cu002D'}) or plus sign
 * {@code '+'} ({@code '\u005Cu002B'}) provided that the
 * string is longer than length 1.
 *
 * <li>The value represented by the string is not a value of type
 * {@code int}.
 * </ul>
 *
 * <p>Examples:
 * <blockquote><pre>
 * parseInt("0", 10) returns 0
 * parseInt("473", 10) returns 473
 * parseInt("+42", 10) returns 42
 * parseInt("-0", 10) returns 0
 * parseInt("-FF", 16) returns -255
 * parseInt("1100110", 2) returns 102
 * parseInt("2147483647", 10) returns 2147483647
 * parseInt("-2147483648", 10) returns -2147483648
 * parseInt("2147483648", 10) throws a NumberFormatException
 * parseInt("99", 8) throws a NumberFormatException
 * parseInt("Kona", 10) throws a NumberFormatException
 * parseInt("Kona", 27) returns 411787
 * </pre></blockquote>
 *
 * @param      s   the {@code String} containing the integer
 *                  representation to be parsed
 * @param      radix   the radix to be used while parsing {@code s}.
 * @return     the integer represented by the string argument in the
 *             specified radix.
 * @exception  NumberFormatException if the {@code String}
 *             does not contain a parsable {@code int}.
 */

	function parseInt(string s, int32 radix) public returns(int32)
	{
			if()
			{
			}
			if(radix < Character.MIN_RADIX)
			{
			}
			if(radix > Character.MAX_RADIX)
			{
			}
			int32 result = int32(0);
			bool negative = bool(false);
			int32 i = int32(0);
			int32 limit = int32(-Integer.MAX_VALUE);
			int32 multmin;
			int32 digit;
			if(len > 0)
			{
					byte firstChar = byte(.charAt(0));
					if(firstChar < "0")
					{
							// Possible leading "+" or "-"

							if(keccak256(abi.encode(firstChar)) == keccak256(abi.encode("-")))
							{
									negative = true;
									limit = Integer.MIN_VALUE;
							}
							else
							{
								if(firstChar != "+");							}

							if(// Cannot have lone "+" or "-"

len == 1);
							i++;
					}
					multmin = limit / radix;
					while(i < len)
					{
							// Accumulating negatively avoids surprises near MAX_VALUE

							;
							if(digit < 0)
							{
							}
							if(result < multmin)
							{
							}
							result *= radix;
							if(result < limit + digit)
							{
							}
							result -= digit;

					}
			}
			else
			{
			}

			return negative ? -result; : result
	}

	/**
 * Parses the string argument as a signed decimal integer. The
 * characters in the string must all be decimal digits, except
 * that the first character may be an ASCII minus sign {@code '-'}
 * ({@code '\u005Cu002D'}) to indicate a negative value or an
 * ASCII plus sign {@code '+'} ({@code '\u005Cu002B'}) to
 * indicate a positive value. The resulting integer value is
 * returned, exactly as if the argument and the radix 10 were
 * given as arguments to the {@link #parseInt(java.lang.String,
 * int)} method.
 *
 * @param s    a {@code String} containing the {@code int}
 *             representation to be parsed
 * @return     the integer value represented by the argument in decimal.
 * @exception  NumberFormatException  if the string does not contain a
 *               parsable integer.
 */

	function parseInt(string s) public returns(int32)
	{
			return 
	}

	/**
 * Parses the string argument as an unsigned integer in the radix
 * specified by the second argument.  An unsigned integer maps the
 * values usually associated with negative numbers to positive
 * numbers larger than {@code MAX_VALUE}.
 *
 * The characters in the string must all be digits of the
 * specified radix (as determined by whether {@link
 * java.lang.Character#digit(char, int)} returns a nonnegative
 * value), except that the first character may be an ASCII plus
 * sign {@code '+'} ({@code '\u005Cu002B'}). The resulting
 * integer value is returned.
 *
 * <p>An exception of type {@code NumberFormatException} is
 * thrown if any of the following situations occurs:
 * <ul>
 * <li>The first argument is {@code null} or is a string of
 * length zero.
 *
 * <li>The radix is either smaller than
 * {@link java.lang.Character#MIN_RADIX} or
 * larger than {@link java.lang.Character#MAX_RADIX}.
 *
 * <li>Any character of the string is not a digit of the specified
 * radix, except that the first character may be a plus sign
 * {@code '+'} ({@code '\u005Cu002B'}) provided that the
 * string is longer than length 1.
 *
 * <li>The value represented by the string is larger than the
 * largest unsigned {@code int}, 2<sup>32</sup>-1.
 *
 * </ul>
 *
 * @param      s   the {@code String} containing the unsigned integer
 *                  representation to be parsed
 * @param      radix   the radix to be used while parsing {@code s}.
 * @return     the integer represented by the string argument in the
 *             specified radix.
 * @throws     NumberFormatException if the {@code String}
 *             does not contain a parsable {@code int}.
 * @since 1.8
 */

	function parseUnsignedInt(string s, int32 radix) public returns(int32)
	{
			if()
			{
			}
			int32 len = int32(.length());
			if(len > 0)
			{
					byte firstChar = byte(.charAt(0));
					if(keccak256(abi.encode(firstChar)) == keccak256(abi.encode("-")))
					{
					}
					else
					{
							if(// Integer.MAX_VALUE in Character.MAX_RADIX is 6 digits

len <= 5 || (radix == 10 && len <= 9))
							{
									// Integer.MAX_VALUE in base 10 is 10 digits

									return 
							}
							else
							{
									int64 ell;
									if(() == 0)
									{
											return int32(ell);
									}
									else
									{
									}

							}

					}

			}
			else
			{
			}

	}

	/**
 * Parses the string argument as an unsigned decimal integer. The
 * characters in the string must all be decimal digits, except
 * that the first character may be an an ASCII plus sign {@code
 * '+'} ({@code '\u005Cu002B'}). The resulting integer value
 * is returned, exactly as if the argument and the radix 10 were
 * given as arguments to the {@link
 * #parseUnsignedInt(java.lang.String, int)} method.
 *
 * @param s   a {@code String} containing the unsigned {@code int}
 *            representation to be parsed
 * @return    the unsigned integer value represented by the argument in decimal.
 * @throws    NumberFormatException  if the string does not contain a
 *            parsable unsigned integer.
 * @since 1.8
 */

	function parseUnsignedInt(string s) public returns(int32)
	{
			return 
	}

	/**
 * Returns an {@code Integer} object holding the value
 * extracted from the specified {@code String} when parsed
 * with the radix given by the second argument. The first argument
 * is interpreted as representing a signed integer in the radix
 * specified by the second argument, exactly as if the arguments
 * were given to the {@link #parseInt(java.lang.String, int)}
 * method. The result is an {@code Integer} object that
 * represents the integer value specified by the string.
 *
 * <p>In other words, this method returns an {@code Integer}
 * object equal to the value of:
 *
 * <blockquote>
 *  {@code new Integer(Integer.parseInt(s, radix))}
 * </blockquote>
 *
 * @param      s   the string to be parsed.
 * @param      radix the radix to be used in interpreting {@code s}
 * @return     an {@code Integer} object holding the value
 *             represented by the string argument in the specified
 *             radix.
 * @exception NumberFormatException if the {@code String}
 *            does not contain a parsable {@code int}.
 */

	function valueOf(string s, int32 radix) public returns(Integer)
	{
			return 
	}

	/**
 * Returns an {@code Integer} object holding the
 * value of the specified {@code String}. The argument is
 * interpreted as representing a signed decimal integer, exactly
 * as if the argument were given to the {@link
 * #parseInt(java.lang.String)} method. The result is an
 * {@code Integer} object that represents the integer value
 * specified by the string.
 *
 * <p>In other words, this method returns an {@code Integer}
 * object equal to the value of:
 *
 * <blockquote>
 *  {@code new Integer(Integer.parseInt(s))}
 * </blockquote>
 *
 * @param      s   the string to be parsed.
 * @return     an {@code Integer} object holding the value
 *             represented by the string argument.
 * @exception  NumberFormatException  if the string cannot be parsed
 *             as an integer.
 */

	function valueOf(string s) public returns(Integer)
	{
			return 
	}

	/**
 * Returns an {@code Integer} instance representing the specified
 * {@code int} value.  If a new {@code Integer} instance is not
 * required, this method should generally be used in preference to
 * the constructor {@link #Integer(int)}, as this method is likely
 * to yield significantly better space and time performance by
 * caching frequently requested values.
 *
 * This method will always cache values in the range -128 to 127,
 * inclusive, and may cache other values outside of this range.
 *
 * @param  i an {@code int} value.
 * @return an {@code Integer} instance representing {@code i}.
 * @since  1.5
 */

	function valueOf(int32 i) public returns(Integer)
	{
			if(i >= IntegerCache.low && i <= IntegerCache.high);
			return 
	}

	/**
 * The value of the {@code Integer}.
 *
 * @serial
 */

	int32 private  immutable value;

	/**
 * Returns the value of this {@code Integer} as a {@code byte}
 * after a narrowing primitive conversion.
 * @jls 5.1.3 Narrowing Primitive Conversions
 */

	function byteValue() public returns(int8)
	{
			return int8(value);
	}

	/**
 * Returns the value of this {@code Integer} as a {@code short}
 * after a narrowing primitive conversion.
 * @jls 5.1.3 Narrowing Primitive Conversions
 */

	function shortValue() public returns(int16)
	{
			return int16(value);
	}

	/**
 * Returns the value of this {@code Integer} as an
 * {@code int}.
 */

	function intValue() public returns(int32)
	{
			return value;
	}

	/**
 * Returns the value of this {@code Integer} as a {@code long}
 * after a widening primitive conversion.
 * @jls 5.1.2 Widening Primitive Conversions
 * @see Integer#toUnsignedLong(int)
 */

	function longValue() public returns(int64)
	{
			return int64(value);
	}

	/**
 * Returns the value of this {@code Integer} as a {@code float}
 * after a widening primitive conversion.
 * @jls 5.1.2 Widening Primitive Conversions
 */

	function floatValue() public returns(int32)
	{
			return int32(value);
	}

	/**
 * Returns the value of this {@code Integer} as a {@code double}
 * after a widening primitive conversion.
 * @jls 5.1.2 Widening Primitive Conversions
 */

	function doubleValue() public returns(int64)
	{
			return int64(value);
	}

	/**
 * Returns a {@code String} object representing this
 * {@code Integer}'s value. The value is converted to signed
 * decimal representation and returned as a string, exactly as if
 * the integer value were given as an argument to the {@link
 * java.lang.Integer#toString(int)} method.
 *
 * @return  a string representation of the value of this object in
 *          base&nbsp;10.
 */

	function toString() public returns(String)
	{
			return toString(value);
	}

	/**
 * Returns a hash code for this {@code Integer}.
 *
 * @return  a hash code value for this object, equal to the
 *          primitive {@code int} value represented by this
 *          {@code Integer} object.
 */

	function hashCode() public returns(int32)
	{
			return .hashCode(value);
	}

	/**
 * Returns a hash code for a {@code int} value; compatible with
 * {@code Integer.hashCode()}.
 *
 * @param value the value to hash
 * @since 1.8
 *
 * @return a hash code value for a {@code int} value.
 */

	function hashCode(int32 value) public returns(int32)
	{
			return value;
	}

	/**
 * Compares this object to the specified object.  The result is
 * {@code true} if and only if the argument is not
 * {@code null} and is an {@code Integer} object that
 * contains the same {@code int} value as this object.
 *
 * @param   obj   the object to compare with.
 * @return  {@code true} if the objects are the same;
 *          {@code false} otherwise.
 */

	function equals(Object obj) public returns(bool)
	{
			return false;
	}

	/**
 * Determines the integer value of the system property with the
 * specified name.
 *
 * <p>The first argument is treated as the name of a system
 * property.  System properties are accessible through the {@link
 * java.lang.System#getProperty(java.lang.String)} method. The
 * string value of this property is then interpreted as an integer
 * value using the grammar supported by {@link Integer#decode decode} and
 * an {@code Integer} object representing this value is returned.
 *
 * <p>If there is no property with the specified name, if the
 * specified name is empty or {@code null}, or if the property
 * does not have the correct numeric format, then {@code null} is
 * returned.
 *
 * <p>In other words, this method returns an {@code Integer}
 * object equal to the value of:
 *
 * <blockquote>
 *  {@code getInteger(nm, null)}
 * </blockquote>
 *
 * @param   nm   property name.
 * @return  the {@code Integer} value of the property.
 * @throws  SecurityException for the same reasons as
 *          {@link System#getProperty(String) System.getProperty}
 * @see     java.lang.System#getProperty(java.lang.String)
 * @see     java.lang.System#getProperty(java.lang.String, java.lang.String)
 */

	function getInteger(string nm) public returns(Integer)
	{
			return 
	}

	/**
 * Determines the integer value of the system property with the
 * specified name.
 *
 * <p>The first argument is treated as the name of a system
 * property.  System properties are accessible through the {@link
 * java.lang.System#getProperty(java.lang.String)} method. The
 * string value of this property is then interpreted as an integer
 * value using the grammar supported by {@link Integer#decode decode} and
 * an {@code Integer} object representing this value is returned.
 *
 * <p>The second argument is the default value. An {@code Integer} object
 * that represents the value of the second argument is returned if there
 * is no property of the specified name, if the property does not have
 * the correct numeric format, or if the specified name is empty or
 * {@code null}.
 *
 * <p>In other words, this method returns an {@code Integer} object
 * equal to the value of:
 *
 * <blockquote>
 *  {@code getInteger(nm, new Integer(val))}
 * </blockquote>
 *
 * but in practice it may be implemented in a manner such as:
 *
 * <blockquote><pre>
 * Integer result = getInteger(nm, null);
 * return (result == null) ? new Integer(val) : result;
 * </pre></blockquote>
 *
 * to avoid the unnecessary allocation of an {@code Integer}
 * object when the default value is not needed.
 *
 * @param   nm   property name.
 * @param   val   default value.
 * @return  the {@code Integer} value of the property.
 * @throws  SecurityException for the same reasons as
 *          {@link System#getProperty(String) System.getProperty}
 * @see     java.lang.System#getProperty(java.lang.String)
 * @see     java.lang.System#getProperty(java.lang.String, java.lang.String)
 */

	function getInteger(string nm, int32 val) public returns(Integer)
	{
			Integer result;
			return 
	}

	/**
 * Returns the integer value of the system property with the
 * specified name.  The first argument is treated as the name of a
 * system property.  System properties are accessible through the
 * {@link java.lang.System#getProperty(java.lang.String)} method.
 * The string value of this property is then interpreted as an
 * integer value, as per the {@link Integer#decode decode} method,
 * and an {@code Integer} object representing this value is
 * returned; in summary:
 *
 * <ul><li>If the property value begins with the two ASCII characters
 *         {@code 0x} or the ASCII character {@code #}, not
 *      followed by a minus sign, then the rest of it is parsed as a
 *      hexadecimal integer exactly as by the method
 *      {@link #valueOf(java.lang.String, int)} with radix 16.
 * <li>If the property value begins with the ASCII character
 *     {@code 0} followed by another character, it is parsed as an
 *     octal integer exactly as by the method
 *     {@link #valueOf(java.lang.String, int)} with radix 8.
 * <li>Otherwise, the property value is parsed as a decimal integer
 * exactly as by the method {@link #valueOf(java.lang.String, int)}
 * with radix 10.
 * </ul>
 *
 * <p>The second argument is the default value. The default value is
 * returned if there is no property of the specified name, if the
 * property does not have the correct numeric format, or if the
 * specified name is empty or {@code null}.
 *
 * @param   nm   property name.
 * @param   val   default value.
 * @return  the {@code Integer} value of the property.
 * @throws  SecurityException for the same reasons as
 *          {@link System#getProperty(String) System.getProperty}
 * @see     System#getProperty(java.lang.String)
 * @see     System#getProperty(java.lang.String, java.lang.String)
 */

	function getInteger(string nm, Integer val) public returns(Integer)
	{
			string memory v;
				//try

					;

				/* catch (IllegalArgumentException | NullPointerException e) {
}*/


			if()
			{
						//try

							return .decode(v);

						/* catch (NumberFormatException e) {
}*/


			}
			return val;
	}

	/**
 * Decodes a {@code String} into an {@code Integer}.
 * Accepts decimal, hexadecimal, and octal numbers given
 * by the following grammar:
 *
 * <blockquote>
 * <dl>
 * <dt><i>DecodableString:</i>
 * <dd><i>Sign<sub>opt</sub> DecimalNumeral</i>
 * <dd><i>Sign<sub>opt</sub></i> {@code 0x} <i>HexDigits</i>
 * <dd><i>Sign<sub>opt</sub></i> {@code 0X} <i>HexDigits</i>
 * <dd><i>Sign<sub>opt</sub></i> {@code #} <i>HexDigits</i>
 * <dd><i>Sign<sub>opt</sub></i> {@code 0} <i>OctalDigits</i>
 *
 * <dt><i>Sign:</i>
 * <dd>{@code -}
 * <dd>{@code +}
 * </dl>
 * </blockquote>
 *
 * <i>DecimalNumeral</i>, <i>HexDigits</i>, and <i>OctalDigits</i>
 * are as defined in section 3.10.1 of
 * <cite>The Java&trade; Language Specification</cite>,
 * except that underscores are not accepted between digits.
 *
 * <p>The sequence of characters following an optional
 * sign and/or radix specifier ("{@code 0x}", "{@code 0X}",
 * "{@code #}", or leading zero) is parsed as by the {@code
 * Integer.parseInt} method with the indicated radix (10, 16, or
 * 8).  This sequence of characters must represent a positive
 * value or a {@link NumberFormatException} will be thrown.  The
 * result is negated if first character of the specified {@code
 * String} is the minus sign.  No whitespace characters are
 * permitted in the {@code String}.
 *
 * @param     nm the {@code String} to decode.
 * @return    an {@code Integer} object holding the {@code int}
 *             value represented by {@code nm}
 * @exception NumberFormatException  if the {@code String} does not
 *            contain a parsable integer.
 * @see java.lang.Integer#parseInt(java.lang.String, int)
 */

	function decode(string nm) public returns(Integer)
	{
			int32 radix = int32(10);
			int32 index = int32(0);
			bool negative = bool(false);
			Integer result;
			if(.length() == 0);
			byte firstChar = byte(.charAt(0));
			// Handle sign, if present

			if(keccak256(abi.encode(firstChar)) == keccak256(abi.encode("-")))
			{
					negative = true;
					index++;
			}
			else
			{
				if(keccak256(abi.encode(firstChar)) == keccak256(abi.encode("+")));			}

			// Handle radix specifier, if present

			if(.startsWith("0x", index) || .startsWith("0X", index))
			{
					index += 2;
					radix = 16;
			}
			else
			{
				if(.startsWith("#", index))
				{
						index++;
						radix = 16;
				}
				else
				{
					if(.startsWith("0", index) && .length() > 1 + index)
					{
							index++;
							radix = 8;
					}				}
			}

			if(.startsWith("-", index) || .startsWith("+", index));
				//try

					result = IntegerCache_Library.valueOf(.substring(index), radix);
					result = negative ? result : .valueOf(-.intValue();)

				/* catch (NumberFormatException e) {
    // If number is Integer.MIN_VALUE, we'll end up here. The next line
    // handles this case, and causes any genuine format error to be
    // rethrown.
    String constant = negative ? ("-" + nm.substring(index)) : nm.substring(index);
    result = Integer.valueOf(constant, radix);
}*/


			return result;
	}

	/**
 * Compares two {@code Integer} objects numerically.
 *
 * @param   anotherInteger   the {@code Integer} to be compared.
 * @return  the value {@code 0} if this {@code Integer} is
 *          equal to the argument {@code Integer}; a value less than
 *          {@code 0} if this {@code Integer} is numerically less
 *          than the argument {@code Integer}; and a value greater
 *          than {@code 0} if this {@code Integer} is numerically
 *           greater than the argument {@code Integer} (signed
 *           comparison).
 * @since   1.2
 */

	function compareTo(Integer anotherInteger) public returns(int32)
	{
			return compare(, anotherInteger.value);
	}

	/**
 * Compares two {@code int} values numerically.
 * The value returned is identical to what would be returned by:
 * <pre>
 *    Integer.valueOf(x).compareTo(Integer.valueOf(y))
 * </pre>
 *
 * @param  x the first {@code int} to compare
 * @param  y the second {@code int} to compare
 * @return the value {@code 0} if {@code x == y};
 *         a value less than {@code 0} if {@code x < y}; and
 *         a value greater than {@code 0} if {@code x > y}
 * @since 1.7
 */

	function compare(int32 x, int32 y) public returns(int32)
	{
			return (x < y) ? ((x == y) ? 1 : 0) : -1;
	}

	/**
 * Compares two {@code int} values numerically treating the values
 * as unsigned.
 *
 * @param  x the first {@code int} to compare
 * @param  y the second {@code int} to compare
 * @return the value {@code 0} if {@code x == y}; a value less
 *         than {@code 0} if {@code x < y} as unsigned values; and
 *         a value greater than {@code 0} if {@code x > y} as
 *         unsigned values
 * @since 1.8
 */

	function compareUnsigned(int32 x, int32 y) public returns(int32)
	{
			return 
	}

	/**
 * Converts the argument to a {@code long} by an unsigned
 * conversion.  In an unsigned conversion to a {@code long}, the
 * high-order 32 bits of the {@code long} are zero and the
 * low-order 32 bits are equal to the bits of the integer
 * argument.
 *
 * Consequently, zero and positive {@code int} values are mapped
 * to a numerically equal {@code long} value and negative {@code
 * int} values are mapped to a {@code long} value equal to the
 * input plus 2<sup>32</sup>.
 *
 * @param  x the value to convert to an unsigned {@code long}
 * @return the argument converted to {@code long} by an unsigned
 *         conversion
 * @since 1.8
 */

	function toUnsignedLong(int32 x) public returns(int64)
	{
			return ;
	}

	/**
 * Returns the unsigned quotient of dividing the first argument by
 * the second where each argument and the result is interpreted as
 * an unsigned value.
 *
 * <p>Note that in two's complement arithmetic, the three other
 * basic arithmetic operations of add, subtract, and multiply are
 * bit-wise identical if the two operands are regarded as both
 * being signed or both being unsigned.  Therefore separate {@code
 * addUnsigned}, etc. methods are not provided.
 *
 * @param dividend the value to be divided
 * @param divisor the value doing the dividing
 * @return the unsigned quotient of the first argument divided by
 * the second argument
 * @see #remainderUnsigned
 * @since 1.8
 */

	function divideUnsigned(int32 dividend, int32 divisor) public returns(int32)
	{
			// In lieu of tricky code, for now just use long arithmetic.

			return int32(());
	}

	/**
 * Returns the unsigned remainder from dividing the first argument
 * by the second where each argument and the result is interpreted
 * as an unsigned value.
 *
 * @param dividend the value to be divided
 * @param divisor the value doing the dividing
 * @return the unsigned remainder of the first argument divided by
 * the second argument
 * @see #divideUnsigned
 * @since 1.8
 */

	function remainderUnsigned(int32 dividend, int32 divisor) public returns(int32)
	{
			// In lieu of tricky code, for now just use long arithmetic.

			return int32(());
	}

	/**
 * The number of bits used to represent an {@code int} value in two's
 * complement binary form.
 *
 * @since 1.5
 */

	int32 static  immutable SIZE = int32(32);

	/**
 * The number of bytes used to represent a {@code int} value in two's
 * complement binary form.
 *
 * @since 1.8
 */

	int32 static  immutable BYTES = int32(SIZE / Byte.SIZE);

	/**
 * Returns an {@code int} value with at most a single one-bit, in the
 * position of the highest-order ("leftmost") one-bit in the specified
 * {@code int} value.  Returns zero if the specified value has no
 * one-bits in its two's complement binary representation, that is, if it
 * is equal to zero.
 *
 * @param i the value whose highest one bit is to be computed
 * @return an {@code int} value with a single one-bit, in the position
 *     of the highest-order one-bit in the specified value, or zero if
 *     the specified value is itself equal to zero.
 * @since 1.5
 */

	function highestOneBit(int32 i) public returns(int32)
	{
			// HD, Figure 3-1

			i |= (i >> 1);
			i |= (i >> 2);
			i |= (i >> 4);
			i |= (i >> 8);
			i |= (i >> 16);
			return i - (i >>> 1);
	}

	/**
 * Returns an {@code int} value with at most a single one-bit, in the
 * position of the lowest-order ("rightmost") one-bit in the specified
 * {@code int} value.  Returns zero if the specified value has no
 * one-bits in its two's complement binary representation, that is, if it
 * is equal to zero.
 *
 * @param i the value whose lowest one bit is to be computed
 * @return an {@code int} value with a single one-bit, in the position
 *     of the lowest-order one-bit in the specified value, or zero if
 *     the specified value is itself equal to zero.
 * @since 1.5
 */

	function lowestOneBit(int32 i) public returns(int32)
	{
			// HD, Section 2-1

			return i & -i;
	}

	/**
 * Returns the number of zero bits preceding the highest-order
 * ("leftmost") one-bit in the two's complement binary representation
 * of the specified {@code int} value.  Returns 32 if the
 * specified value has no one-bits in its two's complement representation,
 * in other words if it is equal to zero.
 *
 * <p>Note that this method is closely related to the logarithm base 2.
 * For all positive {@code int} values x:
 * <ul>
 * <li>floor(log<sub>2</sub>(x)) = {@code 31 - numberOfLeadingZeros(x)}
 * <li>ceil(log<sub>2</sub>(x)) = {@code 32 - numberOfLeadingZeros(x - 1)}
 * </ul>
 *
 * @param i the value whose number of leading zeros is to be computed
 * @return the number of zero bits preceding the highest-order
 *     ("leftmost") one-bit in the two's complement binary representation
 *     of the specified {@code int} value, or 32 if the value
 *     is equal to zero.
 * @since 1.5
 */

	function numberOfLeadingZeros(int32 i) public returns(int32)
	{
			// HD, Figure 5-6

			if(i == 0);
			int32 n = int32(1);
			if(i >>> 16 == 0)
			{
					n += 16;
					i <<= 16;
			}
			if(i >>> 24 == 0)
			{
					n += 8;
					i <<= 8;
			}
			if(i >>> 28 == 0)
			{
					n += 4;
					i <<= 4;
			}
			if(i >>> 30 == 0)
			{
					n += 2;
					i <<= 2;
			}
			n -= i >>> 31;
			return n;
	}

	/**
 * Returns the number of zero bits following the lowest-order ("rightmost")
 * one-bit in the two's complement binary representation of the specified
 * {@code int} value.  Returns 32 if the specified value has no
 * one-bits in its two's complement representation, in other words if it is
 * equal to zero.
 *
 * @param i the value whose number of trailing zeros is to be computed
 * @return the number of zero bits following the lowest-order ("rightmost")
 *     one-bit in the two's complement binary representation of the
 *     specified {@code int} value, or 32 if the value is equal
 *     to zero.
 * @since 1.5
 */

	function numberOfTrailingZeros(int32 i) public returns(int32)
	{
			// HD, Figure 5-14

			int32 y;
			if(i == 0);
			int32 n = int32(31);
			y = i << 16;
			if(y != 0)
			{
					n = n - 16;
					i = y;
			}
			y = i << 8;
			if(y != 0)
			{
					n = n - 8;
					i = y;
			}
			y = i << 4;
			if(y != 0)
			{
					n = n - 4;
					i = y;
			}
			y = i << 2;
			if(y != 0)
			{
					n = n - 2;
					i = y;
			}
			return n - ((i << 1) >>> 31);
	}

	/**
 * Returns the number of one-bits in the two's complement binary
 * representation of the specified {@code int} value.  This function is
 * sometimes referred to as the <i>population count</i>.
 *
 * @param i the value whose bits are to be counted
 * @return the number of one-bits in the two's complement binary
 *     representation of the specified {@code int} value.
 * @since 1.5
 */

	function bitCount(int32 i) public returns(int32)
	{
			// HD, Figure 5-2

			i = i - ((i >>> 1) & 0x55555555);
			i = (i & 0x33333333) + ((i >>> 2) & 0x33333333);
			i = (i + (i >>> 4)) & 0x0f0f0f0f;
			i = i + (i >>> 8);
			i = i + (i >>> 16);
			return i & 0x3f;
	}

	/**
 * Returns the value obtained by rotating the two's complement binary
 * representation of the specified {@code int} value left by the
 * specified number of bits.  (Bits shifted out of the left hand, or
 * high-order, side reenter on the right, or low-order.)
 *
 * <p>Note that left rotation with a negative distance is equivalent to
 * right rotation: {@code rotateLeft(val, -distance) == rotateRight(val,
 * distance)}.  Note also that rotation by any multiple of 32 is a
 * no-op, so all but the last five bits of the rotation distance can be
 * ignored, even if the distance is negative: {@code rotateLeft(val,
 * distance) == rotateLeft(val, distance & 0x1F)}.
 *
 * @param i the value whose bits are to be rotated left
 * @param distance the number of bit positions to rotate left
 * @return the value obtained by rotating the two's complement binary
 *     representation of the specified {@code int} value left by the
 *     specified number of bits.
 * @since 1.5
 */

	function rotateLeft(int32 i, int32 distance) public returns(int32)
	{
			return (i << distance) | (i >>> -distance;)
	}

	/**
 * Returns the value obtained by rotating the two's complement binary
 * representation of the specified {@code int} value right by the
 * specified number of bits.  (Bits shifted out of the right hand, or
 * low-order, side reenter on the left, or high-order.)
 *
 * <p>Note that right rotation with a negative distance is equivalent to
 * left rotation: {@code rotateRight(val, -distance) == rotateLeft(val,
 * distance)}.  Note also that rotation by any multiple of 32 is a
 * no-op, so all but the last five bits of the rotation distance can be
 * ignored, even if the distance is negative: {@code rotateRight(val,
 * distance) == rotateRight(val, distance & 0x1F)}.
 *
 * @param i the value whose bits are to be rotated right
 * @param distance the number of bit positions to rotate right
 * @return the value obtained by rotating the two's complement binary
 *     representation of the specified {@code int} value right by the
 *     specified number of bits.
 * @since 1.5
 */

	function rotateRight(int32 i, int32 distance) public returns(int32)
	{
			return (i >>> distance) | (i << -distance;)
	}

	/**
 * Returns the value obtained by reversing the order of the bits in the
 * two's complement binary representation of the specified {@code int}
 * value.
 *
 * @param i the value to be reversed
 * @return the value obtained by reversing order of the bits in the
 *     specified {@code int} value.
 * @since 1.5
 */

	function reverse(int32 i) public returns(int32)
	{
			// HD, Figure 7-1

			i = (i & 0x55555555) << 1 | (i >>> 1) & 0x55555555;
			i = (i & 0x33333333) << 2 | (i >>> 2) & 0x33333333;
			i = (i & 0x0f0f0f0f) << 4 | (i >>> 4) & 0x0f0f0f0f;
			i = (i << 24) | ((i & 0xff00) << 8) | ((i >>> 8) & 0xff00) | (i >>> 24);
			return i;
	}

	/**
 * Returns the signum function of the specified {@code int} value.  (The
 * return value is -1 if the specified value is negative; 0 if the
 * specified value is zero; and 1 if the specified value is positive.)
 *
 * @param i the value whose signum is to be computed
 * @return the signum function of the specified {@code int} value.
 * @since 1.5
 */

	function signum(int32 i) public returns(int32)
	{
			// HD, Section 2-7

			return (i >> 31) | (-i; >>> 31)
	}

	/**
 * Returns the value obtained by reversing the order of the bytes in the
 * two's complement representation of the specified {@code int} value.
 *
 * @param i the value whose bytes are to be reversed
 * @return the value obtained by reversing the bytes in the specified
 *     {@code int} value.
 * @since 1.5
 */

	function reverseBytes(int32 i) public returns(int32)
	{
			return ((i >>> 24)) | ((i >> 8) & 0xFF00) | ((i << 8) & 0xFF0000) | ((i << 24));
	}

	/**
 * Adds two integers together as per the + operator.
 *
 * @param a the first operand
 * @param b the second operand
 * @return the sum of {@code a} and {@code b}
 * @see java.util.function.BinaryOperator
 * @since 1.8
 */

	function sum(int32 a, int32 b) public returns(int32)
	{
			return a + b;
	}

	/**
 * Returns the greater of two {@code int} values
 * as if by calling {@link Math#max(int, int) Math.max}.
 *
 * @param a the first operand
 * @param b the second operand
 * @return the greater of {@code a} and {@code b}
 * @see java.util.function.BinaryOperator
 * @since 1.8
 */

	function max(int32 a, int32 b) public returns(int32)
	{
			return 
	}

	/**
 * Returns the smaller of two {@code int} values
 * as if by calling {@link Math#min(int, int) Math.min}.
 *
 * @param a the first operand
 * @param b the second operand
 * @return the smaller of {@code a} and {@code b}
 * @see java.util.function.BinaryOperator
 * @since 1.8
 */

	function min(int32 a, int32 b) public returns(int32)
	{
			return 
	}

	/**
 * use serialVersionUID from JDK 1.0.2 for interoperability
 */

	int64 static  immutable serialVersionUID;

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
 * Constructs a newly allocated {@code Integer} object that
 * represents the specified {@code int} value.
 *
 * @param   value   the value to be represented by the
 *                  {@code Integer} object.
 */

	function constructor1(int32 value) public	overloadedConstructor( 1 )
	{
			 = value;
	}

	/**
 * Constructs a newly allocated {@code Integer} object that
 * represents the {@code int} value indicated by the
 * {@code String} parameter. The string is converted to an
 * {@code int} value in exactly the manner used by the
 * {@code parseInt} method for radix 10.
 *
 * @param      s   the {@code String} to be converted to an
 *                 {@code Integer}.
 * @exception  NumberFormatException  if the {@code String} does not
 *               contain a parsable integer.
 * @see        java.lang.Integer#parseInt(java.lang.String, int)
 */

	function constructor2(string s) public	overloadedConstructor( 2 )
	{
			;
	}

}

library Integer_Library
{
	/**
 * Returns a string representation of the first argument in the
 * radix specified by the second argument.
 *
 * <p>If the radix is smaller than {@code Character.MIN_RADIX}
 * or larger than {@code Character.MAX_RADIX}, then the radix
 * {@code 10} is used instead.
 *
 * <p>If the first argument is negative, the first element of the
 * result is the ASCII minus character {@code '-'}
 * ({@code '\u005Cu002D'}). If the first argument is not
 * negative, no sign character appears in the result.
 *
 * <p>The remaining characters of the result represent the magnitude
 * of the first argument. If the magnitude is zero, it is
 * represented by a single zero character {@code '0'}
 * ({@code '\u005Cu0030'}); otherwise, the first character of
 * the representation of the magnitude will not be the zero
 * character.  The following ASCII characters are used as digits:
 *
 * <blockquote>
 *   {@code 0123456789abcdefghijklmnopqrstuvwxyz}
 * </blockquote>
 *
 * These are {@code '\u005Cu0030'} through
 * {@code '\u005Cu0039'} and {@code '\u005Cu0061'} through
 * {@code '\u005Cu007A'}. If {@code radix} is
 * <var>N</var>, then the first <var>N</var> of these characters
 * are used as radix-<var>N</var> digits in the order shown. Thus,
 * the digits for hexadecimal (radix 16) are
 * {@code 0123456789abcdef}. If uppercase letters are
 * desired, the {@link java.lang.String#toUpperCase()} method may
 * be called on the result:
 *
 * <blockquote>
 *  {@code Integer.toString(n, 16).toUpperCase()}
 * </blockquote>
 *
 * @param   i       an integer to be converted to a string.
 * @param   radix   the radix to use in the string representation.
 * @return  a string representation of the argument in the specified radix.
 * @see     java.lang.Character#MAX_RADIX
 * @see     java.lang.Character#MIN_RADIX
 */

	function toString(int32 i, int32 radix) public returns(String)
	{
			if(radix < Character.MIN_RADIX || radix > Character.MAX_RADIX);
			/* Use the faster version */

			if(radix == 10)
			{
					return 
			}
			bool negative = bool((i < 0));
			int32 charPos = int32(32);
			if(!negative;)
			{
					i = -i;
			}
			while(i <= -radix;)
			{
					buf[uint256(charPos--;)] = digits[uint256(-(i % radix);)]
					i = i / radix;

			}
			buf[uint256(charPos)] = digits[uint256(-i;)]
			if(negative)
			{
					buf[uint256(--charPos;)] = "-"
			}
			return 
	}

	/**
 * Returns a string representation of the first argument as an
 * unsigned integer value in the radix specified by the second
 * argument.
 *
 * <p>If the radix is smaller than {@code Character.MIN_RADIX}
 * or larger than {@code Character.MAX_RADIX}, then the radix
 * {@code 10} is used instead.
 *
 * <p>Note that since the first argument is treated as an unsigned
 * value, no leading sign character is printed.
 *
 * <p>If the magnitude is zero, it is represented by a single zero
 * character {@code '0'} ({@code '\u005Cu0030'}); otherwise,
 * the first character of the representation of the magnitude will
 * not be the zero character.
 *
 * <p>The behavior of radixes and the characters used as digits
 * are the same as {@link #toString(int, int) toString}.
 *
 * @param   i       an integer to be converted to an unsigned string.
 * @param   radix   the radix to use in the string representation.
 * @return  an unsigned string representation of the argument in the specified radix.
 * @see     #toString(int, int)
 * @since 1.8
 */

	function toUnsignedString(int32 i, int32 radix) public returns(String)
	{
			return 
	}

	/**
 * Returns a string representation of the integer argument as an
 * unsigned integer in base&nbsp;16.
 *
 * <p>The unsigned integer value is the argument plus 2<sup>32</sup>
 * if the argument is negative; otherwise, it is equal to the
 * argument.  This value is converted to a string of ASCII digits
 * in hexadecimal (base&nbsp;16) with no extra leading
 * {@code 0}s.
 *
 * <p>The value of the argument can be recovered from the returned
 * string {@code s} by calling {@link
 * Integer#parseUnsignedInt(String, int)
 * Integer.parseUnsignedInt(s, 16)}.
 *
 * <p>If the unsigned magnitude is zero, it is represented by a
 * single zero character {@code '0'} ({@code '\u005Cu0030'});
 * otherwise, the first character of the representation of the
 * unsigned magnitude will not be the zero character. The
 * following characters are used as hexadecimal digits:
 *
 * <blockquote>
 *  {@code 0123456789abcdef}
 * </blockquote>
 *
 * These are the characters {@code '\u005Cu0030'} through
 * {@code '\u005Cu0039'} and {@code '\u005Cu0061'} through
 * {@code '\u005Cu0066'}. If uppercase letters are
 * desired, the {@link java.lang.String#toUpperCase()} method may
 * be called on the result:
 *
 * <blockquote>
 *  {@code Integer.toHexString(n).toUpperCase()}
 * </blockquote>
 *
 * @param   i   an integer to be converted to a string.
 * @return  the string representation of the unsigned integer value
 *          represented by the argument in hexadecimal (base&nbsp;16).
 * @see #parseUnsignedInt(String, int)
 * @see #toUnsignedString(int, int)
 * @since   JDK1.0.2
 */

	function toHexString(int32 i) public returns(String)
	{
			return 
	}

	/**
 * Returns a string representation of the integer argument as an
 * unsigned integer in base&nbsp;8.
 *
 * <p>The unsigned integer value is the argument plus 2<sup>32</sup>
 * if the argument is negative; otherwise, it is equal to the
 * argument.  This value is converted to a string of ASCII digits
 * in octal (base&nbsp;8) with no extra leading {@code 0}s.
 *
 * <p>The value of the argument can be recovered from the returned
 * string {@code s} by calling {@link
 * Integer#parseUnsignedInt(String, int)
 * Integer.parseUnsignedInt(s, 8)}.
 *
 * <p>If the unsigned magnitude is zero, it is represented by a
 * single zero character {@code '0'} ({@code '\u005Cu0030'});
 * otherwise, the first character of the representation of the
 * unsigned magnitude will not be the zero character. The
 * following characters are used as octal digits:
 *
 * <blockquote>
 * {@code 01234567}
 * </blockquote>
 *
 * These are the characters {@code '\u005Cu0030'} through
 * {@code '\u005Cu0037'}.
 *
 * @param   i   an integer to be converted to a string.
 * @return  the string representation of the unsigned integer value
 *          represented by the argument in octal (base&nbsp;8).
 * @see #parseUnsignedInt(String, int)
 * @see #toUnsignedString(int, int)
 * @since   JDK1.0.2
 */

	function toOctalString(int32 i) public returns(String)
	{
			return 
	}

	/**
 * Returns a string representation of the integer argument as an
 * unsigned integer in base&nbsp;2.
 *
 * <p>The unsigned integer value is the argument plus 2<sup>32</sup>
 * if the argument is negative; otherwise it is equal to the
 * argument.  This value is converted to a string of ASCII digits
 * in binary (base&nbsp;2) with no extra leading {@code 0}s.
 *
 * <p>The value of the argument can be recovered from the returned
 * string {@code s} by calling {@link
 * Integer#parseUnsignedInt(String, int)
 * Integer.parseUnsignedInt(s, 2)}.
 *
 * <p>If the unsigned magnitude is zero, it is represented by a
 * single zero character {@code '0'} ({@code '\u005Cu0030'});
 * otherwise, the first character of the representation of the
 * unsigned magnitude will not be the zero character. The
 * characters {@code '0'} ({@code '\u005Cu0030'}) and {@code
 * '1'} ({@code '\u005Cu0031'}) are used as binary digits.
 *
 * @param   i   an integer to be converted to a string.
 * @return  the string representation of the unsigned integer value
 *          represented by the argument in binary (base&nbsp;2).
 * @see #parseUnsignedInt(String, int)
 * @see #toUnsignedString(int, int)
 * @since   JDK1.0.2
 */

	function toBinaryString(int32 i) public returns(String)
	{
			return 
	}

	/**
 * Convert the integer to an unsigned number.
 */

	function toUnsignedString0(int32 val, int32 shift) private returns(String)
	{
			// assert shift > 0 && shift <=5 : "Illegal shift value";

			int32 mag = int32();
			int32 chars = int32(.max(((mag + (shift - 1)) / shift), 1));
			// Use special constructor which takes over "buf".

			return 
	}

	/**
 * Format a long (treated as unsigned) into a character buffer.
 * @param val the unsigned int to format
 * @param shift the log2 of the base to format in (4 for hex, 3 for octal, 1 for binary)
 * @param buf the character buffer to write to
 * @param offset the offset in the destination buffer to start at
 * @param len the number of characters to write
 * @return the lowest character  location used
 */

	function formatUnsignedInt(int32 val, int32 shift, byte[] memory buf, int32 offset, int32 len) internal returns(int32)
	{
			int32 charPos = int32(len);
			int32 radix = int32(1 << shift);
			int32 mask = int32(radix - 1);
			do
			{
					buf[uint256(offset + --charPos;)] = Integer.digits[uint256(val & mask)]
					val >>>= shift;

			}while(val != 0 && charPos > 0);
			return charPos;
	}

	/**
 * Returns a {@code String} object representing the
 * specified integer. The argument is converted to signed decimal
 * representation and returned as a string, exactly as if the
 * argument and radix 10 were given as arguments to the {@link
 * #toString(int, int)} method.
 *
 * @param   i   an integer to be converted.
 * @return  a string representation of the argument in base&nbsp;10.
 */

	function toString(int32 i) public returns(String)
	{
			if(i == Integer.MIN_VALUE);
			int32 size;
			return 
	}

	/**
 * Returns a string representation of the argument as an unsigned
 * decimal value.
 *
 * The argument is converted to unsigned decimal representation
 * and returned as a string exactly as if the argument and radix
 * 10 were given as arguments to the {@link #toUnsignedString(int,
 * int)} method.
 *
 * @param   i  an integer to be converted to an unsigned string.
 * @return  an unsigned string representation of the argument.
 * @see     #toUnsignedString(int, int)
 * @since 1.8
 */

	function toUnsignedString(int32 i) public returns(String)
	{
			return 
	}

	/**
 * Places characters representing the integer i into the
 * character array buf. The characters are placed into
 * the buffer backwards starting with the least significant
 * digit at the specified index (exclusive), and working
 * backwards from there.
 *
 * Will fail if i == Integer.MIN_VALUE
 */

	function getChars(int32 i, int32 index, byte[] memory buf) internal
	{
			int32 q;
			int32 charPos = int32(index);
			byte sign = byte(0);
			if(i < 0)
			{
					sign = "-";
					i = -i;
			}
			// Generate two digits per iteration

			while(i >= 65536)
			{
					q = i / 100;
					// really: r = i - (q * 100);

					r = i - ((q << 6) + (q << 5) + (q << 2));
					i = q;
					buf[uint256(--charPos;)] = DigitOnes[uint256(r)]
					buf[uint256(--charPos;)] = DigitTens[uint256(r)]

			}
			if(sign != 0)
			{
					buf[uint256(--charPos;)] = sign
			}
	}

	// Requires positive x

	function stringSize(int32 x) internal returns(int32)
	{
			for(
	}

	/**
 * Parses the string argument as a signed integer in the radix
 * specified by the second argument. The characters in the string
 * must all be digits of the specified radix (as determined by
 * whether {@link java.lang.Character#digit(char, int)} returns a
 * nonnegative value), except that the first character may be an
 * ASCII minus sign {@code '-'} ({@code '\u005Cu002D'}) to
 * indicate a negative value or an ASCII plus sign {@code '+'}
 * ({@code '\u005Cu002B'}) to indicate a positive value. The
 * resulting integer value is returned.
 *
 * <p>An exception of type {@code NumberFormatException} is
 * thrown if any of the following situations occurs:
 * <ul>
 * <li>The first argument is {@code null} or is a string of
 * length zero.
 *
 * <li>The radix is either smaller than
 * {@link java.lang.Character#MIN_RADIX} or
 * larger than {@link java.lang.Character#MAX_RADIX}.
 *
 * <li>Any character of the string is not a digit of the specified
 * radix, except that the first character may be a minus sign
 * {@code '-'} ({@code '\u005Cu002D'}) or plus sign
 * {@code '+'} ({@code '\u005Cu002B'}) provided that the
 * string is longer than length 1.
 *
 * <li>The value represented by the string is not a value of type
 * {@code int}.
 * </ul>
 *
 * <p>Examples:
 * <blockquote><pre>
 * parseInt("0", 10) returns 0
 * parseInt("473", 10) returns 473
 * parseInt("+42", 10) returns 42
 * parseInt("-0", 10) returns 0
 * parseInt("-FF", 16) returns -255
 * parseInt("1100110", 2) returns 102
 * parseInt("2147483647", 10) returns 2147483647
 * parseInt("-2147483648", 10) returns -2147483648
 * parseInt("2147483648", 10) throws a NumberFormatException
 * parseInt("99", 8) throws a NumberFormatException
 * parseInt("Kona", 10) throws a NumberFormatException
 * parseInt("Kona", 27) returns 411787
 * </pre></blockquote>
 *
 * @param      s   the {@code String} containing the integer
 *                  representation to be parsed
 * @param      radix   the radix to be used while parsing {@code s}.
 * @return     the integer represented by the string argument in the
 *             specified radix.
 * @exception  NumberFormatException if the {@code String}
 *             does not contain a parsable {@code int}.
 */

	function parseInt(string s, int32 radix) public returns(int32)
	{
			if()
			{
			}
			if(radix < Character.MIN_RADIX)
			{
			}
			if(radix > Character.MAX_RADIX)
			{
			}
			int32 result = int32(0);
			bool negative = bool(false);
			int32 i = int32(0);
			int32 limit = int32(-Integer.MAX_VALUE);
			int32 multmin;
			int32 digit;
			if(len > 0)
			{
					byte firstChar = byte(.charAt(0));
					if(firstChar < "0")
					{
							// Possible leading "+" or "-"

							if(keccak256(abi.encode(firstChar)) == keccak256(abi.encode("-")))
							{
									negative = true;
									limit = Integer.MIN_VALUE;
							}
							else
							{
								if(firstChar != "+");							}

							if(// Cannot have lone "+" or "-"

len == 1);
							i++;
					}
					multmin = limit / radix;
					while(i < len)
					{
							// Accumulating negatively avoids surprises near MAX_VALUE

							;
							if(digit < 0)
							{
							}
							if(result < multmin)
							{
							}
							result *= radix;
							if(result < limit + digit)
							{
							}
							result -= digit;

					}
			}
			else
			{
			}

			return negative ? -result; : result
	}

	/**
 * Parses the string argument as a signed decimal integer. The
 * characters in the string must all be decimal digits, except
 * that the first character may be an ASCII minus sign {@code '-'}
 * ({@code '\u005Cu002D'}) to indicate a negative value or an
 * ASCII plus sign {@code '+'} ({@code '\u005Cu002B'}) to
 * indicate a positive value. The resulting integer value is
 * returned, exactly as if the argument and the radix 10 were
 * given as arguments to the {@link #parseInt(java.lang.String,
 * int)} method.
 *
 * @param s    a {@code String} containing the {@code int}
 *             representation to be parsed
 * @return     the integer value represented by the argument in decimal.
 * @exception  NumberFormatException  if the string does not contain a
 *               parsable integer.
 */

	function parseInt(string s) public returns(int32)
	{
			return 
	}

	/**
 * Parses the string argument as an unsigned integer in the radix
 * specified by the second argument.  An unsigned integer maps the
 * values usually associated with negative numbers to positive
 * numbers larger than {@code MAX_VALUE}.
 *
 * The characters in the string must all be digits of the
 * specified radix (as determined by whether {@link
 * java.lang.Character#digit(char, int)} returns a nonnegative
 * value), except that the first character may be an ASCII plus
 * sign {@code '+'} ({@code '\u005Cu002B'}). The resulting
 * integer value is returned.
 *
 * <p>An exception of type {@code NumberFormatException} is
 * thrown if any of the following situations occurs:
 * <ul>
 * <li>The first argument is {@code null} or is a string of
 * length zero.
 *
 * <li>The radix is either smaller than
 * {@link java.lang.Character#MIN_RADIX} or
 * larger than {@link java.lang.Character#MAX_RADIX}.
 *
 * <li>Any character of the string is not a digit of the specified
 * radix, except that the first character may be a plus sign
 * {@code '+'} ({@code '\u005Cu002B'}) provided that the
 * string is longer than length 1.
 *
 * <li>The value represented by the string is larger than the
 * largest unsigned {@code int}, 2<sup>32</sup>-1.
 *
 * </ul>
 *
 * @param      s   the {@code String} containing the unsigned integer
 *                  representation to be parsed
 * @param      radix   the radix to be used while parsing {@code s}.
 * @return     the integer represented by the string argument in the
 *             specified radix.
 * @throws     NumberFormatException if the {@code String}
 *             does not contain a parsable {@code int}.
 * @since 1.8
 */

	function parseUnsignedInt(string s, int32 radix) public returns(int32)
	{
			if()
			{
			}
			int32 len = int32(.length());
			if(len > 0)
			{
					byte firstChar = byte(.charAt(0));
					if(keccak256(abi.encode(firstChar)) == keccak256(abi.encode("-")))
					{
					}
					else
					{
							if(// Integer.MAX_VALUE in Character.MAX_RADIX is 6 digits

len <= 5 || (radix == 10 && len <= 9))
							{
									// Integer.MAX_VALUE in base 10 is 10 digits

									return 
							}
							else
							{
									int64 ell;
									if(() == 0)
									{
											return int32(ell);
									}
									else
									{
									}

							}

					}

			}
			else
			{
			}

	}

	/**
 * Parses the string argument as an unsigned decimal integer. The
 * characters in the string must all be decimal digits, except
 * that the first character may be an an ASCII plus sign {@code
 * '+'} ({@code '\u005Cu002B'}). The resulting integer value
 * is returned, exactly as if the argument and the radix 10 were
 * given as arguments to the {@link
 * #parseUnsignedInt(java.lang.String, int)} method.
 *
 * @param s   a {@code String} containing the unsigned {@code int}
 *            representation to be parsed
 * @return    the unsigned integer value represented by the argument in decimal.
 * @throws    NumberFormatException  if the string does not contain a
 *            parsable unsigned integer.
 * @since 1.8
 */

	function parseUnsignedInt(string s) public returns(int32)
	{
			return 
	}

	/**
 * Returns an {@code Integer} object holding the value
 * extracted from the specified {@code String} when parsed
 * with the radix given by the second argument. The first argument
 * is interpreted as representing a signed integer in the radix
 * specified by the second argument, exactly as if the arguments
 * were given to the {@link #parseInt(java.lang.String, int)}
 * method. The result is an {@code Integer} object that
 * represents the integer value specified by the string.
 *
 * <p>In other words, this method returns an {@code Integer}
 * object equal to the value of:
 *
 * <blockquote>
 *  {@code new Integer(Integer.parseInt(s, radix))}
 * </blockquote>
 *
 * @param      s   the string to be parsed.
 * @param      radix the radix to be used in interpreting {@code s}
 * @return     an {@code Integer} object holding the value
 *             represented by the string argument in the specified
 *             radix.
 * @exception NumberFormatException if the {@code String}
 *            does not contain a parsable {@code int}.
 */

	function valueOf(string s, int32 radix) public returns(Integer)
	{
			return 
	}

	/**
 * Returns an {@code Integer} object holding the
 * value of the specified {@code String}. The argument is
 * interpreted as representing a signed decimal integer, exactly
 * as if the argument were given to the {@link
 * #parseInt(java.lang.String)} method. The result is an
 * {@code Integer} object that represents the integer value
 * specified by the string.
 *
 * <p>In other words, this method returns an {@code Integer}
 * object equal to the value of:
 *
 * <blockquote>
 *  {@code new Integer(Integer.parseInt(s))}
 * </blockquote>
 *
 * @param      s   the string to be parsed.
 * @return     an {@code Integer} object holding the value
 *             represented by the string argument.
 * @exception  NumberFormatException  if the string cannot be parsed
 *             as an integer.
 */

	function valueOf(string s) public returns(Integer)
	{
			return 
	}

	/**
 * Returns an {@code Integer} instance representing the specified
 * {@code int} value.  If a new {@code Integer} instance is not
 * required, this method should generally be used in preference to
 * the constructor {@link #Integer(int)}, as this method is likely
 * to yield significantly better space and time performance by
 * caching frequently requested values.
 *
 * This method will always cache values in the range -128 to 127,
 * inclusive, and may cache other values outside of this range.
 *
 * @param  i an {@code int} value.
 * @return an {@code Integer} instance representing {@code i}.
 * @since  1.5
 */

	function valueOf(int32 i) public returns(Integer)
	{
			if(i >= IntegerCache.low && i <= IntegerCache.high);
			return 
	}

	/**
 * Returns a hash code for a {@code int} value; compatible with
 * {@code Integer.hashCode()}.
 *
 * @param value the value to hash
 * @since 1.8
 *
 * @return a hash code value for a {@code int} value.
 */

	function hashCode(int32 value) public returns(int32)
	{
			return value;
	}

	/**
 * Determines the integer value of the system property with the
 * specified name.
 *
 * <p>The first argument is treated as the name of a system
 * property.  System properties are accessible through the {@link
 * java.lang.System#getProperty(java.lang.String)} method. The
 * string value of this property is then interpreted as an integer
 * value using the grammar supported by {@link Integer#decode decode} and
 * an {@code Integer} object representing this value is returned.
 *
 * <p>If there is no property with the specified name, if the
 * specified name is empty or {@code null}, or if the property
 * does not have the correct numeric format, then {@code null} is
 * returned.
 *
 * <p>In other words, this method returns an {@code Integer}
 * object equal to the value of:
 *
 * <blockquote>
 *  {@code getInteger(nm, null)}
 * </blockquote>
 *
 * @param   nm   property name.
 * @return  the {@code Integer} value of the property.
 * @throws  SecurityException for the same reasons as
 *          {@link System#getProperty(String) System.getProperty}
 * @see     java.lang.System#getProperty(java.lang.String)
 * @see     java.lang.System#getProperty(java.lang.String, java.lang.String)
 */

	function getInteger(string nm) public returns(Integer)
	{
			return 
	}

	/**
 * Determines the integer value of the system property with the
 * specified name.
 *
 * <p>The first argument is treated as the name of a system
 * property.  System properties are accessible through the {@link
 * java.lang.System#getProperty(java.lang.String)} method. The
 * string value of this property is then interpreted as an integer
 * value using the grammar supported by {@link Integer#decode decode} and
 * an {@code Integer} object representing this value is returned.
 *
 * <p>The second argument is the default value. An {@code Integer} object
 * that represents the value of the second argument is returned if there
 * is no property of the specified name, if the property does not have
 * the correct numeric format, or if the specified name is empty or
 * {@code null}.
 *
 * <p>In other words, this method returns an {@code Integer} object
 * equal to the value of:
 *
 * <blockquote>
 *  {@code getInteger(nm, new Integer(val))}
 * </blockquote>
 *
 * but in practice it may be implemented in a manner such as:
 *
 * <blockquote><pre>
 * Integer result = getInteger(nm, null);
 * return (result == null) ? new Integer(val) : result;
 * </pre></blockquote>
 *
 * to avoid the unnecessary allocation of an {@code Integer}
 * object when the default value is not needed.
 *
 * @param   nm   property name.
 * @param   val   default value.
 * @return  the {@code Integer} value of the property.
 * @throws  SecurityException for the same reasons as
 *          {@link System#getProperty(String) System.getProperty}
 * @see     java.lang.System#getProperty(java.lang.String)
 * @see     java.lang.System#getProperty(java.lang.String, java.lang.String)
 */

	function getInteger(string nm, int32 val) public returns(Integer)
	{
			Integer result;
			return 
	}

	/**
 * Returns the integer value of the system property with the
 * specified name.  The first argument is treated as the name of a
 * system property.  System properties are accessible through the
 * {@link java.lang.System#getProperty(java.lang.String)} method.
 * The string value of this property is then interpreted as an
 * integer value, as per the {@link Integer#decode decode} method,
 * and an {@code Integer} object representing this value is
 * returned; in summary:
 *
 * <ul><li>If the property value begins with the two ASCII characters
 *         {@code 0x} or the ASCII character {@code #}, not
 *      followed by a minus sign, then the rest of it is parsed as a
 *      hexadecimal integer exactly as by the method
 *      {@link #valueOf(java.lang.String, int)} with radix 16.
 * <li>If the property value begins with the ASCII character
 *     {@code 0} followed by another character, it is parsed as an
 *     octal integer exactly as by the method
 *     {@link #valueOf(java.lang.String, int)} with radix 8.
 * <li>Otherwise, the property value is parsed as a decimal integer
 * exactly as by the method {@link #valueOf(java.lang.String, int)}
 * with radix 10.
 * </ul>
 *
 * <p>The second argument is the default value. The default value is
 * returned if there is no property of the specified name, if the
 * property does not have the correct numeric format, or if the
 * specified name is empty or {@code null}.
 *
 * @param   nm   property name.
 * @param   val   default value.
 * @return  the {@code Integer} value of the property.
 * @throws  SecurityException for the same reasons as
 *          {@link System#getProperty(String) System.getProperty}
 * @see     System#getProperty(java.lang.String)
 * @see     System#getProperty(java.lang.String, java.lang.String)
 */

	function getInteger(string nm, Integer val) public returns(Integer)
	{
			string memory v;
				//try

					;

				/* catch (IllegalArgumentException | NullPointerException e) {
}*/


			if()
			{
						//try

							return .decode(v);

						/* catch (NumberFormatException e) {
}*/


			}
			return val;
	}

	/**
 * Decodes a {@code String} into an {@code Integer}.
 * Accepts decimal, hexadecimal, and octal numbers given
 * by the following grammar:
 *
 * <blockquote>
 * <dl>
 * <dt><i>DecodableString:</i>
 * <dd><i>Sign<sub>opt</sub> DecimalNumeral</i>
 * <dd><i>Sign<sub>opt</sub></i> {@code 0x} <i>HexDigits</i>
 * <dd><i>Sign<sub>opt</sub></i> {@code 0X} <i>HexDigits</i>
 * <dd><i>Sign<sub>opt</sub></i> {@code #} <i>HexDigits</i>
 * <dd><i>Sign<sub>opt</sub></i> {@code 0} <i>OctalDigits</i>
 *
 * <dt><i>Sign:</i>
 * <dd>{@code -}
 * <dd>{@code +}
 * </dl>
 * </blockquote>
 *
 * <i>DecimalNumeral</i>, <i>HexDigits</i>, and <i>OctalDigits</i>
 * are as defined in section 3.10.1 of
 * <cite>The Java&trade; Language Specification</cite>,
 * except that underscores are not accepted between digits.
 *
 * <p>The sequence of characters following an optional
 * sign and/or radix specifier ("{@code 0x}", "{@code 0X}",
 * "{@code #}", or leading zero) is parsed as by the {@code
 * Integer.parseInt} method with the indicated radix (10, 16, or
 * 8).  This sequence of characters must represent a positive
 * value or a {@link NumberFormatException} will be thrown.  The
 * result is negated if first character of the specified {@code
 * String} is the minus sign.  No whitespace characters are
 * permitted in the {@code String}.
 *
 * @param     nm the {@code String} to decode.
 * @return    an {@code Integer} object holding the {@code int}
 *             value represented by {@code nm}
 * @exception NumberFormatException  if the {@code String} does not
 *            contain a parsable integer.
 * @see java.lang.Integer#parseInt(java.lang.String, int)
 */

	function decode(string nm) public returns(Integer)
	{
			int32 radix = int32(10);
			int32 index = int32(0);
			bool negative = bool(false);
			Integer result;
			if(.length() == 0);
			byte firstChar = byte(.charAt(0));
			// Handle sign, if present

			if(keccak256(abi.encode(firstChar)) == keccak256(abi.encode("-")))
			{
					negative = true;
					index++;
			}
			else
			{
				if(keccak256(abi.encode(firstChar)) == keccak256(abi.encode("+")));			}

			// Handle radix specifier, if present

			if(.startsWith("0x", index) || .startsWith("0X", index))
			{
					index += 2;
					radix = 16;
			}
			else
			{
				if(.startsWith("#", index))
				{
						index++;
						radix = 16;
				}
				else
				{
					if(.startsWith("0", index) && .length() > 1 + index)
					{
							index++;
							radix = 8;
					}				}
			}

			if(.startsWith("-", index) || .startsWith("+", index));
				//try

					result = IntegerCache_Library.valueOf(.substring(index), radix);
					result = negative ? result : .valueOf(-.intValue();)

				/* catch (NumberFormatException e) {
    // If number is Integer.MIN_VALUE, we'll end up here. The next line
    // handles this case, and causes any genuine format error to be
    // rethrown.
    String constant = negative ? ("-" + nm.substring(index)) : nm.substring(index);
    result = Integer.valueOf(constant, radix);
}*/


			return result;
	}

	/**
 * Compares two {@code int} values numerically.
 * The value returned is identical to what would be returned by:
 * <pre>
 *    Integer.valueOf(x).compareTo(Integer.valueOf(y))
 * </pre>
 *
 * @param  x the first {@code int} to compare
 * @param  y the second {@code int} to compare
 * @return the value {@code 0} if {@code x == y};
 *         a value less than {@code 0} if {@code x < y}; and
 *         a value greater than {@code 0} if {@code x > y}
 * @since 1.7
 */

	function compare(int32 x, int32 y) public returns(int32)
	{
			return (x < y) ? ((x == y) ? 1 : 0) : -1;
	}

	/**
 * Compares two {@code int} values numerically treating the values
 * as unsigned.
 *
 * @param  x the first {@code int} to compare
 * @param  y the second {@code int} to compare
 * @return the value {@code 0} if {@code x == y}; a value less
 *         than {@code 0} if {@code x < y} as unsigned values; and
 *         a value greater than {@code 0} if {@code x > y} as
 *         unsigned values
 * @since 1.8
 */

	function compareUnsigned(int32 x, int32 y) public returns(int32)
	{
			return 
	}

	/**
 * Converts the argument to a {@code long} by an unsigned
 * conversion.  In an unsigned conversion to a {@code long}, the
 * high-order 32 bits of the {@code long} are zero and the
 * low-order 32 bits are equal to the bits of the integer
 * argument.
 *
 * Consequently, zero and positive {@code int} values are mapped
 * to a numerically equal {@code long} value and negative {@code
 * int} values are mapped to a {@code long} value equal to the
 * input plus 2<sup>32</sup>.
 *
 * @param  x the value to convert to an unsigned {@code long}
 * @return the argument converted to {@code long} by an unsigned
 *         conversion
 * @since 1.8
 */

	function toUnsignedLong(int32 x) public returns(int64)
	{
			return ;
	}

	/**
 * Returns the unsigned quotient of dividing the first argument by
 * the second where each argument and the result is interpreted as
 * an unsigned value.
 *
 * <p>Note that in two's complement arithmetic, the three other
 * basic arithmetic operations of add, subtract, and multiply are
 * bit-wise identical if the two operands are regarded as both
 * being signed or both being unsigned.  Therefore separate {@code
 * addUnsigned}, etc. methods are not provided.
 *
 * @param dividend the value to be divided
 * @param divisor the value doing the dividing
 * @return the unsigned quotient of the first argument divided by
 * the second argument
 * @see #remainderUnsigned
 * @since 1.8
 */

	function divideUnsigned(int32 dividend, int32 divisor) public returns(int32)
	{
			// In lieu of tricky code, for now just use long arithmetic.

			return int32(());
	}

	/**
 * Returns the unsigned remainder from dividing the first argument
 * by the second where each argument and the result is interpreted
 * as an unsigned value.
 *
 * @param dividend the value to be divided
 * @param divisor the value doing the dividing
 * @return the unsigned remainder of the first argument divided by
 * the second argument
 * @see #divideUnsigned
 * @since 1.8
 */

	function remainderUnsigned(int32 dividend, int32 divisor) public returns(int32)
	{
			// In lieu of tricky code, for now just use long arithmetic.

			return int32(());
	}

	/**
 * Returns an {@code int} value with at most a single one-bit, in the
 * position of the highest-order ("leftmost") one-bit in the specified
 * {@code int} value.  Returns zero if the specified value has no
 * one-bits in its two's complement binary representation, that is, if it
 * is equal to zero.
 *
 * @param i the value whose highest one bit is to be computed
 * @return an {@code int} value with a single one-bit, in the position
 *     of the highest-order one-bit in the specified value, or zero if
 *     the specified value is itself equal to zero.
 * @since 1.5
 */

	function highestOneBit(int32 i) public returns(int32)
	{
			// HD, Figure 3-1

			i |= (i >> 1);
			i |= (i >> 2);
			i |= (i >> 4);
			i |= (i >> 8);
			i |= (i >> 16);
			return i - (i >>> 1);
	}

	/**
 * Returns an {@code int} value with at most a single one-bit, in the
 * position of the lowest-order ("rightmost") one-bit in the specified
 * {@code int} value.  Returns zero if the specified value has no
 * one-bits in its two's complement binary representation, that is, if it
 * is equal to zero.
 *
 * @param i the value whose lowest one bit is to be computed
 * @return an {@code int} value with a single one-bit, in the position
 *     of the lowest-order one-bit in the specified value, or zero if
 *     the specified value is itself equal to zero.
 * @since 1.5
 */

	function lowestOneBit(int32 i) public returns(int32)
	{
			// HD, Section 2-1

			return i & -i;
	}

	/**
 * Returns the number of zero bits preceding the highest-order
 * ("leftmost") one-bit in the two's complement binary representation
 * of the specified {@code int} value.  Returns 32 if the
 * specified value has no one-bits in its two's complement representation,
 * in other words if it is equal to zero.
 *
 * <p>Note that this method is closely related to the logarithm base 2.
 * For all positive {@code int} values x:
 * <ul>
 * <li>floor(log<sub>2</sub>(x)) = {@code 31 - numberOfLeadingZeros(x)}
 * <li>ceil(log<sub>2</sub>(x)) = {@code 32 - numberOfLeadingZeros(x - 1)}
 * </ul>
 *
 * @param i the value whose number of leading zeros is to be computed
 * @return the number of zero bits preceding the highest-order
 *     ("leftmost") one-bit in the two's complement binary representation
 *     of the specified {@code int} value, or 32 if the value
 *     is equal to zero.
 * @since 1.5
 */

	function numberOfLeadingZeros(int32 i) public returns(int32)
	{
			// HD, Figure 5-6

			if(i == 0);
			int32 n = int32(1);
			if(i >>> 16 == 0)
			{
					n += 16;
					i <<= 16;
			}
			if(i >>> 24 == 0)
			{
					n += 8;
					i <<= 8;
			}
			if(i >>> 28 == 0)
			{
					n += 4;
					i <<= 4;
			}
			if(i >>> 30 == 0)
			{
					n += 2;
					i <<= 2;
			}
			n -= i >>> 31;
			return n;
	}

	/**
 * Returns the number of zero bits following the lowest-order ("rightmost")
 * one-bit in the two's complement binary representation of the specified
 * {@code int} value.  Returns 32 if the specified value has no
 * one-bits in its two's complement representation, in other words if it is
 * equal to zero.
 *
 * @param i the value whose number of trailing zeros is to be computed
 * @return the number of zero bits following the lowest-order ("rightmost")
 *     one-bit in the two's complement binary representation of the
 *     specified {@code int} value, or 32 if the value is equal
 *     to zero.
 * @since 1.5
 */

	function numberOfTrailingZeros(int32 i) public returns(int32)
	{
			// HD, Figure 5-14

			int32 y;
			if(i == 0);
			int32 n = int32(31);
			y = i << 16;
			if(y != 0)
			{
					n = n - 16;
					i = y;
			}
			y = i << 8;
			if(y != 0)
			{
					n = n - 8;
					i = y;
			}
			y = i << 4;
			if(y != 0)
			{
					n = n - 4;
					i = y;
			}
			y = i << 2;
			if(y != 0)
			{
					n = n - 2;
					i = y;
			}
			return n - ((i << 1) >>> 31);
	}

	/**
 * Returns the number of one-bits in the two's complement binary
 * representation of the specified {@code int} value.  This function is
 * sometimes referred to as the <i>population count</i>.
 *
 * @param i the value whose bits are to be counted
 * @return the number of one-bits in the two's complement binary
 *     representation of the specified {@code int} value.
 * @since 1.5
 */

	function bitCount(int32 i) public returns(int32)
	{
			// HD, Figure 5-2

			i = i - ((i >>> 1) & 0x55555555);
			i = (i & 0x33333333) + ((i >>> 2) & 0x33333333);
			i = (i + (i >>> 4)) & 0x0f0f0f0f;
			i = i + (i >>> 8);
			i = i + (i >>> 16);
			return i & 0x3f;
	}

	/**
 * Returns the value obtained by rotating the two's complement binary
 * representation of the specified {@code int} value left by the
 * specified number of bits.  (Bits shifted out of the left hand, or
 * high-order, side reenter on the right, or low-order.)
 *
 * <p>Note that left rotation with a negative distance is equivalent to
 * right rotation: {@code rotateLeft(val, -distance) == rotateRight(val,
 * distance)}.  Note also that rotation by any multiple of 32 is a
 * no-op, so all but the last five bits of the rotation distance can be
 * ignored, even if the distance is negative: {@code rotateLeft(val,
 * distance) == rotateLeft(val, distance & 0x1F)}.
 *
 * @param i the value whose bits are to be rotated left
 * @param distance the number of bit positions to rotate left
 * @return the value obtained by rotating the two's complement binary
 *     representation of the specified {@code int} value left by the
 *     specified number of bits.
 * @since 1.5
 */

	function rotateLeft(int32 i, int32 distance) public returns(int32)
	{
			return (i << distance) | (i >>> -distance;)
	}

	/**
 * Returns the value obtained by rotating the two's complement binary
 * representation of the specified {@code int} value right by the
 * specified number of bits.  (Bits shifted out of the right hand, or
 * low-order, side reenter on the left, or high-order.)
 *
 * <p>Note that right rotation with a negative distance is equivalent to
 * left rotation: {@code rotateRight(val, -distance) == rotateLeft(val,
 * distance)}.  Note also that rotation by any multiple of 32 is a
 * no-op, so all but the last five bits of the rotation distance can be
 * ignored, even if the distance is negative: {@code rotateRight(val,
 * distance) == rotateRight(val, distance & 0x1F)}.
 *
 * @param i the value whose bits are to be rotated right
 * @param distance the number of bit positions to rotate right
 * @return the value obtained by rotating the two's complement binary
 *     representation of the specified {@code int} value right by the
 *     specified number of bits.
 * @since 1.5
 */

	function rotateRight(int32 i, int32 distance) public returns(int32)
	{
			return (i >>> distance) | (i << -distance;)
	}

	/**
 * Returns the value obtained by reversing the order of the bits in the
 * two's complement binary representation of the specified {@code int}
 * value.
 *
 * @param i the value to be reversed
 * @return the value obtained by reversing order of the bits in the
 *     specified {@code int} value.
 * @since 1.5
 */

	function reverse(int32 i) public returns(int32)
	{
			// HD, Figure 7-1

			i = (i & 0x55555555) << 1 | (i >>> 1) & 0x55555555;
			i = (i & 0x33333333) << 2 | (i >>> 2) & 0x33333333;
			i = (i & 0x0f0f0f0f) << 4 | (i >>> 4) & 0x0f0f0f0f;
			i = (i << 24) | ((i & 0xff00) << 8) | ((i >>> 8) & 0xff00) | (i >>> 24);
			return i;
	}

	/**
 * Returns the signum function of the specified {@code int} value.  (The
 * return value is -1 if the specified value is negative; 0 if the
 * specified value is zero; and 1 if the specified value is positive.)
 *
 * @param i the value whose signum is to be computed
 * @return the signum function of the specified {@code int} value.
 * @since 1.5
 */

	function signum(int32 i) public returns(int32)
	{
			// HD, Section 2-7

			return (i >> 31) | (-i; >>> 31)
	}

	/**
 * Returns the value obtained by reversing the order of the bytes in the
 * two's complement representation of the specified {@code int} value.
 *
 * @param i the value whose bytes are to be reversed
 * @return the value obtained by reversing the bytes in the specified
 *     {@code int} value.
 * @since 1.5
 */

	function reverseBytes(int32 i) public returns(int32)
	{
			return ((i >>> 24)) | ((i >> 8) & 0xFF00) | ((i << 8) & 0xFF0000) | ((i << 24));
	}

	/**
 * Adds two integers together as per the + operator.
 *
 * @param a the first operand
 * @param b the second operand
 * @return the sum of {@code a} and {@code b}
 * @see java.util.function.BinaryOperator
 * @since 1.8
 */

	function sum(int32 a, int32 b) public returns(int32)
	{
			return a + b;
	}

	/**
 * Returns the greater of two {@code int} values
 * as if by calling {@link Math#max(int, int) Math.max}.
 *
 * @param a the first operand
 * @param b the second operand
 * @return the greater of {@code a} and {@code b}
 * @see java.util.function.BinaryOperator
 * @since 1.8
 */

	function max(int32 a, int32 b) public returns(int32)
	{
			return 
	}

	/**
 * Returns the smaller of two {@code int} values
 * as if by calling {@link Math#min(int, int) Math.min}.
 *
 * @param a the first operand
 * @param b the second operand
 * @return the smaller of {@code a} and {@code b}
 * @see java.util.function.BinaryOperator
 * @since 1.8
 */

	function min(int32 a, int32 b) public returns(int32)
	{
			return 
	}

}

