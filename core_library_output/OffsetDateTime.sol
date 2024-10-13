pragma solidity 0.7.2;

//package java.time


import "java/time/temporal/ChronoField/EPOCH_DAY.sol";

import "java/time/temporal/ChronoField/INSTANT_SECONDS.sol";

import "java/time/temporal/ChronoField/NANO_OF_DAY.sol";

import "java/time/temporal/ChronoField/OFFSET_SECONDS.sol";

import "java/time/temporal/ChronoUnit/FOREVER.sol";

import "java/time/temporal/ChronoUnit/NANOS.sol";

import "java/io/IOException.sol";

import "java/io/ObjectInput.sol";

import "java/io/ObjectOutput.sol";

import "java/io/InvalidObjectException.sol";

import "java/io/ObjectInputStream.sol";

import "java/io/Serializable.sol";

import "java/time/chrono/IsoChronology.sol";

import "java/time/format/DateTimeFormatter.sol";

import "java/time/format/DateTimeParseException.sol";

import "java/time/temporal/ChronoField.sol";

import "java/time/temporal/ChronoUnit.sol";

import "java/time/temporal/Temporal.sol";

import "java/time/temporal/TemporalAccessor.sol";

import "java/time/temporal/TemporalAdjuster.sol";

import "java/time/temporal/TemporalAmount.sol";

import "java/time/temporal/TemporalField.sol";

import "java/time/temporal/TemporalQueries.sol";

import "java/time/temporal/TemporalQuery.sol";

import "java/time/temporal/TemporalUnit.sol";

import "java/time/temporal/UnsupportedTemporalTypeException.sol";

import "java/time/temporal/ValueRange.sol";

import "java/time/zone/ZoneRules.sol";

import "java/util/Comparator.sol";

import "java/util/Objects.sol";

/**
 * A date-time with an offset from UTC/Greenwich in the ISO-8601 calendar system,
 * such as {@code 2007-12-03T10:15:30+01:00}.
 * <p>
 * {@code OffsetDateTime} is an immutable representation of a date-time with an offset.
 * This class stores all date and time fields, to a precision of nanoseconds,
 * as well as the offset from UTC/Greenwich. For example, the value
 * "2nd October 2007 at 13:45.30.123456789 +02:00" can be stored in an {@code OffsetDateTime}.
 * <p>
 * {@code OffsetDateTime}, {@link java.time.ZonedDateTime} and {@link java.time.Instant} all store an instant
 * on the time-line to nanosecond precision.
 * {@code Instant} is the simplest, simply representing the instant.
 * {@code OffsetDateTime} adds to the instant the offset from UTC/Greenwich, which allows
 * the local date-time to be obtained.
 * {@code ZonedDateTime} adds full time-zone rules.
 * <p>
 * It is intended that {@code ZonedDateTime} or {@code Instant} is used to model data
 * in simpler applications. This class may be used when modeling date-time concepts in
 * more detail, or when communicating to a database or in a network protocol.
 *
 * <p>
 * This is a <a href="{@docRoot}/java/lang/doc-files/ValueBased.html">value-based</a>
 * class; use of identity-sensitive operations (including reference equality
 * ({@code ==}), identity hash code, or synchronization) on instances of
 * {@code OffsetDateTime} may have unpredictable results and should be avoided.
 * The {@code equals} method should be used for comparisons.
 *
 * @implSpec
 * This class is immutable and thread-safe.
 *
 * @since 1.8
 */

