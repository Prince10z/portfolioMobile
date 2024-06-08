import 'package:intl/intl.dart';

class LocalFunc {
  static Map<String, String> convertTime(String val) {
    DateTime dateTime = DateTime.parse(val);

    DateFormat dateFormatter = DateFormat('dd-MM-yyyy');
    DateFormat timeFormatter = DateFormat('hh:mm a');

    // Format the DateTime object to the desired formats
    String formattedDate = dateFormatter.format(dateTime);
    String formattedTime = timeFormatter.format(dateTime);

    return {'date': formattedDate, 'time': formattedTime};
  }
}
