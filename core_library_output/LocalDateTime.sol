pragma solidity 0.7.2;

//package java.time


import "java/time/LocalTime/HOURS_PER_DAY.sol";

import "java/time/LocalTime/MICROS_PER_DAY.sol";

import "java/time/LocalTime/MILLIS_PER_DAY.sol";

import "java/time/LocalTime/MINUTES_PER_DAY.sol";

import "java/time/LocalTime/NANOS_PER_DAY.sol";

import "java/time/LocalTime/NANOS_PER_HOUR.sol";

import "java/time/LocalTime/NANOS_PER_MINUTE.sol";

import "java/time/LocalTime/NANOS_PER_SECOND.sol";

import "java/time/LocalTime/SECONDS_PER_DAY.sol";

import "java/time/temporal/ChronoField/NANO_OF_SECOND.sol";

import "java/io/DataInput.sol";

import "java/io/DataOutput.sol";

import "java/io/IOException.sol";

import "java/io/InvalidObjectException.sol";

import "java/io/ObjectInputStream.sol";

import "java/io/Serializable.sol";

import "java/time/chrono/ChronoLocalDateTime.sol";

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

import "java/util/Objects.sol";

/**
 * A date-time without a time-zone in the ISO-8601 calendar system,
 * such as {@code 2007-12-03T10:15:30}.
 * <p>
 * {@code LocalDateTime} is an immutable date-time object that represents a date-time,
 * often viewed as year-month-day-hour-minute-second. Other date and time fields,
 * such as day-of-year, day-of-week and week-of-year, can also be accessed.
 * Time is represented to nanosecond precision.
 * For example, the value "2nd October 2007 at 13:45.30.123456789" can be
 * stored in a {@code LocalDateTime}.
 * <p>
 * This class does not store or represent a time-zone.
 * Instead, it is a description of the date, as used for birthdays, combined with
 * the local time as seen on a wall clock.
 * It cannot represent an instant on the time-line without additional information
 * such as an offset or time-zone.
 * <p>
 * The ISO-8601 calendar system is the modern civil calendar system used today
 * in most of the world. It is equivalent to the proleptic Gregorian calendar
 * system, in which today's rules for leap years are applied for all time.
 * For most applications written today, the ISO-8601 rules are entirely suitable.
 * However, any application that makes use of historical dates, and requires them
 * to be accurate will find the ISO-8601 approach unsuitable.
 *
 * <p>
 * This is a <a href="{@docRoot}/java/lang/doc-files/ValueBased.html">value-based</a>
 * class; use of identity-sensitive operations (including reference equality
 * ({@code ==}), identity hash code, or synchronization) on instances of
 * {@code LocalDateTime} may have unpredictable results and should be avoided.
 * The {@code equals} method should be used for comparisons.
 *
 * @implSpec
 * This class is immutable and thread-safe.
 *
 * @since 1.8
 */

