import 'package:intl/intl.dart';

class DateFormatUtils {
  static String getDateOnly({required DateTime date}) {
    return DateFormat("dd-MM-yyyy").format(date);
  }

  static String getFormettedTime({required DateTime date}) {
    return DateFormat("hh:mm a").format(date);
  }

  static String getCustomDateFormat(
      {required DateTime date, required String formate}) {
    return DateFormat(formate).format(date);
  }

  static String getDateAndTimeFormate({required DateTime date}) {
    return DateFormat("dd-MM-yyyy hh:mm a").format(date);
  }

  static String serverformatDate(DateTime? date) {
    if (date == null) return "";
    return DateFormat("yyyy-MM-ddTHH:mm:ss.SSSZ").format(date);
  }
}
