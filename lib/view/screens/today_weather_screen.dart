import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_test/constants.dart';
import 'package:weather_app_test/data/controllers/form_controller.dart';
import 'package:weather_app_test/data/controllers/weather_controller.dart';
import 'package:weather_app_test/view/widgets/form.dart';
import 'package:weather_app_test/view/widgets/temperature_display.dart';

class TodayWeatherScreen extends StatelessWidget {
  const TodayWeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WeatherController controller = Get.put(WeatherController());
    FormController formCtrl = Get.put(FormController());
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: const Icon(
          FontAwesomeIcons.snowflake,
          color: kWhiteColor,
        ),
        title: Text(
          "Weather forecase",
          style: GoogleFonts.roboto(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => controller.cityWeather.value.name == null
              ? const Center(child: LinearProgressIndicator())
              : Container(
                padding: const EdgeInsets.symmetric(
                  vertical: kDefaultPadding,
                  horizontal: kDefaultPadding,
                ),
                width: size.width,
                decoration: BoxDecoration(
                  color: kBoxColor,
                  borderRadius: BorderRadius.circular(29),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Today",
                          style: GoogleFonts.roboto(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.1,
                          ),
                        ),
                        Text(
                          DateFormat('EEE, MMM d, ' 'yyyy')
                              .format(DateTime.now()),
                          style: GoogleFonts.roboto(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TemperatureDisplay(
                          text: controller.cityWeather.value.main?.temp
                                  .toString() ??
                              "**,*",
                          unit: "°C",
                        ),
                        Image.network(
                          controller.cityWeather.value.weather?[0] !=
                                  null
                              ? "https://openweathermap.org/img/wn/${controller.cityWeather.value.weather?[0].icon}@2x.png"
                              : "",
                          height: size.height * 0.16,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          FontAwesomeIcons.mapMarkerAlt,
                          color: kPrimaryColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text(
                            "${controller.cityWeather.value.name ?? "****"}, ${controller.cityWeather.value.sys?.country ?? "**"}",
                            style: GoogleFonts.roboto(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ),
              const SizedBox(height: 20 * 4),
              FormFieldsInput(),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                ),
                onPressed: () {
                  formCtrl.checkCityName();
                  controller.getWeatherCityData(formCtrl.cityName);
                },
                child: Text(
                  "Get Weather",
                  style: GoogleFonts.roboto(
                      color: kWhiteColor, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
