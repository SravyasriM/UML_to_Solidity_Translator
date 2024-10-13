pragma solidity 0.7.5;

//package java.util


import "java/io.sol";

import "java/nio/ByteBuffer.sol";

import "java/nio/ByteOrder.sol";

import "java/nio/LongBuffer.sol";

/**
 * This class implements a vector of bits that grows as needed. Each
 * component of the bit set has a {@code boolean} value. The
 * bits of a {@code BitSet} are indexed by nonnegative integers.
 * Individual indexed bits can be examined, set, or cleared. One
 * {@code BitSet} may be used to modify the contents of another
 * {@code BitSet} through logical AND, logical inclusive OR, and
 * logical exclusive OR operations.
 *
 * <p>By default, all bits in the set initially have the value
 * {@code false}.
 *
 * <p>Every bit set has a current size, which is the number of bits
 * of space currently in use by the bit set. Note that the size is
 * related to the implementation of a bit set, so it may change with
 * implementation. The length of a bit set relates to logical length
 * of a bit set and is defined independently of implementation.
 *
 * <p>Unless otherwise noted, passing a null parameter to any of the
 * methods in a {@code BitSet} will result in a
 * {@code NullPointerException}.
 *
 * <p>A {@code BitSet} is not safe for multithreaded use without
 * external synchronization.
 *
 * @author  Arthur van Hoff
 * @author  Michael McCloskey
 * @author  Martin Buchholz
 * @since   JDK1.0
 */

