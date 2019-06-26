class WeatherModel {
  String city;
  String temperature;
  String humidity;
  String pressure;

  WeatherModel({this.temperature, this.humidity, this.pressure, this.city});

  WeatherModel.fromJson(Map<String, dynamic> json)
      : city = json['name'].toString(),
        temperature = (double.parse(json['main']['temp'].toString()) -
                double.parse('273.15'))
            .toStringAsFixed(1),
        humidity = json['main']['humidity'].toString(),
        pressure = json['main']['pressure'].toString();

  Map<String, dynamic> toJson() => {
        'city': city,
        'temperature': temperature,
        'humidity': humidity,
        'pressure': pressure,
      };

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(double temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time in ';
    } else if (temp > 20) {
      return 'Time for shorts and 👕 in ';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤 in ';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
