import 'package:intl/intl.dart';

class DateFormatter {
  // Format a DateTime to a readable string like "August 19, 2024"
  static String formatDate(DateTime date) {
    return DateFormat('MMMM d, yyyy').format(date);
  }

  // Format a DateTime to a readable string like "19 Aug 2024"
  static String formatDateShort(DateTime date) {
    return DateFormat('d MMM yyyy').format(date);
  }

  // Format a DateTime to a time string like "2:45 PM"
  static String formatTime(DateTime date) {
    return DateFormat('h:mm a').format(date);
  }

  // Format a DateTime to a relative time string like "2 hours ago"
  // Give BuildContext for Localization
  static String formatTimeAgo(DateTime date) {
    final Duration difference = DateTime.now().difference(date);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return formatDate(date);
    }
  }

  // Format a DateTime to a specific format, e.g., "2024-08-19 14:45:00"
  static String formatCustom(DateTime date, String pattern) {
    return DateFormat(pattern).format(date);
  }

  // Converts a UTC DateTime to local time and formats it
  // static String formatLocal(DateTime date) {
  //   final localDate = date.toLocal();
  //   return DateFormat('yyyy-MM-dd HH:mm:ss').format(localDate);
  // }

  // Parse a date string to a DateTime object
  // static DateTime? parseDate(String dateString, {String format = 'yyyy-MM-dd HH:mm:ss'}) {
  //   try {
  //     return DateFormat(format).parse(dateString);
  //   } catch (e) {
  //     // Handle the error, e.g., log it or return null
  //     return null;
  //   }
  // }
}