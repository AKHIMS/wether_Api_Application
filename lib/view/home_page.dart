// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controler/class_models_wether.dart';
import 'package:flutter_application_1/controler/wether_Api_page.dart';
import 'package:flutter_application_1/controller/class_models_weather.dart';
import 'package:flutter_application_1/controller/weather_api_page.dart';
import 'package:flutter_application_1/view/fist_screen.dart';

import 'first_screen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
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
            onRefresh: () {},
          ),
        ),
      );
    } catch (e) {
      print('Error: $e');
      // Handle error
    }
  }

  void _handleSearch() {
    final cityName = _searchController.text;
    _fetchWeatherData(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Change background color here
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Other content of the page can be added here
            ],
          ),
        ),
      ),
    );
  }
}
