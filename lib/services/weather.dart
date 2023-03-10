import 'location.dart';
import 'networking.dart';

class WeatherModel {
  Future<dynamic> getlocdata() async {
    double lat, lon;
    String url;
    Location loc = Location();
    await loc.getloc();
    lat = loc.lat;
    lon = loc.lon;
    url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=9b25066d1b2b805c141bbbbf66dc4145&units=metric';
    Net det = Net(url);
    var json = await det.jso();
    return json;
  }

  Future<dynamic> getcitydata(String city) async {
    String url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=9b25066d1b2b805c141bbbbf66dc4145&units=metric';
    Net det = Net(url);
    var json = await det.jso();

    return json;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
