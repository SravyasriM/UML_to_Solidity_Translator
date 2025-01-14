pragma solidity 0.7.2;

//package java.lang


import "java/io/ObjectStreamField.sol";

import "java/io/UnsupportedEncodingException.sol";

import "java/nio/charset/Charset.sol";

import "java/util/ArrayList.sol";

import "java/util/Arrays.sol";

import "java/util/Comparator.sol";

import "java/util/Formatter.sol";

import "java/util/Locale.sol";

import "java/util/regex/Matcher.sol";

import "java/util/regex/Pattern.sol";

import "java/util/regex/PatternSyntaxException.sol";

contract String
{
	// Default to 0

	int32 private  hash;

	/**
 * use serialVersionUID from JDK 1.0.2 for interoperability
 */

	int64 static  immutable serialVersionUID

	

	/**
 * Returns the length of this string.
 * The length is equal to the number of <a href="Character.html#unicode">Unicode
 * code units</a> in the string.
 *
 * @return  the length of the sequence of characters represented by this
 *          object.
 */

	function length() public returns(int32)
	{
			return value.length;
	}

	/**
 * Returns <tt>true</tt> if, and only if, {@link #length()} is <tt>0</tt>.
 *
 * @return <tt>true</tt> if {@link #length()} is <tt>0</tt>, otherwise
 * <tt>false</tt>
 *
 * @since 1.6
 */

	function isEmpty() public returns(bool)
	{
			return value.length == 0;
	}

	/**
 * Returns the <code>char</code> value at the
 * specified index. An index ranges from <code>0</code> to
 * <code>length() - 1</code>. The first <code>char</code> value of the sequence
 * is at index <code>0</code>, the next at index <code>1</code>,
 * and so on, as for array indexing.
 *
 * <p>If the <code>char</code> value specified by the index is a
 * <a href="Character.html#unicode">surrogate</a>, the surrogate
 * value is returned.
 *
 * @param      index   the index of the <code>char</code> value.
 * @return     the <code>char</code> value at the specified index of this string.
 *             The first <code>char</code> value is at index <code>0</code>.
 * @exception  IndexOutOfBoundsException  if the <code>index</code>
 *             argument is negative or not less than the length of this
 *             string.
 */

	function charAt(int32 index) public returns(byte)
	{
			if((index < 0) || (index >= value.length))
			{
			}
			return value[uint256(index)];
	}

	/**
 * Returns the character (Unicode code point) at the specified
 * index. The index refers to <code>char</code> values
 * (Unicode code units) and ranges from <code>0</code> to
 * {@link #length()}<code> - 1</code>.
 *
 * <p> If the <code>char</code> value specified at the given index
 * is in the high-surrogate range, the following index is less
 * than the length of this <code>String</code>, and the
 * <code>char</code> value at the following index is in the
 * low-surrogate range, then the supplementary code point
 * corresponding to this surrogate pair is returned. Otherwise,
 * the <code>char</code> value at the given index is returned.
 *
 * @param      index the index to the <code>char</code> values
 * @return     the code point value of the character at the
 *             <code>index</code>
 * @exception  IndexOutOfBoundsException  if the <code>index</code>
 *             argument is negative or not less than the length of this
 *             string.
 * @since      1.5
 */

	function codePointAt(int32 index) public returns(int32)
	{
			if((index < 0) || (index >= value.length))
			{
			}
			return 
	}

	/**
 * Returns the character (Unicode code point) before the specified
 * index. The index refers to <code>char</code> values
 * (Unicode code units) and ranges from <code>1</code> to {@link
 * CharSequence#length() length}.
 *
 * <p> If the <code>char</code> value at <code>(index - 1)</code>
 * is in the low-surrogate range, <code>(index - 2)</code> is not
 * negative, and the <code>char</code> value at <code>(index -
 * 2)</code> is in the high-surrogate range, then the
 * supplementary code point value of the surrogate pair is
 * returned. If the <code>char</code> value at <code>index -
 * 1</code> is an unpaired low-surrogate or a high-surrogate, the
 * surrogate value is returned.
 *
 * @param     index the index following the code point that should be returned
 * @return    the Unicode code point value before the given index.
 * @exception IndexOutOfBoundsException if the <code>index</code>
 *            argument is less than 1 or greater than the length
 *            of this string.
 * @since     1.5
 */

	function codePointBefore(int32 index) public returns(int32)
	{
			int32 i = int32(index - 1);
			if((i < 0) || (i >= value.length))
			{
			}
			return 
	}

	/**
 * Returns the number of Unicode code points in the specified text
 * range of this <code>String</code>. The text range begins at the
 * specified <code>beginIndex</code> and extends to the
 * <code>char</code> at index <code>endIndex - 1</code>. Thus the
 * length (in <code>char</code>s) of the text range is
 * <code>endIndex-beginIndex</code>. Unpaired surrogates within
 * the text range count as one code point each.
 *
 * @param beginIndex the index to the first <code>char</code> of
 * the text range.
 * @param endIndex the index after the last <code>char</code> of
 * the text range.
 * @return the number of Unicode code points in the specified text
 * range
 * @exception IndexOutOfBoundsException if the
 * <code>beginIndex</code> is negative, or <code>endIndex</code>
 * is larger than the length of this <code>String</code>, or
 * <code>beginIndex</code> is larger than <code>endIndex</code>.
 * @since  1.5
 */

	function codePointCount(int32 beginIndex, int32 endIndex) public returns(int32)
	{
			if(beginIndex < 0 || endIndex > value.length || beginIndex > endIndex)
			{
			}
			return 
	}

	/**
 * Returns the index within this <code>String</code> that is
 * offset from the given <code>index</code> by
 * <code>codePointOffset</code> code points. Unpaired surrogates
 * within the text range given by <code>index</code> and
 * <code>codePointOffset</code> count as one code point each.
 *
 * @param index the index to be offset
 * @param codePointOffset the offset in code points
 * @return the index within this <code>String</code>
 * @exception IndexOutOfBoundsException if <code>index</code>
 *   is negative or larger then the length of this
 *   <code>String</code>, or if <code>codePointOffset</code> is positive
 *   and the substring starting with <code>index</code> has fewer
 *   than <code>codePointOffset</code> code points,
 *   or if <code>codePointOffset</code> is negative and the substring
 *   before <code>index</code> has fewer than the absolute value
 *   of <code>codePointOffset</code> code points.
 * @since 1.5
 */

	function offsetByCodePoints(int32 index, int32 codePointOffset) public returns(int32)
	{
			if(index < 0 || index > value.length)
			{
			}
			return 
	}

	/**
 * Copy characters from this string into dst starting at dstBegin.
 * This method doesn't perform any range checking.
 */

	function getChars(byte[] memory dst, int32 dstBegin) internal
	{
	}

	/**
 * Copies characters from this string into the destination character
 * array.
 * <p>
 * The first character to be copied is at index <code>srcBegin</code>;
 * the last character to be copied is at index <code>srcEnd-1</code>
 * (thus the total number of characters to be copied is
 * <code>srcEnd-srcBegin</code>). The characters are copied into the
 * subarray of <code>dst</code> starting at index <code>dstBegin</code>
 * and ending at index:
 * <p><blockquote><pre>
 *     dstbegin + (srcEnd-srcBegin) - 1
 * </pre></blockquote>
 *
 * @param      srcBegin   index of the first character in the string
 *                        to copy.
 * @param      srcEnd     index after the last character in the string
 *                        to copy.
 * @param      dst        the destination array.
 * @param      dstBegin   the start offset in the destination array.
 * @exception IndexOutOfBoundsException If any of the following
 *            is true:
 *            <ul><li><code>srcBegin</code> is negative.
 *            <li><code>srcBegin</code> is greater than <code>srcEnd</code>
 *            <li><code>srcEnd</code> is greater than the length of this
 *                string
 *            <li><code>dstBegin</code> is negative
 *            <li><code>dstBegin+(srcEnd-srcBegin)</code> is larger than
 *                <code>dst.length</code></ul>
 */

	function getChars(int32 srcBegin, int32 srcEnd, byte[] memory dst, int32 dstBegin) public
	{
			if(srcBegin < 0)
			{
			}
			if(srcEnd > value.length)
			{
			}
			if(srcBegin > srcEnd)
			{
			}
	}

	/**
 * Copies characters from this string into the destination byte array. Each
 * byte receives the 8 low-order bits of the corresponding character. The
 * eight high-order bits of each character are not copied and do not
 * participate in the transfer in any way.
 *
 * <p> The first character to be copied is at index {@code srcBegin}; the
 * last character to be copied is at index {@code srcEnd-1}.  The total
 * number of characters to be copied is {@code srcEnd-srcBegin}. The
 * characters, converted to bytes, are copied into the subarray of {@code
 * dst} starting at index {@code dstBegin} and ending at index:
 *
 * <blockquote><pre>
 *     dstbegin + (srcEnd-srcBegin) - 1
 * </pre></blockquote>
 *
 * @deprecated  This method does not properly convert characters into
 * bytes.  As of JDK&nbsp;1.1, the preferred way to do this is via the
 * {@link #getBytes()} method, which uses the platform's default charset.
 *
 * @param  srcBegin
 *         Index of the first character in the string to copy
 *
 * @param  srcEnd
 *         Index after the last character in the string to copy
 *
 * @param  dst
 *         The destination array
 *
 * @param  dstBegin
 *         The start offset in the destination array
 *
 * @throws  IndexOutOfBoundsException
 *          If any of the following is true:
 *          <ul>
 *            <li> {@code srcBegin} is negative
 *            <li> {@code srcBegin} is greater than {@code srcEnd}
 *            <li> {@code srcEnd} is greater than the length of this String
 *            <li> {@code dstBegin} is negative
 *            <li> {@code dstBegin+(srcEnd-srcBegin)} is larger than {@code
 *                 dst.length}
 *          </ul>
 */

	function getBytes(int32 srcBegin, int32 srcEnd, int8[] memory dst, int32 dstBegin) public
	{
			if(srcBegin < 0)
			{
			}
			if(srcEnd > value.length)
			{
			}
			if(srcBegin > srcEnd)
			{
			}
			int32 j = int32(dstBegin);
			int32 n = int32(srcEnd);
			int32 i = int32(srcBegin);
			while(i < n)
			{
					dst[uint256(j++;)] = int8(val[uint256(i++;)])

			}
	}

	/**
 * Encodes this {@code String} into a sequence of bytes using the named
 * charset, storing the result into a new byte array.
 *
 * <p> The behavior of this method when this string cannot be encoded in
 * the given charset is unspecified.  The {@link
 * java.nio.charset.CharsetEncoder} class should be used when more control
 * over the encoding process is required.
 *
 * @param  charsetName
 *         The name of a supported {@linkplain java.nio.charset.Charset
 *         charset}
 *
 * @return  The resultant byte array
 *
 * @throws  UnsupportedEncodingException
 *          If the named charset is not supported
 *
 * @since  JDK1.1
 */

	function getBytes(string charsetName) public returns(

	/**
 * Encodes this {@code String} into a sequence of bytes using the given
 * {@linkplain java.nio.charset.Charset charset}, storing the result into a
 * new byte array.
 *
 * <p> This method always replaces malformed-input and unmappable-character
 * sequences with this charset's default replacement byte array.  The
 * {@link java.nio.charset.CharsetEncoder} class should be used when more
 * control over the encoding process is required.
 *
 * @param  charset
 *         The {@linkplain java.nio.charset.Charset} to be used to encode
 *         the {@code String}
 *
 * @return  The resultant byte array
 *
 * @since  1.6
 */

	function getBytes(Charset charset) public returns(

	/**
 * Encodes this {@code String} into a sequence of bytes using the
 * platform's default charset, storing the result into a new byte array.
 *
 * <p> The behavior of this method when this string cannot be encoded in
 * the default charset is unspecified.  The {@link
 * java.nio.charset.CharsetEncoder} class should be used when more control
 * over the encoding process is required.
 *
 * @return  The resultant byte array
 *
 * @since      JDK1.1
 */

	function getBytes() public returns(

	/**
 * Compares this string to the specified object.  The result is {@code
 * true} if and only if the argument is not {@code null} and is a {@code
 * String} object that represents the same sequence of characters as this
 * object.
 *
 * @param  anObject
 *         The object to compare this {@code String} against
 *
 * @return  {@code true} if the given object represents a {@code String}
 *          equivalent to this string, {@code false} otherwise
 *
 * @see  #compareTo(String)
 * @see  #equalsIgnoreCase(String)
 */

	function equals(Object anObject) public returns(bool)
	{
			if()
			{
					return true;
			}
			return false;
	}

	/**
 * Compares this string to the specified {@code StringBuffer}.  The result
 * is {@code true} if and only if this {@code String} represents the same
 * sequence of characters as the specified {@code StringBuffer}.
 *
 * @param  sb
 *         The {@code StringBuffer} to compare this {@code String} against
 *
 * @return  {@code true} if this {@code String} represents the same
 *          sequence of characters as the specified {@code StringBuffer},
 *          {@code false} otherwise
 *
 * @since  1.4
 */

	function contentEquals(StringBuffer sb) public returns(bool)
	{
	}

	/**
 * Compares this string to the specified {@code CharSequence}.  The result
 * is {@code true} if and only if this {@code String} represents the same
 * sequence of char values as the specified sequence.
 *
 * @param  cs
 *         The sequence to compare this {@code String} against
 *
 * @return  {@code true} if this {@code String} represents the same
 *          sequence of char values as the specified sequence, {@code
 *          false} otherwise
 *
 * @since  1.5
 */

	function contentEquals(CharSequence cs) public returns(bool)
	{
			if(value.length != .length());
			int32 i = int32(0);
			int32 n = int32(value.length);
			while(n--; != 0)
			{
					if(v1[uint256(i)] != .charAt(i));
					i++;

			}
			return true;
	}

	/**
 * Compares this {@code String} to another {@code String}, ignoring case
 * considerations.  Two strings are considered equal ignoring case if they
 * are of the same length and corresponding characters in the two strings
 * are equal ignoring case.
 *
 * <p> Two characters {@code c1} and {@code c2} are considered the same
 * ignoring case if at least one of the following is true:
 * <ul>
 *   <li> The two characters are the same (as compared by the
 *        {@code ==} operator)
 *   <li> Applying the method {@link
 *        java.lang.Character#toUpperCase(char)} to each character
 *        produces the same result
 *   <li> Applying the method {@link
 *        java.lang.Character#toLowerCase(char)} to each character
 *        produces the same result
 * </ul>
 *
 * @param  anotherString
 *         The {@code String} to compare this {@code String} against
 *
 * @return  {@code true} if the argument is not {@code null} and it
 *          represents an equivalent {@code String} ignoring case; {@code
 *          false} otherwise
 *
 * @see  #equals(Object)
 */

	function equalsIgnoreCase(string anotherString) public returns(bool)
	{
			return () ?  : true;
	}

	/**
 * Compares two strings lexicographically.
 * The comparison is based on the Unicode value of each character in
 * the strings. The character sequence represented by this
 * <code>String</code> object is compared lexicographically to the
 * character sequence represented by the argument string. The result is
 * a negative integer if this <code>String</code> object
 * lexicographically precedes the argument string. The result is a
 * positive integer if this <code>String</code> object lexicographically
 * follows the argument string. The result is zero if the strings
 * are equal; <code>compareTo</code> returns <code>0</code> exactly when
 * the {@link #equals(Object)} method would return <code>true</code>.
 * <p>
 * This is the definition of lexicographic ordering. If two strings are
 * different, then either they have different characters at some index
 * that is a valid index for both strings, or their lengths are different,
 * or both. If they have different characters at one or more index
 * positions, let <i>k</i> be the smallest such index; then the string
 * whose character at position <i>k</i> has the smaller value, as
 * determined by using the &lt; operator, lexicographically precedes the
 * other string. In this case, <code>compareTo</code> returns the
 * difference of the two character values at position <code>k</code> in
 * the two string -- that is, the value:
 * <blockquote><pre>
 * this.charAt(k)-anotherString.charAt(k)
 * </pre></blockquote>
 * If there is no index position at which they differ, then the shorter
 * string lexicographically precedes the longer string. In this case,
 * <code>compareTo</code> returns the difference of the lengths of the
 * strings -- that is, the value:
 * <blockquote><pre>
 * this.length()-anotherString.length()
 * </pre></blockquote>
 *
 * @param   anotherString   the <code>String</code> to be compared.
 * @return  the value <code>0</code> if the argument string is equal to
 *          this string; a value less than <code>0</code> if this string
 *          is lexicographically less than the string argument; and a
 *          value greater than <code>0</code> if this string is
 *          lexicographically greater than the string argument.
 */

	function compareTo(string anotherString) public returns(int32)
	{
			int32 len1 = int32(value.length);
			int32 len2 = int32(anotherString.value.length);
			int32 lim = int32(IntegerCache_Library.min(len1, len2));
			int32 k = int32(0);
			while(k < lim)
			{
					byte c1 = byte(v1[uint256(k)]);
					byte c2 = byte(v2[uint256(k)]);
					if(c1 != c2)
					{
							return c1 - c2;
					}
					k++;

			}
			return len1 - len2;
	}

	/**
 * A Comparator that orders <code>String</code> objects as by
 * <code>compareToIgnoreCase</code>. This comparator is serializable.
 * <p>
 * Note that this Comparator does <em>not</em> take locale into account,
 * and will result in an unsatisfactory ordering for certain locales.
 * The java.text package provides <em>Collators</em> to allow
 * locale-sensitive ordering.
 *
 * @see     java.text.Collator#compare(String, String)
 * @since   1.2
 */

	Comparator static  immutable CASE_INSENSITIVE_ORDER;

	/**
 * Compares two strings lexicographically, ignoring case
 * differences. This method returns an integer whose sign is that of
 * calling <code>compareTo</code> with normalized versions of the strings
 * where case differences have been eliminated by calling
 * <code>Character.toLowerCase(Character.toUpperCase(character))</code> on
 * each character.
 * <p>
 * Note that this method does <em>not</em> take locale into account,
 * and will result in an unsatisfactory ordering for certain locales.
 * The java.text package provides <em>collators</em> to allow
 * locale-sensitive ordering.
 *
 * @param   str   the <code>String</code> to be compared.
 * @return  a negative integer, zero, or a positive integer as the
 *          specified String is greater than, equal to, or less
 *          than this String, ignoring case considerations.
 * @see     java.text.Collator#compare(String, String)
 * @since   1.2
 */

	function compareToIgnoreCase(string str) public returns(int32)
	{
			return 
	}

	/**
 * Tests if two string regions are equal.
 * <p>
 * A substring of this <tt>String</tt> object is compared to a substring
 * of the argument other. The result is true if these substrings
 * represent identical character sequences. The substring of this
 * <tt>String</tt> object to be compared begins at index <tt>toffset</tt>
 * and has length <tt>len</tt>. The substring of other to be compared
 * begins at index <tt>ooffset</tt> and has length <tt>len</tt>. The
 * result is <tt>false</tt> if and only if at least one of the following
 * is true:
 * <ul><li><tt>toffset</tt> is negative.
 * <li><tt>ooffset</tt> is negative.
 * <li><tt>toffset+len</tt> is greater than the length of this
 * <tt>String</tt> object.
 * <li><tt>ooffset+len</tt> is greater than the length of the other
 * argument.
 * <li>There is some nonnegative integer <i>k</i> less than <tt>len</tt>
 * such that:
 * <tt>this.charAt(toffset+<i>k</i>)&nbsp;!=&nbsp;other.charAt(ooffset+<i>k</i>)</tt>
 * </ul>
 *
 * @param   toffset   the starting offset of the subregion in this string.
 * @param   other     the string argument.
 * @param   ooffset   the starting offset of the subregion in the string
 *                    argument.
 * @param   len       the number of characters to compare.
 * @return  <code>true</code> if the specified subregion of this string
 *          exactly matches the specified subregion of the string argument;
 *          <code>false</code> otherwise.
 */

	function regionMatches(int32 toffset, string other, int32 ooffset, int32 len) public returns(bool)
	{
			int32 to = int32(toffset);
			int32 po = int32(ooffset);
			// Note: toffset, ooffset, or len might be near -1>>>1.

			if((ooffset < 0) || (toffset < 0) || (toffset > int64(value.length) - len) || (ooffset > int64(other.value.length) - len))
			{
					return false;
			}
			while(len--; > 0)
			{
					if(ta[uint256(to++;)] != pa[uint256(po++;)])
					{
							return false;
					}

			}
			return true;
	}

	/**
 * Tests if two string regions are equal.
 * <p>
 * A substring of this <tt>String</tt> object is compared to a substring
 * of the argument <tt>other</tt>. The result is <tt>true</tt> if these
 * substrings represent character sequences that are the same, ignoring
 * case if and only if <tt>ignoreCase</tt> is true. The substring of
 * this <tt>String</tt> object to be compared begins at index
 * <tt>toffset</tt> and has length <tt>len</tt>. The substring of
 * <tt>other</tt> to be compared begins at index <tt>ooffset</tt> and
 * has length <tt>len</tt>. The result is <tt>false</tt> if and only if
 * at least one of the following is true:
 * <ul><li><tt>toffset</tt> is negative.
 * <li><tt>ooffset</tt> is negative.
 * <li><tt>toffset+len</tt> is greater than the length of this
 * <tt>String</tt> object.
 * <li><tt>ooffset+len</tt> is greater than the length of the other
 * argument.
 * <li><tt>ignoreCase</tt> is <tt>false</tt> and there is some nonnegative
 * integer <i>k</i> less than <tt>len</tt> such that:
 * <blockquote><pre>
 * this.charAt(toffset+k) != other.charAt(ooffset+k)
 * </pre></blockquote>
 * <li><tt>ignoreCase</tt> is <tt>true</tt> and there is some nonnegative
 * integer <i>k</i> less than <tt>len</tt> such that:
 * <blockquote><pre>
 * Character.toLowerCase(this.charAt(toffset+k)) !=
 *     Character.toLowerCase(other.charAt(ooffset+k))
 * </pre></blockquote>
 * and:
 * <blockquote><pre>
 * Character.toUpperCase(this.charAt(toffset+k)) !=
 *         Character.toUpperCase(other.charAt(ooffset+k))
 * </pre></blockquote>
 * </ul>
 *
 * @param   ignoreCase   if <code>true</code>, ignore case when comparing
 *                       characters.
 * @param   toffset      the starting offset of the subregion in this
 *                       string.
 * @param   other        the string argument.
 * @param   ooffset      the starting offset of the subregion in the string
 *                       argument.
 * @param   len          the number of characters to compare.
 * @return  <code>true</code> if the specified subregion of this string
 *          matches the specified subregion of the string argument;
 *          <code>false</code> otherwise. Whether the matching is exact
 *          or case insensitive depends on the <code>ignoreCase</code>
 *          argument.
 */

	function regionMatches(bool ignoreCase, int32 toffset, string other, int32 ooffset, int32 len) public returns(bool)
	{
			int32 to = int32(toffset);
			int32 po = int32(ooffset);
			// Note: toffset, ooffset, or len might be near -1>>>1.

			if((ooffset < 0) || (toffset < 0) || (toffset > int64(value.length) - len) || (ooffset > int64(other.value.length) - len))
			{
					return false;
			}
			while(len--; > 0)
			{
					byte c1 = byte(ta[uint256(to++;))
					byte c2 = byte(pa[uint256(po++;))
					if(c1 == c2)
					{
							continue;
					}
					if(ignoreCase)
					{
							// continue.

							byte u1 = byte(.toUpperCase(c1));
							byte u2 = byte(.toUpperCase(c2));
							if(u1 == u2)
							{
									continue;
							}
							// exiting.

							if(.toLowerCase(u1) == .toLowerCase(u2))
							{
									continue;
							}
					}
					return false;

			}
			return true;
	}

	/**
 * Tests if the substring of this string beginning at the
 * specified index starts with the specified prefix.
 *
 * @param   prefix    the prefix.
 * @param   toffset   where to begin looking in this string.
 * @return  <code>true</code> if the character sequence represented by the
 *          argument is a prefix of the substring of this object starting
 *          at index <code>toffset</code>; <code>false</code> otherwise.
 *          The result is <code>false</code> if <code>toffset</code> is
 *          negative or greater than the length of this
 *          <code>String</code> object; otherwise the result is the same
 *          as the result of the expression
 *          <pre>
 *          this.substring(toffset).startsWith(prefix)
 *          </pre>
 */

	function startsWith(string prefix, int32 toffset) public returns(bool)
	{
			int32 to = int32(toffset);
			int32 po = int32(0);
			int32 pc = int32(prefix.value.length);
			// Note: toffset might be near -1>>>1.

			if((toffset < 0) || (toffset > value.length - pc))
			{
					return false;
			}
			while(--pc; >= 0)
			{
					if(ta[uint256(to++;)] != pa[uint256(po++;)])
					{
							return false;
					}

			}
			return true;
	}

	/**
 * Tests if this string starts with the specified prefix.
 *
 * @param   prefix   the prefix.
 * @return  <code>true</code> if the character sequence represented by the
 *          argument is a prefix of the character sequence represented by
 *          this string; <code>false</code> otherwise.
 *          Note also that <code>true</code> will be returned if the
 *          argument is an empty string or is equal to this
 *          <code>String</code> object as determined by the
 *          {@link #equals(Object)} method.
 * @since   1. 0
 */

	function startsWith(string prefix) public returns(bool)
	{
			return 
	}

	/**
 * Tests if this string ends with the specified suffix.
 *
 * @param   suffix   the suffix.
 * @return  <code>true</code> if the character sequence represented by the
 *          argument is a suffix of the character sequence represented by
 *          this object; <code>false</code> otherwise. Note that the
 *          result will be <code>true</code> if the argument is the
 *          empty string or is equal to this <code>String</code> object
 *          as determined by the {@link #equals(Object)} method.
 */

	function endsWith(string suffix) public returns(bool)
	{
			return 
	}

	/**
 * Returns a hash code for this string. The hash code for a
 * <code>String</code> object is computed as
 * <blockquote><pre>
 * s[0]*31^(n-1) + s[1]*31^(n-2) + ... + s[n-1]
 * </pre></blockquote>
 * using <code>int</code> arithmetic, where <code>s[i]</code> is the
 * <i>i</i>th character of the string, <code>n</code> is the length of
 * the string, and <code>^</code> indicates exponentiation.
 * (The hash value of the empty string is zero.)
 *
 * @return  a hash code value for this object.
 */

	function hashCode() public returns(int32)
	{
			int32 h = int32(hash);
			if(h == 0 && value.length > 0)
			{
					for(int32 i = int32(0); i < value.length; i++)
					{
							h = 31 * h + val[uint256(i)];
					}
					hash = h;
			}
			return h;
	}

	/**
 * Returns the index within this string of the first occurrence of
 * the specified character. If a character with value
 * <code>ch</code> occurs in the character sequence represented by
 * this <code>String</code> object, then the index (in Unicode
 * code units) of the first such occurrence is returned. For
 * values of <code>ch</code> in the range from 0 to 0xFFFF
 * (inclusive), this is the smallest value <i>k</i> such that:
 * <blockquote><pre>
 * this.charAt(<i>k</i>) == ch
 * </pre></blockquote>
 * is true. For other values of <code>ch</code>, it is the
 * smallest value <i>k</i> such that:
 * <blockquote><pre>
 * this.codePointAt(<i>k</i>) == ch
 * </pre></blockquote>
 * is true. In either case, if no such character occurs in this
 * string, then <code>-1</code> is returned.
 *
 * @param   ch   a character (Unicode code point).
 * @return  the index of the first occurrence of the character in the
 *          character sequence represented by this object, or
 *          <code>-1</code> if the character does not occur.
 */

	function indexOf(int32 ch) public returns(int32)
	{
			return 
	}

	/**
 * Returns the index within this string of the first occurrence of the
 * specified character, starting the search at the specified index.
 * <p>
 * If a character with value <code>ch</code> occurs in the
 * character sequence represented by this <code>String</code>
 * object at an index no smaller than <code>fromIndex</code>, then
 * the index of the first such occurrence is returned. For values
 * of <code>ch</code> in the range from 0 to 0xFFFF (inclusive),
 * this is the smallest value <i>k</i> such that:
 * <blockquote><pre>
 * (this.charAt(<i>k</i>) == ch) && (<i>k</i> &gt;= fromIndex)
 * </pre></blockquote>
 * is true. For other values of <code>ch</code>, it is the
 * smallest value <i>k</i> such that:
 * <blockquote><pre>
 * (this.codePointAt(<i>k</i>) == ch) && (<i>k</i> &gt;= fromIndex)
 * </pre></blockquote>
 * is true. In either case, if no such character occurs in this
 * string at or after position <code>fromIndex</code>, then
 * <code>-1</code> is returned.
 *
 * <p>
 * There is no restriction on the value of <code>fromIndex</code>. If it
 * is negative, it has the same effect as if it were zero: this entire
 * string may be searched. If it is greater than the length of this
 * string, it has the same effect as if it were equal to the length of
 * this string: <code>-1</code> is returned.
 *
 * <p>All indices are specified in <code>char</code> values
 * (Unicode code units).
 *
 * @param   ch          a character (Unicode code point).
 * @param   fromIndex   the index to start the search from.
 * @return  the index of the first occurrence of the character in the
 *          character sequence represented by this object that is greater
 *          than or equal to <code>fromIndex</code>, or <code>-1</code>
 *          if the character does not occur.
 */

	function indexOf(int32 ch, int32 fromIndex) public returns(int32)
	{
			int32 max = int32(value.length);
			if(fromIndex < 0)
			{
					fromIndex = 0;
			}
			else
			{
				if(fromIndex >= max)
				{
						// Note: fromIndex might be near -1>>>1.

						return -1;
				}			}

			if(ch < Character.MIN_SUPPLEMENTARY_CODE_POINT)
			{
					for(int32 i = int32(fromIndex); i < max; i++)
					{
							if(value[uint256(i)] == ch)
							{
									return i;
							}
					}
					return -1;
			}
			else
			{
					return 
			}

	}

	/**
 * Handles (rare) calls of indexOf with a supplementary character.
 */

	function indexOfSupplementary(int32 ch, int32 fromIndex) private returns(int32)
	{
			return -1;
	}

	/**
 * Returns the index within this string of the last occurrence of
 * the specified character. For values of <code>ch</code> in the
 * range from 0 to 0xFFFF (inclusive), the index (in Unicode code
 * units) returned is the largest value <i>k</i> such that:
 * <blockquote><pre>
 * this.charAt(<i>k</i>) == ch
 * </pre></blockquote>
 * is true. For other values of <code>ch</code>, it is the
 * largest value <i>k</i> such that:
 * <blockquote><pre>
 * this.codePointAt(<i>k</i>) == ch
 * </pre></blockquote>
 * is true.  In either case, if no such character occurs in this
 * string, then <code>-1</code> is returned.  The
 * <code>String</code> is searched backwards starting at the last
 * character.
 *
 * @param   ch   a character (Unicode code point).
 * @return  the index of the last occurrence of the character in the
 *          character sequence represented by this object, or
 *          <code>-1</code> if the character does not occur.
 */

	function lastIndexOf(int32 ch) public returns(int32)
	{
			return 
	}

	/**
 * Returns the index within this string of the last occurrence of
 * the specified character, searching backward starting at the
 * specified index. For values of <code>ch</code> in the range
 * from 0 to 0xFFFF (inclusive), the index returned is the largest
 * value <i>k</i> such that:
 * <blockquote><pre>
 * (this.charAt(<i>k</i>) == ch) && (<i>k</i> &lt;= fromIndex)
 * </pre></blockquote>
 * is true. For other values of <code>ch</code>, it is the
 * largest value <i>k</i> such that:
 * <blockquote><pre>
 * (this.codePointAt(<i>k</i>) == ch) && (<i>k</i> &lt;= fromIndex)
 * </pre></blockquote>
 * is true. In either case, if no such character occurs in this
 * string at or before position <code>fromIndex</code>, then
 * <code>-1</code> is returned.
 *
 * <p>All indices are specified in <code>char</code> values
 * (Unicode code units).
 *
 * @param   ch          a character (Unicode code point).
 * @param   fromIndex   the index to start the search from. There is no
 *          restriction on the value of <code>fromIndex</code>. If it is
 *          greater than or equal to the length of this string, it has
 *          the same effect as if it were equal to one less than the
 *          length of this string: this entire string may be searched.
 *          If it is negative, it has the same effect as if it were -1:
 *          -1 is returned.
 * @return  the index of the last occurrence of the character in the
 *          character sequence represented by this object that is less
 *          than or equal to <code>fromIndex</code>, or <code>-1</code>
 *          if the character does not occur before that point.
 */

	function lastIndexOf(int32 ch, int32 fromIndex) public returns(int32)
	{
			if(ch < Character.MIN_SUPPLEMENTARY_CODE_POINT)
			{
					int32 i;
					return -1;
			}
			else
			{
					return 
			}

	}

	/**
 * Handles (rare) calls of lastIndexOf with a supplementary character.
 */

	function lastIndexOfSupplementary(int32 ch, int32 fromIndex) private returns(int32)
	{
			return -1;
	}

	/**
 * Returns the index within this string of the first occurrence of the
 * specified substring.
 *
 * <p>The returned index is the smallest value <i>k</i> for which:
 * <blockquote><pre>
 * this.startsWith(str, <i>k</i>)
 * </pre></blockquote>
 * If no such value of <i>k</i> exists, then {@code -1} is returned.
 *
 * @param   str   the substring to search for.
 * @return  the index of the first occurrence of the specified substring,
 *          or {@code -1} if there is no such occurrence.
 */

	function indexOf(string str) public returns(int32)
	{
			return 
	}

	/**
 * Returns the index within this string of the first occurrence of the
 * specified substring, starting at the specified index.
 *
 * <p>The returned index is the smallest value <i>k</i> for which:
 * <blockquote><pre>
 * <i>k</i> &gt;= fromIndex && this.startsWith(str, <i>k</i>)
 * </pre></blockquote>
 * If no such value of <i>k</i> exists, then {@code -1} is returned.
 *
 * @param   str         the substring to search for.
 * @param   fromIndex   the index from which to start the search.
 * @return  the index of the first occurrence of the specified substring,
 *          starting at the specified index,
 *          or {@code -1} if there is no such occurrence.
 */

	function indexOf(string str, int32 fromIndex) public returns(int32)
	{
			return 
	}

	/**
 * Returns the index within this string of the last occurrence of the
 * specified substring.  The last occurrence of the empty string ""
 * is considered to occur at the index value {@code this.length()}.
 *
 * <p>The returned index is the largest value <i>k</i> for which:
 * <blockquote><pre>
 * this.startsWith(str, <i>k</i>)
 * </pre></blockquote>
 * If no such value of <i>k</i> exists, then {@code -1} is returned.
 *
 * @param   str   the substring to search for.
 * @return  the index of the last occurrence of the specified substring,
 *          or {@code -1} if there is no such occurrence.
 */

	function lastIndexOf(string str) public returns(int32)
	{
			return 
	}

	/**
 * Returns the index within this string of the last occurrence of the
 * specified substring, searching backward starting at the specified index.
 *
 * <p>The returned index is the largest value <i>k</i> for which:
 * <blockquote><pre>
 * <i>k</i> &lt;= fromIndex && this.startsWith(str, <i>k</i>)
 * </pre></blockquote>
 * If no such value of <i>k</i> exists, then {@code -1} is returned.
 *
 * @param   str         the substring to search for.
 * @param   fromIndex   the index to start the search from.
 * @return  the index of the last occurrence of the specified substring,
 *          searching backward from the specified index,
 *          or {@code -1} if there is no such occurrence.
 */

	function lastIndexOf(string str, int32 fromIndex) public returns(int32)
	{
			return 
	}

	/**
 * Returns a new string that is a substring of this string. The
 * substring begins with the character at the specified index and
 * extends to the end of this string. <p>
 * Examples:
 * <blockquote><pre>
 * "unhappy".substring(2) returns "happy"
 * "Harbison".substring(3) returns "bison"
 * "emptiness".substring(9) returns "" (an empty string)
 * </pre></blockquote>
 *
 * @param      beginIndex   the beginning index, inclusive.
 * @return     the specified substring.
 * @exception  IndexOutOfBoundsException  if
 *             <code>beginIndex</code> is negative or larger than the
 *             length of this <code>String</code> object.
 */

	function substring(int32 beginIndex) public returns(String)
	{
			if(beginIndex < 0)
			{
			}
			int32 subLen = int32(value.length - beginIndex);
			if(subLen < 0)
			{
			}
			return 
	}

	/**
 * Returns a new string that is a substring of this string. The
 * substring begins at the specified <code>beginIndex</code> and
 * extends to the character at index <code>endIndex - 1</code>.
 * Thus the length of the substring is <code>endIndex-beginIndex</code>.
 * <p>
 * Examples:
 * <blockquote><pre>
 * "hamburger".substring(4, 8) returns "urge"
 * "smiles".substring(1, 5) returns "mile"
 * </pre></blockquote>
 *
 * @param      beginIndex   the beginning index, inclusive.
 * @param      endIndex     the ending index, exclusive.
 * @return     the specified substring.
 * @exception  IndexOutOfBoundsException  if the
 *             <code>beginIndex</code> is negative, or
 *             <code>endIndex</code> is larger than the length of
 *             this <code>String</code> object, or
 *             <code>beginIndex</code> is larger than
 *             <code>endIndex</code>.
 */

	function substring(int32 beginIndex, int32 endIndex) public returns(String)
	{
			if(beginIndex < 0)
			{
			}
			if(endIndex > value.length)
			{
			}
			int32 subLen = int32(endIndex - beginIndex);
			if(subLen < 0)
			{
			}
			return 
	}

	/**
 * Returns a new character sequence that is a subsequence of this sequence.
 *
 * <p> An invocation of this method of the form
 *
 * <blockquote><pre>
 * str.subSequence(begin,&nbsp;end)</pre></blockquote>
 *
 * behaves in exactly the same way as the invocation
 *
 * <blockquote><pre>
 * str.substring(begin,&nbsp;end)</pre></blockquote>
 *
 * This method is defined so that the <tt>String</tt> class can implement
 * the {@link CharSequence} interface. </p>
 *
 * @param      beginIndex   the begin index, inclusive.
 * @param      endIndex     the end index, exclusive.
 * @return     the specified subsequence.
 *
 * @throws  IndexOutOfBoundsException
 *          if <tt>beginIndex</tt> or <tt>endIndex</tt> are negative,
 *          if <tt>endIndex</tt> is greater than <tt>length()</tt>,
 *          or if <tt>beginIndex</tt> is greater than <tt>startIndex</tt>
 *
 * @since 1.4
 * @spec JSR-51
 */

	function subSequence(int32 beginIndex, int32 endIndex) public returns(CharSequence)
	{
			return 
	}

	/**
 * Concatenates the specified string to the end of this string.
 * <p>
 * If the length of the argument string is <code>0</code>, then this
 * <code>String</code> object is returned. Otherwise, a new
 * <code>String</code> object is created, representing a character
 * sequence that is the concatenation of the character sequence
 * represented by this <code>String</code> object and the character
 * sequence represented by the argument string.<p>
 * Examples:
 * <blockquote><pre>
 * "cares".concat("s") returns "caress"
 * "to".concat("get").concat("her") returns "together"
 * </pre></blockquote>
 *
 * @param   str   the <code>String</code> that is concatenated to the end
 *                of this <code>String</code>.
 * @return  a string that represents the concatenation of this object's
 *          characters followed by the string argument's characters.
 */

	function concat(string str) public returns(String)
	{
			int32 otherLen = int32(.length());
			if(otherLen == 0)
			{
					return 
			}
			int32 len = int32(value.length);
			return 
	}

	/**
 * Returns a new string resulting from replacing all occurrences of
 * <code>oldChar</code> in this string with <code>newChar</code>.
 * <p>
 * If the character <code>oldChar</code> does not occur in the
 * character sequence represented by this <code>String</code> object,
 * then a reference to this <code>String</code> object is returned.
 * Otherwise, a new <code>String</code> object is created that
 * represents a character sequence identical to the character sequence
 * represented by this <code>String</code> object, except that every
 * occurrence of <code>oldChar</code> is replaced by an occurrence
 * of <code>newChar</code>.
 * <p>
 * Examples:
 * <blockquote><pre>
 * "mesquite in your cellar".replace('e', 'o')
 *         returns "mosquito in your collar"
 * "the war of baronets".replace('r', 'y')
 *         returns "the way of bayonets"
 * "sparring with a purple porpoise".replace('p', 't')
 *         returns "starring with a turtle tortoise"
 * "JonL".replace('q', 'x') returns "JonL" (no change)
 * </pre></blockquote>
 *
 * @param   oldChar   the old character.
 * @param   newChar   the new character.
 * @return  a string derived from this string by replacing every
 *          occurrence of <code>oldChar</code> with <code>newChar</code>.
 */

	function replace(byte oldChar, byte newChar) public returns(String)
	{
			if(oldChar != newChar)
			{
					int32 len = int32(value.length);
					int32 i = int32(-1);
					while(++i; < len)
					{
							if(val[uint256(i)] == oldChar)
							{
									break;
							}

					}
					if(i < len)
					{
							for(int32 j = int32(0); j < i; j++)
							{
									buf[uint256(j)] = val[uint256(j)];
							}
							while(i < len)
							{
									byte c = byte(val[uint256(i)]);
									buf[uint256(i)] = (c == oldChar) ? c : newChar;
									i++;

							}
							return 
					}
			}
			return 
	}

	/**
 * Tells whether or not this string matches the given <a
 * href="../util/regex/Pattern.html#sum">regular expression</a>.
 *
 * <p> An invocation of this method of the form
 * <i>str</i><tt>.matches(</tt><i>regex</i><tt>)</tt> yields exactly the
 * same result as the expression
 *
 * <blockquote><tt> {@link java.util.regex.Pattern}.{@link
 * java.util.regex.Pattern#matches(String,CharSequence)
 * matches}(</tt><i>regex</i><tt>,</tt> <i>str</i><tt>)</tt></blockquote>
 *
 * @param   regex
 *          the regular expression to which this string is to be matched
 *
 * @return  <tt>true</tt> if, and only if, this string matches the
 *          given regular expression
 *
 * @throws  PatternSyntaxException
 *          if the regular expression's syntax is invalid
 *
 * @see java.util.regex.Pattern
 *
 * @since 1.4
 * @spec JSR-51
 */

	function matches(string regex) public returns(bool)
	{
			return 
	}

	/**
 * Returns true if and only if this string contains the specified
 * sequence of char values.
 *
 * @param s the sequence to search for
 * @return true if this string contains <code>s</code>, false otherwise
 * @throws NullPointerException if <code>s</code> is <code>null</code>
 * @since 1.5
 */

	function contains(CharSequence s) public returns(bool)
	{
			return indexOf(.toString()) > -1;
	}

	/**
 *  Replaces the first substring of this string that matches the given <a
 *  href="../util/regex/Pattern.html#sum">regular expression</a> with the
 *  given replacement.
 *
 *  <p> An invocation of this method of the form
 *  <i>str</i><tt>.replaceFirst(</tt><i>regex</i><tt>,</tt> <i>repl</i><tt>)</tt>
 *  yields exactly the same result as the expression
 *
 *  <blockquote><tt>
 *  {@link java.util.regex.Pattern}.{@link java.util.regex.Pattern#compile
 *  compile}(</tt><i>regex</i><tt>).{@link
 *  java.util.regex.Pattern#matcher(java.lang.CharSequence)
 *  matcher}(</tt><i>str</i><tt>).{@link java.util.regex.Matcher#replaceFirst
 *  replaceFirst}(</tt><i>repl</i><tt>)</tt></blockquote>
 *
 * <p>
 *  Note that backslashes (<tt>\</tt>) and dollar signs (<tt>$</tt>) in the
 *  replacement string may cause the results to be different than if it were
 *  being treated as a literal replacement string; see
 *  {@link java.util.regex.Matcher#replaceFirst}.
 *  Use {@link java.util.regex.Matcher#quoteReplacement} to suppress the special
 *  meaning of these characters, if desired.
 *
 *  @param   regex
 *           the regular expression to which this string is to be matched
 *  @param   replacement
 *           the string to be substituted for the first match
 *
 *  @return  The resulting <tt>String</tt>
 *
 *  @throws  PatternSyntaxException
 *           if the regular expression's syntax is invalid
 *
 *  @see java.util.regex.Pattern
 *
 *  @since 1.4
 *  @spec JSR-51
 */

	function replaceFirst(string regex, string replacement) public returns(String)
	{
			return 
	}

	/**
 *  Replaces each substring of this string that matches the given <a
 *  href="../util/regex/Pattern.html#sum">regular expression</a> with the
 *  given replacement.
 *
 *  <p> An invocation of this method of the form
 *  <i>str</i><tt>.replaceAll(</tt><i>regex</i><tt>,</tt> <i>repl</i><tt>)</tt>
 *  yields exactly the same result as the expression
 *
 *  <blockquote><tt>
 *  {@link java.util.regex.Pattern}.{@link java.util.regex.Pattern#compile
 *  compile}(</tt><i>regex</i><tt>).{@link
 *  java.util.regex.Pattern#matcher(java.lang.CharSequence)
 *  matcher}(</tt><i>str</i><tt>).{@link java.util.regex.Matcher#replaceAll
 *  replaceAll}(</tt><i>repl</i><tt>)</tt></blockquote>
 *
 * <p>
 *  Note that backslashes (<tt>\</tt>) and dollar signs (<tt>$</tt>) in the
 *  replacement string may cause the results to be different than if it were
 *  being treated as a literal replacement string; see
 *  {@link java.util.regex.Matcher#replaceAll Matcher.replaceAll}.
 *  Use {@link java.util.regex.Matcher#quoteReplacement} to suppress the special
 *  meaning of these characters, if desired.
 *
 *  @param   regex
 *           the regular expression to which this string is to be matched
 *  @param   replacement
 *           the string to be substituted for each match
 *
 *  @return  The resulting <tt>String</tt>
 *
 *  @throws  PatternSyntaxException
 *           if the regular expression's syntax is invalid
 *
 *  @see java.util.regex.Pattern
 *
 *  @since 1.4
 *  @spec JSR-51
 */

	function replaceAll(string regex, string replacement) public returns(String)
	{
			return 
	}

	/**
 * Replaces each substring of this string that matches the literal target
 * sequence with the specified literal replacement sequence. The
 * replacement proceeds from the beginning of the string to the end, for
 * example, replacing "aa" with "b" in the string "aaa" will result in
 * "ba" rather than "ab".
 *
 * @param  target The sequence of char values to be replaced
 * @param  replacement The replacement sequence of char values
 * @return  The resulting string
 * @throws NullPointerException if <code>target</code> or
 *         <code>replacement</code> is <code>null</code>.
 * @since 1.5
 */

	function replace(CharSequence target, CharSequence replacement) public returns(String)
	{
			return 
	}

	/**
 * Splits this string around matches of the given
 * <a href="../util/regex/Pattern.html#sum">regular expression</a>.
 *
 * <p> The array returned by this method contains each substring of this
 * string that is terminated by another substring that matches the given
 * expression or is terminated by the end of the string.  The substrings in
 * the array are in the order in which they occur in this string.  If the
 * expression does not match any part of the input then the resulting array
 * has just one element, namely this string.
 *
 * <p> The <tt>limit</tt> parameter controls the number of times the
 * pattern is applied and therefore affects the length of the resulting
 * array.  If the limit <i>n</i> is greater than zero then the pattern
 * will be applied at most <i>n</i>&nbsp;-&nbsp;1 times, the array's
 * length will be no greater than <i>n</i>, and the array's last entry
 * will contain all input beyond the last matched delimiter.  If <i>n</i>
 * is non-positive then the pattern will be applied as many times as
 * possible and the array can have any length.  If <i>n</i> is zero then
 * the pattern will be applied as many times as possible, the array can
 * have any length, and trailing empty strings will be discarded.
 *
 * <p> The string <tt>"boo:and:foo"</tt>, for example, yields the
 * following results with these parameters:
 *
 * <blockquote><table cellpadding=1 cellspacing=0 summary="Split example showing regex, limit, and result">
 * <tr>
 *     <th>Regex</th>
 *     <th>Limit</th>
 *     <th>Result</th>
 * </tr>
 * <tr><td align=center>:</td>
 *     <td align=center>2</td>
 *     <td><tt>{ "boo", "and:foo" }</tt></td></tr>
 * <tr><td align=center>:</td>
 *     <td align=center>5</td>
 *     <td><tt>{ "boo", "and", "foo" }</tt></td></tr>
 * <tr><td align=center>:</td>
 *     <td align=center>-2</td>
 *     <td><tt>{ "boo", "and", "foo" }</tt></td></tr>
 * <tr><td align=center>o</td>
 *     <td align=center>5</td>
 *     <td><tt>{ "b", "", ":and:f", "", "" }</tt></td></tr>
 * <tr><td align=center>o</td>
 *     <td align=center>-2</td>
 *     <td><tt>{ "b", "", ":and:f", "", "" }</tt></td></tr>
 * <tr><td align=center>o</td>
 *     <td align=center>0</td>
 *     <td><tt>{ "b", "", ":and:f" }</tt></td></tr>
 * </table></blockquote>
 *
 * <p> An invocation of this method of the form
 * <i>str.</i><tt>split(</tt><i>regex</i><tt>,</tt>&nbsp;<i>n</i><tt>)</tt>
 * yields the same result as the expression
 *
 * <blockquote>
 * {@link java.util.regex.Pattern}.{@link java.util.regex.Pattern#compile
 * compile}<tt>(</tt><i>regex</i><tt>)</tt>.{@link
 * java.util.regex.Pattern#split(java.lang.CharSequence,int)
 * split}<tt>(</tt><i>str</i><tt>,</tt>&nbsp;<i>n</i><tt>)</tt>
 * </blockquote>
 *
 * @param  regex
 *         the delimiting regular expression
 *
 * @param  limit
 *         the result threshold, as described above
 *
 * @return  the array of strings computed by splitting this string
 *          around matches of the given regular expression
 *
 * @throws  PatternSyntaxException
 *          if the regular expression's syntax is invalid
 *
 * @see java.util.regex.Pattern
 *
 * @since 1.4
 * @spec JSR-51
 */

	function split(string regex, int32 limit) public returns(

	/**
 * Splits this string around matches of the given <a
 * href="../util/regex/Pattern.html#sum">regular expression</a>.
 *
 * <p> This method works as if by invoking the two-argument {@link
 * #split(String, int) split} method with the given expression and a limit
 * argument of zero.  Trailing empty strings are therefore not included in
 * the resulting array.
 *
 * <p> The string <tt>"boo:and:foo"</tt>, for example, yields the following
 * results with these expressions:
 *
 * <blockquote><table cellpadding=1 cellspacing=0 summary="Split examples showing regex and result">
 * <tr>
 *  <th>Regex</th>
 *  <th>Result</th>
 * </tr>
 * <tr><td align=center>:</td>
 *     <td><tt>{ "boo", "and", "foo" }</tt></td></tr>
 * <tr><td align=center>o</td>
 *     <td><tt>{ "b", "", ":and:f" }</tt></td></tr>
 * </table></blockquote>
 *
 * @param  regex
 *         the delimiting regular expression
 *
 * @return  the array of strings computed by splitting this string
 *          around matches of the given regular expression
 *
 * @throws  PatternSyntaxException
 *          if the regular expression's syntax is invalid
 *
 * @see java.util.regex.Pattern
 *
 * @since 1.4
 * @spec JSR-51
 */

	function split(string regex) public returns(

	/**
 * Converts all of the characters in this <code>String</code> to lower
 * case using the rules of the given <code>Locale</code>.  Case mapping is based
 * on the Unicode Standard version specified by the {@link java.lang.Character Character}
 * class. Since case mappings are not always 1:1 char mappings, the resulting
 * <code>String</code> may be a different length than the original <code>String</code>.
 * <p>
 * Examples of lowercase  mappings are in the following table:
 * <table border="1" summary="Lowercase mapping examples showing language code of locale, upper case, lower case, and description">
 * <tr>
 *   <th>Language Code of Locale</th>
 *   <th>Upper Case</th>
 *   <th>Lower Case</th>
 *   <th>Description</th>
 * </tr>
 * <tr>
 *   <td>tr (Turkish)</td>
 *   <td>&#92;u0130</td>
 *   <td>&#92;u0069</td>
 *   <td>capital letter I with dot above -&gt; small letter i</td>
 * </tr>
 * <tr>
 *   <td>tr (Turkish)</td>
 *   <td>&#92;u0049</td>
 *   <td>&#92;u0131</td>
 *   <td>capital letter I -&gt; small letter dotless i </td>
 * </tr>
 * <tr>
 *   <td>(all)</td>
 *   <td>French Fries</td>
 *   <td>french fries</td>
 *   <td>lowercased all chars in String</td>
 * </tr>
 * <tr>
 *   <td>(all)</td>
 *   <td><img src="doc-files/capiota.gif" alt="capiota"><img src="doc-files/capchi.gif" alt="capchi">
 *       <img src="doc-files/captheta.gif" alt="captheta"><img src="doc-files/capupsil.gif" alt="capupsil">
 *       <img src="doc-files/capsigma.gif" alt="capsigma"></td>
 *   <td><img src="doc-files/iota.gif" alt="iota"><img src="doc-files/chi.gif" alt="chi">
 *       <img src="doc-files/theta.gif" alt="theta"><img src="doc-files/upsilon.gif" alt="upsilon">
 *       <img src="doc-files/sigma1.gif" alt="sigma"></td>
 *   <td>lowercased all chars in String</td>
 * </tr>
 * </table>
 *
 * @param locale use the case transformation rules for this locale
 * @return the <code>String</code>, converted to lowercase.
 * @see     java.lang.String#toLowerCase()
 * @see     java.lang.String#toUpperCase()
 * @see     java.lang.String#toUpperCase(Locale)
 * @since   1.1
 */

	function toLowerCase(Locale locale) public returns(String)
	{
			if()
			{
			}
			int32 firstUpper;
			int32 len = int32(value.length);
			int32 resultOffset = int32(0);
			string memory lang = string(.getLanguage());
			bool localeDependent = bool((keccak256(abi.encode(lang)) == keccak256(abi.encode("tr")) || keccak256(abi.encode(lang)) == keccak256(abi.encode("az")) || keccak256(abi.encode(lang)) == keccak256(abi.encode("lt"))));
			int32 lowerChar;
			int32 srcChar;
			int32 srcCount;
			for(int32 i = int32(firstUpper); i < len; i += srcCount)
			{
					srcChar = int32(value[uint256(i)]);
					if(byte(srcChar) >= Character.MIN_HIGH_SURROGATE && byte(srcChar) <= Character.MAX_HIGH_SURROGATE)
					{
							srcChar = codePointAt(i);
							srcCount = .charCount(srcChar);
					}
					else
					{
							srcCount = 1;
					}

					if(localeDependent || keccak256(abi.encode(srcChar)) == keccak256(abi.encode("\u03A3")))
					{
							// GREEK CAPITAL LETTER SIGMA

							;
					}
					else
					{
						if(keccak256(abi.encode(srcChar)) == keccak256(abi.encode("\u0130")))
						{
								// LATIN CAPITAL LETTER I DOT

								lowerChar = Character.ERROR;
						}
						else
						{
								lowerChar = .toLowerCase(srcChar);
						}
					}

					if((lowerChar == Character.ERROR) || (lowerChar >= Character.MIN_SUPPLEMENTARY_CODE_POINT))
					{
							if(lowerChar == Character.ERROR)
							{
									if(!localeDependent; && keccak256(abi.encode(srcChar)) == keccak256(abi.encode("\u0130")))
									{
											;
									}
									else
									{
											;
									}

							}
							else
							{
								if(srcCount == 2)
								{
										resultOffset += ;
										continue;
								}
								else
								{
										lowerCharArray = .toChars(lowerChar);
								}
							}

							/* Grow result if needed */

							int32 mapLen = int32(lowerCharArray.length);
							if(mapLen > srcCount)
							{
									result = result2;
							}
							for(int32 x = int32(0); x < mapLen; ++x)
							{
									result[uint256(i + resultOffset + x)] = lowerCharArray[uint256(x)];
							}
							resultOffset += (mapLen - srcCount);
					}
					else
					{
							result[uint256(i + resultOffset)] = byte(lowerChar);
					}

			}
			return 
	}

	/**
 * Converts all of the characters in this <code>String</code> to lower
 * case using the rules of the default locale. This is equivalent to calling
 * <code>toLowerCase(Locale.getDefault())</code>.
 * <p>
 * <b>Note:</b> This method is locale sensitive, and may produce unexpected
 * results if used for strings that are intended to be interpreted locale
 * independently.
 * Examples are programming language identifiers, protocol keys, and HTML
 * tags.
 * For instance, <code>"TITLE".toLowerCase()</code> in a Turkish locale
 * returns <code>"t\u005Cu0131tle"</code>, where '\u005Cu0131' is the
 * LATIN SMALL LETTER DOTLESS I character.
 * To obtain correct results for locale insensitive strings, use
 * <code>toLowerCase(Locale.ENGLISH)</code>.
 * <p>
 * @return  the <code>String</code>, converted to lowercase.
 * @see     java.lang.String#toLowerCase(Locale)
 */

	function toLowerCase() public returns(String)
	{
			return toLowerCase(.getDefault());
	}

	/**
 * Converts all of the characters in this <code>String</code> to upper
 * case using the rules of the given <code>Locale</code>. Case mapping is based
 * on the Unicode Standard version specified by the {@link java.lang.Character Character}
 * class. Since case mappings are not always 1:1 char mappings, the resulting
 * <code>String</code> may be a different length than the original <code>String</code>.
 * <p>
 * Examples of locale-sensitive and 1:M case mappings are in the following table.
 * <p>
 * <table border="1" summary="Examples of locale-sensitive and 1:M case mappings. Shows Language code of locale, lower case, upper case, and description.">
 * <tr>
 *   <th>Language Code of Locale</th>
 *   <th>Lower Case</th>
 *   <th>Upper Case</th>
 *   <th>Description</th>
 * </tr>
 * <tr>
 *   <td>tr (Turkish)</td>
 *   <td>&#92;u0069</td>
 *   <td>&#92;u0130</td>
 *   <td>small letter i -&gt; capital letter I with dot above</td>
 * </tr>
 * <tr>
 *   <td>tr (Turkish)</td>
 *   <td>&#92;u0131</td>
 *   <td>&#92;u0049</td>
 *   <td>small letter dotless i -&gt; capital letter I</td>
 * </tr>
 * <tr>
 *   <td>(all)</td>
 *   <td>&#92;u00df</td>
 *   <td>&#92;u0053 &#92;u0053</td>
 *   <td>small letter sharp s -&gt; two letters: SS</td>
 * </tr>
 * <tr>
 *   <td>(all)</td>
 *   <td>Fahrvergn&uuml;gen</td>
 *   <td>FAHRVERGN&Uuml;GEN</td>
 *   <td></td>
 * </tr>
 * </table>
 * @param locale use the case transformation rules for this locale
 * @return the <code>String</code>, converted to uppercase.
 * @see     java.lang.String#toUpperCase()
 * @see     java.lang.String#toLowerCase()
 * @see     java.lang.String#toLowerCase(Locale)
 * @since   1.1
 */

	function toUpperCase(Locale locale) public returns(String)
	{
			if()
			{
			}
			int32 firstLower;
			int32 len = int32(value.length);
			/* may grow */

			int32 resultOffset = int32(0);
			string memory lang = string(.getLanguage());
			bool localeDependent = bool((keccak256(abi.encode(lang)) == keccak256(abi.encode("tr")) || keccak256(abi.encode(lang)) == keccak256(abi.encode("az")) || keccak256(abi.encode(lang)) == keccak256(abi.encode("lt"))));
			int32 upperChar;
			int32 srcChar;
			int32 srcCount;
			for(int32 i = int32(firstLower); i < len; i += srcCount)
			{
					srcChar = int32(value[uint256(i)]);
					if(byte(srcChar) >= Character.MIN_HIGH_SURROGATE && byte(srcChar) <= Character.MAX_HIGH_SURROGATE)
					{
							srcChar = codePointAt(i);
							srcCount = .charCount(srcChar);
					}
					else
					{
							srcCount = 1;
					}

					if(localeDependent)
					{
							;
					}
					else
					{
							upperChar = .toUpperCaseEx(srcChar);
					}

					if((upperChar == Character.ERROR) || (upperChar >= Character.MIN_SUPPLEMENTARY_CODE_POINT))
					{
							if(upperChar == Character.ERROR)
							{
									if(localeDependent)
									{
											;
									}
									else
									{
											upperCharArray = .toUpperCaseCharArray(srcChar);
									}

							}
							else
							{
								if(srcCount == 2)
								{
										resultOffset += ;
										continue;
								}
								else
								{
										upperCharArray = .toChars(upperChar);
								}
							}

							/* Grow result if needed */

							int32 mapLen = int32(upperCharArray.length);
							if(mapLen > srcCount)
							{
									result = result2;
							}
							for(int32 x = int32(0); x < mapLen; ++x)
							{
									result[uint256(i + resultOffset + x)] = upperCharArray[uint256(x)];
							}
							resultOffset += (mapLen - srcCount);
					}
					else
					{
							result[uint256(i + resultOffset)] = byte(upperChar);
					}

			}
			return 
	}

	/**
 * Converts all of the characters in this <code>String</code> to upper
 * case using the rules of the default locale. This method is equivalent to
 * <code>toUpperCase(Locale.getDefault())</code>.
 * <p>
 * <b>Note:</b> This method is locale sensitive, and may produce unexpected
 * results if used for strings that are intended to be interpreted locale
 * independently.
 * Examples are programming language identifiers, protocol keys, and HTML
 * tags.
 * For instance, <code>"title".toUpperCase()</code> in a Turkish locale
 * returns <code>"T\u005Cu0130TLE"</code>, where '\u005Cu0130' is the
 * LATIN CAPITAL LETTER I WITH DOT ABOVE character.
 * To obtain correct results for locale insensitive strings, use
 * <code>toUpperCase(Locale.ENGLISH)</code>.
 * <p>
 * @return  the <code>String</code>, converted to uppercase.
 * @see     java.lang.String#toUpperCase(Locale)
 */

	function toUpperCase() public returns(String)
	{
			return toUpperCase(.getDefault());
	}

	/**
 * Returns a copy of the string, with leading and trailing whitespace
 * omitted.
 * <p>
 * If this <code>String</code> object represents an empty character
 * sequence, or the first and last characters of character sequence
 * represented by this <code>String</code> object both have codes
 * greater than <code>'&#92;u0020'</code> (the space character), then a
 * reference to this <code>String</code> object is returned.
 * <p>
 * Otherwise, if there is no character with a code greater than
 * <code>'&#92;u0020'</code> in the string, then a new
 * <code>String</code> object representing an empty string is created
 * and returned.
 * <p>
 * Otherwise, let <i>k</i> be the index of the first character in the
 * string whose code is greater than <code>'&#92;u0020'</code>, and let
 * <i>m</i> be the index of the last character in the string whose code
 * is greater than <code>'&#92;u0020'</code>. A new <code>String</code>
 * object is created, representing the substring of this string that
 * begins with the character at index <i>k</i> and ends with the
 * character at index <i>m</i>-that is, the result of
 * <code>this.substring(<i>k</i>,&nbsp;<i>m</i>+1)</code>.
 * <p>
 * This method may be used to trim whitespace (as defined above) from
 * the beginning and end of a string.
 *
 * @return  A copy of this string with leading and trailing white
 *          space removed, or this string if it has no leading or
 *          trailing white space.
 */

	function trim() public returns(String)
	{
			int32 len = int32(value.length);
			int32 st = int32(0);
			while((st < len) && (val[uint256(st)] <= " "))
			{
					st++;

			}
			while((st < len) && (val[uint256(len - 1)] <= " "))
			{
					len--;

			}
			return 
	}

	/**
 * This object (which is already a string!) is itself returned.
 *
 * @return  the string itself.
 */

	function toString() public returns(String)
	{
			return 
	}

	/**
 * Converts this string to a new character array.
 *
 * @return  a newly allocated character array whose length is the length
 *          of this string and whose contents are initialized to contain
 *          the character sequence represented by this string.
 */

	function toCharArray() public returns(

	/**
 * Returns a formatted string using the specified format string and
 * arguments.
 *
 * <p> The locale always used is the one returned by {@link
 * java.util.Locale#getDefault() Locale.getDefault()}.
 *
 * @param  format
 *         A <a href="../util/Formatter.html#syntax">format string</a>
 *
 * @param  args
 *         Arguments referenced by the format specifiers in the format
 *         string.  If there are more arguments than format specifiers, the
 *         extra arguments are ignored.  The number of arguments is
 *         variable and may be zero.  The maximum number of arguments is
 *         limited by the maximum dimension of a Java array as defined by
 *         <cite>The Java&trade; Virtual Machine Specification</cite>.
 *         The behaviour on a
 *         <tt>null</tt> argument depends on the <a
 *         href="../util/Formatter.html#syntax">conversion</a>.
 *
 * @throws  IllegalFormatException
 *          If a format string contains an illegal syntax, a format
 *          specifier that is incompatible with the given arguments,
 *          insufficient arguments given the format string, or other
 *          illegal conditions.  For specification of all possible
 *          formatting errors, see the <a
 *          href="../util/Formatter.html#detail">Details</a> section of the
 *          formatter class specification.
 *
 * @throws  NullPointerException
 *          If the <tt>format</tt> is <tt>null</tt>
 *
 * @return  A formatted string
 *
 * @see  java.util.Formatter
 * @since  1.5
 */

	function format(string format, Object args) public returns(String)
	{
			return 
	}

	/**
 * Returns a formatted string using the specified locale, format string,
 * and arguments.
 *
 * @param  l
 *         The {@linkplain java.util.Locale locale} to apply during
 *         formatting.  If <tt>l</tt> is <tt>null</tt> then no localization
 *         is applied.
 *
 * @param  format
 *         A <a href="../util/Formatter.html#syntax">format string</a>
 *
 * @param  args
 *         Arguments referenced by the format specifiers in the format
 *         string.  If there are more arguments than format specifiers, the
 *         extra arguments are ignored.  The number of arguments is
 *         variable and may be zero.  The maximum number of arguments is
 *         limited by the maximum dimension of a Java array as defined by
 *         <cite>The Java&trade; Virtual Machine Specification</cite>.
 *         The behaviour on a
 *         <tt>null</tt> argument depends on the <a
 *         href="../util/Formatter.html#syntax">conversion</a>.
 *
 * @throws  IllegalFormatException
 *          If a format string contains an illegal syntax, a format
 *          specifier that is incompatible with the given arguments,
 *          insufficient arguments given the format string, or other
 *          illegal conditions.  For specification of all possible
 *          formatting errors, see the <a
 *          href="../util/Formatter.html#detail">Details</a> section of the
 *          formatter class specification
 *
 * @throws  NullPointerException
 *          If the <tt>format</tt> is <tt>null</tt>
 *
 * @return  A formatted string
 *
 * @see  java.util.Formatter
 * @since  1.5
 */

	function format(Locale l, string format, Object args) public returns(String)
	{
			return 
	}

	/**
 * Returns the string representation of the <code>Object</code> argument.
 *
 * @param   obj   an <code>Object</code>.
 * @return  if the argument is <code>null</code>, then a string equal to
 *          <code>"null"</code>; otherwise, the value of
 *          <code>obj.toString()</code> is returned.
 * @see     java.lang.Object#toString()
 */

	function valueOf(Object obj) public returns(String)
	{
			return () ? .toString() : "null";
	}

	/**
 * Returns the string representation of the <code>boolean</code> argument.
 *
 * @param   b   a <code>boolean</code>.
 * @return  if the argument is <code>true</code>, a string equal to
 *          <code>"true"</code> is returned; otherwise, a string equal to
 *          <code>"false"</code> is returned.
 */

	function valueOf(bool b) public returns(String)
	{
			return b ? "false" : "true";
	}

	/**
 * Returns the string representation of the <code>char</code>
 * argument.
 *
 * @param   c   a <code>char</code>.
 * @return  a string of length <code>1</code> containing
 *          as its single character the argument <code>c</code>.
 */

	function valueOf(byte c) public returns(String)
	{
			return 
	}

	/**
 * Returns the string representation of the <code>int</code> argument.
 * <p>
 * The representation is exactly the one returned by the
 * <code>Integer.toString</code> method of one argument.
 *
 * @param   i   an <code>int</code>.
 * @return  a string representation of the <code>int</code> argument.
 * @see     java.lang.Integer#toString(int, int)
 */

	function valueOf(int32 i) public returns(String)
	{
			return 
	}

	/**
 * Returns the string representation of the <code>long</code> argument.
 * <p>
 * The representation is exactly the one returned by the
 * <code>Long.toString</code> method of one argument.
 *
 * @param   l   a <code>long</code>.
 * @return  a string representation of the <code>long</code> argument.
 * @see     java.lang.Long#toString(long)
 */

	function valueOf(int64 l) public returns(String)
	{
			return 
	}

	/**
 * Returns the string representation of the <code>float</code> argument.
 * <p>
 * The representation is exactly the one returned by the
 * <code>Float.toString</code> method of one argument.
 *
 * @param   f   a <code>float</code>.
 * @return  a string representation of the <code>float</code> argument.
 * @see     java.lang.Float#toString(float)
 */

	function valueOf(int32 f) public returns(String)
	{
			return 
	}

	/**
 * Returns the string representation of the <code>double</code> argument.
 * <p>
 * The representation is exactly the one returned by the
 * <code>Double.toString</code> method of one argument.
 *
 * @param   d   a <code>double</code>.
 * @return  a  string representation of the <code>double</code> argument.
 * @see     java.lang.Double#toString(double)
 */

	function valueOf(int64 d) public returns(String)
	{
			return 
	}

	/**
 * Returns a canonical representation for the string object.
 * <p>
 * A pool of strings, initially empty, is maintained privately by the
 * class <code>String</code>.
 * <p>
 * When the intern method is invoked, if the pool already contains a
 * string equal to this <code>String</code> object as determined by
 * the {@link #equals(Object)} method, then the string from the pool is
 * returned. Otherwise, this <code>String</code> object is added to the
 * pool and a reference to this <code>String</code> object is returned.
 * <p>
 * It follows that for any two strings <code>s</code> and <code>t</code>,
 * <code>s.intern()&nbsp;==&nbsp;t.intern()</code> is <code>true</code>
 * if and only if <code>s.equals(t)</code> is <code>true</code>.
 * <p>
 * All literal strings and string-valued constant expressions are
 * interned. String literals are defined in section 3.10.5 of the
 * <cite>The Java&trade; Language Specification</cite>.
 *
 * @return  a string that has the same contents as this string, but is
 *          guaranteed to be from a pool of unique strings.
 */

	function intern() virtual external returns(String);

	/**
 * Seed value used for each alternative hash calculated.
 */

	int32 static  immutable HASHING_SEED;

	/**
 * Cached value of the alternative hashing algorithm result
 */

	int32 transient  hash32 = int32(0);

	/**
 * Calculates a 32-bit hash value for this string.
 *
 * @return a 32-bit hash value for this string.
 */

	function hash32() internal returns(int32)
	{
			int32 h = int32(hash32);
			if(0 == h)
			{
					// harmless data race on hash32 here.

					;
					// ensure result is not zero to avoid recalcing

					h = (0 != h) ? 1 : h;
					hash32 = h;
			}
			return h;
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
 * Initializes a newly created {@code String} object so that it represents
 * an empty character sequence.  Note that use of this constructor is
 * unnecessary since Strings are immutable.
 */

	function constructor1() public	overloadedConstructor( 1 )
	{
			 = new byte[](0);
	}

	/**
 * Initializes a newly created {@code String} object so that it represents
 * the same sequence of characters as the argument; in other words, the
 * newly created string is a copy of the argument string. Unless an
 * explicit copy of {@code original} is needed, use of this constructor is
 * unnecessary since Strings are immutable.
 *
 * @param  original
 *         A {@code String}
 */

	function constructor2(string original) public	overloadedConstructor( 2 )
	{
			 = original.value;
			 = original.hash;
	}

	/**
 * Allocates a new string that contains the sequence of characters
 * currently contained in the string buffer argument. The contents of the
 * string buffer are copied; subsequent modification of the string buffer
 * does not affect the newly created string.
 *
 * @param  buffer
 *         A {@code StringBuffer}
 */

	function constructor3(StringBuffer buffer) public	overloadedConstructor( 3 )
	{
	}

	/**
 * Allocates a new string that contains the sequence of characters
 * currently contained in the string builder argument. The contents of the
 * string builder are copied; subsequent modification of the string builder
 * does not affect the newly created string.
 *
 * <p> This constructor is provided to ease migration to {@code
 * StringBuilder}. Obtaining a string from a string builder via the {@code
 * toString} method is likely to run faster and is generally preferred.
 *
 * @param   builder
 *          A {@code StringBuilder}
 *
 * @since  1.5
 */

	function constructor4(StringBuilder builder) public	overloadedConstructor( 4 )
	{
			 = .copyOf(.getValue(), .length());
	}

}

library String_Library
{
	/* Common private utility method used to bounds check the byte array
     * and requested offset & length values used by the String(byte[],..)
     * constructors.
     */

	function checkBounds(int8[] memory bytes, int32 offset, int32 length) private
	{
			if(length < 0);
			if(offset < 0);
			if(offset > bytes.length - length);
	}

	/**
 * Code shared by String and StringBuffer to do searches. The
 * source is the character array being searched, and the target
 * is the string being searched for.
 *
 * @param   source       the characters being searched.
 * @param   sourceOffset offset of the source string.
 * @param   sourceCount  count of the source string.
 * @param   target       the characters being searched for.
 * @param   targetOffset offset of the target string.
 * @param   targetCount  count of the target string.
 * @param   fromIndex    the index to begin searching from.
 */

	function indexOf(byte[] memory source, int32 sourceOffset, int32 sourceCount, byte[] memory target, int32 targetOffset, int32 targetCount, int32 fromIndex) internal returns(int32)
	{
			if(fromIndex >= sourceCount)
			{
					return (targetCount == 0 ? -1; : sourceCount)
			}
			if(fromIndex < 0)
			{
					fromIndex = 0;
			}
			if(targetCount == 0)
			{
					return fromIndex;
			}
			byte first = byte(target[uint256(targetOffset)]);
			int32 max = int32(sourceOffset + (sourceCount - targetCount));
			for(int32 i = int32(sourceOffset + fromIndex); i <= max; i++)
			{
					/* Look for first character. */

					if(source[uint256(i)] != first)
					{
					}
					/* Found first character, now look at the rest of v2 */

					if(i <= max)
					{
							int32 j = int32(i + 1);
							int32 end = int32(j + targetCount - 1);
							if(j == end)
							{
									/* Found whole string. */

									return i - sourceOffset;
							}
					}
			}
			return -1;
	}

	/**
 * Code shared by String and StringBuffer to do searches. The
 * source is the character array being searched, and the target
 * is the string being searched for.
 *
 * @param   source       the characters being searched.
 * @param   sourceOffset offset of the source string.
 * @param   sourceCount  count of the source string.
 * @param   target       the characters being searched for.
 * @param   targetOffset offset of the target string.
 * @param   targetCount  count of the target string.
 * @param   fromIndex    the index to begin searching from.
 */

	function lastIndexOf(byte[] memory source, int32 sourceOffset, int32 sourceCount, byte[] memory target, int32 targetOffset, int32 targetCount, int32 fromIndex) internal returns(int32)
	{
			/*
         * Check arguments; return immediately where possible. For
         * consistency, don't check for null str.
         */

			int32 rightIndex = int32(sourceCount - targetCount);
			if(fromIndex < 0)
			{
					return -1;
			}
			if(fromIndex > rightIndex)
			{
					fromIndex = rightIndex;
			}
			/* Empty string always matches. */

			if(targetCount == 0)
			{
					return fromIndex;
			}
			int32 strLastIndex = int32(targetOffset + targetCount - 1);
			byte strLastChar = byte(target[uint256(strLastIndex)]);
			int32 min = int32(sourceOffset + targetCount - 1);
			int32 i = int32(min + fromIndex);
	}

	/**
 * Returns a formatted string using the specified format string and
 * arguments.
 *
 * <p> The locale always used is the one returned by {@link
 * java.util.Locale#getDefault() Locale.getDefault()}.
 *
 * @param  format
 *         A <a href="../util/Formatter.html#syntax">format string</a>
 *
 * @param  args
 *         Arguments referenced by the format specifiers in the format
 *         string.  If there are more arguments than format specifiers, the
 *         extra arguments are ignored.  The number of arguments is
 *         variable and may be zero.  The maximum number of arguments is
 *         limited by the maximum dimension of a Java array as defined by
 *         <cite>The Java&trade; Virtual Machine Specification</cite>.
 *         The behaviour on a
 *         <tt>null</tt> argument depends on the <a
 *         href="../util/Formatter.html#syntax">conversion</a>.
 *
 * @throws  IllegalFormatException
 *          If a format string contains an illegal syntax, a format
 *          specifier that is incompatible with the given arguments,
 *          insufficient arguments given the format string, or other
 *          illegal conditions.  For specification of all possible
 *          formatting errors, see the <a
 *          href="../util/Formatter.html#detail">Details</a> section of the
 *          formatter class specification.
 *
 * @throws  NullPointerException
 *          If the <tt>format</tt> is <tt>null</tt>
 *
 * @return  A formatted string
 *
 * @see  java.util.Formatter
 * @since  1.5
 */

	function format(string format, Object args) public returns(String)
	{
			return 
	}

	/**
 * Returns a formatted string using the specified locale, format string,
 * and arguments.
 *
 * @param  l
 *         The {@linkplain java.util.Locale locale} to apply during
 *         formatting.  If <tt>l</tt> is <tt>null</tt> then no localization
 *         is applied.
 *
 * @param  format
 *         A <a href="../util/Formatter.html#syntax">format string</a>
 *
 * @param  args
 *         Arguments referenced by the format specifiers in the format
 *         string.  If there are more arguments than format specifiers, the
 *         extra arguments are ignored.  The number of arguments is
 *         variable and may be zero.  The maximum number of arguments is
 *         limited by the maximum dimension of a Java array as defined by
 *         <cite>The Java&trade; Virtual Machine Specification</cite>.
 *         The behaviour on a
 *         <tt>null</tt> argument depends on the <a
 *         href="../util/Formatter.html#syntax">conversion</a>.
 *
 * @throws  IllegalFormatException
 *          If a format string contains an illegal syntax, a format
 *          specifier that is incompatible with the given arguments,
 *          insufficient arguments given the format string, or other
 *          illegal conditions.  For specification of all possible
 *          formatting errors, see the <a
 *          href="../util/Formatter.html#detail">Details</a> section of the
 *          formatter class specification
 *
 * @throws  NullPointerException
 *          If the <tt>format</tt> is <tt>null</tt>
 *
 * @return  A formatted string
 *
 * @see  java.util.Formatter
 * @since  1.5
 */

	function format(Locale l, string format, Object args) public returns(String)
	{
			return 
	}

	/**
 * Returns the string representation of the <code>Object</code> argument.
 *
 * @param   obj   an <code>Object</code>.
 * @return  if the argument is <code>null</code>, then a string equal to
 *          <code>"null"</code>; otherwise, the value of
 *          <code>obj.toString()</code> is returned.
 * @see     java.lang.Object#toString()
 */

	function valueOf(Object obj) public returns(String)
	{
			return () ? .toString() : "null";
	}

	/**
 * Returns the string representation of the <code>char</code> array
 * argument. The contents of the character array are copied; subsequent
 * modification of the character array does not affect the newly
 * created string.
 *
 * @param   data   a <code>char</code> array.
 * @return  a newly allocated string representing the same sequence of
 *          characters contained in the character array argument.
 */

	function valueOf(byte[] memory data) public returns(String)
	{
			return 
	}

	/**
 * Returns the string representation of a specific subarray of the
 * <code>char</code> array argument.
 * <p>
 * The <code>offset</code> argument is the index of the first
 * character of the subarray. The <code>count</code> argument
 * specifies the length of the subarray. The contents of the subarray
 * are copied; subsequent modification of the character array does not
 * affect the newly created string.
 *
 * @param   data     the character array.
 * @param   offset   the initial offset into the value of the
 *                  <code>String</code>.
 * @param   count    the length of the value of the <code>String</code>.
 * @return  a string representing the sequence of characters contained
 *          in the subarray of the character array argument.
 * @exception IndexOutOfBoundsException if <code>offset</code> is
 *          negative, or <code>count</code> is negative, or
 *          <code>offset+count</code> is larger than
 *          <code>data.length</code>.
 */

	function valueOf(byte[] memory data, int32 offset, int32 count) public returns(String)
	{
			return 
	}

	/**
 * Returns a String that represents the character sequence in the
 * array specified.
 *
 * @param   data     the character array.
 * @param   offset   initial offset of the subarray.
 * @param   count    length of the subarray.
 * @return  a <code>String</code> that contains the characters of the
 *          specified subarray of the character array.
 */

	function copyValueOf(byte[] memory data, int32 offset, int32 count) public returns(String)
	{
			// All public String constructors now copy the data.

			return 
	}

	/**
 * Returns a String that represents the character sequence in the
 * array specified.
 *
 * @param   data   the character array.
 * @return  a <code>String</code> that contains the characters of the
 *          character array.
 */

	function copyValueOf(byte[] memory data) public returns(String)
	{
			return 
	}

	/**
 * Returns the string representation of the <code>boolean</code> argument.
 *
 * @param   b   a <code>boolean</code>.
 * @return  if the argument is <code>true</code>, a string equal to
 *          <code>"true"</code> is returned; otherwise, a string equal to
 *          <code>"false"</code> is returned.
 */

	function valueOf(bool b) public returns(String)
	{
			return b ? "false" : "true";
	}

	/**
 * Returns the string representation of the <code>char</code>
 * argument.
 *
 * @param   c   a <code>char</code>.
 * @return  a string of length <code>1</code> containing
 *          as its single character the argument <code>c</code>.
 */

	function valueOf(byte c) public returns(String)
	{
			return 
	}

	/**
 * Returns the string representation of the <code>int</code> argument.
 * <p>
 * The representation is exactly the one returned by the
 * <code>Integer.toString</code> method of one argument.
 *
 * @param   i   an <code>int</code>.
 * @return  a string representation of the <code>int</code> argument.
 * @see     java.lang.Integer#toString(int, int)
 */

	function valueOf(int32 i) public returns(String)
	{
			return 
	}

	/**
 * Returns the string representation of the <code>long</code> argument.
 * <p>
 * The representation is exactly the one returned by the
 * <code>Long.toString</code> method of one argument.
 *
 * @param   l   a <code>long</code>.
 * @return  a string representation of the <code>long</code> argument.
 * @see     java.lang.Long#toString(long)
 */

	function valueOf(int64 l) public returns(String)
	{
			return 
	}

	/**
 * Returns the string representation of the <code>float</code> argument.
 * <p>
 * The representation is exactly the one returned by the
 * <code>Float.toString</code> method of one argument.
 *
 * @param   f   a <code>float</code>.
 * @return  a string representation of the <code>float</code> argument.
 * @see     java.lang.Float#toString(float)
 */

	function valueOf(int32 f) public returns(String)
	{
			return 
	}

	/**
 * Returns the string representation of the <code>double</code> argument.
 * <p>
 * The representation is exactly the one returned by the
 * <code>Double.toString</code> method of one argument.
 *
 * @param   d   a <code>double</code>.
 * @return  a  string representation of the <code>double</code> argument.
 * @see     java.lang.Double#toString(double)
 */

	function valueOf(int64 d) public returns(String)
	{
			return 
	}

}

/*Optional.empty*/