contract BitSet
{
	/*
     * BitSets are packed into arrays of "words."  Currently a word is
     * a long, which consists of 64 bits, requiring 6 address bits.
     * The choice of word size is determined purely by performance concerns.
     */

	int32 static  immutable ADDRESS_BITS_PER_WORD = int32(6);

	int32 static  immutable BITS_PER_WORD = int32(1 << ADDRESS_BITS_PER_WORD);

	int32 static  immutable BIT_INDEX_MASK = int32(BITS_PER_WORD - 1);

	/* Used to shift left or right for a partial word mask */

	int64 static  immutable WORD_MASK = int64(0xffffffffffffffff);

	

	/**
 * The number of words in the logical size of this BitSet.
 */

	int32 transient  wordsInUse = int32(0);

	/**
 * Whether the size of "words" is user-specified.  If so, we assume
 * the user knows what he's doing and try harder to preserve it.
 */

	bool transient  sizeIsSticky = bool(false);

	/* use serialVersionUID from JDK 1.0.2 for interoperability */

	int64 static  immutable serialVersionUID = int64(7997698588986878753);

	/**
 * Given a bit index, return word index containing it.
 */

	function wordIndex(int32 bitIndex) private returns(int32)
	{
			return bitIndex >> ADDRESS_BITS_PER_WORD;
	}

	/**
 * Every public method must preserve these invariants.
 */

	function checkInvariants() private
	{
	}

	/**
 * Sets the field wordsInUse to the logical size in words of the bit set.
 * WARNING:This method assumes that the number of words actually in use is
 * less than or equal to the current value of wordsInUse!
 */

	function recalculateWordsInUse() private
	{
			// Traverse the bitset until a used word is found

			int32 i;
			for(i = wordsInUse - 1; i >= 0; i--;)
			{
				if(words[uint256(i)] != 0)
				{
					break;				}			}
			// The new logical size

			wordsInUse = i + 1;
	}

	function initWords(int32 nbits) private
	{
			words = new int64[](wordIndex(nbits - 1) + 1);
	}

	/**
 * Returns a new bit set containing all the bits in the given long
 * buffer between its position and limit.
 *
 * <p>More precisely,
 * <br>{@code BitSet.valueOf(lb).get(n) == ((lb.get(lb.position()+n/64) & (1L<<(n%64))) != 0)}
 * <br>for all {@code n < 64 * lb.remaining()}.
 *
 * <p>The long buffer is not modified by this method, and no
 * reference to the buffer is retained by the bit set.
 *
 * @param lb a long buffer containing a little-endian representation
 *        of a sequence of bits between its position and limit, to be
 *        used as the initial bits of the new bit set
 * @since 1.7
 */

	function valueOf(LongBuffer lb) public returns(BitSet)
	{
			lb = lb.slice();
			int32 n;
			lb.get(words);
			return 
	}

	/**
 * Returns a new bit set containing all the bits in the given byte
 * buffer between its position and limit.
 *
 * <p>More precisely,
 * <br>{@code BitSet.valueOf(bb).get(n) == ((bb.get(bb.position()+n/8) & (1<<(n%8))) != 0)}
 * <br>for all {@code n < 8 * bb.remaining()}.
 *
 * <p>The byte buffer is not modified by this method, and no
 * reference to the buffer is retained by the bit set.
 *
 * @param bb a byte buffer containing a little-endian representation
 *        of a sequence of bits between its position and limit, to be
 *        used as the initial bits of the new bit set
 * @since 1.7
 */

	function valueOf(ByteBuffer bb) public returns(BitSet)
	{
			bb = bb.slice().order(ByteOrder.LITTLE_ENDIAN);
			int32 n;
			bb.limit(n);
			int32 i = int32(0);
			while(bb.remaining() >= 8)
			{
				words[uint256(i++;)] = bb.getLong()
			}
			for(int32 remaining = int32(bb.remaining()); j < remaining; j++;)
			{
				words[uint256(i)] |= (bb.get() & 0xff) << (8 * j);			}
			return 
	}

	/**
 * Returns a new byte array containing all the bits in this bit set.
 *
 * <p>More precisely, if
 * <br>{@code byte[] bytes = s.toByteArray();}
 * <br>then {@code bytes.length == (s.length()+7)/8} and
 * <br>{@code s.get(n) == ((bytes[n/8] & (1<<(n%8))) != 0)}
 * <br>for all {@code n < 8 * bytes.length}.
 *
 * @return a byte array containing a little-endian representation
 *         of all the bits in this bit set
 * @since 1.7
 */

	function toByteArray() public returns(

	/**
 * Returns a new long array containing all the bits in this bit set.
 *
 * <p>More precisely, if
 * <br>{@code long[] longs = s.toLongArray();}
 * <br>then {@code longs.length == (s.length()+63)/64} and
 * <br>{@code s.get(n) == ((longs[n/64] & (1L<<(n%64))) != 0)}
 * <br>for all {@code n < 64 * longs.length}.
 *
 * @return a long array containing a little-endian representation
 *         of all the bits in this bit set
 * @since 1.7
 */

	function toLongArray() public returns(

	/**
 * Ensures that the BitSet can hold enough words.
 * @param wordsRequired the minimum acceptable number of words.
 */

	function ensureCapacity(int32 wordsRequired) private
	{
			if(words.length < wordsRequired)
			{
					// Allocate larger of doubled size or required size

					int32 request = int32(Math.max(2 * words.length, wordsRequired));
					words = Arrays.copyOf(words, request);
					sizeIsSticky = false;
			}
	}

	/**
 * Ensures that the BitSet can accommodate a given wordIndex,
 * temporarily violating the invariants.  The caller must
 * restore the invariants before returning to the user,
 * possibly using recalculateWordsInUse().
 * @param wordIndex the index to be accommodated.
 */

	function expandTo(int32 wordIndex) private
	{
			int32 wordsRequired = int32(wordIndex + 1);
			if(wordsInUse < wordsRequired)
			{
					ensureCapacity(wordsRequired);
					wordsInUse = wordsRequired;
			}
	}

	/**
 * Checks that fromIndex ... toIndex is a valid range of bit indices.
 */

	function checkRange(int32 fromIndex, int32 toIndex) private
	{
	}

	/**
 * Sets the bit at the specified index to the complement of its
 * current value.
 *
 * @param  bitIndex the index of the bit to flip
 * @throws IndexOutOfBoundsException if the specified index is negative
 * @since  1.4
 */

	function flip(int32 bitIndex) public
	{
			int32 wordIndex = int32(wordIndex(bitIndex));
			expandTo(wordIndex);
			words[uint256(wordIndex)] ^= (1 << bitIndex);
			recalculateWordsInUse();
			checkInvariants();
	}

	/**
 * Sets each bit from the specified {@code fromIndex} (inclusive) to the
 * specified {@code toIndex} (exclusive) to the complement of its current
 * value.
 *
 * @param  fromIndex index of the first bit to flip
 * @param  toIndex index after the last bit to flip
 * @throws IndexOutOfBoundsException if {@code fromIndex} is negative,
 *         or {@code toIndex} is negative, or {@code fromIndex} is
 *         larger than {@code toIndex}
 * @since  1.4
 */

	function flip(int32 fromIndex, int32 toIndex) public
	{
			checkRange(fromIndex, toIndex);
			if(fromIndex == toIndex)
			{
				return 			}
			int32 startWordIndex = int32(wordIndex(fromIndex));
			int32 endWordIndex = int32(wordIndex(toIndex - 1));
			expandTo(endWordIndex);
			int64 firstWordMask = int64(WORD_MASK << fromIndex);
			int64 lastWordMask = int64(WORD_MASK >>> -toIndex);
			if(startWordIndex == endWordIndex)
			{
					// Case 1: One word

					words[uint256(startWordIndex)] ^= (firstWordMask & lastWordMask);
			}
			else
			{
					// Handle first word

					words[uint256(startWordIndex)] ^= firstWordMask;
					// Handle intermediate words, if any

					for(int32 i = int32(startWordIndex + 1); i < endWordIndex; i++;)
					{
						words[uint256(i)] ^= WORD_MASK;					}
					// Handle last word

					words[uint256(endWordIndex)] ^= lastWordMask;
			}

			recalculateWordsInUse();
			checkInvariants();
	}

	/**
 * Sets the bit at the specified index to {@code true}.
 *
 * @param  bitIndex a bit index
 * @throws IndexOutOfBoundsException if the specified index is negative
 * @since  JDK1.0
 */

	function set(int32 bitIndex) public
	{
			int32 wordIndex = int32(wordIndex(bitIndex));
			expandTo(wordIndex);
			// Restores invariants

			words[uint256(wordIndex)] |= (1 << bitIndex);
			checkInvariants();
	}

	/**
 * Sets the bit at the specified index to the specified value.
 *
 * @param  bitIndex a bit index
 * @param  value a boolean value to set
 * @throws IndexOutOfBoundsException if the specified index is negative
 * @since  1.4
 */

	function set(int32 bitIndex, bool value) public
	{
			if(value)
			{
				set(bitIndex);			}
			else
			{
				clear(bitIndex);			}

	}

	/**
 * Sets the bits from the specified {@code fromIndex} (inclusive) to the
 * specified {@code toIndex} (exclusive) to {@code true}.
 *
 * @param  fromIndex index of the first bit to be set
 * @param  toIndex index after the last bit to be set
 * @throws IndexOutOfBoundsException if {@code fromIndex} is negative,
 *         or {@code toIndex} is negative, or {@code fromIndex} is
 *         larger than {@code toIndex}
 * @since  1.4
 */

	function set(int32 fromIndex, int32 toIndex) public
	{
			checkRange(fromIndex, toIndex);
			if(fromIndex == toIndex)
			{
				return 			}
			// Increase capacity if necessary

			int32 startWordIndex = int32(wordIndex(fromIndex));
			int32 endWordIndex = int32(wordIndex(toIndex - 1));
			expandTo(endWordIndex);
			int64 firstWordMask = int64(WORD_MASK << fromIndex);
			int64 lastWordMask = int64(WORD_MASK >>> -toIndex);
			if(startWordIndex == endWordIndex)
			{
					// Case 1: One word

					words[uint256(startWordIndex)] |= (firstWordMask & lastWordMask);
			}
			else
			{
					// Handle first word

					words[uint256(startWordIndex)] |= firstWordMask;
					// Handle intermediate words, if any

					for(int32 i = int32(startWordIndex + 1); i < endWordIndex; i++;)
					{
						words[uint256(i)] = WORD_MASK;					}
					// Handle last word (restores invariants)

					words[uint256(endWordIndex)] |= lastWordMask;
			}

			checkInvariants();
	}

	/**
 * Sets the bits from the specified {@code fromIndex} (inclusive) to the
 * specified {@code toIndex} (exclusive) to the specified value.
 *
 * @param  fromIndex index of the first bit to be set
 * @param  toIndex index after the last bit to be set
 * @param  value value to set the selected bits to
 * @throws IndexOutOfBoundsException if {@code fromIndex} is negative,
 *         or {@code toIndex} is negative, or {@code fromIndex} is
 *         larger than {@code toIndex}
 * @since  1.4
 */

	function set(int32 fromIndex, int32 toIndex, bool value) public
	{
			if(value)
			{
				set(fromIndex, toIndex);			}
			else
			{
				clear(fromIndex, toIndex);			}

	}

	/**
 * Sets the bit specified by the index to {@code false}.
 *
 * @param  bitIndex the index of the bit to be cleared
 * @throws IndexOutOfBoundsException if the specified index is negative
 * @since  JDK1.0
 */

	function clear(int32 bitIndex) public
	{
			int32 wordIndex = int32(wordIndex(bitIndex));
			if(wordIndex >= wordsInUse)
			{
				return 			}
			words[uint256(wordIndex)] &= ~(1 << bitIndex);
			recalculateWordsInUse();
			checkInvariants();
	}

	/**
 * Sets the bits from the specified {@code fromIndex} (inclusive) to the
 * specified {@code toIndex} (exclusive) to {@code false}.
 *
 * @param  fromIndex index of the first bit to be cleared
 * @param  toIndex index after the last bit to be cleared
 * @throws IndexOutOfBoundsException if {@code fromIndex} is negative,
 *         or {@code toIndex} is negative, or {@code fromIndex} is
 *         larger than {@code toIndex}
 * @since  1.4
 */

	function clear(int32 fromIndex, int32 toIndex) public
	{
			checkRange(fromIndex, toIndex);
			if(fromIndex == toIndex)
			{
				return 			}
			int32 startWordIndex = int32(wordIndex(fromIndex));
			if(startWordIndex >= wordsInUse)
			{
				return 			}
			int32 endWordIndex = int32(wordIndex(toIndex - 1));
			if(endWordIndex >= wordsInUse)
			{
					toIndex = length();
					endWordIndex = wordsInUse - 1;
			}
			int64 firstWordMask = int64(WORD_MASK << fromIndex);
			int64 lastWordMask = int64(WORD_MASK >>> -toIndex);
			if(startWordIndex == endWordIndex)
			{
					// Case 1: One word

					words[uint256(startWordIndex)] &= ~(firstWordMask & lastWordMask);
			}
			else
			{
					// Handle first word

					words[uint256(startWordIndex)] &= ~firstWordMask;
					// Handle intermediate words, if any

					for(int32 i = int32(startWordIndex + 1); i < endWordIndex; i++;)
					{
						words[uint256(i)] = 0;					}
					// Handle last word

					words[uint256(endWordIndex)] &= ~lastWordMask;
			}

			recalculateWordsInUse();
			checkInvariants();
	}

	/**
 * Sets all of the bits in this BitSet to {@code false}.
 *
 * @since 1.4
 */

	function clear() public
	{
			while(wordsInUse > 0)
			{
				words[uint256(--wordsInUse;)] = 0
			}
	}

	/**
 * Returns the value of the bit with the specified index. The value
 * is {@code true} if the bit with the index {@code bitIndex}
 * is currently set in this {@code BitSet}; otherwise, the result
 * is {@code false}.
 *
 * @param  bitIndex   the bit index
 * @return the value of the bit with the specified index
 * @throws IndexOutOfBoundsException if the specified index is negative
 */

	function get(int32 bitIndex) public returns(bool)
	{
			checkInvariants();
			int32 wordIndex = int32(wordIndex(bitIndex));
			return (wordIndex < wordsInUse) && ((words[uint256(wordIndex)] & (1 << bitIndex)) != 0);
	}

	/**
 * Returns a new {@code BitSet} composed of bits from this {@code BitSet}
 * from {@code fromIndex} (inclusive) to {@code toIndex} (exclusive).
 *
 * @param  fromIndex index of the first bit to include
 * @param  toIndex index after the last bit to include
 * @return a new {@code BitSet} from a range of this {@code BitSet}
 * @throws IndexOutOfBoundsException if {@code fromIndex} is negative,
 *         or {@code toIndex} is negative, or {@code fromIndex} is
 *         larger than {@code toIndex}
 * @since  1.4
 */

	function get(int32 fromIndex, int32 toIndex) public returns(BitSet)
	{
			checkRange(fromIndex, toIndex);
			checkInvariants();
			int32 len = int32(length());
			// If no set bits in range return empty bitset

			if(len <= fromIndex || fromIndex == toIndex)
			{
				return 			}
			// An optimization

			if(toIndex > len)
			{
				toIndex = len;			}
			BitSet result;
			int32 targetWords = int32();
			int32 sourceIndex = int32(wordIndex(fromIndex));
			bool wordAligned = bool(((fromIndex & BIT_INDEX_MASK) == 0));
			// Process all words but the last word

			for(int32 i = int32(0); i < targetWords - 1; i++;)
			{
				result.words[uint256(i)] = wordAligned ? words[uint256(sourceIndex)] : (words[uint256(sourceIndex)] >>> fromIndex) | (words[uint256(sourceIndex + 1)] << -fromIndex);			}
			// Process the last word

			int64 lastWordMask = int64(WORD_MASK >>> -toIndex);
			result.words[uint256(targetWords - 1)] = ((toIndex - 1) & BIT_INDEX_MASK) < (fromIndex & BIT_INDEX_MASK) ? /* straddles source words */

((words[uint256(sourceIndex)] >>> fromIndex) | (words[uint256(sourceIndex + 1)] & lastWordMask) << -fromIndex;) : ((words[uint256(sourceIndex)] & lastWordMask) >>> fromIndex)
			// Set wordsInUse correctly

			result.wordsInUse = targetWords;
			result.recalculateWordsInUse();
			result.checkInvariants();
			return result;
	}

	/**
 * Returns the index of the first bit that is set to {@code true}
 * that occurs on or after the specified starting index. If no such
 * bit exists then {@code -1} is returned.
 *
 * <p>To iterate over the {@code true} bits in a {@code BitSet},
 * use the following loop:
 *
 *  <pre> {@code
 * for (int i = bs.nextSetBit(0); i >= 0; i = bs.nextSetBit(i+1)) {
 *     // operate on index i here
 * }}</pre>
 *
 * @param  fromIndex the index to start checking from (inclusive)
 * @return the index of the next set bit, or {@code -1} if there
 *         is no such bit
 * @throws IndexOutOfBoundsException if the specified index is negative
 * @since  1.4
 */

	function nextSetBit(int32 fromIndex) public returns(int32)
	{
			checkInvariants();
			int32 u = int32(wordIndex(fromIndex));
			if(u >= wordsInUse)
			{
				return -1;			}
			int64 word = int64(words[uint256(u)] & (WORD_MASK << fromIndex));
			while(true)
			{
					if(word != 0)
					{
						return (u * BITS_PER_WORD) + Long.numberOfTrailingZeros(word);					}
					if(++u; == wordsInUse)
					{
						return -1;					}
					word = words[uint256(u)];

			}
	}

	/**
 * Returns the index of the first bit that is set to {@code false}
 * that occurs on or after the specified starting index.
 *
 * @param  fromIndex the index to start checking from (inclusive)
 * @return the index of the next clear bit
 * @throws IndexOutOfBoundsException if the specified index is negative
 * @since  1.4
 */

	function nextClearBit(int32 fromIndex) public returns(int32)
	{
			checkInvariants();
			int32 u = int32(wordIndex(fromIndex));
			if(u >= wordsInUse)
			{
				return fromIndex;			}
			int64 word = int64(~words[uint256(u)]; & (WORD_MASK << fromIndex)
			while(true)
			{
					if(word != 0)
					{
						return (u * BITS_PER_WORD) + Long.numberOfTrailingZeros(word);					}
					if(++u; == wordsInUse)
					{
						return wordsInUse * BITS_PER_WORD;					}
					word = ~words[uint256(u)];

			}
	}

	/**
 * Returns the index of the nearest bit that is set to {@code true}
 * that occurs on or before the specified starting index.
 * If no such bit exists, or if {@code -1} is given as the
 * starting index, then {@code -1} is returned.
 *
 * <p>To iterate over the {@code true} bits in a {@code BitSet},
 * use the following loop:
 *
 *  <pre> {@code
 * for (int i = bs.length(); (i = bs.previousSetBit(i-1)) >= 0; ) {
 *     // operate on index i here
 * }}</pre>
 *
 * @param  fromIndex the index to start checking from (inclusive)
 * @return the index of the previous set bit, or {@code -1} if there
 *         is no such bit
 * @throws IndexOutOfBoundsException if the specified index is less
 *         than {@code -1}
 * @since  1.7
 */

	function previousSetBit(int32 fromIndex) public returns(int32)
	{
			if(fromIndex < 0)
			{
					if(fromIndex == -1;)
					{
						return -1;					}
			}
			checkInvariants();
			int32 u = int32(wordIndex(fromIndex));
			if(u >= wordsInUse)
			{
				return length() - 1;			}
			int64 word = int64(words[uint256(u)] & (WORD_MASK >>> -(fromIndex + 1);)
			while(true)
			{
					if(word != 0)
					{
						return (u + 1) * BITS_PER_WORD - 1 - Long.numberOfLeadingZeros(word);					}
					if(u--; == 0)
					{
						return -1;					}
					word = words[uint256(u)];

			}
	}

	/**
 * Returns the index of the nearest bit that is set to {@code false}
 * that occurs on or before the specified starting index.
 * If no such bit exists, or if {@code -1} is given as the
 * starting index, then {@code -1} is returned.
 *
 * @param  fromIndex the index to start checking from (inclusive)
 * @return the index of the previous clear bit, or {@code -1} if there
 *         is no such bit
 * @throws IndexOutOfBoundsException if the specified index is less
 *         than {@code -1}
 * @since  1.7
 */

	function previousClearBit(int32 fromIndex) public returns(int32)
	{
			if(fromIndex < 0)
			{
					if(fromIndex == -1;)
					{
						return -1;					}
			}
			checkInvariants();
			int32 u = int32(wordIndex(fromIndex));
			if(u >= wordsInUse)
			{
				return fromIndex;			}
			int64 word = int64(~words[uint256(u)]; & (WORD_MASK >>> -(fromIndex + 1);)
			while(true)
			{
					if(word != 0)
					{
						return (u + 1) * BITS_PER_WORD - 1 - Long.numberOfLeadingZeros(word);					}
					if(u--; == 0)
					{
						return -1;					}
					word = ~words[uint256(u)];

			}
	}

	/**
 * Returns the "logical size" of this {@code BitSet}: the index of
 * the highest set bit in the {@code BitSet} plus one. Returns zero
 * if the {@code BitSet} contains no set bits.
 *
 * @return the logical size of this {@code BitSet}
 * @since  1.2
 */

	function length() public returns(int32)
	{
			if(wordsInUse == 0)
			{
				return 0;			}
			return BITS_PER_WORD * (wordsInUse - 1) + (BITS_PER_WORD - Long.numberOfLeadingZeros(words[uint256(wordsInUse - 1)]));
	}

	/**
 * Returns true if this {@code BitSet} contains no bits that are set
 * to {@code true}.
 *
 * @return boolean indicating whether this {@code BitSet} is empty
 * @since  1.4
 */

	function isEmpty() public returns(bool)
	{
			return wordsInUse == 0;
	}

	/**
 * Returns true if the specified {@code BitSet} has any bits set to
 * {@code true} that are also set to {@code true} in this {@code BitSet}.
 *
 * @param  set {@code BitSet} to intersect with
 * @return boolean indicating whether this {@code BitSet} intersects
 *         the specified {@code BitSet}
 * @since  1.4
 */

	function intersects(BitSet set) public returns(bool)
	{
			for(int32 i = int32(Math.min(wordsInUse, set.wordsInUse) - 1); i >= 0; i--;)
			{
				if((words[uint256(i)] & set.words[uint256(i)]) != 0)
				{
					return true;				}			}
			return false;
	}

	/**
 * Returns the number of bits set to {@code true} in this {@code BitSet}.
 *
 * @return the number of bits set to {@code true} in this {@code BitSet}
 * @since  1.4
 */

	function cardinality() public returns(int32)
	{
			int32 sum = int32(0);
			for(int32 i = int32(0); i < wordsInUse; i++;)
			{
				sum += Long.bitCount(words[uint256(i)]);			}
			return sum;
	}

	/**
 * Performs a logical <b>AND</b> of this target bit set with the
 * argument bit set. This bit set is modified so that each bit in it
 * has the value {@code true} if and only if it both initially
 * had the value {@code true} and the corresponding bit in the
 * bit set argument also had the value {@code true}.
 *
 * @param set a bit set
 */

	function and(BitSet set) public
	{
			if(BitSet == set)
			{
				return 			}
			while(wordsInUse > set.wordsInUse)
			{
				words[uint256(--wordsInUse;)] = 0
			}
			// Perform logical AND on words in common

			for(int32 i = int32(0); i < wordsInUse; i++;)
			{
				words[uint256(i)] &= set.words[uint256(i)];			}
			recalculateWordsInUse();
			checkInvariants();
	}

	/**
 * Performs a logical <b>OR</b> of this bit set with the bit set
 * argument. This bit set is modified so that a bit in it has the
 * value {@code true} if and only if it either already had the
 * value {@code true} or the corresponding bit in the bit set
 * argument has the value {@code true}.
 *
 * @param set a bit set
 */

	function or(BitSet set) public
	{
			if(BitSet == set)
			{
				return 			}
			int32 wordsInCommon = int32(Math.min(wordsInUse, set.wordsInUse));
			if(wordsInUse < set.wordsInUse)
			{
					ensureCapacity(set.wordsInUse);
					wordsInUse = set.wordsInUse;
			}
			// Perform logical OR on words in common

			for(int32 i = int32(0); i < wordsInCommon; i++;)
			{
				words[uint256(i)] |= set.words[uint256(i)];			}
			// Copy any remaining words

			if(wordsInCommon < set.wordsInUse)
			{
				System.arraycopy(set.words, wordsInCommon, words, wordsInCommon, wordsInUse - wordsInCommon);			}
			// recalculateWordsInUse() is unnecessary

			checkInvariants();
	}

	/**
 * Performs a logical <b>XOR</b> of this bit set with the bit set
 * argument. This bit set is modified so that a bit in it has the
 * value {@code true} if and only if one of the following
 * statements holds:
 * <ul>
 * <li>The bit initially has the value {@code true}, and the
 *     corresponding bit in the argument has the value {@code false}.
 * <li>The bit initially has the value {@code false}, and the
 *     corresponding bit in the argument has the value {@code true}.
 * </ul>
 *
 * @param  set a bit set
 */

	function xor(BitSet set) public
	{
			int32 wordsInCommon = int32(Math.min(wordsInUse, set.wordsInUse));
			if(wordsInUse < set.wordsInUse)
			{
					ensureCapacity(set.wordsInUse);
					wordsInUse = set.wordsInUse;
			}
			// Perform logical XOR on words in common

			for(int32 i = int32(0); i < wordsInCommon; i++;)
			{
				words[uint256(i)] ^= set.words[uint256(i)];			}
			// Copy any remaining words

			if(wordsInCommon < set.wordsInUse)
			{
				System.arraycopy(set.words, wordsInCommon, words, wordsInCommon, set.wordsInUse - wordsInCommon);			}
			recalculateWordsInUse();
			checkInvariants();
	}

	/**
 * Clears all of the bits in this {@code BitSet} whose corresponding
 * bit is set in the specified {@code BitSet}.
 *
 * @param  set the {@code BitSet} with which to mask this
 *         {@code BitSet}
 * @since  1.2
 */

	function andNot(BitSet set) public
	{
			// Perform logical (a & !b) on words in common

			for(int32 i = int32(Math.min(wordsInUse, set.wordsInUse) - 1); i >= 0; i--;)
			{
				words[uint256(i)] &= ~set.words[uint256(i)];			}
			recalculateWordsInUse();
			checkInvariants();
	}

	/**
 * Returns the hash code value for this bit set. The hash code depends
 * only on which bits are set within this {@code BitSet}.
 *
 * <p>The hash code is defined to be the result of the following
 * calculation:
 *  <pre> {@code
 * public int hashCode() {
 *     long h = 1234;
 *     long[] words = toLongArray();
 *     for (int i = words.length; --i >= 0; )
 *         h ^= words[i] * (i + 1);
 *     return (int)((h >> 32) ^ h);
 * }}</pre>
 * Note that the hash code changes if the set of bits is altered.
 *
 * @return the hash code value for this bit set
 */

	function hashCode() public returns(int32)
	{
			int64 h = int64(1234);
			for(int32 i = int32(wordsInUse); --i; >= 0; )
			{
				h ^= words[uint256(i)] * (i + 1);			}
			return int32(((h >> 32) ^ h));
	}

	/**
 * Returns the number of bits of space actually in use by this
 * {@code BitSet} to represent bit values.
 * The maximum element in the set is the size - 1st element.
 *
 * @return the number of bits currently in this bit set
 */

	function size() public returns(int32)
	{
			return words.length * BITS_PER_WORD;
	}

	/**
 * Compares this object against the specified object.
 * The result is {@code true} if and only if the argument is
 * not {@code null} and is a {@code Bitset} object that has
 * exactly the same set of bits set to {@code true} as this bit
 * set. That is, for every nonnegative {@code int} index {@code k},
 * <pre>((BitSet)obj).get(k) == this.get(k)</pre>
 * must be true. The current sizes of the two bit sets are not compared.
 *
 * @param  obj the object to compare with
 * @return {@code true} if the objects are the same;
 *         {@code false} otherwise
 * @see    #size()
 */

	function equals(Object obj) public returns(bool)
	{
			if(!();)
			{
				return false;			}
			if(BitSet == obj)
			{
				return true;			}
			BitSet set = BitSet(BitSet(obj));
			checkInvariants();
			set.checkInvariants();
			if(wordsInUse != set.wordsInUse)
			{
				return false;			}
			// Check words in use by both BitSets

			for(int32 i = int32(0); i < wordsInUse; i++;)
			{
				if(words[uint256(i)] != set.words[uint256(i)])
				{
					return false;				}			}
			return true;
	}

	/**
 * Cloning this {@code BitSet} produces a new {@code BitSet}
 * that is equal to it.
 * The clone of the bit set is another bit set that has exactly the
 * same bits set to {@code true} as this bit set.
 *
 * @return a clone of this bit set
 * @see    #size()
 */

	function clone() public returns(Object)
	{
			if(!sizeIsSticky;)
			{
				trimToSize();			}
				//try

					BitSet result = BitSet(BitSet());
					result.words = words.clone();
					result.checkInvariants();
					return result;

				/* catch (CloneNotSupportedException e) {
    throw new InternalError();
}*/


	}

	/**
 * Attempts to reduce internal storage used for the bits in this bit set.
 * Calling this method may, but is not required to, affect the value
 * returned by a subsequent call to the {@link #size()} method.
 */

	function trimToSize() private
	{
			if(wordsInUse != words.length)
			{
					words = Arrays.copyOf(words, wordsInUse);
					checkInvariants();
			}
	}

	/**
 * Save the state of the {@code BitSet} instance to a stream (i.e.,
 * serialize it).
 */

	function writeObject(ObjectOutputStream s) private
	{
			checkInvariants();
			if(!sizeIsSticky;)
			{
				trimToSize();			}
			PutField fields = PutField(s.putFields());
			fields.put("bits", words);
			s.writeFields();
	}

	/**
 * Reconstitute the {@code BitSet} instance from a stream (i.e.,
 * deserialize it).
 */

	function readObject(ObjectInputStream s) private
	{
			GetField fields = GetField(s.readFields());
			words = int64[](fields.get("bits", none));
			// or reduction in logical size

			wordsInUse = words.length;
			recalculateWordsInUse();
			// heuristic

			sizeIsSticky = (words.length > 0 && words[uint256(words.length - 1)] == 0);
			checkInvariants();
	}

	/**
 * Returns a string representation of this bit set. For every index
 * for which this {@code BitSet} contains a bit in the set
 * state, the decimal representation of that index is included in
 * the result. Such indices are listed in order from lowest to
 * highest, separated by ",&nbsp;" (a comma and a space) and
 * surrounded by braces, resulting in the usual mathematical
 * notation for a set of integers.
 *
 * <p>Example:
 * <pre>
 * BitSet drPepper = new BitSet();</pre>
 * Now {@code drPepper.toString()} returns "{@code {}}".<p>
 * <pre>
 * drPepper.set(2);</pre>
 * Now {@code drPepper.toString()} returns "{@code {2}}".<p>
 * <pre>
 * drPepper.set(4);
 * drPepper.set(10);</pre>
 * Now {@code drPepper.toString()} returns "{@code {2, 4, 10}}".
 *
 * @return a string representation of this bit set
 */

	function toString() public returns(String)
	{
			checkInvariants();
			int32 numBits = int32((wordsInUse > 128) ? cardinality() : wordsInUse * BITS_PER_WORD);
			StringBuilder b;
			b.append("{");
			int32 i = int32(nextSetBit(0));
			if(i != -1;)
			{
					b.append(i);
					for(i = nextSetBit(i + 1); i >= 0; i = nextSetBit(i + 1);)
					{
							int32 endOfRun = int32(nextClearBit(i));
							do
							{
									b.append(", ").append(i);

							}while(++i; < endOfRun);
					}
			}
			b.append("}");
			return b.toString();
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
 * Creates a new bit set. All bits are initially {@code false}.
 */

	function constructor1() public	overloadedConstructor( 1 )
	{
			initWords(BITS_PER_WORD);
			sizeIsSticky = false;
	}

	/**
 * Creates a bit set whose initial size is large enough to explicitly
 * represent bits with indices in the range {@code 0} through
 * {@code nbits-1}. All bits are initially {@code false}.
 *
 * @param  nbits the initial size of the bit set
 * @throws NegativeArraySizeException if the specified initial size
 *         is negative
 */

	function constructor2(int32 nbits) public	overloadedConstructor( 2 )
	{
			initWords(nbits);
			sizeIsSticky = true;
	}

}

library BitSet_Library
{
	/**
 * Given a bit index, return word index containing it.
 */

	function wordIndex(int32 bitIndex) private returns(int32)
	{
			return bitIndex >> ADDRESS_BITS_PER_WORD;
	}

	/**
 * Returns a new bit set containing all the bits in the given long array.
 *
 * <p>More precisely,
 * <br>{@code BitSet.valueOf(longs).get(n) == ((longs[n/64] & (1L<<(n%64))) != 0)}
 * <br>for all {@code n < 64 * longs.length}.
 *
 * <p>This method is equivalent to
 * {@code BitSet.valueOf(LongBuffer.wrap(longs))}.
 *
 * @param longs a long array containing a little-endian representation
 *        of a sequence of bits to be used as the initial bits of the
 *        new bit set
 * @since 1.7
 */

	function valueOf(int64[] memory longs) public returns(BitSet)
	{
			int32 n;
			return 
	}

	/**
 * Returns a new bit set containing all the bits in the given long
 * buffer between its position and limit.
 *
 * <p>More precisely,
 * <br>{@code BitSet.valueOf(lb).get(n) == ((lb.get(lb.position()+n/64) & (1L<<(n%64))) != 0)}
 * <br>for all {@code n < 64 * lb.remaining()}.
 *
 * <p>The long buffer is not modified by this method, and no
 * reference to the buffer is retained by the bit set.
 *
 * @param lb a long buffer containing a little-endian representation
 *        of a sequence of bits between its position and limit, to be
 *        used as the initial bits of the new bit set
 * @since 1.7
 */

	function valueOf(LongBuffer lb) public returns(BitSet)
	{
			lb = lb.slice();
			int32 n;
			lb.get(words);
			return 
	}

	/**
 * Returns a new bit set containing all the bits in the given byte array.
 *
 * <p>More precisely,
 * <br>{@code BitSet.valueOf(bytes).get(n) == ((bytes[n/8] & (1<<(n%8))) != 0)}
 * <br>for all {@code n <  8 * bytes.length}.
 *
 * <p>This method is equivalent to
 * {@code BitSet.valueOf(ByteBuffer.wrap(bytes))}.
 *
 * @param bytes a byte array containing a little-endian
 *        representation of a sequence of bits to be used as the
 *        initial bits of the new bit set
 * @since 1.7
 */

	function valueOf(int8[] memory bytes) public returns(BitSet)
	{
			return BitSet.valueOf(ByteBuffer.wrap(bytes));
	}

	/**
 * Returns a new bit set containing all the bits in the given byte
 * buffer between its position and limit.
 *
 * <p>More precisely,
 * <br>{@code BitSet.valueOf(bb).get(n) == ((bb.get(bb.position()+n/8) & (1<<(n%8))) != 0)}
 * <br>for all {@code n < 8 * bb.remaining()}.
 *
 * <p>The byte buffer is not modified by this method, and no
 * reference to the buffer is retained by the bit set.
 *
 * @param bb a byte buffer containing a little-endian representation
 *        of a sequence of bits between its position and limit, to be
 *        used as the initial bits of the new bit set
 * @since 1.7
 */

	function valueOf(ByteBuffer bb) public returns(BitSet)
	{
			bb = bb.slice().order(ByteOrder.LITTLE_ENDIAN);
			int32 n;
			bb.limit(n);
			int32 i = int32(0);
			while(bb.remaining() >= 8)
			{
				words[uint256(i++;)] = bb.getLong()
			}
			for(int32 remaining = int32(bb.remaining()); j < remaining; j++;)
			{
				words[uint256(i)] |= (bb.get() & 0xff) << (8 * j);			}
			return 
	}

	/**
 * Checks that fromIndex ... toIndex is a valid range of bit indices.
 */

	function checkRange(int32 fromIndex, int32 toIndex) private
	{
	}

}

