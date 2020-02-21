import 'package:ourESchool/core/Models/holiday_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:world_holidays/internal/keys.dart';

class CalendarificApiCall {
  String apiKey =
      'a0bb972df672fe8ee634d7b3aaac6a1110feaa11'; //API key from calendarific.com :)
  String currentYear = DateTime.now().year.toString();

  Future<HolidayData> getHolidays(String countryCode) async {
    final response = await http.get(
        'https://calendarific.com/api/v2/holidays?country=$countryCode&year=$currentYear&api_key=$apiKey');
    if (response.statusCode == 200) {
      final jsonData = await json.decode(response.body);
      return HolidayData.fromJson(jsonData);
    } else {
      throw Exception("Failed to get holidays");
    }
  }
}
