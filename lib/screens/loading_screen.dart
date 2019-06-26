import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';
import 'location_screen.dart';

LocationBrain locationBrain = LocationBrain();
NetworkingBrain networkingBrain = NetworkingBrain();

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  String infoText = 'Recupero informazioni Meteo';

  void getLocation() async {
    await locationBrain.getLocation();
    getWeatherInfo(locationBrain.latitude, locationBrain.longitude);
  }

  void getWeatherInfo(double latitude, double longitude) async {
    await networkingBrain.getWeatherInfo(latitude, longitude);

    if (!networkingBrain.networkKO)
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LocationScreen(
                    weather: networkingBrain.weatherModel,
                  )));
    else {
      setState(() {
        infoText = 'Network KO';
      });
      print('Network KO');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            infoText,
            style: kButtonTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
