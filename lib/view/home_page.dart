// ignore_for_file: use_build_context_synchronously, unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controler/class_models_wether.dart';
import 'package:flutter_application_1/controler/wether_Api_page.dart';
import 'package:flutter_application_1/controller/class_models_weather.dart';
import 'package:flutter_application_1/controller/weather_api_page.dart';
import 'package:flutter_application_1/view/fist_screen.dart';
import 'package:flutter_application_1/view/weather_display_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _searchController;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(_clearErrorMessage);
  }

  void _clearErrorMessage() {
    setState(() {
      _errorMessage = null;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _fetchWeatherData(String cityName) async {
    try {
      final weatherData = await WeatherAPI.fetchWeatherData(cityName);
      final forecastData = await WeatherAPI.fetchForecastData(cityName);
      final cityData = await WeatherAPI.fetchCityData(cityName);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WeatherDisplayPage(
            weatherData: weatherData,
            forecastData: forecastData,
            cities: cityData.map((city) => City.fromJson(city)).toList(),
            searchedCity: cityName,
            onRefresh: _refreshData, // Pass _refreshData callback here
          ),
        ),
      );
    } catch (e) {
      _showErrorDialog('Error weather data. Please try again.');
      print('Error: $e');
    }
  }

  void _refreshData() {
    // Fetch weather data for the current city again
    final cityName = _searchController.text.trim();
    if (cityName.isNotEmpty) {
      _fetchWeatherData(cityName);
    }
  }

  void _handleSearch() {
    final cityName = _searchController.text.trim();
    if (cityName.isNotEmpty) {
      _fetchWeatherData(cityName);
    } else {
      _showErrorDialog('Please enter a city name.');
    }
  }

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 38, 41, 43),
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Enter a city name',
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: _handleSearch,
              ),
            ),
            onSubmitted: (_) => _handleSearch(),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Implement onRefresh to call _refreshData
          _refreshData();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (_errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      _errorMessage!,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                // Other content of the page can be added here
              ],
            ),
          ),
        ),
      ),
    );
  }
}
