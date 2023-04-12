import 'package:intl/intl.dart';

class DateFormatter {
  DateFormatter._internal();

  static String formatDDmmYYYY(DateTime? date) {
    if (date == null) {
      return '';
    }
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }

  static String formatYYYYmmDD(DateTime? date) {
    if (date == null) {
      return '';
    }
    final formatter = DateFormat('yyyy/MM/dd');
    return formatter.format(date);
  }

  static String formatYYYYmmDDBE(DateTime? date) {
    if (date == null) {
      return '';
    }
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  static String formatStringDate(String value) {
    if (value.isEmpty) {
      return '-';
    }
    final date = DateTime.parse(value);
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }

  static String convertTimeSlot(String timeSlot) {
    if (timeSlot.isEmpty) {
      return '';
    }
    final hourStr = timeSlot.substring(0, 2);
    final minuteStr = timeSlot.substring(3, 5);
    final hour = int.parse(hourStr);
    final minute = int.parse(minuteStr);
    if (hour == 23) {
      if (minute == 59) {
        return '00:00AM';
      } else {
        return '11:${minuteStr}PM';
      }
    } else if (hour > 12) {
      if ((hour - 12) < 10) {
        return '0${hour - 12}:${minuteStr}PM';
      } else {
        return '${hour - 12}:${minuteStr}PM';
      }
    } else if (hour == 12) {
      return '12:${minuteStr}PM';
    } else {
      return '${timeSlot}AM';
    }
  }

  static String convertNameMonth(String timeStr) {
    if (timeStr.isEmpty) {
      return '';
    }
    final convertDateTime = DateTime.parse(timeStr);
    final formatMonth = DateFormat.MMM('en_US');
    final formatDay = DateFormat.d('en_US');
    final formatYear = DateFormat.y('en_US');
    final dateTimeStr =
        '${formatDay.format(convertDateTime)} ${formatMonth.format(convertDateTime)} '
        '${formatYear.format(convertDateTime)}';
    return dateTimeStr;
  }

  static String convertNameMonthTime(String timeStr) {
    print('check time Strn $timeStr');
    if (timeStr.isEmpty) {
      return '';
    }
    final convertDateTime = DateTime.parse(timeStr);
    final format = DateFormat.MMM('dd/MM/yyyy HH:mm');

    final dateTimeStr = format.format(convertDateTime);
    return dateTimeStr;
  }

  static String convertTimeToEEEE(String timeStr) {
    if (timeStr.isEmpty) {
      return '';
    }
    final convertDateTime = DateTime.parse(timeStr);
    final formatMonth = DateFormat.MMM('en_US');
    final formatDay = DateFormat.d('en_US');
    final formatNameDay = DateFormat('EEEE');
    final dateTimeStr =
        '${formatNameDay.format(convertDateTime)},${formatDay.format(convertDateTime)} ${formatMonth.format(convertDateTime)}';
    return dateTimeStr;
  }

  static String convertTimeStr(String timeStr) {
    if (timeStr.isEmpty) {
      return '';
    }
    final convertDateTime = DateTime.parse(timeStr);
    var format = DateFormat('HH:mm:ss');

    final dateTimeStr = format.format(convertDateTime);

    return dateTimeStr;
  }

  static String getNameDate(DateTime time) {
    return DateFormat('EEEE').format(time);
  }

  static String getDateEndTime(String time) {
    if (time.isEmpty) {
      return '';
    }

    final selectDate = DateTime.parse(time);
    String nameDay = DateFormatter.getNameDate(selectDate);
    String dayMonthYear = DateFormatter.convertNameMonth(time);
    return '$nameDay, $dayMonthYear';
  }

  static String getTimeSlot(String fromTime, String toTime) {
    final text =
        '${fromTime.isNotEmpty ? DateFormatter.convertTimeSlot(fromTime) : ''} - '
        '${toTime.isNotEmpty ? DateFormatter.convertTimeSlot(toTime) : ''}';
    return text;
  }
}
