import 'package:intl/intl.dart';

enum DateFormatType {
  monthDayYear,
  dayMonthYear,
  yearMonthDay,
  monthNameDayYear,
  dayMonthNameYear,
  dayMonthAbbreviationYear,
  dayMonthAbbreviationYearWithTime,
  timeZoneFormat,
  hour,
  dayMonthYearWithTime,
  monthNameYear,
  monthNameYearWithComma,
  dayNameDateMonthNameYear, //Jumat, 17 Juni 2022
  yearMonthDateWithDash, //2022-06-17
  dayMonthNameWithTime, // 17 Juni 2022 14:30
  shortMonthName, // Jan, Feb, Mar
  year,
  month,
  day,
  monthName,
}

extension DateFormatTypeExt on DateFormatType {
  String get value {
    switch (this) {
      case DateFormatType.monthDayYear:
        return "MM/dd/yyyy";
      case DateFormatType.dayMonthYear:
        return "dd/MM/yyyy";
      case DateFormatType.yearMonthDay:
        return "yyyy/MM/dd";
      case DateFormatType.monthNameDayYear:
        return "MMMM d, yyyy";
      case DateFormatType.dayMonthNameYear:
        return "d MMMM yyyy";
      case DateFormatType.dayMonthAbbreviationYear:
        return "dd MMM yyyy";
      case DateFormatType.dayMonthAbbreviationYearWithTime:
        return "dd MMM, yyyy HH:mm";
      case DateFormatType.timeZoneFormat:
        return "yyyy-MM-ddTHH:mm:sssssssZ";
      case DateFormatType.hour:
        return "HH:mm";
      case DateFormatType.dayMonthYearWithTime:
        return "dd MMMM yyyy, HH:mm";
      case DateFormatType.monthNameYear:
        return "MMMM yyyy"; //Februari 2022
      case DateFormatType.monthNameYearWithComma:
        return "MMMM, yyyy"; //Februari, 2022
      case DateFormatType.dayNameDateMonthNameYear:
        return "EEEE, d MMMM yyyy";
      case DateFormatType.yearMonthDateWithDash:
        return "yyyy-MM-dd";
      case DateFormatType.dayMonthNameWithTime:
        return "dd MMMM yyyy, HH:mm";
      case DateFormatType.shortMonthName:
        return "MMM";
      case DateFormatType.year:
        return "yyyy";
      case DateFormatType.month:
        return "MM";
      case DateFormatType.day:
        return "dd";
      case DateFormatType.monthName:
        return "MMMM";
    }
  }
}

class DatesFormat {
  /// convert date time to string date
  static String convertDateTime(
    DateTime date, {
    DateFormatType? format,
  }) {
    try {
      DateFormat outputFormat = DateFormat(
          format?.value ?? DateFormatType.dayMonthAbbreviationYear.value,
          'id_ID');
      return outputFormat.format(date);
    } catch (e) {
      return "-";
    }
  }

  static DateTime datefromSeconds(int seconds) {
    return DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
  }

  static String convertStringDate({
    String? previousFormat,
    String? newFormat,
    String? value,
  }) {
    try {
      DateFormat inputFormat = DateFormat(previousFormat, 'id_ID');
      DateTime dateTime = inputFormat.parseUtc(value!).toLocal();
      DateFormat outputFormat = DateFormat(newFormat);
      return outputFormat.format(dateTime);
    } catch (e) {
      return value ?? "";
    }
  }

  static DateTime convertToDateTime({
    required String textDate,
    required String format,
  }) {
    try {
      if (textDate.length > 1) {
        DateTime initDate = DateFormat(format, 'id_ID').parse(textDate);
        return initDate;
      } else {
        return DateTime.now();
      }
    } catch (e) {
      return DateTime.now();
    }
  }

  static DateTime dateNow() {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    return date;
  }

  static String getMonthName(int month, bool isShort) {
    return DateFormat(
      isShort
          ? DateFormatType.shortMonthName.value
          : DateFormatType.monthName.value,
    ).format(DateTime(2025, month, 1));
  }

  static String toHumanTime(int milisecond) {
    final difference = Duration(milliseconds: milisecond);
    if ((difference.inDays / 7).floor() >= 1) {
      return '1 minggu yang lalu';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} hari yang lalu';
    } else if (difference.inDays >= 1) {
      return '1 hari yang lalu';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} jam yang lalu';
    } else if (difference.inHours >= 1) {
      return '1 jam yang lalu';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} menit yang lalu';
    } else if (difference.inMinutes >= 1) {
      return '1 menit yang lalu';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} detik yang lalu';
    } else {
      return 'baru saja';
    }
  }
}
