
import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
     getLocation();
    super.initState();
  }

  void getLocation()  async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longtitude);
  }

  void getData() async{
    http.Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    getData();
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
