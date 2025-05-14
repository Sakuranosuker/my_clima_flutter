import 'package:flutter/material.dart';
import 'package:my_clima_flutter/services/location.dart';
import 'package:my_clima_flutter/services/networking.dart';

const APIkey = 'b6e30902e6755890b39ae1a643cd8197';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double lat;
  late double
      longi; //late modifier means declaring a non-nullable variable that's initialized after its declaration.

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location loc = new Location();
    await loc.getCurrentLocation();
    lat = loc.latitude;
    longi = loc.longitude;
    print(lat);
    print(longi);
    getNetworkingData();
  }

  void getNetworkingData() {
    Networking net = new Networking(
        url:
            "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$longi&appid=$APIkey");
    net.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
