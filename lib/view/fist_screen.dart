// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_key_in_widget_constructors, unnecessary_string_interpolations, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controler/class_models_wether.dart';
import 'package:flutter_application_1/controller/class_models_weather.dart';

class WeatherDisplayPage extends StatelessWidget {
  final Map<String, dynamic> weatherData;
  final List<dynamic> forecastData;
  final VoidCallback onRefresh;
  final List<City> cities;
  final String searchedCity;

  WeatherDisplayPage({
    required this.weatherData,
    required this.forecastData,
    required this.onRefresh,
    required this.cities,
    required this.searchedCity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$searchedCity',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 26, color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 26, 27, 27),
        leading: IconButton(
          icon: Icon(Icons.location_on),
          color: Colors.white, // Setting icon color to white
          onPressed: () {
            // Implement action when location icon is pressed
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white, // Setting icon color to white
            onPressed: () {
              // Implement action when menu icon is pressed
            },
          ),
          IconButton(
            icon: Icon(Icons.menu_open), // Adding search icon
            color: Colors.white, // Setting icon color to white
            onPressed: () {
              // Implement action when search icon is pressed
            },
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 47, 50, 53),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 250,
                child: Card(
                  color: Color.fromARGB(0, 40, 66, 180),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Today: ${weatherData['weather'][0]['main']}',
                                style: TextStyle(color: Colors.white),
                              ),
                              _buildWeatherDetail(
                                '${weatherData['weather'][0]['description']}',
                                fontSize: 8,
                              ),
                              SizedBox(height: 16),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        _buildWeatherDetail(
                                          '${weatherData['main']['temp']}°C',
                                          fontSize: 50,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            _buildWeatherDetail(
                                              '${forecastData[0]['main']['temp']}°C',
                                              fontSize: 16,
                                            ),
                                            SizedBox(
                                                width:
                                                    8), // Add space between temperature details and refresh icon
                                            _buildWeatherDetail(
                                              '${forecastData[1]['main']['temp']}°C',
                                              fontSize: 16,
                                            ),
                                            SizedBox(
                                                width:
                                                    8), // Add space between temperature details and refresh icon
                                            // Refresh Icon
                                            GestureDetector(
                                              onTap:
                                                  onRefresh, // Call the onRefresh callback passed from the parent widget
                                              child: Icon(
                                                Icons.refresh,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Card(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Feels like", // Your additional text goes here
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      SizedBox(
                          height:
                              8), // Add space between the additional text and the Row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.thermostat, color: Colors.white),
                          SizedBox(
                              width:
                                  8), // Add some spacing between icon and temperature
                          _buildWeatherDetail('${weatherData['main']['temp']}',
                              fontSize: 16),
                          Spacer(), // Add a spacer to push the text to the right side
                          Text(
                            "Humidity: ${weatherData['main']['humidity']}%",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Card(
                      color: Colors.transparent, // Adjusted alpha value to 255
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Wind Speed',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height:
                                    8), // Add space between the text and the icon
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.air, color: Colors.white),
                                SizedBox(width: 8),
                                _buildWeatherDetail(
                                  '${weatherData['wind']['speed']} m/s',
                                  fontSize: 16,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Card(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Humidity',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height:
                                    8), // Add space between the text and the icon
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.water_drop, color: Colors.white),
                                SizedBox(width: 8),
                                _buildWeatherDetail(
                                    '${weatherData['main']['humidity']}%',
                                    fontSize: 16),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Card(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.calendar_today,
                              color:
                                  Colors.white), // Icon fixed next to the text
                          SizedBox(
                              width: 8), // Adjust spacing between icon and text
                          Text(
                            '5 Days Forecast',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5, // Display forecast for the next 5 days
                        itemBuilder: (context, index) {
                          final DateTime nextDay =
                              DateTime.now().add(Duration(days: index + 1));
                          final String dayName = _getDayName(nextDay.weekday);
                          final IconData weatherIcon = _getWeatherIcon(
                              forecastData[index]['weather'][0]['main']);
                          return ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  dayName,
                                  style: TextStyle(color: Colors.white),
                                ),
                                Row(
                                  children: [
                                    Icon(weatherIcon, color: Colors.white),
                                    SizedBox(width: 5),
                                    Text(
                                      '${forecastData[index]['main']['temp']}°C',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherDetail(String value, {double? fontSize}) {
    return Text(
      value,
      style: TextStyle(color: Colors.white, fontSize: fontSize ?? 16),
    );
  }

  String _getDayName(int weekday) {
    switch (weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
  }

  IconData _getWeatherIcon(String weatherCondition) {
    switch (weatherCondition) {
      case 'Clear':
        return Icons.wb_sunny;
      case 'Clouds':
        return Icons.cloud;
      case 'Rain':
        return Icons.grain;
      case 'Drizzle':
        return Icons.grain;
      case 'Thunderstorm':
        return Icons.flash_on;
      case 'Snow':
        return Icons.ac_unit;
      case 'Sunny':
        return Icons.wb_sunny;
      case 'Cloudy':
        return Icons.cloud;
      default:
        return Icons.wb_sunny;
    }
  }
}
