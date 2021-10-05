import 'package:get/get.dart';
import 'package:weather_app_test/data/services/weather_service.dart';
import 'package:weather_app_test/model/weather_model.dart';

class WeatherController extends GetxController {
  Rx<WeatherCityModel> cityWeather = WeatherCityModel().obs;

  WeatherService weather = WeatherService();
  void getWeatherCityData(String cityName) async {
    var weatherCity = await weather.fetchWeatherOfCity(cityName);
    if (weatherCity != null) {
      cityWeather.value = weatherCity;
      print(cityWeather.value.sys!.country);
    } else {
      cityWeather.value = WeatherCityModel();
      print("error: ${cityWeather.value.name}");
    }
  }
}