contract OffsetDateTime
{
	/**
 * The minimum supported {@code OffsetDateTime}, '-999999999-01-01T00:00:00+18:00'.
 * This is the local date-time of midnight at the start of the minimum date
 * in the maximum offset (larger offsets are earlier on the time-line).
 * This combines {@link LocalDateTime#MIN} and {@link ZoneOffset#MAX}.
 * This could be used by an application as a "far past" date-time.
 */

	OffsetDateTime static  immutable MIN = OffsetDateTime(LocalDateTime.MIN.atOffset(ZoneOffset.MAX));

	/**
 * The maximum supported {@code OffsetDateTime}, '+999999999-12-31T23:59:59.999999999-18:00'.
 * This is the local date-time just before midnight at the end of the maximum date
 * in the minimum offset (larger negative offsets are later on the time-line).
 * This combines {@link LocalDateTime#MAX} and {@link ZoneOffset#MIN}.
 * This could be used by an application as a "far future" date-time.
 */

	OffsetDateTime static  immutable MAX = OffsetDateTime(LocalDateTime.MAX.atOffset(ZoneOffset.MIN));

	/**
 * Gets a comparator that compares two {@code OffsetDateTime} instances
 * based solely on the instant.
 * <p>
 * This method differs from the comparison in {@link #compareTo} in that it
 * only compares the underlying instant.
 *
 * @return a comparator that compares in time-line order
 *
 * @see #isAfter
 * @see #isBefore
 * @see #isEqual
 */

	function timeLineOrder() public returns(Comparator)
	{
			return 
	}

	/**
 * Compares this {@code OffsetDateTime} to another date-time.
 * The comparison is based on the instant.
 *
 * @param datetime1  the first date-time to compare, not null
 * @param datetime2  the other date-time to compare to, not null
 * @return the comparator value, negative if less, positive if greater
 */

	function compareInstant(OffsetDateTime datetime1, OffsetDateTime datetime2) private returns(int32)
	{
			if(.getOffset().equals(.getOffset()))
			{
					return .toLocalDateTime().compareTo(.toLocalDateTime());
			}
			int32 cmp = int32(.compare(.toEpochSecond(), .toEpochSecond()));
			if(cmp == 0)
			{
					cmp = .toLocalTime().getNano() - .toLocalTime().getNano();
			}
			return cmp;
	}

	/**
 * Serialization version.
 */

	int64 static  immutable serialVersionUID;

	/**
 * The local date-time.
 */

	LocalDateTime private  immutable dateTime;

	/**
 * The offset from UTC/Greenwich.
 */

	ZoneOffset private  immutable offset;

	/**
 * Obtains the current date-time from the system clock in the default time-zone.
 * <p>
 * This will query the {@link java.time.Clock#systemDefaultZone() system clock} in the default
 * time-zone to obtain the current date-time.
 * The offset will be calculated from the time-zone in the clock.
 * <p>
 * Using this method will prevent the ability to use an alternate clock for testing
 * because the clock is hard-coded.
 *
 * @return the current date-time using the system clock, not null
 */

	function now() public returns(OffsetDateTime)
	{
			return now(.systemDefaultZone());
	}

	/**
 * Obtains the current date-time from the system clock in the specified time-zone.
 * <p>
 * This will query the {@link Clock#system(java.time.ZoneId) system clock} to obtain the current date-time.
 * Specifying the time-zone avoids dependence on the default time-zone.
 * The offset will be calculated from the specified time-zone.
 * <p>
 * Using this method will prevent the ability to use an alternate clock for testing
 * because the clock is hard-coded.
 *
 * @param zone  the zone ID to use, not null
 * @return the current date-time using the system clock, not null
 */

	function now(ZoneId zone) public returns(OffsetDateTime)
	{
			return 
	}

	/**
 * Obtains the current date-time from the specified clock.
 * <p>
 * This will query the specified clock to obtain the current date-time.
 * The offset will be calculated from the time-zone in the clock.
 * <p>
 * Using this method allows the use of an alternate clock for testing.
 * The alternate clock may be introduced using {@link Clock dependency injection}.
 *
 * @param clock  the clock to use, not null
 * @return the current date-time, not null
 */

	function now(Clock clock) public returns(OffsetDateTime)
	{
			// called once

			Instant now = Instant(.instant());
			return ofInstant(now, .getZone().getRules().getOffset(now));
	}

	/**
 * Obtains an instance of {@code OffsetDateTime} from a date, time and offset.
 * <p>
 * This creates an offset date-time with the specified local date, time and offset.
 *
 * @param date  the local date, not null
 * @param time  the local time, not null
 * @param offset  the zone offset, not null
 * @return the offset date-time, not null
 */

	function of(LocalDate date, LocalTime time, ZoneOffset offset) public returns(OffsetDateTime)
	{
			LocalDateTime dt;
			return 
	}

	/**
 * Obtains an instance of {@code OffsetDateTime} from a date-time and offset.
 * <p>
 * This creates an offset date-time with the specified local date-time and offset.
 *
 * @param dateTime  the local date-time, not null
 * @param offset  the zone offset, not null
 * @return the offset date-time, not null
 */

	function of(LocalDateTime dateTime, ZoneOffset offset) public returns(OffsetDateTime)
	{
			return 
	}

	/**
 * Obtains an instance of {@code OffsetDateTime} from a year, month, day,
 * hour, minute, second, nanosecond and offset.
 * <p>
 * This creates an offset date-time with the seven specified fields.
 * <p>
 * This method exists primarily for writing test cases.
 * Non test-code will typically use other methods to create an offset time.
 * {@code LocalDateTime} has five additional convenience variants of the
 * equivalent factory method taking fewer arguments.
 * They are not provided here to reduce the footprint of the API.
 *
 * @param year  the year to represent, from MIN_YEAR to MAX_YEAR
 * @param month  the month-of-year to represent, from 1 (January) to 12 (December)
 * @param dayOfMonth  the day-of-month to represent, from 1 to 31
 * @param hour  the hour-of-day to represent, from 0 to 23
 * @param minute  the minute-of-hour to represent, from 0 to 59
 * @param second  the second-of-minute to represent, from 0 to 59
 * @param nanoOfSecond  the nano-of-second to represent, from 0 to 999,999,999
 * @param offset  the zone offset, not null
 * @return the offset date-time, not null
 * @throws DateTimeException if the value of any field is out of range, or
 *  if the day-of-month is invalid for the month-year
 */

	function of(int32 year, int32 month, int32 dayOfMonth, int32 hour, int32 minute, int32 second, int32 nanoOfSecond, ZoneOffset offset) public returns(OffsetDateTime)
	{
			LocalDateTime dt;
			return 
	}

	/**
 * Obtains an instance of {@code OffsetDateTime} from an {@code Instant} and zone ID.
 * <p>
 * This creates an offset date-time with the same instant as that specified.
 * Finding the offset from UTC/Greenwich is simple as there is only one valid
 * offset for each instant.
 *
 * @param instant  the instant to create the date-time from, not null
 * @param zone  the time-zone, which may be an offset, not null
 * @return the offset date-time, not null
 * @throws DateTimeException if the result exceeds the supported range
 */

	function ofInstant(Instant instant, ZoneId zone) public returns(OffsetDateTime)
	{
			ZoneRules rules = ZoneRules(.getRules());
			ZoneOffset offset;
			LocalDateTime ldt = LocalDateTime(.ofEpochSecond(.getEpochSecond(), .getNano(), offset));
			return 
	}

	/**
 * Obtains an instance of {@code OffsetDateTime} from a temporal object.
 * <p>
 * This obtains an offset date-time based on the specified temporal.
 * A {@code TemporalAccessor} represents an arbitrary set of date and time information,
 * which this factory converts to an instance of {@code OffsetDateTime}.
 * <p>
 * The conversion will first obtain a {@code ZoneOffset} from the temporal object.
 * It will then try to obtain a {@code LocalDateTime}, falling back to an {@code Instant} if necessary.
 * The result will be the combination of {@code ZoneOffset} with either
 * with {@code LocalDateTime} or {@code Instant}.
 * Implementations are permitted to perform optimizations such as accessing
 * those fields that are equivalent to the relevant objects.
 * <p>
 * This method matches the signature of the functional interface {@link TemporalQuery}
 * allowing it to be used in queries via method reference, {@code OffsetDateTime::from}.
 *
 * @param temporal  the temporal object to convert, not null
 * @return the offset date-time, not null
 * @throws DateTimeException if unable to convert to an {@code OffsetDateTime}
 */

	function from(TemporalAccessor temporal) public returns(OffsetDateTime)
	{
				//try

					ZoneOffset offset;
					LocalDate date = LocalDate(.query(.localDate()));
					LocalTime time = LocalTime(.query(.localTime()));
					if( && )
					{
							return OffsetDateTime_Library.of(date, time, offset);
					}
					else
					{
							Instant instant;
							return .ofInstant(instant, offset);
					}


				/* catch (DateTimeException ex) {
    throw new DateTimeException("Unable to obtain OffsetDateTime from TemporalAccessor: " + temporal + " of type " + temporal.getClass().getName(), ex);
}*/


	}

	/**
 * Obtains an instance of {@code OffsetDateTime} from a text string
 * such as {@code 2007-12-03T10:15:30+01:00}.
 * <p>
 * The string must represent a valid date-time and is parsed using
 * {@link java.time.format.DateTimeFormatter#ISO_OFFSET_DATE_TIME}.
 *
 * @param text  the text to parse such as "2007-12-03T10:15:30+01:00", not null
 * @return the parsed offset date-time, not null
 * @throws DateTimeParseException if the text cannot be parsed
 */

	function parse(CharSequence text) public returns(OffsetDateTime)
	{
			return 
	}

	/**
 * Obtains an instance of {@code OffsetDateTime} from a text string using a specific formatter.
 * <p>
 * The text is parsed using the formatter, returning a date-time.
 *
 * @param text  the text to parse, not null
 * @param formatter  the formatter to use, not null
 * @return the parsed offset date-time, not null
 * @throws DateTimeParseException if the text cannot be parsed
 */

	function parse(CharSequence text, DateTimeFormatter formatter) public returns(OffsetDateTime)
	{
			return 
	}

	/**
 * Returns a new date-time based on this one, returning {@code this} where possible.
 *
 * @param dateTime  the date-time to create with, not null
 * @param offset  the zone offset to create with, not null
 */

	function with(LocalDateTime dateTime, ZoneOffset offset) private returns(OffsetDateTime)
	{
			if( == dateTime && .equals(offset))
			{
					return 
			}
			return 
	}

	/**
 * Checks if the specified field is supported.
 * <p>
 * This checks if this date-time can be queried for the specified field.
 * If false, then calling the {@link #range(TemporalField) range},
 * {@link #get(TemporalField) get} and {@link #with(TemporalField, long)}
 * methods will throw an exception.
 * <p>
 * If the field is a {@link ChronoField} then the query is implemented here.
 * The supported fields are:
 * <ul>
 * <li>{@code NANO_OF_SECOND}
 * <li>{@code NANO_OF_DAY}
 * <li>{@code MICRO_OF_SECOND}
 * <li>{@code MICRO_OF_DAY}
 * <li>{@code MILLI_OF_SECOND}
 * <li>{@code MILLI_OF_DAY}
 * <li>{@code SECOND_OF_MINUTE}
 * <li>{@code SECOND_OF_DAY}
 * <li>{@code MINUTE_OF_HOUR}
 * <li>{@code MINUTE_OF_DAY}
 * <li>{@code HOUR_OF_AMPM}
 * <li>{@code CLOCK_HOUR_OF_AMPM}
 * <li>{@code HOUR_OF_DAY}
 * <li>{@code CLOCK_HOUR_OF_DAY}
 * <li>{@code AMPM_OF_DAY}
 * <li>{@code DAY_OF_WEEK}
 * <li>{@code ALIGNED_DAY_OF_WEEK_IN_MONTH}
 * <li>{@code ALIGNED_DAY_OF_WEEK_IN_YEAR}
 * <li>{@code DAY_OF_MONTH}
 * <li>{@code DAY_OF_YEAR}
 * <li>{@code EPOCH_DAY}
 * <li>{@code ALIGNED_WEEK_OF_MONTH}
 * <li>{@code ALIGNED_WEEK_OF_YEAR}
 * <li>{@code MONTH_OF_YEAR}
 * <li>{@code PROLEPTIC_MONTH}
 * <li>{@code YEAR_OF_ERA}
 * <li>{@code YEAR}
 * <li>{@code ERA}
 * <li>{@code INSTANT_SECONDS}
 * <li>{@code OFFSET_SECONDS}
 * </ul>
 * All other {@code ChronoField} instances will return false.
 * <p>
 * If the field is not a {@code ChronoField}, then the result of this method
 * is obtained by invoking {@code TemporalField.isSupportedBy(TemporalAccessor)}
 * passing {@code this} as the argument.
 * Whether the field is supported is determined by the field.
 *
 * @param field  the field to check, null returns false
 * @return true if the field is supported on this date-time, false if not
 */

	function isSupported(TemporalField field) public returns(bool)
	{
			return ;
	}

	/**
 * Checks if the specified unit is supported.
 * <p>
 * This checks if the specified unit can be added to, or subtracted from, this date-time.
 * If false, then calling the {@link #plus(long, TemporalUnit)} and
 * {@link #minus(long, TemporalUnit) minus} methods will throw an exception.
 * <p>
 * If the unit is a {@link ChronoUnit} then the query is implemented here.
 * The supported units are:
 * <ul>
 * <li>{@code NANOS}
 * <li>{@code MICROS}
 * <li>{@code MILLIS}
 * <li>{@code SECONDS}
 * <li>{@code MINUTES}
 * <li>{@code HOURS}
 * <li>{@code HALF_DAYS}
 * <li>{@code DAYS}
 * <li>{@code WEEKS}
 * <li>{@code MONTHS}
 * <li>{@code YEARS}
 * <li>{@code DECADES}
 * <li>{@code CENTURIES}
 * <li>{@code MILLENNIA}
 * <li>{@code ERAS}
 * </ul>
 * All other {@code ChronoUnit} instances will return false.
 * <p>
 * If the unit is not a {@code ChronoUnit}, then the result of this method
 * is obtained by invoking {@code TemporalUnit.isSupportedBy(Temporal)}
 * passing {@code this} as the argument.
 * Whether the unit is supported is determined by the unit.
 *
 * @param unit  the unit to check, null returns false
 * @return true if the unit can be added/subtracted, false if not
 */

	function isSupported(TemporalUnit unit) public returns(bool)
	{
			return ;
	}

	/**
 * Gets the range of valid values for the specified field.
 * <p>
 * The range object expresses the minimum and maximum valid values for a field.
 * This date-time is used to enhance the accuracy of the returned range.
 * If it is not possible to return the range, because the field is not supported
 * or for some other reason, an exception is thrown.
 * <p>
 * If the field is a {@link ChronoField} then the query is implemented here.
 * The {@link #isSupported(TemporalField) supported fields} will return
 * appropriate range instances.
 * All other {@code ChronoField} instances will throw an {@code UnsupportedTemporalTypeException}.
 * <p>
 * If the field is not a {@code ChronoField}, then the result of this method
 * is obtained by invoking {@code TemporalField.rangeRefinedBy(TemporalAccessor)}
 * passing {@code this} as the argument.
 * Whether the range can be obtained is determined by the field.
 *
 * @param field  the field to query the range for, not null
 * @return the range of valid values for the field, not null
 * @throws DateTimeException if the range for the field cannot be obtained
 * @throws UnsupportedTemporalTypeException if the field is not supported
 */

	function range(TemporalField field) public returns(ValueRange)
	{
			return 
	}

	/**
 * Gets the value of the specified field from this date-time as an {@code int}.
 * <p>
 * This queries this date-time for the value for the specified field.
 * The returned value will always be within the valid range of values for the field.
 * If it is not possible to return the value, because the field is not supported
 * or for some other reason, an exception is thrown.
 * <p>
 * If the field is a {@link ChronoField} then the query is implemented here.
 * The {@link #isSupported(TemporalField) supported fields} will return valid
 * values based on this date-time, except {@code NANO_OF_DAY}, {@code MICRO_OF_DAY},
 * {@code EPOCH_DAY}, {@code PROLEPTIC_MONTH} and {@code INSTANT_SECONDS} which are too
 * large to fit in an {@code int} and throw a {@code DateTimeException}.
 * All other {@code ChronoField} instances will throw an {@code UnsupportedTemporalTypeException}.
 * <p>
 * If the field is not a {@code ChronoField}, then the result of this method
 * is obtained by invoking {@code TemporalField.getFrom(TemporalAccessor)}
 * passing {@code this} as the argument. Whether the value can be obtained,
 * and what the value represents, is determined by the field.
 *
 * @param field  the field to get, not null
 * @return the value for the field
 * @throws DateTimeException if a value for the field cannot be obtained or
 *         the value is outside the range of valid values for the field
 * @throws UnsupportedTemporalTypeException if the field is not supported or
 *         the range of values exceeds an {@code int}
 * @throws ArithmeticException if numeric overflow occurs
 */

	function get(TemporalField field) public returns(int32)
	{
			return 
	}

	/**
 * Gets the value of the specified field from this date-time as a {@code long}.
 * <p>
 * This queries this date-time for the value for the specified field.
 * If it is not possible to return the value, because the field is not supported
 * or for some other reason, an exception is thrown.
 * <p>
 * If the field is a {@link ChronoField} then the query is implemented here.
 * The {@link #isSupported(TemporalField) supported fields} will return valid
 * values based on this date-time.
 * All other {@code ChronoField} instances will throw an {@code UnsupportedTemporalTypeException}.
 * <p>
 * If the field is not a {@code ChronoField}, then the result of this method
 * is obtained by invoking {@code TemporalField.getFrom(TemporalAccessor)}
 * passing {@code this} as the argument. Whether the value can be obtained,
 * and what the value represents, is determined by the field.
 *
 * @param field  the field to get, not null
 * @return the value for the field
 * @throws DateTimeException if a value for the field cannot be obtained
 * @throws UnsupportedTemporalTypeException if the field is not supported
 * @throws ArithmeticException if numeric overflow occurs
 */

	function getLong(TemporalField field) public returns(int64)
	{
			return 
	}

	/**
 * Gets the zone offset, such as '+01:00'.
 * <p>
 * This is the offset of the local date-time from UTC/Greenwich.
 *
 * @return the zone offset, not null
 */

	function getOffset() public returns(ZoneOffset)
	{
			return offset;
	}

	/**
 * Returns a copy of this {@code OffsetDateTime} with the specified offset ensuring
 * that the result has the same local date-time.
 * <p>
 * This method returns an object with the same {@code LocalDateTime} and the specified {@code ZoneOffset}.
 * No calculation is needed or performed.
 * For example, if this time represents {@code 2007-12-03T10:30+02:00} and the offset specified is
 * {@code +03:00}, then this method will return {@code 2007-12-03T10:30+03:00}.
 * <p>
 * To take into account the difference between the offsets, and adjust the time fields,
 * use {@link #withOffsetSameInstant}.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param offset  the zone offset to change to, not null
 * @return an {@code OffsetDateTime} based on this date-time with the requested offset, not null
 */

	function withOffsetSameLocal(ZoneOffset offset) public returns(OffsetDateTime)
	{
			return with(dateTime, offset);
	}

	/**
 * Returns a copy of this {@code OffsetDateTime} with the specified offset ensuring
 * that the result is at the same instant.
 * <p>
 * This method returns an object with the specified {@code ZoneOffset} and a {@code LocalDateTime}
 * adjusted by the difference between the two offsets.
 * This will result in the old and new objects representing the same instant.
 * This is useful for finding the local time in a different offset.
 * For example, if this time represents {@code 2007-12-03T10:30+02:00} and the offset specified is
 * {@code +03:00}, then this method will return {@code 2007-12-03T11:30+03:00}.
 * <p>
 * To change the offset without adjusting the local time use {@link #withOffsetSameLocal}.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param offset  the zone offset to change to, not null
 * @return an {@code OffsetDateTime} based on this date-time with the requested offset, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function withOffsetSameInstant(ZoneOffset offset) public returns(OffsetDateTime)
	{
			if(.equals())
			{
					return 
			}
			int32 difference = int32(.getTotalSeconds() - .getTotalSeconds());
			LocalDateTime adjusted = LocalDateTime(.plusSeconds(difference));
			return 
	}

	/**
 * Gets the {@code LocalDateTime} part of this offset date-time.
 * <p>
 * This returns a {@code LocalDateTime} with the same year, month, day and time
 * as this date-time.
 *
 * @return the local date-time part of this date-time, not null
 */

	function toLocalDateTime() public returns(LocalDateTime)
	{
			return dateTime;
	}

	/**
 * Gets the {@code LocalDate} part of this date-time.
 * <p>
 * This returns a {@code LocalDate} with the same year, month and day
 * as this date-time.
 *
 * @return the date part of this date-time, not null
 */

	function toLocalDate() public returns(LocalDate)
	{
			return .toLocalDate();
	}

	/**
 * Gets the year field.
 * <p>
 * This method returns the primitive {@code int} value for the year.
 * <p>
 * The year returned by this method is proleptic as per {@code get(YEAR)}.
 * To obtain the year-of-era, use {@code get(YEAR_OF_ERA)}.
 *
 * @return the year, from MIN_YEAR to MAX_YEAR
 */

	function getYear() public returns(int32)
	{
			return .getYear();
	}

	/**
 * Gets the month-of-year field from 1 to 12.
 * <p>
 * This method returns the month as an {@code int} from 1 to 12.
 * Application code is frequently clearer if the enum {@link Month}
 * is used by calling {@link #getMonth()}.
 *
 * @return the month-of-year, from 1 to 12
 * @see #getMonth()
 */

	function getMonthValue() public returns(int32)
	{
			return .getMonthValue();
	}

	/**
 * Gets the month-of-year field using the {@code Month} enum.
 * <p>
 * This method returns the enum {@link Month} for the month.
 * This avoids confusion as to what {@code int} values mean.
 * If you need access to the primitive {@code int} value then the enum
 * provides the {@link Month#getValue() int value}.
 *
 * @return the month-of-year, not null
 * @see #getMonthValue()
 */

	function getMonth() public returns(Month)
	{
			return .getMonth();
	}

	/**
 * Gets the day-of-month field.
 * <p>
 * This method returns the primitive {@code int} value for the day-of-month.
 *
 * @return the day-of-month, from 1 to 31
 */

	function getDayOfMonth() public returns(int32)
	{
			return .getDayOfMonth();
	}

	/**
 * Gets the day-of-year field.
 * <p>
 * This method returns the primitive {@code int} value for the day-of-year.
 *
 * @return the day-of-year, from 1 to 365, or 366 in a leap year
 */

	function getDayOfYear() public returns(int32)
	{
			return .getDayOfYear();
	}

	/**
 * Gets the day-of-week field, which is an enum {@code DayOfWeek}.
 * <p>
 * This method returns the enum {@link java.time.DayOfWeek} for the day-of-week.
 * This avoids confusion as to what {@code int} values mean.
 * If you need access to the primitive {@code int} value then the enum
 * provides the {@link java.time.DayOfWeek#getValue() int value}.
 * <p>
 * Additional information can be obtained from the {@code DayOfWeek}.
 * This includes textual names of the values.
 *
 * @return the day-of-week, not null
 */

	function getDayOfWeek() public returns(DayOfWeek)
	{
			return .getDayOfWeek();
	}

	/**
 * Gets the {@code LocalTime} part of this date-time.
 * <p>
 * This returns a {@code LocalTime} with the same hour, minute, second and
 * nanosecond as this date-time.
 *
 * @return the time part of this date-time, not null
 */

	function toLocalTime() public returns(LocalTime)
	{
			return .toLocalTime();
	}

	/**
 * Gets the hour-of-day field.
 *
 * @return the hour-of-day, from 0 to 23
 */

	function getHour() public returns(int32)
	{
			return .getHour();
	}

	/**
 * Gets the minute-of-hour field.
 *
 * @return the minute-of-hour, from 0 to 59
 */

	function getMinute() public returns(int32)
	{
			return .getMinute();
	}

	/**
 * Gets the second-of-minute field.
 *
 * @return the second-of-minute, from 0 to 59
 */

	function getSecond() public returns(int32)
	{
			return .getSecond();
	}

	/**
 * Gets the nano-of-second field.
 *
 * @return the nano-of-second, from 0 to 999,999,999
 */

	function getNano() public returns(int32)
	{
			return .getNano();
	}

	/**
 * Returns an adjusted copy of this date-time.
 * <p>
 * This returns an {@code OffsetDateTime}, based on this one, with the date-time adjusted.
 * The adjustment takes place using the specified adjuster strategy object.
 * Read the documentation of the adjuster to understand what adjustment will be made.
 * <p>
 * A simple adjuster might simply set the one of the fields, such as the year field.
 * A more complex adjuster might set the date to the last day of the month.
 * A selection of common adjustments is provided in {@link TemporalAdjuster}.
 * These include finding the "last day of the month" and "next Wednesday".
 * Key date-time classes also implement the {@code TemporalAdjuster} interface,
 * such as {@link Month} and {@link java.time.MonthDay MonthDay}.
 * The adjuster is responsible for handling special cases, such as the varying
 * lengths of month and leap years.
 * <p>
 * For example this code returns a date on the last day of July:
 * <pre>
 *  import static java.time.Month.*;
 *  import static java.time.temporal.Adjusters.*;
 *
 *  result = offsetDateTime.with(JULY).with(lastDayOfMonth());
 * </pre>
 * <p>
 * The classes {@link LocalDate}, {@link LocalTime} and {@link ZoneOffset} implement
 * {@code TemporalAdjuster}, thus this method can be used to change the date, time or offset:
 * <pre>
 *  result = offsetDateTime.with(date);
 *  result = offsetDateTime.with(time);
 *  result = offsetDateTime.with(offset);
 * </pre>
 * <p>
 * The result of this method is obtained by invoking the
 * {@link TemporalAdjuster#adjustInto(Temporal)} method on the
 * specified adjuster passing {@code this} as the argument.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param adjuster the adjuster to use, not null
 * @return an {@code OffsetDateTime} based on {@code this} with the adjustment made, not null
 * @throws DateTimeException if the adjustment cannot be made
 * @throws ArithmeticException if numeric overflow occurs
 */

	function with(TemporalAdjuster adjuster) public returns(OffsetDateTime)
	{
			return OffsetDateTime();
	}

	/**
 * Returns a copy of this date-time with the specified field set to a new value.
 * <p>
 * TThis returns an {@code OffsetDateTime}, based on this one, with the value
 * for the specified field changed.
 * This can be used to change any supported field, such as the year, month or day-of-month.
 * If it is not possible to set the value, because the field is not supported or for
 * some other reason, an exception is thrown.
 * <p>
 * In some cases, changing the specified field can cause the resulting date-time to become invalid,
 * such as changing the month from 31st January to February would make the day-of-month invalid.
 * In cases like this, the field is responsible for resolving the date. Typically it will choose
 * the previous valid date, which would be the last valid day of February in this example.
 * <p>
 * If the field is a {@link ChronoField} then the adjustment is implemented here.
 * <p>
 * The {@code INSTANT_SECONDS} field will return a date-time with the specified instant.
 * The offset and nano-of-second are unchanged.
 * If the new instant value is outside the valid range then a {@code DateTimeException} will be thrown.
 * <p>
 * The {@code OFFSET_SECONDS} field will return a date-time with the specified offset.
 * The local date-time is unaltered. If the new offset value is outside the valid range
 * then a {@code DateTimeException} will be thrown.
 * <p>
 * The other {@link #isSupported(TemporalField) supported fields} will behave as per
 * the matching method on {@link LocalDateTime#with(TemporalField, long) LocalDateTime}.
 * In this case, the offset is not part of the calculation and will be unchanged.
 * <p>
 * All other {@code ChronoField} instances will throw an {@code UnsupportedTemporalTypeException}.
 * <p>
 * If the field is not a {@code ChronoField}, then the result of this method
 * is obtained by invoking {@code TemporalField.adjustInto(Temporal, long)}
 * passing {@code this} as the argument. In this case, the field determines
 * whether and how to adjust the instant.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param field  the field to set in the result, not null
 * @param newValue  the new value of the field in the result
 * @return an {@code OffsetDateTime} based on {@code this} with the specified field set, not null
 * @throws DateTimeException if the field cannot be set
 * @throws UnsupportedTemporalTypeException if the field is not supported
 * @throws ArithmeticException if numeric overflow occurs
 */

	function with(TemporalField field, int64 newValue) public returns(OffsetDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this {@code OffsetDateTime} with the year altered.
 * The offset does not affect the calculation and will be the same in the result.
 * If the day-of-month is invalid for the year, it will be changed to the last valid day of the month.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param year  the year to set in the result, from MIN_YEAR to MAX_YEAR
 * @return an {@code OffsetDateTime} based on this date-time with the requested year, not null
 * @throws DateTimeException if the year value is invalid
 */

	function withYear(int32 year) public returns(OffsetDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this {@code OffsetDateTime} with the month-of-year altered.
 * The offset does not affect the calculation and will be the same in the result.
 * If the day-of-month is invalid for the year, it will be changed to the last valid day of the month.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param month  the month-of-year to set in the result, from 1 (January) to 12 (December)
 * @return an {@code OffsetDateTime} based on this date-time with the requested month, not null
 * @throws DateTimeException if the month-of-year value is invalid
 */

	function withMonth(int32 month) public returns(OffsetDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this {@code OffsetDateTime} with the day-of-month altered.
 * If the resulting {@code OffsetDateTime} is invalid, an exception is thrown.
 * The offset does not affect the calculation and will be the same in the result.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param dayOfMonth  the day-of-month to set in the result, from 1 to 28-31
 * @return an {@code OffsetDateTime} based on this date-time with the requested day, not null
 * @throws DateTimeException if the day-of-month value is invalid,
 *  or if the day-of-month is invalid for the month-year
 */

	function withDayOfMonth(int32 dayOfMonth) public returns(OffsetDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this {@code OffsetDateTime} with the day-of-year altered.
 * If the resulting {@code OffsetDateTime} is invalid, an exception is thrown.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param dayOfYear  the day-of-year to set in the result, from 1 to 365-366
 * @return an {@code OffsetDateTime} based on this date with the requested day, not null
 * @throws DateTimeException if the day-of-year value is invalid,
 *  or if the day-of-year is invalid for the year
 */

	function withDayOfYear(int32 dayOfYear) public returns(OffsetDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this {@code OffsetDateTime} with the hour-of-day value altered.
 * <p>
 * The offset does not affect the calculation and will be the same in the result.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param hour  the hour-of-day to set in the result, from 0 to 23
 * @return an {@code OffsetDateTime} based on this date-time with the requested hour, not null
 * @throws DateTimeException if the hour value is invalid
 */

	function withHour(int32 hour) public returns(OffsetDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this {@code OffsetDateTime} with the minute-of-hour value altered.
 * <p>
 * The offset does not affect the calculation and will be the same in the result.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param minute  the minute-of-hour to set in the result, from 0 to 59
 * @return an {@code OffsetDateTime} based on this date-time with the requested minute, not null
 * @throws DateTimeException if the minute value is invalid
 */

	function withMinute(int32 minute) public returns(OffsetDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this {@code OffsetDateTime} with the second-of-minute value altered.
 * <p>
 * The offset does not affect the calculation and will be the same in the result.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param second  the second-of-minute to set in the result, from 0 to 59
 * @return an {@code OffsetDateTime} based on this date-time with the requested second, not null
 * @throws DateTimeException if the second value is invalid
 */

	function withSecond(int32 second) public returns(OffsetDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this {@code OffsetDateTime} with the nano-of-second value altered.
 * <p>
 * The offset does not affect the calculation and will be the same in the result.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param nanoOfSecond  the nano-of-second to set in the result, from 0 to 999,999,999
 * @return an {@code OffsetDateTime} based on this date-time with the requested nanosecond, not null
 * @throws DateTimeException if the nanos value is invalid
 */

	function withNano(int32 nanoOfSecond) public returns(OffsetDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this {@code OffsetDateTime} with the time truncated.
 * <p>
 * Truncation returns a copy of the original date-time with fields
 * smaller than the specified unit set to zero.
 * For example, truncating with the {@link ChronoUnit#MINUTES minutes} unit
 * will set the second-of-minute and nano-of-second field to zero.
 * <p>
 * The unit must have a {@linkplain TemporalUnit#getDuration() duration}
 * that divides into the length of a standard day without remainder.
 * This includes all supplied time units on {@link ChronoUnit} and
 * {@link ChronoUnit#DAYS DAYS}. Other units throw an exception.
 * <p>
 * The offset does not affect the calculation and will be the same in the result.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param unit  the unit to truncate to, not null
 * @return an {@code OffsetDateTime} based on this date-time with the time truncated, not null
 * @throws DateTimeException if unable to truncate
 * @throws UnsupportedTemporalTypeException if the unit is not supported
 */

	function truncatedTo(TemporalUnit unit) public returns(OffsetDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this date-time with the specified amount added.
 * <p>
 * This returns an {@code OffsetDateTime}, based on this one, with the specified amount added.
 * The amount is typically {@link Period} or {@link Duration} but may be
 * any other type implementing the {@link TemporalAmount} interface.
 * <p>
 * The calculation is delegated to the amount object by calling
 * {@link TemporalAmount#addTo(Temporal)}. The amount implementation is free
 * to implement the addition in any way it wishes, however it typically
 * calls back to {@link #plus(long, TemporalUnit)}. Consult the documentation
 * of the amount implementation to determine if it can be successfully added.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param amountToAdd  the amount to add, not null
 * @return an {@code OffsetDateTime} based on this date-time with the addition made, not null
 * @throws DateTimeException if the addition cannot be made
 * @throws ArithmeticException if numeric overflow occurs
 */

	function plus(TemporalAmount amountToAdd) public returns(OffsetDateTime)
	{
			return OffsetDateTime();
	}

	/**
 * Returns a copy of this date-time with the specified amount added.
 * <p>
 * This returns an {@code OffsetDateTime}, based on this one, with the amount
 * in terms of the unit added. If it is not possible to add the amount, because the
 * unit is not supported or for some other reason, an exception is thrown.
 * <p>
 * If the field is a {@link ChronoUnit} then the addition is implemented by
 * {@link LocalDateTime#plus(long, TemporalUnit)}.
 * The offset is not part of the calculation and will be unchanged in the result.
 * <p>
 * If the field is not a {@code ChronoUnit}, then the result of this method
 * is obtained by invoking {@code TemporalUnit.addTo(Temporal, long)}
 * passing {@code this} as the argument. In this case, the unit determines
 * whether and how to perform the addition.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param amountToAdd  the amount of the unit to add to the result, may be negative
 * @param unit  the unit of the amount to add, not null
 * @return an {@code OffsetDateTime} based on this date-time with the specified amount added, not null
 * @throws DateTimeException if the addition cannot be made
 * @throws UnsupportedTemporalTypeException if the unit is not supported
 * @throws ArithmeticException if numeric overflow occurs
 */

	function plus(int64 amountToAdd, TemporalUnit unit) public returns(OffsetDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this {@code OffsetDateTime} with the specified period in years added.
 * <p>
 * This method adds the specified amount to the years field in three steps:
 * <ol>
 * <li>Add the input years to the year field</li>
 * <li>Check if the resulting date would be invalid</li>
 * <li>Adjust the day-of-month to the last valid day if necessary</li>
 * </ol>
 * <p>
 * For example, 2008-02-29 (leap year) plus one year would result in the
 * invalid date 2009-02-29 (standard year). Instead of returning an invalid
 * result, the last valid day of the month, 2009-02-28, is selected instead.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param years  the years to add, may be negative
 * @return an {@code OffsetDateTime} based on this date-time with the years added, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function plusYears(int64 years) public returns(OffsetDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this {@code OffsetDateTime} with the specified period in months added.
 * <p>
 * This method adds the specified amount to the months field in three steps:
 * <ol>
 * <li>Add the input months to the month-of-year field</li>
 * <li>Check if the resulting date would be invalid</li>
 * <li>Adjust the day-of-month to the last valid day if necessary</li>
 * </ol>
 * <p>
 * For example, 2007-03-31 plus one month would result in the invalid date
 * 2007-04-31. Instead of returning an invalid result, the last valid day
 * of the month, 2007-04-30, is selected instead.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param months  the months to add, may be negative
 * @return an {@code OffsetDateTime} based on this date-time with the months added, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function plusMonths(int64 months) public returns(OffsetDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this OffsetDateTime with the specified period in weeks added.
 * <p>
 * This method adds the specified amount in weeks to the days field incrementing
 * the month and year fields as necessary to ensure the result remains valid.
 * The result is only invalid if the maximum/minimum year is exceeded.
 * <p>
 * For example, 2008-12-31 plus one week would result in the 2009-01-07.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param weeks  the weeks to add, may be negative
 * @return an {@code OffsetDateTime} based on this date-time with the weeks added, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function plusWeeks(int64 weeks) public returns(OffsetDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this OffsetDateTime with the specified period in days added.
 * <p>
 * This method adds the specified amount to the days field incrementing the
 * month and year fields as necessary to ensure the result remains valid.
 * The result is only invalid if the maximum/minimum year is exceeded.
 * <p>
 * For example, 2008-12-31 plus one day would result in the 2009-01-01.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param days  the days to add, may be negative
 * @return an {@code OffsetDateTime} based on this date-time with the days added, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function plusDays(int64 days) public returns(OffsetDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this {@code OffsetDateTime} with the specified period in hours added.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param hours  the hours to add, may be negative
 * @return an {@code OffsetDateTime} based on this date-time with the hours added, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function plusHours(int64 hours) public returns(OffsetDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this {@code OffsetDateTime} with the specified period in minutes added.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param minutes  the minutes to add, may be negative
 * @return an {@code OffsetDateTime} based on this date-time with the minutes added, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function plusMinutes(int64 minutes) public returns(OffsetDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this {@code OffsetDateTime} with the specified period in seconds added.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param seconds  the seconds to add, may be negative
 * @return an {@code OffsetDateTime} based on this date-time with the seconds added, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function plusSeconds(int64 seconds) public returns(OffsetDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this {@code OffsetDateTime} with the specified period in nanoseconds added.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param nanos  the nanos to add, may be negative
 * @return an {@code OffsetDateTime} based on this date-time with the nanoseconds added, not null
 * @throws DateTimeException if the unit cannot be added to this type
 */

	function plusNanos(int64 nanos) public returns(OffsetDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this date-time with the specified amount subtracted.
 * <p>
 * This returns an {@code OffsetDateTime}, based on this one, with the specified amount subtracted.
 * The amount is typically {@link Period} or {@link Duration} but may be
 * any other type implementing the {@link TemporalAmount} interface.
 * <p>
 * The calculation is delegated to the amount object by calling
 * {@link TemporalAmount#subtractFrom(Temporal)}. The amount implementation is free
 * to implement the subtraction in any way it wishes, however it typically
 * calls back to {@link #minus(long, TemporalUnit)}. Consult the documentation
 * of the amount implementation to determine if it can be successfully subtracted.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param amountToSubtract  the amount to subtract, not null
 * @return an {@code OffsetDateTime} based on this date-time with the subtraction made, not null
 * @throws DateTimeException if the subtraction cannot be made
 * @throws ArithmeticException if numeric overflow occurs
 */

	function minus(TemporalAmount amountToSubtract) public returns(OffsetDateTime)
	{
			return OffsetDateTime();
	}

	/**
 * Returns a copy of this date-time with the specified amount subtracted.
 * <p>
 * This returns an {@code OffsetDateTime}, based on this one, with the amount
 * in terms of the unit subtracted. If it is not possible to subtract the amount,
 * because the unit is not supported or for some other reason, an exception is thrown.
 * <p>
 * This method is equivalent to {@link #plus(long, TemporalUnit)} with the amount negated.
 * See that method for a full description of how addition, and thus subtraction, works.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param amountToSubtract  the amount of the unit to subtract from the result, may be negative
 * @param unit  the unit of the amount to subtract, not null
 * @return an {@code OffsetDateTime} based on this date-time with the specified amount subtracted, not null
 * @throws DateTimeException if the subtraction cannot be made
 * @throws UnsupportedTemporalTypeException if the unit is not supported
 * @throws ArithmeticException if numeric overflow occurs
 */

	function minus(int64 amountToSubtract, TemporalUnit unit) public returns(OffsetDateTime)
	{
			return ();
	}

	/**
 * Returns a copy of this {@code OffsetDateTime} with the specified period in years subtracted.
 * <p>
 * This method subtracts the specified amount from the years field in three steps:
 * <ol>
 * <li>Subtract the input years to the year field</li>
 * <li>Check if the resulting date would be invalid</li>
 * <li>Adjust the day-of-month to the last valid day if necessary</li>
 * </ol>
 * <p>
 * For example, 2008-02-29 (leap year) minus one year would result in the
 * invalid date 2009-02-29 (standard year). Instead of returning an invalid
 * result, the last valid day of the month, 2009-02-28, is selected instead.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param years  the years to subtract, may be negative
 * @return an {@code OffsetDateTime} based on this date-time with the years subtracted, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function minusYears(int64 years) public returns(OffsetDateTime)
	{
			return (years == Long.MIN_VALUE ? plusYears(-years;) : plusYears(Long.MAX_VALUE).plusYears(1))
	}

	/**
 * Returns a copy of this {@code OffsetDateTime} with the specified period in months subtracted.
 * <p>
 * This method subtracts the specified amount from the months field in three steps:
 * <ol>
 * <li>Subtract the input months to the month-of-year field</li>
 * <li>Check if the resulting date would be invalid</li>
 * <li>Adjust the day-of-month to the last valid day if necessary</li>
 * </ol>
 * <p>
 * For example, 2007-03-31 minus one month would result in the invalid date
 * 2007-04-31. Instead of returning an invalid result, the last valid day
 * of the month, 2007-04-30, is selected instead.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param months  the months to subtract, may be negative
 * @return an {@code OffsetDateTime} based on this date-time with the months subtracted, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function minusMonths(int64 months) public returns(OffsetDateTime)
	{
			return (months == Long.MIN_VALUE ? plusMonths(-months;) : plusMonths(Long.MAX_VALUE).plusMonths(1))
	}

	/**
 * Returns a copy of this {@code OffsetDateTime} with the specified period in weeks subtracted.
 * <p>
 * This method subtracts the specified amount in weeks from the days field decrementing
 * the month and year fields as necessary to ensure the result remains valid.
 * The result is only invalid if the maximum/minimum year is exceeded.
 * <p>
 * For example, 2008-12-31 minus one week would result in the 2009-01-07.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param weeks  the weeks to subtract, may be negative
 * @return an {@code OffsetDateTime} based on this date-time with the weeks subtracted, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function minusWeeks(int64 weeks) public returns(OffsetDateTime)
	{
			return (weeks == Long.MIN_VALUE ? plusWeeks(-weeks;) : plusWeeks(Long.MAX_VALUE).plusWeeks(1))
	}

	/**
 * Returns a copy of this {@code OffsetDateTime} with the specified period in days subtracted.
 * <p>
 * This method subtracts the specified amount from the days field incrementing the
 * month and year fields as necessary to ensure the result remains valid.
 * The result is only invalid if the maximum/minimum year is exceeded.
 * <p>
 * For example, 2008-12-31 minus one day would result in the 2009-01-01.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param days  the days to subtract, may be negative
 * @return an {@code OffsetDateTime} based on this date-time with the days subtracted, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function minusDays(int64 days) public returns(OffsetDateTime)
	{
			return (days == Long.MIN_VALUE ? plusDays(-days;) : plusDays(Long.MAX_VALUE).plusDays(1))
	}

	/**
 * Returns a copy of this {@code OffsetDateTime} with the specified period in hours subtracted.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param hours  the hours to subtract, may be negative
 * @return an {@code OffsetDateTime} based on this date-time with the hours subtracted, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function minusHours(int64 hours) public returns(OffsetDateTime)
	{
			return (hours == Long.MIN_VALUE ? plusHours(-hours;) : plusHours(Long.MAX_VALUE).plusHours(1))
	}

	/**
 * Returns a copy of this {@code OffsetDateTime} with the specified period in minutes subtracted.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param minutes  the minutes to subtract, may be negative
 * @return an {@code OffsetDateTime} based on this date-time with the minutes subtracted, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function minusMinutes(int64 minutes) public returns(OffsetDateTime)
	{
			return (minutes == Long.MIN_VALUE ? plusMinutes(-minutes;) : plusMinutes(Long.MAX_VALUE).plusMinutes(1))
	}

	/**
 * Returns a copy of this {@code OffsetDateTime} with the specified period in seconds subtracted.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param seconds  the seconds to subtract, may be negative
 * @return an {@code OffsetDateTime} based on this date-time with the seconds subtracted, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function minusSeconds(int64 seconds) public returns(OffsetDateTime)
	{
			return (seconds == Long.MIN_VALUE ? plusSeconds(-seconds;) : plusSeconds(Long.MAX_VALUE).plusSeconds(1))
	}

	/**
 * Returns a copy of this {@code OffsetDateTime} with the specified period in nanoseconds subtracted.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param nanos  the nanos to subtract, may be negative
 * @return an {@code OffsetDateTime} based on this date-time with the nanoseconds subtracted, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function minusNanos(int64 nanos) public returns(OffsetDateTime)
	{
			return (nanos == Long.MIN_VALUE ? plusNanos(-nanos;) : plusNanos(Long.MAX_VALUE).plusNanos(1))
	}

	/**
 * Queries this date-time using the specified query.
 * <p>
 * This queries this date-time using the specified query strategy object.
 * The {@code TemporalQuery} object defines the logic to be used to
 * obtain the result. Read the documentation of the query to understand
 * what the result of this method will be.
 * <p>
 * The result of this method is obtained by invoking the
 * {@link TemporalQuery#queryFrom(TemporalAccessor)} method on the
 * specified query passing {@code this} as the argument.
 *
 * @param <R> the type of the result
 * @param query  the query to invoke, not null
 * @return the query result, null may be returned (defined by the query)
 * @throws DateTimeException if unable to query (defined by the query)
 * @throws ArithmeticException if numeric overflow occurs (defined by the query)
 */

	function query(TemporalQuery query) public returns(R)
	{
			if(query == .offset() || query == .zone())
			{
					return R(getOffset());
			}
			else
			{
				if(query == .zoneId())
				{
						return 
				}
				else
				{
					if(query == .localDate())
					{
							return R(toLocalDate());
					}
					else
					{
						if(query == .localTime())
						{
								return R(toLocalTime());
						}
						else
						{
							if(query == .chronology())
							{
									return R(IsoChronology.INSTANCE);
							}
							else
							{
								if(query == .precision())
								{
										return R(NANOS);
								}							}
						}
					}
				}
			}

			// non-JDK classes are not permitted to make this optimization

			return 
	}

	/**
 * Adjusts the specified temporal object to have the same offset, date
 * and time as this object.
 * <p>
 * This returns a temporal object of the same observable type as the input
 * with the offset, date and time changed to be the same as this.
 * <p>
 * The adjustment is equivalent to using {@link Temporal#with(TemporalField, long)}
 * three times, passing {@link ChronoField#EPOCH_DAY},
 * {@link ChronoField#NANO_OF_DAY} and {@link ChronoField#OFFSET_SECONDS} as the fields.
 * <p>
 * In most cases, it is clearer to reverse the calling pattern by using
 * {@link Temporal#with(TemporalAdjuster)}:
 * <pre>
 *   // these two lines are equivalent, but the second approach is recommended
 *   temporal = thisOffsetDateTime.adjustInto(temporal);
 *   temporal = temporal.with(thisOffsetDateTime);
 * </pre>
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param temporal  the target object to be adjusted, not null
 * @return the adjusted object, not null
 * @throws DateTimeException if unable to make the adjustment
 * @throws ArithmeticException if numeric overflow occurs
 */

	function adjustInto(Temporal temporal) public returns(Temporal)
	{
			// tweak to the result, with ZonedDateTime frequently ignoring the offset

			return 
	}

	/**
 * Calculates the amount of time until another date-time in terms of the specified unit.
 * <p>
 * This calculates the amount of time between two {@code OffsetDateTime}
 * objects in terms of a single {@code TemporalUnit}.
 * The start and end points are {@code this} and the specified date-time.
 * The result will be negative if the end is before the start.
 * For example, the period in days between two date-times can be calculated
 * using {@code startDateTime.until(endDateTime, DAYS)}.
 * <p>
 * The {@code Temporal} passed to this method is converted to a
 * {@code OffsetDateTime} using {@link #from(TemporalAccessor)}.
 * If the offset differs between the two date-times, the specified
 * end date-time is normalized to have the same offset as this date-time.
 * <p>
 * The calculation returns a whole number, representing the number of
 * complete units between the two date-times.
 * For example, the period in months between 2012-06-15T00:00Z and 2012-08-14T23:59Z
 * will only be one month as it is one minute short of two months.
 * <p>
 * There are two equivalent ways of using this method.
 * The first is to invoke this method.
 * The second is to use {@link TemporalUnit#between(Temporal, Temporal)}:
 * <pre>
 *   // these two lines are equivalent
 *   amount = start.until(end, MONTHS);
 *   amount = MONTHS.between(start, end);
 * </pre>
 * The choice should be made based on which makes the code more readable.
 * <p>
 * The calculation is implemented in this method for {@link ChronoUnit}.
 * The units {@code NANOS}, {@code MICROS}, {@code MILLIS}, {@code SECONDS},
 * {@code MINUTES}, {@code HOURS} and {@code HALF_DAYS}, {@code DAYS},
 * {@code WEEKS}, {@code MONTHS}, {@code YEARS}, {@code DECADES},
 * {@code CENTURIES}, {@code MILLENNIA} and {@code ERAS} are supported.
 * Other {@code ChronoUnit} values will throw an exception.
 * <p>
 * If the unit is not a {@code ChronoUnit}, then the result of this method
 * is obtained by invoking {@code TemporalUnit.between(Temporal, Temporal)}
 * passing {@code this} as the first argument and the converted input temporal
 * as the second argument.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param endExclusive  the end date, exclusive, which is converted to an {@code OffsetDateTime}, not null
 * @param unit  the unit to measure the amount in, not null
 * @return the amount of time between this date-time and the end date-time
 * @throws DateTimeException if the amount cannot be calculated, or the end
 *  temporal cannot be converted to an {@code OffsetDateTime}
 * @throws UnsupportedTemporalTypeException if the unit is not supported
 * @throws ArithmeticException if numeric overflow occurs
 */

	function until(Temporal endExclusive, TemporalUnit unit) public returns(int64)
	{
			OffsetDateTime end;
			return 
	}

	/**
 * Formats this date-time using the specified formatter.
 * <p>
 * This date-time will be passed to the formatter to produce a string.
 *
 * @param formatter  the formatter to use, not null
 * @return the formatted date-time string, not null
 * @throws DateTimeException if an error occurs during printing
 */

	function format(DateTimeFormatter formatter) public returns(String)
	{
			return 
	}

	/**
 * Combines this date-time with a time-zone to create a {@code ZonedDateTime}
 * ensuring that the result has the same instant.
 * <p>
 * This returns a {@code ZonedDateTime} formed from this date-time and the specified time-zone.
 * This conversion will ignore the visible local date-time and use the underlying instant instead.
 * This avoids any problems with local time-line gaps or overlaps.
 * The result might have different values for fields such as hour, minute an even day.
 * <p>
 * To attempt to retain the values of the fields, use {@link #atZoneSimilarLocal(ZoneId)}.
 * To use the offset as the zone ID, use {@link #toZonedDateTime()}.
 *
 * @param zone  the time-zone to use, not null
 * @return the zoned date-time formed from this date-time, not null
 */

	function atZoneSameInstant(ZoneId zone) public returns(ZonedDateTime)
	{
			return 
	}

	/**
 * Combines this date-time with a time-zone to create a {@code ZonedDateTime}
 * trying to keep the same local date and time.
 * <p>
 * This returns a {@code ZonedDateTime} formed from this date-time and the specified time-zone.
 * Where possible, the result will have the same local date-time as this object.
 * <p>
 * Time-zone rules, such as daylight savings, mean that not every time on the
 * local time-line exists. If the local date-time is in a gap or overlap according to
 * the rules then a resolver is used to determine the resultant local time and offset.
 * This method uses {@link ZonedDateTime#ofLocal(LocalDateTime, ZoneId, ZoneOffset)}
 * to retain the offset from this instance if possible.
 * <p>
 * Finer control over gaps and overlaps is available in two ways.
 * If you simply want to use the later offset at overlaps then call
 * {@link ZonedDateTime#withLaterOffsetAtOverlap()} immediately after this method.
 * <p>
 * To create a zoned date-time at the same instant irrespective of the local time-line,
 * use {@link #atZoneSameInstant(ZoneId)}.
 * To use the offset as the zone ID, use {@link #toZonedDateTime()}.
 *
 * @param zone  the time-zone to use, not null
 * @return the zoned date-time formed from this date and the earliest valid time for the zone, not null
 */

	function atZoneSimilarLocal(ZoneId zone) public returns(ZonedDateTime)
	{
			return 
	}

	/**
 * Converts this date-time to an {@code OffsetTime}.
 * <p>
 * This returns an offset time with the same local time and offset.
 *
 * @return an OffsetTime representing the time and offset, not null
 */

	function toOffsetTime() public returns(OffsetTime)
	{
			return .of(.toLocalTime(), offset);
	}

	/**
 * Converts this date-time to a {@code ZonedDateTime} using the offset as the zone ID.
 * <p>
 * This creates the simplest possible {@code ZonedDateTime} using the offset
 * as the zone ID.
 * <p>
 * To control the time-zone used, see {@link #atZoneSameInstant(ZoneId)} and
 * {@link #atZoneSimilarLocal(ZoneId)}.
 *
 * @return a zoned date-time representing the same local date-time and offset, not null
 */

	function toZonedDateTime() public returns(ZonedDateTime)
	{
			return OffsetDateTime_Library.of(dateTime, offset);
	}

	/**
 * Converts this date-time to an {@code Instant}.
 * <p>
 * This returns an {@code Instant} representing the same point on the
 * time-line as this date-time.
 *
 * @return an {@code Instant} representing the same instant, not null
 */

	function toInstant() public returns(Instant)
	{
			return .toInstant(offset);
	}

	/**
 * Converts this date-time to the number of seconds from the epoch of 1970-01-01T00:00:00Z.
 * <p>
 * This allows this date-time to be converted to a value of the
 * {@link ChronoField#INSTANT_SECONDS epoch-seconds} field. This is primarily
 * intended for low-level conversions rather than general application usage.
 *
 * @return the number of seconds from the epoch of 1970-01-01T00:00:00Z
 */

	function toEpochSecond() public returns(int64)
	{
			return .toEpochSecond(offset);
	}

	/**
 * Compares this {@code OffsetDateTime} to another date-time.
 * <p>
 * The comparison is based on the instant then on the local date-time.
 * It is "consistent with equals", as defined by {@link Comparable}.
 * <p>
 * For example, the following is the comparator order:
 * <ol>
 * <li>{@code 2008-12-03T10:30+01:00}</li>
 * <li>{@code 2008-12-03T11:00+01:00}</li>
 * <li>{@code 2008-12-03T12:00+02:00}</li>
 * <li>{@code 2008-12-03T11:30+01:00}</li>
 * <li>{@code 2008-12-03T12:00+01:00}</li>
 * <li>{@code 2008-12-03T12:30+01:00}</li>
 * </ol>
 * Values #2 and #3 represent the same instant on the time-line.
 * When two values represent the same instant, the local date-time is compared
 * to distinguish them. This step is needed to make the ordering
 * consistent with {@code equals()}.
 *
 * @param other  the other date-time to compare to, not null
 * @return the comparator value, negative if less, positive if greater
 */

	function compareTo(OffsetDateTime other) public returns(int32)
	{
			int32 cmp;
			if(cmp == 0)
			{
					cmp = toLocalDateTime().compareTo(.toLocalDateTime());
			}
			return cmp;
	}

	/**
 * Checks if the instant of this date-time is after that of the specified date-time.
 * <p>
 * This method differs from the comparison in {@link #compareTo} and {@link #equals} in that it
 * only compares the instant of the date-time. This is equivalent to using
 * {@code dateTime1.toInstant().isAfter(dateTime2.toInstant());}.
 *
 * @param other  the other date-time to compare to, not null
 * @return true if this is after the instant of the specified date-time
 */

	function isAfter(OffsetDateTime other) public returns(bool)
	{
			int64 thisEpochSec = int64(toEpochSecond());
			int64 otherEpochSec = int64(.toEpochSecond());
			return thisEpochSec > otherEpochSec || (thisEpochSec == otherEpochSec && toLocalTime().getNano() > .toLocalTime().getNano());
	}

	/**
 * Checks if the instant of this date-time is before that of the specified date-time.
 * <p>
 * This method differs from the comparison in {@link #compareTo} in that it
 * only compares the instant of the date-time. This is equivalent to using
 * {@code dateTime1.toInstant().isBefore(dateTime2.toInstant());}.
 *
 * @param other  the other date-time to compare to, not null
 * @return true if this is before the instant of the specified date-time
 */

	function isBefore(OffsetDateTime other) public returns(bool)
	{
			int64 thisEpochSec = int64(toEpochSecond());
			int64 otherEpochSec = int64(.toEpochSecond());
			return thisEpochSec < otherEpochSec || (thisEpochSec == otherEpochSec && toLocalTime().getNano() < .toLocalTime().getNano());
	}

	/**
 * Checks if the instant of this date-time is equal to that of the specified date-time.
 * <p>
 * This method differs from the comparison in {@link #compareTo} and {@link #equals}
 * in that it only compares the instant of the date-time. This is equivalent to using
 * {@code dateTime1.toInstant().equals(dateTime2.toInstant());}.
 *
 * @param other  the other date-time to compare to, not null
 * @return true if the instant equals the instant of the specified date-time
 */

	function isEqual(OffsetDateTime other) public returns(bool)
	{
			return toEpochSecond() == .toEpochSecond() && toLocalTime().getNano() == .toLocalTime().getNano();
	}

	/**
 * Checks if this date-time is equal to another date-time.
 * <p>
 * The comparison is based on the local date-time and the offset.
 * To compare for the same instant on the time-line, use {@link #isEqual}.
 * Only objects of type {@code OffsetDateTime} are compared, other types return false.
 *
 * @param obj  the object to check, null returns false
 * @return true if this is equal to the other date-time
 */

	function equals(Object obj) public returns(bool)
	{
			if()
			{
					return true;
			}
			return false;
	}

	/**
 * A hash code for this date-time.
 *
 * @return a suitable hash code
 */

	function hashCode() public returns(int32)
	{
			return .hashCode() ^ .hashCode();
	}

	/**
 * Outputs this date-time as a {@code String}, such as {@code 2007-12-03T10:15:30+01:00}.
 * <p>
 * The output will be one of the following ISO-8601 formats:
 * <ul>
 * <li>{@code uuuu-MM-dd'T'HH:mmXXXXX}</li>
 * <li>{@code uuuu-MM-dd'T'HH:mm:ssXXXXX}</li>
 * <li>{@code uuuu-MM-dd'T'HH:mm:ss.SSSXXXXX}</li>
 * <li>{@code uuuu-MM-dd'T'HH:mm:ss.SSSSSSXXXXX}</li>
 * <li>{@code uuuu-MM-dd'T'HH:mm:ss.SSSSSSSSSXXXXX}</li>
 * </ul>
 * The format used will be the shortest that outputs the full value of
 * the time where the omitted parts are implied to be zero.
 *
 * @return a string representation of this date-time, not null
 */

	function toString() public returns(String)
	{
			return .toString() + .toString();
	}

	/**
 * Writes the object using a
 * <a href="../../serialized-form.html#java.time.Ser">dedicated serialized form</a>.
 * @serialData
 * <pre>
 *  out.writeByte(10);  // identifies an OffsetDateTime
 *  // the <a href="../../serialized-form.html#java.time.LocalDateTime">datetime</a> excluding the one byte header
 *  // the <a href="../../serialized-form.html#java.time.ZoneOffset">offset</a> excluding the one byte header
 * </pre>
 *
 * @return the instance of {@code Ser}, not null
 */

	function writeReplace() private returns(Object)
	{
			return 
	}

	/**
 * Defend against malicious streams.
 *
 * @param s the stream to read
 * @throws InvalidObjectException always
 */

	function readObject(ObjectInputStream s) private
	{
	}

	function writeExternal(ObjectOutput out) internal
	{
	}

	function readExternal(ObjectInput in) internal returns(OffsetDateTime)
	{
			LocalDateTime dateTime;
			ZoneOffset offset;
			return OffsetDateTime_Library.of(dateTime, offset);
	}

	/**
 * Constructor.
 *
 * @param dateTime  the local date-time, not null
 * @param offset  the zone offset, not null
 */

	constructor(LocalDateTime dateTime, ZoneOffset offset) private
	{
			 = .requireNonNull(dateTime, "dateTime");
			 = .requireNonNull(offset, "offset");
	}

}

library OffsetDateTime_Library
{
	/**
 * Gets a comparator that compares two {@code OffsetDateTime} instances
 * based solely on the instant.
 * <p>
 * This method differs from the comparison in {@link #compareTo} in that it
 * only compares the underlying instant.
 *
 * @return a comparator that compares in time-line order
 *
 * @see #isAfter
 * @see #isBefore
 * @see #isEqual
 */

	function timeLineOrder() public returns(Comparator)
	{
			return 
	}

	/**
 * Compares this {@code OffsetDateTime} to another date-time.
 * The comparison is based on the instant.
 *
 * @param datetime1  the first date-time to compare, not null
 * @param datetime2  the other date-time to compare to, not null
 * @return the comparator value, negative if less, positive if greater
 */

	function compareInstant(OffsetDateTime datetime1, OffsetDateTime datetime2) private returns(int32)
	{
			if(.getOffset().equals(.getOffset()))
			{
					return .toLocalDateTime().compareTo(.toLocalDateTime());
			}
			int32 cmp = int32(.compare(.toEpochSecond(), .toEpochSecond()));
			if(cmp == 0)
			{
					cmp = .toLocalTime().getNano() - .toLocalTime().getNano();
			}
			return cmp;
	}

	/**
 * Obtains the current date-time from the system clock in the default time-zone.
 * <p>
 * This will query the {@link java.time.Clock#systemDefaultZone() system clock} in the default
 * time-zone to obtain the current date-time.
 * The offset will be calculated from the time-zone in the clock.
 * <p>
 * Using this method will prevent the ability to use an alternate clock for testing
 * because the clock is hard-coded.
 *
 * @return the current date-time using the system clock, not null
 */

	function now() public returns(OffsetDateTime)
	{
			return now(.systemDefaultZone());
	}

	/**
 * Obtains the current date-time from the system clock in the specified time-zone.
 * <p>
 * This will query the {@link Clock#system(java.time.ZoneId) system clock} to obtain the current date-time.
 * Specifying the time-zone avoids dependence on the default time-zone.
 * The offset will be calculated from the specified time-zone.
 * <p>
 * Using this method will prevent the ability to use an alternate clock for testing
 * because the clock is hard-coded.
 *
 * @param zone  the zone ID to use, not null
 * @return the current date-time using the system clock, not null
 */

	function now(ZoneId zone) public returns(OffsetDateTime)
	{
			return 
	}

	/**
 * Obtains the current date-time from the specified clock.
 * <p>
 * This will query the specified clock to obtain the current date-time.
 * The offset will be calculated from the time-zone in the clock.
 * <p>
 * Using this method allows the use of an alternate clock for testing.
 * The alternate clock may be introduced using {@link Clock dependency injection}.
 *
 * @param clock  the clock to use, not null
 * @return the current date-time, not null
 */

	function now(Clock clock) public returns(OffsetDateTime)
	{
			// called once

			Instant now = Instant(.instant());
			return ofInstant(now, .getZone().getRules().getOffset(now));
	}

	/**
 * Obtains an instance of {@code OffsetDateTime} from a date, time and offset.
 * <p>
 * This creates an offset date-time with the specified local date, time and offset.
 *
 * @param date  the local date, not null
 * @param time  the local time, not null
 * @param offset  the zone offset, not null
 * @return the offset date-time, not null
 */

	function of(LocalDate date, LocalTime time, ZoneOffset offset) public returns(OffsetDateTime)
	{
			LocalDateTime dt;
			return 
	}

	/**
 * Obtains an instance of {@code OffsetDateTime} from a date-time and offset.
 * <p>
 * This creates an offset date-time with the specified local date-time and offset.
 *
 * @param dateTime  the local date-time, not null
 * @param offset  the zone offset, not null
 * @return the offset date-time, not null
 */

	function of(LocalDateTime dateTime, ZoneOffset offset) public returns(OffsetDateTime)
	{
			return 
	}

	/**
 * Obtains an instance of {@code OffsetDateTime} from a year, month, day,
 * hour, minute, second, nanosecond and offset.
 * <p>
 * This creates an offset date-time with the seven specified fields.
 * <p>
 * This method exists primarily for writing test cases.
 * Non test-code will typically use other methods to create an offset time.
 * {@code LocalDateTime} has five additional convenience variants of the
 * equivalent factory method taking fewer arguments.
 * They are not provided here to reduce the footprint of the API.
 *
 * @param year  the year to represent, from MIN_YEAR to MAX_YEAR
 * @param month  the month-of-year to represent, from 1 (January) to 12 (December)
 * @param dayOfMonth  the day-of-month to represent, from 1 to 31
 * @param hour  the hour-of-day to represent, from 0 to 23
 * @param minute  the minute-of-hour to represent, from 0 to 59
 * @param second  the second-of-minute to represent, from 0 to 59
 * @param nanoOfSecond  the nano-of-second to represent, from 0 to 999,999,999
 * @param offset  the zone offset, not null
 * @return the offset date-time, not null
 * @throws DateTimeException if the value of any field is out of range, or
 *  if the day-of-month is invalid for the month-year
 */

	function of(int32 year, int32 month, int32 dayOfMonth, int32 hour, int32 minute, int32 second, int32 nanoOfSecond, ZoneOffset offset) public returns(OffsetDateTime)
	{
			LocalDateTime dt;
			return 
	}

	/**
 * Obtains an instance of {@code OffsetDateTime} from an {@code Instant} and zone ID.
 * <p>
 * This creates an offset date-time with the same instant as that specified.
 * Finding the offset from UTC/Greenwich is simple as there is only one valid
 * offset for each instant.
 *
 * @param instant  the instant to create the date-time from, not null
 * @param zone  the time-zone, which may be an offset, not null
 * @return the offset date-time, not null
 * @throws DateTimeException if the result exceeds the supported range
 */

	function ofInstant(Instant instant, ZoneId zone) public returns(OffsetDateTime)
	{
			ZoneRules rules = ZoneRules(.getRules());
			ZoneOffset offset;
			LocalDateTime ldt = LocalDateTime(.ofEpochSecond(.getEpochSecond(), .getNano(), offset));
			return 
	}

	/**
 * Obtains an instance of {@code OffsetDateTime} from a temporal object.
 * <p>
 * This obtains an offset date-time based on the specified temporal.
 * A {@code TemporalAccessor} represents an arbitrary set of date and time information,
 * which this factory converts to an instance of {@code OffsetDateTime}.
 * <p>
 * The conversion will first obtain a {@code ZoneOffset} from the temporal object.
 * It will then try to obtain a {@code LocalDateTime}, falling back to an {@code Instant} if necessary.
 * The result will be the combination of {@code ZoneOffset} with either
 * with {@code LocalDateTime} or {@code Instant}.
 * Implementations are permitted to perform optimizations such as accessing
 * those fields that are equivalent to the relevant objects.
 * <p>
 * This method matches the signature of the functional interface {@link TemporalQuery}
 * allowing it to be used in queries via method reference, {@code OffsetDateTime::from}.
 *
 * @param temporal  the temporal object to convert, not null
 * @return the offset date-time, not null
 * @throws DateTimeException if unable to convert to an {@code OffsetDateTime}
 */

	function from(TemporalAccessor temporal) public returns(OffsetDateTime)
	{
				//try

					ZoneOffset offset;
					LocalDate date = LocalDate(.query(.localDate()));
					LocalTime time = LocalTime(.query(.localTime()));
					if( && )
					{
							return OffsetDateTime_Library.of(date, time, offset);
					}
					else
					{
							Instant instant;
							return .ofInstant(instant, offset);
					}


				/* catch (DateTimeException ex) {
    throw new DateTimeException("Unable to obtain OffsetDateTime from TemporalAccessor: " + temporal + " of type " + temporal.getClass().getName(), ex);
}*/


	}

	/**
 * Obtains an instance of {@code OffsetDateTime} from a text string
 * such as {@code 2007-12-03T10:15:30+01:00}.
 * <p>
 * The string must represent a valid date-time and is parsed using
 * {@link java.time.format.DateTimeFormatter#ISO_OFFSET_DATE_TIME}.
 *
 * @param text  the text to parse such as "2007-12-03T10:15:30+01:00", not null
 * @return the parsed offset date-time, not null
 * @throws DateTimeParseException if the text cannot be parsed
 */

	function parse(CharSequence text) public returns(OffsetDateTime)
	{
			return 
	}

	/**
 * Obtains an instance of {@code OffsetDateTime} from a text string using a specific formatter.
 * <p>
 * The text is parsed using the formatter, returning a date-time.
 *
 * @param text  the text to parse, not null
 * @param formatter  the formatter to use, not null
 * @return the parsed offset date-time, not null
 * @throws DateTimeParseException if the text cannot be parsed
 */

	function parse(CharSequence text, DateTimeFormatter formatter) public returns(OffsetDateTime)
	{
			return 
	}

	function readExternal(ObjectInput in) internal returns(OffsetDateTime)
	{
			LocalDateTime dateTime;
			ZoneOffset offset;
			return OffsetDateTime_Library.of(dateTime, offset);
	}

}

