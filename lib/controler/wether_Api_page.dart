// ignore_for_file: prefer_const_declarations, file_names

import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherAPI {
  static Future<Map<String, dynamic>> fetchWeatherData(String cityName) async {
    final apiKey = 'b39c7464ab56df782ab4652f7da5fd99';
    final apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  static Future<List<dynamic>> fetchForecastData(String cityName) async {
    final apiKey = 'b39c7464ab56df782ab4652f7da5fd99';
    final forecastUrl =
        'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=$apiKey&units=metric';

    final forecastResponse = await http.get(Uri.parse(forecastUrl));
    if (forecastResponse.statusCode == 200) {
      return json.decode(forecastResponse.body)['list'];
    } else {
      throw Exception('Failed to load forecast data');
    }
  }

  static Future<List<dynamic>> fetchCityData(String cityName) async {
    final apiKey = 'b39c7464ab56df782ab4652f7da5fd99';
    final geoApiUrl =
        'http://api.openweathermap.org/geo/1.0/direct?q=$cityName&limit=1&appid=$apiKey';

    final geoResponse = await http.get(Uri.parse(geoApiUrl));
    if (geoResponse.statusCode == 200) {
      return json.decode(geoResponse.body) as List;
    } else {
      throw Exception('Failed to load city data');
    }
  }
}
