import 'package:intl/intl.dart';

String formatDateTime(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  String formattedDateTime =
      DateFormat('EEE, MMM d, y, h:mm a').format(dateTime);
  return formattedDateTime;
}

String formatDate(String inputDateTime) {
  final inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  final outputFormat = DateFormat('EEEE, MMMM d, y');

  final dateTime = inputFormat.parse(inputDateTime);
  final dateString = outputFormat.format(dateTime);
  return dateString;
}

String formatTime(String dateTime) {
  final inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  final outputFormat = DateFormat('hh:mm a');

  final date = inputFormat.parse(dateTime);
  final timeString = outputFormat.format(date);
  return timeString;
}
