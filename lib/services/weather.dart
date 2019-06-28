class WeatherModel {
  String city;
  String temperature;
  String humidity;
  String condition;

  WeatherModel({this.temperature, this.humidity, this.condition, this.city});

  WeatherModel.fromJson(Map<String, dynamic> json)
      : city = json['name'].toString(),
        temperature = json['main']['temp'].toStringAsFixed(1),
        humidity = json['main']['humidity'].toString(),
        condition = json['weather'][0]['id'].toString();

  Map<String, dynamic> toJson() => {
        'city': city,
        'temperature': temperature,
        'humidity': humidity,
        'condition': condition,
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
