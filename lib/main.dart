// main.dart

// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_import

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controler/class_models_wether.dart';
import 'package:flutter_application_1/view/fist_screen.dart';
import 'package:flutter_application_1/view/home_page.dart';
import 'package:flutter_application_1/controler/wether_Api_page.dart';

import 'city_model.dart'; // Import the City class from the city_model.dart file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

