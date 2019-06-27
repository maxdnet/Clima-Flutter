import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';

class NetworkingBrain {
  WeatherModel weatherModel;
  bool networkKO = false;

  Future<void> getWeatherInfo(double latitude, double longitude) async {
    var url =
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&APPID=$kAppID";

    var client = http.Client();

    try {
      var response = await client.get(url).timeout(Duration(seconds: 5));
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        weatherModel = WeatherModel.fromJson(jsonResponse);
      } else {
        //print("Request failed with status: ${response.statusCode}.");
        networkKO = true;
      }
    } catch (e) {
      //print(e.toString());
      networkKO = true;
    } finally {
      client.close();
    }

    /*Duration duration = Duration(seconds: 5);

    var response = await http.get(url).timeout(duration);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      weatherModel = WeatherModel.fromJson(jsonResponse);
    } else {
      //print("Request failed with status: ${response.statusCode}.");
      networkKO = true;
    }*/
  }
}
