import 'package:flutter/material.dart';
import 'package:my_clima_flutter/screens/location_screen.dart';
import 'package:my_clima_flutter/services/location.dart';
import 'package:my_clima_flutter/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const APIkey = 'b6e30902e6755890b39ae1a643cd8197';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location loc = new Location();
    await loc.getCurrentLocation();
    Networking net = Networking(
        url:
            "https://api.openweathermap.org/data/2.5/weather?lat=${loc.latitude}&lon=${loc.longitude}&appid=$APIkey&units=metric");
    var weatherData = await net.getData();
    print(weatherData);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