contract LocalDateTime
{
	/**
 * The minimum supported {@code LocalDateTime}, '-999999999-01-01T00:00:00'.
 * This is the local date-time of midnight at the start of the minimum date.
 * This combines {@link LocalDate#MIN} and {@link LocalTime#MIN}.
 * This could be used by an application as a "far past" date-time.
 */

	LocalDateTime static  immutable MIN = LocalDateTime(.of(LocalDate.MIN, LocalTime.MIN));

	/**
 * The maximum supported {@code LocalDateTime}, '+999999999-12-31T23:59:59.999999999'.
 * This is the local date-time just before midnight at the end of the maximum date.
 * This combines {@link LocalDate#MAX} and {@link LocalTime#MAX}.
 * This could be used by an application as a "far future" date-time.
 */

	LocalDateTime static  immutable MAX = LocalDateTime(.of(LocalDate.MAX, LocalTime.MAX));

	/**
 * Serialization version.
 */

	int64 static  immutable serialVersionUID;

	/**
 * The date part.
 */

	LocalDate private  immutable date;

	/**
 * The time part.
 */

	LocalTime private  immutable time;

	/**
 * Obtains the current date-time from the system clock in the default time-zone.
 * <p>
 * This will query the {@link Clock#systemDefaultZone() system clock} in the default
 * time-zone to obtain the current date-time.
 * <p>
 * Using this method will prevent the ability to use an alternate clock for testing
 * because the clock is hard-coded.
 *
 * @return the current date-time using the system clock and default time-zone, not null
 */

	function now() public returns(LocalDateTime)
	{
			return now(.systemDefaultZone());
	}

	/**
 * Obtains the current date-time from the system clock in the specified time-zone.
 * <p>
 * This will query the {@link Clock#system(ZoneId) system clock} to obtain the current date-time.
 * Specifying the time-zone avoids dependence on the default time-zone.
 * <p>
 * Using this method will prevent the ability to use an alternate clock for testing
 * because the clock is hard-coded.
 *
 * @param zone  the zone ID to use, not null
 * @return the current date-time using the system clock, not null
 */

	function now(ZoneId zone) public returns(LocalDateTime)
	{
			return 
	}

	/**
 * Obtains the current date-time from the specified clock.
 * <p>
 * This will query the specified clock to obtain the current date-time.
 * Using this method allows the use of an alternate clock for testing.
 * The alternate clock may be introduced using {@link Clock dependency injection}.
 *
 * @param clock  the clock to use, not null
 * @return the current date-time, not null
 */

	function now(Clock clock) public returns(LocalDateTime)
	{
			// called once

			Instant now = Instant(.instant());
			ZoneOffset offset = ZoneOffset(.getZone().getRules().getOffset(now));
			return ofEpochSecond(.getEpochSecond(), .getNano(), offset);
	}

	/**
 * Obtains an instance of {@code LocalDateTime} from year, month,
 * day, hour and minute, setting the second and nanosecond to zero.
 * <p>
 * This returns a {@code LocalDateTime} with the specified year, month,
 * day-of-month, hour and minute.
 * The day must be valid for the year and month, otherwise an exception will be thrown.
 * The second and nanosecond fields will be set to zero.
 *
 * @param year  the year to represent, from MIN_YEAR to MAX_YEAR
 * @param month  the month-of-year to represent, not null
 * @param dayOfMonth  the day-of-month to represent, from 1 to 31
 * @param hour  the hour-of-day to represent, from 0 to 23
 * @param minute  the minute-of-hour to represent, from 0 to 59
 * @return the local date-time, not null
 * @throws DateTimeException if the value of any field is out of range,
 *  or if the day-of-month is invalid for the month-year
 */

	function of(int32 year, Month month, int32 dayOfMonth, int32 hour, int32 minute) public returns(LocalDateTime)
	{
			LocalDate date;
			LocalTime time;
			return 
	}

	/**
 * Obtains an instance of {@code LocalDateTime} from year, month,
 * day, hour, minute and second, setting the nanosecond to zero.
 * <p>
 * This returns a {@code LocalDateTime} with the specified year, month,
 * day-of-month, hour, minute and second.
 * The day must be valid for the year and month, otherwise an exception will be thrown.
 * The nanosecond field will be set to zero.
 *
 * @param year  the year to represent, from MIN_YEAR to MAX_YEAR
 * @param month  the month-of-year to represent, not null
 * @param dayOfMonth  the day-of-month to represent, from 1 to 31
 * @param hour  the hour-of-day to represent, from 0 to 23
 * @param minute  the minute-of-hour to represent, from 0 to 59
 * @param second  the second-of-minute to represent, from 0 to 59
 * @return the local date-time, not null
 * @throws DateTimeException if the value of any field is out of range,
 *  or if the day-of-month is invalid for the month-year
 */

	function of(int32 year, Month month, int32 dayOfMonth, int32 hour, int32 minute, int32 second) public returns(LocalDateTime)
	{
			LocalDate date;
			LocalTime time;
			return 
	}

	/**
 * Obtains an instance of {@code LocalDateTime} from year, month,
 * day, hour, minute, second and nanosecond.
 * <p>
 * This returns a {@code LocalDateTime} with the specified year, month,
 * day-of-month, hour, minute, second and nanosecond.
 * The day must be valid for the year and month, otherwise an exception will be thrown.
 *
 * @param year  the year to represent, from MIN_YEAR to MAX_YEAR
 * @param month  the month-of-year to represent, not null
 * @param dayOfMonth  the day-of-month to represent, from 1 to 31
 * @param hour  the hour-of-day to represent, from 0 to 23
 * @param minute  the minute-of-hour to represent, from 0 to 59
 * @param second  the second-of-minute to represent, from 0 to 59
 * @param nanoOfSecond  the nano-of-second to represent, from 0 to 999,999,999
 * @return the local date-time, not null
 * @throws DateTimeException if the value of any field is out of range,
 *  or if the day-of-month is invalid for the month-year
 */

	function of(int32 year, Month month, int32 dayOfMonth, int32 hour, int32 minute, int32 second, int32 nanoOfSecond) public returns(LocalDateTime)
	{
			LocalDate date;
			LocalTime time;
			return 
	}

	/**
 * Obtains an instance of {@code LocalDateTime} from year, month,
 * day, hour and minute, setting the second and nanosecond to zero.
 * <p>
 * This returns a {@code LocalDateTime} with the specified year, month,
 * day-of-month, hour and minute.
 * The day must be valid for the year and month, otherwise an exception will be thrown.
 * The second and nanosecond fields will be set to zero.
 *
 * @param year  the year to represent, from MIN_YEAR to MAX_YEAR
 * @param month  the month-of-year to represent, from 1 (January) to 12 (December)
 * @param dayOfMonth  the day-of-month to represent, from 1 to 31
 * @param hour  the hour-of-day to represent, from 0 to 23
 * @param minute  the minute-of-hour to represent, from 0 to 59
 * @return the local date-time, not null
 * @throws DateTimeException if the value of any field is out of range,
 *  or if the day-of-month is invalid for the month-year
 */

	function of(int32 year, int32 month, int32 dayOfMonth, int32 hour, int32 minute) public returns(LocalDateTime)
	{
			LocalDate date;
			LocalTime time;
			return 
	}

	/**
 * Obtains an instance of {@code LocalDateTime} from year, month,
 * day, hour, minute and second, setting the nanosecond to zero.
 * <p>
 * This returns a {@code LocalDateTime} with the specified year, month,
 * day-of-month, hour, minute and second.
 * The day must be valid for the year and month, otherwise an exception will be thrown.
 * The nanosecond field will be set to zero.
 *
 * @param year  the year to represent, from MIN_YEAR to MAX_YEAR
 * @param month  the month-of-year to represent, from 1 (January) to 12 (December)
 * @param dayOfMonth  the day-of-month to represent, from 1 to 31
 * @param hour  the hour-of-day to represent, from 0 to 23
 * @param minute  the minute-of-hour to represent, from 0 to 59
 * @param second  the second-of-minute to represent, from 0 to 59
 * @return the local date-time, not null
 * @throws DateTimeException if the value of any field is out of range,
 *  or if the day-of-month is invalid for the month-year
 */

	function of(int32 year, int32 month, int32 dayOfMonth, int32 hour, int32 minute, int32 second) public returns(LocalDateTime)
	{
			LocalDate date;
			LocalTime time;
			return 
	}

	/**
 * Obtains an instance of {@code LocalDateTime} from year, month,
 * day, hour, minute, second and nanosecond.
 * <p>
 * This returns a {@code LocalDateTime} with the specified year, month,
 * day-of-month, hour, minute, second and nanosecond.
 * The day must be valid for the year and month, otherwise an exception will be thrown.
 *
 * @param year  the year to represent, from MIN_YEAR to MAX_YEAR
 * @param month  the month-of-year to represent, from 1 (January) to 12 (December)
 * @param dayOfMonth  the day-of-month to represent, from 1 to 31
 * @param hour  the hour-of-day to represent, from 0 to 23
 * @param minute  the minute-of-hour to represent, from 0 to 59
 * @param second  the second-of-minute to represent, from 0 to 59
 * @param nanoOfSecond  the nano-of-second to represent, from 0 to 999,999,999
 * @return the local date-time, not null
 * @throws DateTimeException if the value of any field is out of range,
 *  or if the day-of-month is invalid for the month-year
 */

	function of(int32 year, int32 month, int32 dayOfMonth, int32 hour, int32 minute, int32 second, int32 nanoOfSecond) public returns(LocalDateTime)
	{
			LocalDate date;
			LocalTime time;
			return 
	}

	/**
 * Obtains an instance of {@code LocalDateTime} from a date and time.
 *
 * @param date  the local date, not null
 * @param time  the local time, not null
 * @return the local date-time, not null
 */

	function of(LocalDate date, LocalTime time) public returns(LocalDateTime)
	{
			.requireNonNull(date, "date");
			.requireNonNull(time, "time");
			return 
	}

	/**
 * Obtains an instance of {@code LocalDateTime} from an {@code Instant} and zone ID.
 * <p>
 * This creates a local date-time based on the specified instant.
 * First, the offset from UTC/Greenwich is obtained using the zone ID and instant,
 * which is simple as there is only one valid offset for each instant.
 * Then, the instant and offset are used to calculate the local date-time.
 *
 * @param instant  the instant to create the date-time from, not null
 * @param zone  the time-zone, which may be an offset, not null
 * @return the local date-time, not null
 * @throws DateTimeException if the result exceeds the supported range
 */

	function ofInstant(Instant instant, ZoneId zone) public returns(LocalDateTime)
	{
			ZoneRules rules = ZoneRules(.getRules());
			ZoneOffset offset;
			return ofEpochSecond(.getEpochSecond(), .getNano(), offset);
	}

	/**
 * Obtains an instance of {@code LocalDateTime} using seconds from the
 * epoch of 1970-01-01T00:00:00Z.
 * <p>
 * This allows the {@link ChronoField#INSTANT_SECONDS epoch-second} field
 * to be converted to a local date-time. This is primarily intended for
 * low-level conversions rather than general application usage.
 *
 * @param epochSecond  the number of seconds from the epoch of 1970-01-01T00:00:00Z
 * @param nanoOfSecond  the nanosecond within the second, from 0 to 999,999,999
 * @param offset  the zone offset, not null
 * @return the local date-time, not null
 * @throws DateTimeException if the result exceeds the supported range,
 *  or if the nano-of-second is invalid
 */

	function ofEpochSecond(int64 epochSecond, int32 nanoOfSecond, ZoneOffset offset) public returns(LocalDateTime)
	{
			// overflow caught later

			int64 localSecond = int64(epochSecond + .getTotalSeconds());
			int64 localEpochDay;
			int32 secsOfDay = int32(int32());
			LocalDate date = LocalDate(.ofEpochDay(localEpochDay));
			LocalTime time;
			return 
	}

	/**
 * Obtains an instance of {@code LocalDateTime} from a temporal object.
 * <p>
 * This obtains an offset time based on the specified temporal.
 * A {@code TemporalAccessor} represents an arbitrary set of date and time information,
 * which this factory converts to an instance of {@code LocalDateTime}.
 * <p>
 * The conversion extracts and combines the {@code LocalDate} and the
 * {@code LocalTime} from the temporal object.
 * Implementations are permitted to perform optimizations such as accessing
 * those fields that are equivalent to the relevant objects.
 * <p>
 * This method matches the signature of the functional interface {@link TemporalQuery}
 * allowing it to be used as a query via method reference, {@code LocalDateTime::from}.
 *
 * @param temporal  the temporal object to convert, not null
 * @return the local date-time, not null
 * @throws DateTimeException if unable to convert to a {@code LocalDateTime}
 */

	function from(TemporalAccessor temporal) public returns(LocalDateTime)
	{
				//try

					LocalDate date;
					LocalTime time;
					return 

				/* catch (DateTimeException ex) {
    throw new DateTimeException("Unable to obtain LocalDateTime from TemporalAccessor: " + temporal + " of type " + temporal.getClass().getName(), ex);
}*/


	}

	/**
 * Obtains an instance of {@code LocalDateTime} from a text string such as {@code 2007-12-03T10:15:30}.
 * <p>
 * The string must represent a valid date-time and is parsed using
 * {@link java.time.format.DateTimeFormatter#ISO_LOCAL_DATE_TIME}.
 *
 * @param text  the text to parse such as "2007-12-03T10:15:30", not null
 * @return the parsed local date-time, not null
 * @throws DateTimeParseException if the text cannot be parsed
 */

	function parse(CharSequence text) public returns(LocalDateTime)
	{
			return 
	}

	/**
 * Obtains an instance of {@code LocalDateTime} from a text string using a specific formatter.
 * <p>
 * The text is parsed using the formatter, returning a date-time.
 *
 * @param text  the text to parse, not null
 * @param formatter  the formatter to use, not null
 * @return the parsed local date-time, not null
 * @throws DateTimeParseException if the text cannot be parsed
 */

	function parse(CharSequence text, DateTimeFormatter formatter) public returns(LocalDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this date-time with the new date and time, checking
 * to see if a new object is in fact required.
 *
 * @param newDate  the date of the new date-time, not null
 * @param newTime  the time of the new date-time, not null
 * @return the date-time, not null
 */

	function with(LocalDate newDate, LocalTime newTime) private returns(LocalDateTime)
	{
			if(date == newDate && time == newTime)
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
			return 
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
 * {@code EPOCH_DAY} and {@code PROLEPTIC_MONTH} which are too large to fit in
 * an {@code int} and throw a {@code DateTimeException}.
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
 * Gets the {@code LocalDate} part of this date-time.
 * <p>
 * This returns a {@code LocalDate} with the same year, month and day
 * as this date-time.
 *
 * @return the date part of this date-time, not null
 */

	function toLocalDate() public returns(LocalDate)
	{
			return date;
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
 * This method returns the enum {@link DayOfWeek} for the day-of-week.
 * This avoids confusion as to what {@code int} values mean.
 * If you need access to the primitive {@code int} value then the enum
 * provides the {@link DayOfWeek#getValue() int value}.
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
			return time;
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
 * This returns a {@code LocalDateTime}, based on this one, with the date-time adjusted.
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
 *  result = localDateTime.with(JULY).with(lastDayOfMonth());
 * </pre>
 * <p>
 * The classes {@link LocalDate} and {@link LocalTime} implement {@code TemporalAdjuster},
 * thus this method can be used to change the date, time or offset:
 * <pre>
 *  result = localDateTime.with(date);
 *  result = localDateTime.with(time);
 * </pre>
 * <p>
 * The result of this method is obtained by invoking the
 * {@link TemporalAdjuster#adjustInto(Temporal)} method on the
 * specified adjuster passing {@code this} as the argument.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param adjuster the adjuster to use, not null
 * @return a {@code LocalDateTime} based on {@code this} with the adjustment made, not null
 * @throws DateTimeException if the adjustment cannot be made
 * @throws ArithmeticException if numeric overflow occurs
 */

	function with(TemporalAdjuster adjuster) public returns(LocalDateTime)
	{
			return LocalDateTime();
	}

	/**
 * Returns a copy of this date-time with the specified field set to a new value.
 * <p>
 * This returns a {@code LocalDateTime}, based on this one, with the value
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
 * The {@link #isSupported(TemporalField) supported fields} will behave as per
 * the matching method on {@link LocalDate#with(TemporalField, long) LocalDate}
 * or {@link LocalTime#with(TemporalField, long) LocalTime}.
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
 * @return a {@code LocalDateTime} based on {@code this} with the specified field set, not null
 * @throws DateTimeException if the field cannot be set
 * @throws UnsupportedTemporalTypeException if the field is not supported
 * @throws ArithmeticException if numeric overflow occurs
 */

	function with(TemporalField field, int64 newValue) public returns(LocalDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this {@code LocalDateTime} with the year altered.
 * The time does not affect the calculation and will be the same in the result.
 * If the day-of-month is invalid for the year, it will be changed to the last valid day of the month.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param year  the year to set in the result, from MIN_YEAR to MAX_YEAR
 * @return a {@code LocalDateTime} based on this date-time with the requested year, not null
 * @throws DateTimeException if the year value is invalid
 */

	function withYear(int32 year) public returns(LocalDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this {@code LocalDateTime} with the month-of-year altered.
 * The time does not affect the calculation and will be the same in the result.
 * If the day-of-month is invalid for the year, it will be changed to the last valid day of the month.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param month  the month-of-year to set in the result, from 1 (January) to 12 (December)
 * @return a {@code LocalDateTime} based on this date-time with the requested month, not null
 * @throws DateTimeException if the month-of-year value is invalid
 */

	function withMonth(int32 month) public returns(LocalDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this {@code LocalDateTime} with the day-of-month altered.
 * If the resulting {@code LocalDateTime} is invalid, an exception is thrown.
 * The time does not affect the calculation and will be the same in the result.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param dayOfMonth  the day-of-month to set in the result, from 1 to 28-31
 * @return a {@code LocalDateTime} based on this date-time with the requested day, not null
 * @throws DateTimeException if the day-of-month value is invalid,
 *  or if the day-of-month is invalid for the month-year
 */

	function withDayOfMonth(int32 dayOfMonth) public returns(LocalDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this {@code LocalDateTime} with the day-of-year altered.
 * If the resulting {@code LocalDateTime} is invalid, an exception is thrown.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param dayOfYear  the day-of-year to set in the result, from 1 to 365-366
 * @return a {@code LocalDateTime} based on this date with the requested day, not null
 * @throws DateTimeException if the day-of-year value is invalid,
 *  or if the day-of-year is invalid for the year
 */

	function withDayOfYear(int32 dayOfYear) public returns(LocalDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this {@code LocalDateTime} with the hour-of-day value altered.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param hour  the hour-of-day to set in the result, from 0 to 23
 * @return a {@code LocalDateTime} based on this date-time with the requested hour, not null
 * @throws DateTimeException if the hour value is invalid
 */

	function withHour(int32 hour) public returns(LocalDateTime)
	{
			LocalTime newTime;
			return with(date, newTime);
	}

	/**
 * Returns a copy of this {@code LocalDateTime} with the minute-of-hour value altered.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param minute  the minute-of-hour to set in the result, from 0 to 59
 * @return a {@code LocalDateTime} based on this date-time with the requested minute, not null
 * @throws DateTimeException if the minute value is invalid
 */

	function withMinute(int32 minute) public returns(LocalDateTime)
	{
			LocalTime newTime;
			return with(date, newTime);
	}

	/**
 * Returns a copy of this {@code LocalDateTime} with the second-of-minute value altered.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param second  the second-of-minute to set in the result, from 0 to 59
 * @return a {@code LocalDateTime} based on this date-time with the requested second, not null
 * @throws DateTimeException if the second value is invalid
 */

	function withSecond(int32 second) public returns(LocalDateTime)
	{
			LocalTime newTime;
			return with(date, newTime);
	}

	/**
 * Returns a copy of this {@code LocalDateTime} with the nano-of-second value altered.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param nanoOfSecond  the nano-of-second to set in the result, from 0 to 999,999,999
 * @return a {@code LocalDateTime} based on this date-time with the requested nanosecond, not null
 * @throws DateTimeException if the nano value is invalid
 */

	function withNano(int32 nanoOfSecond) public returns(LocalDateTime)
	{
			LocalTime newTime;
			return with(date, newTime);
	}

	/**
 * Returns a copy of this {@code LocalDateTime} with the time truncated.
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
 * This instance is immutable and unaffected by this method call.
 *
 * @param unit  the unit to truncate to, not null
 * @return a {@code LocalDateTime} based on this date-time with the time truncated, not null
 * @throws DateTimeException if unable to truncate
 * @throws UnsupportedTemporalTypeException if the field is not supported
 */

	function truncatedTo(TemporalUnit unit) public returns(LocalDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this date-time with the specified amount added.
 * <p>
 * This returns a {@code LocalDateTime}, based on this one, with the specified amount added.
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
 * @return a {@code LocalDateTime} based on this date-time with the addition made, not null
 * @throws DateTimeException if the addition cannot be made
 * @throws ArithmeticException if numeric overflow occurs
 */

	function plus(TemporalAmount amountToAdd) public returns(LocalDateTime)
	{
			return LocalDateTime();
	}

	/**
 * Returns a copy of this date-time with the specified amount added.
 * <p>
 * This returns a {@code LocalDateTime}, based on this one, with the amount
 * in terms of the unit added. If it is not possible to add the amount, because the
 * unit is not supported or for some other reason, an exception is thrown.
 * <p>
 * If the field is a {@link ChronoUnit} then the addition is implemented here.
 * Date units are added as per {@link LocalDate#plus(long, TemporalUnit)}.
 * Time units are added as per {@link LocalTime#plus(long, TemporalUnit)} with
 * any overflow in days added equivalent to using {@link #plusDays(long)}.
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
 * @return a {@code LocalDateTime} based on this date-time with the specified amount added, not null
 * @throws DateTimeException if the addition cannot be made
 * @throws UnsupportedTemporalTypeException if the unit is not supported
 * @throws ArithmeticException if numeric overflow occurs
 */

	function plus(int64 amountToAdd, TemporalUnit unit) public returns(LocalDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this {@code LocalDateTime} with the specified period in years added.
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
 * @return a {@code LocalDateTime} based on this date-time with the years added, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function plusYears(int64 years) public returns(LocalDateTime)
	{
			LocalDate newDate;
			return with(newDate, time);
	}

	/**
 * Returns a copy of this {@code LocalDateTime} with the specified period in months added.
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
 * @return a {@code LocalDateTime} based on this date-time with the months added, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function plusMonths(int64 months) public returns(LocalDateTime)
	{
			LocalDate newDate;
			return with(newDate, time);
	}

	/**
 * Returns a copy of this {@code LocalDateTime} with the specified period in weeks added.
 * <p>
 * This method adds the specified amount in weeks to the days field incrementing
 * the month and year fields as necessary to ensure the result remains valid.
 * The result is only invalid if the maximum/minimum year is exceeded.
 * <p>
 * For example, 2008-12-31 plus one week would result in 2009-01-07.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param weeks  the weeks to add, may be negative
 * @return a {@code LocalDateTime} based on this date-time with the weeks added, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function plusWeeks(int64 weeks) public returns(LocalDateTime)
	{
			LocalDate newDate;
			return with(newDate, time);
	}

	/**
 * Returns a copy of this {@code LocalDateTime} with the specified period in days added.
 * <p>
 * This method adds the specified amount to the days field incrementing the
 * month and year fields as necessary to ensure the result remains valid.
 * The result is only invalid if the maximum/minimum year is exceeded.
 * <p>
 * For example, 2008-12-31 plus one day would result in 2009-01-01.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param days  the days to add, may be negative
 * @return a {@code LocalDateTime} based on this date-time with the days added, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function plusDays(int64 days) public returns(LocalDateTime)
	{
			LocalDate newDate;
			return with(newDate, time);
	}

	/**
 * Returns a copy of this {@code LocalDateTime} with the specified period in hours added.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param hours  the hours to add, may be negative
 * @return a {@code LocalDateTime} based on this date-time with the hours added, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function plusHours(int64 hours) public returns(LocalDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this {@code LocalDateTime} with the specified period in minutes added.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param minutes  the minutes to add, may be negative
 * @return a {@code LocalDateTime} based on this date-time with the minutes added, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function plusMinutes(int64 minutes) public returns(LocalDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this {@code LocalDateTime} with the specified period in seconds added.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param seconds  the seconds to add, may be negative
 * @return a {@code LocalDateTime} based on this date-time with the seconds added, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function plusSeconds(int64 seconds) public returns(LocalDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this {@code LocalDateTime} with the specified period in nanoseconds added.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param nanos  the nanos to add, may be negative
 * @return a {@code LocalDateTime} based on this date-time with the nanoseconds added, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function plusNanos(int64 nanos) public returns(LocalDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this date-time with the specified amount subtracted.
 * <p>
 * This returns a {@code LocalDateTime}, based on this one, with the specified amount subtracted.
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
 * @return a {@code LocalDateTime} based on this date-time with the subtraction made, not null
 * @throws DateTimeException if the subtraction cannot be made
 * @throws ArithmeticException if numeric overflow occurs
 */

	function minus(TemporalAmount amountToSubtract) public returns(LocalDateTime)
	{
			return LocalDateTime();
	}

	/**
 * Returns a copy of this date-time with the specified amount subtracted.
 * <p>
 * This returns a {@code LocalDateTime}, based on this one, with the amount
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
 * @return a {@code LocalDateTime} based on this date-time with the specified amount subtracted, not null
 * @throws DateTimeException if the subtraction cannot be made
 * @throws UnsupportedTemporalTypeException if the unit is not supported
 * @throws ArithmeticException if numeric overflow occurs
 */

	function minus(int64 amountToSubtract, TemporalUnit unit) public returns(LocalDateTime)
	{
			return ();
	}

	/**
 * Returns a copy of this {@code LocalDateTime} with the specified period in years subtracted.
 * <p>
 * This method subtracts the specified amount from the years field in three steps:
 * <ol>
 * <li>Subtract the input years from the year field</li>
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
 * @return a {@code LocalDateTime} based on this date-time with the years subtracted, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function minusYears(int64 years) public returns(LocalDateTime)
	{
			return (years == Long.MIN_VALUE ? plusYears(-years;) : plusYears(Long.MAX_VALUE).plusYears(1))
	}

	/**
 * Returns a copy of this {@code LocalDateTime} with the specified period in months subtracted.
 * <p>
 * This method subtracts the specified amount from the months field in three steps:
 * <ol>
 * <li>Subtract the input months from the month-of-year field</li>
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
 * @return a {@code LocalDateTime} based on this date-time with the months subtracted, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function minusMonths(int64 months) public returns(LocalDateTime)
	{
			return (months == Long.MIN_VALUE ? plusMonths(-months;) : plusMonths(Long.MAX_VALUE).plusMonths(1))
	}

	/**
 * Returns a copy of this {@code LocalDateTime} with the specified period in weeks subtracted.
 * <p>
 * This method subtracts the specified amount in weeks from the days field decrementing
 * the month and year fields as necessary to ensure the result remains valid.
 * The result is only invalid if the maximum/minimum year is exceeded.
 * <p>
 * For example, 2009-01-07 minus one week would result in 2008-12-31.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param weeks  the weeks to subtract, may be negative
 * @return a {@code LocalDateTime} based on this date-time with the weeks subtracted, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function minusWeeks(int64 weeks) public returns(LocalDateTime)
	{
			return (weeks == Long.MIN_VALUE ? plusWeeks(-weeks;) : plusWeeks(Long.MAX_VALUE).plusWeeks(1))
	}

	/**
 * Returns a copy of this {@code LocalDateTime} with the specified period in days subtracted.
 * <p>
 * This method subtracts the specified amount from the days field incrementing the
 * month and year fields as necessary to ensure the result remains valid.
 * The result is only invalid if the maximum/minimum year is exceeded.
 * <p>
 * For example, 2009-01-01 minus one day would result in 2008-12-31.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param days  the days to subtract, may be negative
 * @return a {@code LocalDateTime} based on this date-time with the days subtracted, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function minusDays(int64 days) public returns(LocalDateTime)
	{
			return (days == Long.MIN_VALUE ? plusDays(-days;) : plusDays(Long.MAX_VALUE).plusDays(1))
	}

	/**
 * Returns a copy of this {@code LocalDateTime} with the specified period in hours subtracted.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param hours  the hours to subtract, may be negative
 * @return a {@code LocalDateTime} based on this date-time with the hours subtracted, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function minusHours(int64 hours) public returns(LocalDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this {@code LocalDateTime} with the specified period in minutes subtracted.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param minutes  the minutes to subtract, may be negative
 * @return a {@code LocalDateTime} based on this date-time with the minutes subtracted, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function minusMinutes(int64 minutes) public returns(LocalDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this {@code LocalDateTime} with the specified period in seconds subtracted.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param seconds  the seconds to subtract, may be negative
 * @return a {@code LocalDateTime} based on this date-time with the seconds subtracted, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function minusSeconds(int64 seconds) public returns(LocalDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this {@code LocalDateTime} with the specified period in nanoseconds subtracted.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param nanos  the nanos to subtract, may be negative
 * @return a {@code LocalDateTime} based on this date-time with the nanoseconds subtracted, not null
 * @throws DateTimeException if the result exceeds the supported date range
 */

	function minusNanos(int64 nanos) public returns(LocalDateTime)
	{
			return 
	}

	/**
 * Returns a copy of this {@code LocalDateTime} with the specified period added.
 * <p>
 * This instance is immutable and unaffected by this method call.
 *
 * @param newDate  the new date to base the calculation on, not null
 * @param hours  the hours to add, may be negative
 * @param minutes the minutes to add, may be negative
 * @param seconds the seconds to add, may be negative
 * @param nanos the nanos to add, may be negative
 * @param sign  the sign to determine add or subtract
 * @return the combined result, not null
 */

	function plusWithOverflow(LocalDate newDate, int64 hours, int64 minutes, int64 seconds, int64 nanos, int32 sign) private returns(LocalDateTime)
	{
			// 9223372036854775808 long, 2147483648 int

			if((hours | minutes | seconds | nanos) == 0)
			{
					return 
			}
			int64 totDays = int64(// max/24*60*60*1B

nanos / NANOS_PER_DAY + // max/24*60*60

seconds / SECONDS_PER_DAY + // max/24*60

minutes / MINUTES_PER_DAY + // max/24

hours / HOURS_PER_DAY);
			// total max*0.4237...

			totDays *= sign;
			int64 totNanos = int64(// max  86400000000000

nanos % NANOS_PER_DAY + // max  86400000000000

(seconds % SECONDS_PER_DAY) * NANOS_PER_SECOND + // max  86400000000000

(minutes % MINUTES_PER_DAY) * NANOS_PER_MINUTE + // max  86400000000000

(hours % HOURS_PER_DAY) * NANOS_PER_HOUR);
			// max  86400000000000

			int64 curNoD = int64(.toNanoOfDay());
			// total 432000000000000

			totNanos = totNanos * sign + curNoD;
			;
			int64 newNoD;
			LocalTime newTime = (newNoD == curNoD ? .ofNanoOfDay(newNoD) : time);
			return with(.plusDays(totDays), newTime);
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
 * {@link java.time.temporal.TemporalQuery#queryFrom(TemporalAccessor)} method on the
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
			if(query == .localDate())
			{
					return R(date);
			}
			return 
	}

	/**
 * Adjusts the specified temporal object to have the same date and time as this object.
 * <p>
 * This returns a temporal object of the same observable type as the input
 * with the date and time changed to be the same as this.
 * <p>
 * The adjustment is equivalent to using {@link Temporal#with(TemporalField, long)}
 * twice, passing {@link ChronoField#EPOCH_DAY} and
 * {@link ChronoField#NANO_OF_DAY} as the fields.
 * <p>
 * In most cases, it is clearer to reverse the calling pattern by using
 * {@link Temporal#with(TemporalAdjuster)}:
 * <pre>
 *   // these two lines are equivalent, but the second approach is recommended
 *   temporal = thisLocalDateTime.adjustInto(temporal);
 *   temporal = temporal.with(thisLocalDateTime);
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
			return 
	}

	/**
 * Calculates the amount of time until another date-time in terms of the specified unit.
 * <p>
 * This calculates the amount of time between two {@code LocalDateTime}
 * objects in terms of a single {@code TemporalUnit}.
 * The start and end points are {@code this} and the specified date-time.
 * The result will be negative if the end is before the start.
 * The {@code Temporal} passed to this method is converted to a
 * {@code LocalDateTime} using {@link #from(TemporalAccessor)}.
 * For example, the amount in days between two date-times can be calculated
 * using {@code startDateTime.until(endDateTime, DAYS)}.
 * <p>
 * The calculation returns a whole number, representing the number of
 * complete units between the two date-times.
 * For example, the amount in months between 2012-06-15T00:00 and 2012-08-14T23:59
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
 * @param endExclusive  the end date, exclusive, which is converted to a {@code LocalDateTime}, not null
 * @param unit  the unit to measure the amount in, not null
 * @return the amount of time between this date-time and the end date-time
 * @throws DateTimeException if the amount cannot be calculated, or the end
 *  temporal cannot be converted to a {@code LocalDateTime}
 * @throws UnsupportedTemporalTypeException if the unit is not supported
 * @throws ArithmeticException if numeric overflow occurs
 */

	function until(Temporal endExclusive, TemporalUnit unit) public returns(int64)
	{
			LocalDateTime end;
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
 * Combines this date-time with an offset to create an {@code OffsetDateTime}.
 * <p>
 * This returns an {@code OffsetDateTime} formed from this date-time at the specified offset.
 * All possible combinations of date-time and offset are valid.
 *
 * @param offset  the offset to combine with, not null
 * @return the offset date-time formed from this date-time and the specified offset, not null
 */

	function atOffset(ZoneOffset offset) public returns(OffsetDateTime)
	{
			return 
	}

	/**
 *  Combines this date-time with a time-zone to create a {@code ZonedDateTime}.
 *  <p>
 *  This returns a {@code ZonedDateTime} formed from this date-time at the
 *  specified time-zone. The result will match this date-time as closely as possible.
 *  Time-zone rules, such as daylight savings, mean that not every local date-time
 *  is valid for the specified zone, thus the local date-time may be adjusted.
 *  <p>
 *  The local date-time is resolved to a single instant on the time-line.
 *  This is achieved by finding a valid offset from UTC/Greenwich for the local
 *  date-time as defined by the {@link ZoneRules rules} of the zone ID.
 * <p>
 *  In most cases, there is only one valid offset for a local date-time.
 *  In the case of an overlap, where clocks are set back, there are two valid offsets.
 *  This method uses the earlier offset typically corresponding to "summer".
 *  <p>
 *  In the case of a gap, where clocks jump forward, there is no valid offset.
 *  Instead, the local date-time is adjusted to be later by the length of the gap.
 *  For a typical one hour daylight savings change, the local date-time will be
 *  moved one hour later into the offset typically corresponding to "summer".
 *  <p>
 *  To obtain the later offset during an overlap, call
 *  {@link ZonedDateTime#withLaterOffsetAtOverlap()} on the result of this method.
 *  To throw an exception when there is a gap or overlap, use
 *  {@link ZonedDateTime#ofStrict(LocalDateTime, ZoneOffset, ZoneId)}.
 *
 *  @param zone  the time-zone to use, not null
 *  @return the zoned date-time formed from this date-time, not null
 */

	function atZone(ZoneId zone) public returns(ZonedDateTime)
	{
			return 
	}

	/**
 * Compares this date-time to another date-time.
 * <p>
 * The comparison is primarily based on the date-time, from earliest to latest.
 * It is "consistent with equals", as defined by {@link Comparable}.
 * <p>
 * If all the date-times being compared are instances of {@code LocalDateTime},
 * then the comparison will be entirely based on the date-time.
 * If some dates being compared are in different chronologies, then the
 * chronology is also considered, see {@link ChronoLocalDateTime#compareTo}.
 *
 * @param other  the other date-time to compare to, not null
 * @return the comparator value, negative if less, positive if greater
 */

	function compareTo(ChronoLocalDateTime other) public returns(int32)
	{
			return 
	}

	function compareTo0(LocalDateTime other) private returns(int32)
	{
			int32 cmp = int32(.compareTo0(.toLocalDate()));
			if(cmp == 0)
			{
					cmp = .compareTo(.toLocalTime());
			}
			return cmp;
	}

	/**
 * Checks if this date-time is after the specified date-time.
 * <p>
 * This checks to see if this date-time represents a point on the
 * local time-line after the other date-time.
 * <pre>
 *   LocalDate a = LocalDateTime.of(2012, 6, 30, 12, 00);
 *   LocalDate b = LocalDateTime.of(2012, 7, 1, 12, 00);
 *   a.isAfter(b) == false
 *   a.isAfter(a) == false
 *   b.isAfter(a) == true
 * </pre>
 * <p>
 * This method only considers the position of the two date-times on the local time-line.
 * It does not take into account the chronology, or calendar system.
 * This is different from the comparison in {@link #compareTo(ChronoLocalDateTime)},
 * but is the same approach as {@link ChronoLocalDateTime#timeLineOrder()}.
 *
 * @param other  the other date-time to compare to, not null
 * @return true if this date-time is after the specified date-time
 */

	function isAfter(ChronoLocalDateTime other) public returns(bool)
	{
			return 
	}

	/**
 * Checks if this date-time is before the specified date-time.
 * <p>
 * This checks to see if this date-time represents a point on the
 * local time-line before the other date-time.
 * <pre>
 *   LocalDate a = LocalDateTime.of(2012, 6, 30, 12, 00);
 *   LocalDate b = LocalDateTime.of(2012, 7, 1, 12, 00);
 *   a.isBefore(b) == true
 *   a.isBefore(a) == false
 *   b.isBefore(a) == false
 * </pre>
 * <p>
 * This method only considers the position of the two date-times on the local time-line.
 * It does not take into account the chronology, or calendar system.
 * This is different from the comparison in {@link #compareTo(ChronoLocalDateTime)},
 * but is the same approach as {@link ChronoLocalDateTime#timeLineOrder()}.
 *
 * @param other  the other date-time to compare to, not null
 * @return true if this date-time is before the specified date-time
 */

	function isBefore(ChronoLocalDateTime other) public returns(bool)
	{
			return 
	}

	/**
 * Checks if this date-time is equal to the specified date-time.
 * <p>
 * This checks to see if this date-time represents the same point on the
 * local time-line as the other date-time.
 * <pre>
 *   LocalDate a = LocalDateTime.of(2012, 6, 30, 12, 00);
 *   LocalDate b = LocalDateTime.of(2012, 7, 1, 12, 00);
 *   a.isEqual(b) == false
 *   a.isEqual(a) == true
 *   b.isEqual(a) == false
 * </pre>
 * <p>
 * This method only considers the position of the two date-times on the local time-line.
 * It does not take into account the chronology, or calendar system.
 * This is different from the comparison in {@link #compareTo(ChronoLocalDateTime)},
 * but is the same approach as {@link ChronoLocalDateTime#timeLineOrder()}.
 *
 * @param other  the other date-time to compare to, not null
 * @return true if this date-time is equal to the specified date-time
 */

	function isEqual(ChronoLocalDateTime other) public returns(bool)
	{
			return 
	}

	/**
 * Checks if this date-time is equal to another date-time.
 * <p>
 * Compares this {@code LocalDateTime} with another ensuring that the date-time is the same.
 * Only objects of type {@code LocalDateTime} are compared, other types return false.
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
 * Outputs this date-time as a {@code String}, such as {@code 2007-12-03T10:15:30}.
 * <p>
 * The output will be one of the following ISO-8601 formats:
 * <ul>
 * <li>{@code uuuu-MM-dd'T'HH:mm}</li>
 * <li>{@code uuuu-MM-dd'T'HH:mm:ss}</li>
 * <li>{@code uuuu-MM-dd'T'HH:mm:ss.SSS}</li>
 * <li>{@code uuuu-MM-dd'T'HH:mm:ss.SSSSSS}</li>
 * <li>{@code uuuu-MM-dd'T'HH:mm:ss.SSSSSSSSS}</li>
 * </ul>
 * The format used will be the shortest that outputs the full value of
 * the time where the omitted parts are implied to be zero.
 *
 * @return a string representation of this date-time, not null
 */

	function toString() public returns(String)
	{
			return .toString() + "T" + .toString();
	}

	/**
 * Writes the object using a
 * <a href="../../serialized-form.html#java.time.Ser">dedicated serialized form</a>.
 * @serialData
 * <pre>
 *  out.writeByte(5);  // identifies a LocalDateTime
 *  // the <a href="../../serialized-form.html#java.time.LocalDate">date</a> excluding the one byte header
 *  // the <a href="../../serialized-form.html#java.time.LocalTime">time</a> excluding the one byte header
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
 * @throws InvalidObjectException always
 */

	function readObject(ObjectInputStream s) private
	{
	}

	function writeExternal(DataOutput out) internal
	{
	}

	function readExternal(DataInput in) internal returns(LocalDateTime)
	{
			LocalDate date;
			LocalTime time;
			return LocalDateTime_Library.of(date, time);
	}

	/**
 * Constructor.
 *
 * @param date  the date part of the date-time, validated not null
 * @param time  the time part of the date-time, validated not null
 */

	constructor(LocalDate date, LocalTime time) private
	{
			 = date;
			 = time;
	}

}

library LocalDateTime_Library
{
	/**
 * Obtains the current date-time from the system clock in the default time-zone.
 * <p>
 * This will query the {@link Clock#systemDefaultZone() system clock} in the default
 * time-zone to obtain the current date-time.
 * <p>
 * Using this method will prevent the ability to use an alternate clock for testing
 * because the clock is hard-coded.
 *
 * @return the current date-time using the system clock and default time-zone, not null
 */

	function now() public returns(LocalDateTime)
	{
			return now(.systemDefaultZone());
	}

	/**
 * Obtains the current date-time from the system clock in the specified time-zone.
 * <p>
 * This will query the {@link Clock#system(ZoneId) system clock} to obtain the current date-time.
 * Specifying the time-zone avoids dependence on the default time-zone.
 * <p>
 * Using this method will prevent the ability to use an alternate clock for testing
 * because the clock is hard-coded.
 *
 * @param zone  the zone ID to use, not null
 * @return the current date-time using the system clock, not null
 */

	function now(ZoneId zone) public returns(LocalDateTime)
	{
			return 
	}

	/**
 * Obtains the current date-time from the specified clock.
 * <p>
 * This will query the specified clock to obtain the current date-time.
 * Using this method allows the use of an alternate clock for testing.
 * The alternate clock may be introduced using {@link Clock dependency injection}.
 *
 * @param clock  the clock to use, not null
 * @return the current date-time, not null
 */

	function now(Clock clock) public returns(LocalDateTime)
	{
			// called once

			Instant now = Instant(.instant());
			ZoneOffset offset = ZoneOffset(.getZone().getRules().getOffset(now));
			return ofEpochSecond(.getEpochSecond(), .getNano(), offset);
	}

	/**
 * Obtains an instance of {@code LocalDateTime} from year, month,
 * day, hour and minute, setting the second and nanosecond to zero.
 * <p>
 * This returns a {@code LocalDateTime} with the specified year, month,
 * day-of-month, hour and minute.
 * The day must be valid for the year and month, otherwise an exception will be thrown.
 * The second and nanosecond fields will be set to zero.
 *
 * @param year  the year to represent, from MIN_YEAR to MAX_YEAR
 * @param month  the month-of-year to represent, not null
 * @param dayOfMonth  the day-of-month to represent, from 1 to 31
 * @param hour  the hour-of-day to represent, from 0 to 23
 * @param minute  the minute-of-hour to represent, from 0 to 59
 * @return the local date-time, not null
 * @throws DateTimeException if the value of any field is out of range,
 *  or if the day-of-month is invalid for the month-year
 */

	function of(int32 year, Month month, int32 dayOfMonth, int32 hour, int32 minute) public returns(LocalDateTime)
	{
			LocalDate date;
			LocalTime time;
			return 
	}

	/**
 * Obtains an instance of {@code LocalDateTime} from year, month,
 * day, hour, minute and second, setting the nanosecond to zero.
 * <p>
 * This returns a {@code LocalDateTime} with the specified year, month,
 * day-of-month, hour, minute and second.
 * The day must be valid for the year and month, otherwise an exception will be thrown.
 * The nanosecond field will be set to zero.
 *
 * @param year  the year to represent, from MIN_YEAR to MAX_YEAR
 * @param month  the month-of-year to represent, not null
 * @param dayOfMonth  the day-of-month to represent, from 1 to 31
 * @param hour  the hour-of-day to represent, from 0 to 23
 * @param minute  the minute-of-hour to represent, from 0 to 59
 * @param second  the second-of-minute to represent, from 0 to 59
 * @return the local date-time, not null
 * @throws DateTimeException if the value of any field is out of range,
 *  or if the day-of-month is invalid for the month-year
 */

	function of(int32 year, Month month, int32 dayOfMonth, int32 hour, int32 minute, int32 second) public returns(LocalDateTime)
	{
			LocalDate date;
			LocalTime time;
			return 
	}

	/**
 * Obtains an instance of {@code LocalDateTime} from year, month,
 * day, hour, minute, second and nanosecond.
 * <p>
 * This returns a {@code LocalDateTime} with the specified year, month,
 * day-of-month, hour, minute, second and nanosecond.
 * The day must be valid for the year and month, otherwise an exception will be thrown.
 *
 * @param year  the year to represent, from MIN_YEAR to MAX_YEAR
 * @param month  the month-of-year to represent, not null
 * @param dayOfMonth  the day-of-month to represent, from 1 to 31
 * @param hour  the hour-of-day to represent, from 0 to 23
 * @param minute  the minute-of-hour to represent, from 0 to 59
 * @param second  the second-of-minute to represent, from 0 to 59
 * @param nanoOfSecond  the nano-of-second to represent, from 0 to 999,999,999
 * @return the local date-time, not null
 * @throws DateTimeException if the value of any field is out of range,
 *  or if the day-of-month is invalid for the month-year
 */

	function of(int32 year, Month month, int32 dayOfMonth, int32 hour, int32 minute, int32 second, int32 nanoOfSecond) public returns(LocalDateTime)
	{
			LocalDate date;
			LocalTime time;
			return 
	}

	/**
 * Obtains an instance of {@code LocalDateTime} from year, month,
 * day, hour and minute, setting the second and nanosecond to zero.
 * <p>
 * This returns a {@code LocalDateTime} with the specified year, month,
 * day-of-month, hour and minute.
 * The day must be valid for the year and month, otherwise an exception will be thrown.
 * The second and nanosecond fields will be set to zero.
 *
 * @param year  the year to represent, from MIN_YEAR to MAX_YEAR
 * @param month  the month-of-year to represent, from 1 (January) to 12 (December)
 * @param dayOfMonth  the day-of-month to represent, from 1 to 31
 * @param hour  the hour-of-day to represent, from 0 to 23
 * @param minute  the minute-of-hour to represent, from 0 to 59
 * @return the local date-time, not null
 * @throws DateTimeException if the value of any field is out of range,
 *  or if the day-of-month is invalid for the month-year
 */

	function of(int32 year, int32 month, int32 dayOfMonth, int32 hour, int32 minute) public returns(LocalDateTime)
	{
			LocalDate date;
			LocalTime time;
			return 
	}

	/**
 * Obtains an instance of {@code LocalDateTime} from year, month,
 * day, hour, minute and second, setting the nanosecond to zero.
 * <p>
 * This returns a {@code LocalDateTime} with the specified year, month,
 * day-of-month, hour, minute and second.
 * The day must be valid for the year and month, otherwise an exception will be thrown.
 * The nanosecond field will be set to zero.
 *
 * @param year  the year to represent, from MIN_YEAR to MAX_YEAR
 * @param month  the month-of-year to represent, from 1 (January) to 12 (December)
 * @param dayOfMonth  the day-of-month to represent, from 1 to 31
 * @param hour  the hour-of-day to represent, from 0 to 23
 * @param minute  the minute-of-hour to represent, from 0 to 59
 * @param second  the second-of-minute to represent, from 0 to 59
 * @return the local date-time, not null
 * @throws DateTimeException if the value of any field is out of range,
 *  or if the day-of-month is invalid for the month-year
 */

	function of(int32 year, int32 month, int32 dayOfMonth, int32 hour, int32 minute, int32 second) public returns(LocalDateTime)
	{
			LocalDate date;
			LocalTime time;
			return 
	}

	/**
 * Obtains an instance of {@code LocalDateTime} from year, month,
 * day, hour, minute, second and nanosecond.
 * <p>
 * This returns a {@code LocalDateTime} with the specified year, month,
 * day-of-month, hour, minute, second and nanosecond.
 * The day must be valid for the year and month, otherwise an exception will be thrown.
 *
 * @param year  the year to represent, from MIN_YEAR to MAX_YEAR
 * @param month  the month-of-year to represent, from 1 (January) to 12 (December)
 * @param dayOfMonth  the day-of-month to represent, from 1 to 31
 * @param hour  the hour-of-day to represent, from 0 to 23
 * @param minute  the minute-of-hour to represent, from 0 to 59
 * @param second  the second-of-minute to represent, from 0 to 59
 * @param nanoOfSecond  the nano-of-second to represent, from 0 to 999,999,999
 * @return the local date-time, not null
 * @throws DateTimeException if the value of any field is out of range,
 *  or if the day-of-month is invalid for the month-year
 */

	function of(int32 year, int32 month, int32 dayOfMonth, int32 hour, int32 minute, int32 second, int32 nanoOfSecond) public returns(LocalDateTime)
	{
			LocalDate date;
			LocalTime time;
			return 
	}

	/**
 * Obtains an instance of {@code LocalDateTime} from a date and time.
 *
 * @param date  the local date, not null
 * @param time  the local time, not null
 * @return the local date-time, not null
 */

	function of(LocalDate date, LocalTime time) public returns(LocalDateTime)
	{
			.requireNonNull(date, "date");
			.requireNonNull(time, "time");
			return 
	}

	/**
 * Obtains an instance of {@code LocalDateTime} from an {@code Instant} and zone ID.
 * <p>
 * This creates a local date-time based on the specified instant.
 * First, the offset from UTC/Greenwich is obtained using the zone ID and instant,
 * which is simple as there is only one valid offset for each instant.
 * Then, the instant and offset are used to calculate the local date-time.
 *
 * @param instant  the instant to create the date-time from, not null
 * @param zone  the time-zone, which may be an offset, not null
 * @return the local date-time, not null
 * @throws DateTimeException if the result exceeds the supported range
 */

	function ofInstant(Instant instant, ZoneId zone) public returns(LocalDateTime)
	{
			ZoneRules rules = ZoneRules(.getRules());
			ZoneOffset offset;
			return ofEpochSecond(.getEpochSecond(), .getNano(), offset);
	}

	/**
 * Obtains an instance of {@code LocalDateTime} using seconds from the
 * epoch of 1970-01-01T00:00:00Z.
 * <p>
 * This allows the {@link ChronoField#INSTANT_SECONDS epoch-second} field
 * to be converted to a local date-time. This is primarily intended for
 * low-level conversions rather than general application usage.
 *
 * @param epochSecond  the number of seconds from the epoch of 1970-01-01T00:00:00Z
 * @param nanoOfSecond  the nanosecond within the second, from 0 to 999,999,999
 * @param offset  the zone offset, not null
 * @return the local date-time, not null
 * @throws DateTimeException if the result exceeds the supported range,
 *  or if the nano-of-second is invalid
 */

	function ofEpochSecond(int64 epochSecond, int32 nanoOfSecond, ZoneOffset offset) public returns(LocalDateTime)
	{
			// overflow caught later

			int64 localSecond = int64(epochSecond + .getTotalSeconds());
			int64 localEpochDay;
			int32 secsOfDay = int32(int32());
			LocalDate date = LocalDate(.ofEpochDay(localEpochDay));
			LocalTime time;
			return 
	}

	/**
 * Obtains an instance of {@code LocalDateTime} from a temporal object.
 * <p>
 * This obtains an offset time based on the specified temporal.
 * A {@code TemporalAccessor} represents an arbitrary set of date and time information,
 * which this factory converts to an instance of {@code LocalDateTime}.
 * <p>
 * The conversion extracts and combines the {@code LocalDate} and the
 * {@code LocalTime} from the temporal object.
 * Implementations are permitted to perform optimizations such as accessing
 * those fields that are equivalent to the relevant objects.
 * <p>
 * This method matches the signature of the functional interface {@link TemporalQuery}
 * allowing it to be used as a query via method reference, {@code LocalDateTime::from}.
 *
 * @param temporal  the temporal object to convert, not null
 * @return the local date-time, not null
 * @throws DateTimeException if unable to convert to a {@code LocalDateTime}
 */

	function from(TemporalAccessor temporal) public returns(LocalDateTime)
	{
				//try

					LocalDate date;
					LocalTime time;
					return 

				/* catch (DateTimeException ex) {
    throw new DateTimeException("Unable to obtain LocalDateTime from TemporalAccessor: " + temporal + " of type " + temporal.getClass().getName(), ex);
}*/


	}

	/**
 * Obtains an instance of {@code LocalDateTime} from a text string such as {@code 2007-12-03T10:15:30}.
 * <p>
 * The string must represent a valid date-time and is parsed using
 * {@link java.time.format.DateTimeFormatter#ISO_LOCAL_DATE_TIME}.
 *
 * @param text  the text to parse such as "2007-12-03T10:15:30", not null
 * @return the parsed local date-time, not null
 * @throws DateTimeParseException if the text cannot be parsed
 */

	function parse(CharSequence text) public returns(LocalDateTime)
	{
			return 
	}

	/**
 * Obtains an instance of {@code LocalDateTime} from a text string using a specific formatter.
 * <p>
 * The text is parsed using the formatter, returning a date-time.
 *
 * @param text  the text to parse, not null
 * @param formatter  the formatter to use, not null
 * @return the parsed local date-time, not null
 * @throws DateTimeParseException if the text cannot be parsed
 */

	function parse(CharSequence text, DateTimeFormatter formatter) public returns(LocalDateTime)
	{
			return 
	}

	function readExternal(DataInput in) internal returns(LocalDateTime)
	{
			LocalDate date;
			LocalTime time;
			return LocalDateTime_Library.of(date, time);
	}

}

