// ignore_for_file: unused_import, unnecessary_string_interpolations, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controler/class_models_wether.dart';
import 'package:flutter_application_1/controller/class_models_weather.dart';
import 'package:flutter_application_1/controller/weather_api_page.dart';

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
        title: Text('$searchedCity'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 350,
                child: Card(
                  color: Colors.transparent,
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
                              SizedBox(height: 16),
                              _buildWeatherDetail('${weatherData['main']['temp']}°C', fontSize: 50),
                              _buildWeatherDetail('${weatherData['weather'][0]['description']}', fontSize: 13),
                              SizedBox(height: 18),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildWeatherDetail('${forecastData[0]['main']['temp']}°C', fontSize: 16),
                                  _buildWeatherDetail('${forecastData[1]['main']['temp']}°C', fontSize: 16),
                                ],
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
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.thermostat, color: Colors.white),
                      _buildWeatherDetail('Temperature Ratio: ${weatherData['main']['temp'] / forecastData[0]['main']['temp']}', fontSize: 16),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Card(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const Icon(Icons.air, color: Colors.white),
                            _buildWeatherDetail('Wind Speed: ${weatherData['wind']['speed']} m/s', fontSize: 16),
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
                          children: [
                            const Icon(Icons.water_damage, color: Colors.white),
                            _buildWeatherDetail('Humidity: ${weatherData['main']['humidity']}%', fontSize: 16),
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
                      Text(
                        'Next 5 Days Forecast',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: forecastData.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('${forecastData[index]['main']['temp']}°C'),
                            subtitle: Text('${forecastData[index]['weather'][0]['description']}'),
                            leading: Icon(Icons.wb_sunny),
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
}
