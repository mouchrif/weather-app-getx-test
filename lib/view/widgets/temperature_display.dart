import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_test/constants.dart';

class TemperatureDisplay extends StatelessWidget {
  final String text;
  final String unit;
  const TemperatureDisplay({Key? key, required this.text, required this.unit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: GoogleFonts.roboto(
            color: kTextWhiteColor,
            fontSize: 52.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 4),
        Padding(
          padding: const EdgeInsets.only(
            top: 6,
          ),
          child: Text(
            unit,
            style: GoogleFonts.roboto(
              color: kPrimaryColor,
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
