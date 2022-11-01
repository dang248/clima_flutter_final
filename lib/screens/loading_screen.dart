import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:http/http.dart' as http;

const apiKey = '3113844d0ce9ec2865d7206226db87c3';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocationData();
    print('Helllooooo');
    super.initState();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    double latitudeLocation = location.latitude;
    double longtitudeLocation = location.longtitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitudeLocation&lon=$longtitudeLocation&appid=$apiKey');
    var temperature = await networkHelper.getData();
    print(temperature['coord']['lat']);
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return LocationScreen();
    // }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: Center(
        //   child: ElevatedButton(
        //     onPressed: () {
        //       getLocation();
        //       print('Hello');
        //     },
        //     child: Text('Get Location'),
        //   ),
        // ),
        );
  }
}
