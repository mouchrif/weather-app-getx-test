import 'package:http/http.dart' as http;
import 'package:weather_app_test/model/weather_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherService {
  Future<dynamic> fetchWeatherOfCity(String? cityName) async {
    print(dotenv.env['API_KEY']);
    final url = Uri.parse(
        "${dotenv.env['API_TARGET_NAME']}?q=$cityName&units=metric&appid=${dotenv.env['API_KEY']}");

    final response = await http.get(url);
    if (response.statusCode == 200) {
      WeatherCityModel weatherOfCity = weatherFromJson(response.body);
      return weatherOfCity;
    } else {
      print("error in request");
      return null;
    }
  }
}
