import 'package:intl/intl.dart';


String getCurrentDate(String dateFormat) {
  // Get the current date
  DateTime now = DateTime.now();

  // Create a DateFormat object with the specified format
  DateFormat formatter = DateFormat(dateFormat);

  // Format the date and return it as a string
  return formatter.format(now);
}