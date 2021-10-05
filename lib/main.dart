import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:weather_app_test/constants.dart';
import 'package:weather_app_test/view/screens/today_weather_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather app test',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kScaffoldBgColor,
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: kWhiteColor,
          ),
          bodyText2: TextStyle(
            color: kWhiteColor,
          ),
        ),
      ),
      home: const TodayWeatherScreen(),
    );
  }
}
