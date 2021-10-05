import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_test/constants.dart';
import 'package:weather_app_test/data/controllers/form_controller.dart';

class FormFieldsInput extends StatelessWidget {
  FormFieldsInput({Key? key}) : super(key: key);
  final FocusNode _textNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final FormController formCtrl = Get.find();
    return Form(
      key: formCtrl.formKey,
      child: TextFormField(
        focusNode: _textNode,
        style: GoogleFonts.roboto(
          color: kWhiteColor,
          fontSize: 18.0,
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: "Enter your localization",
          hintStyle: GoogleFonts.roboto(
            color: kWhiteColor.withOpacity(0.4),
          ),
          filled: true,
          fillColor: kBoxColor,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: kBoxColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: kPrimaryColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
        ),
        cursorColor: kPrimaryColor,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          return formCtrl.validateCityNametext(value!);
        },
        onSaved: (value) {
          formCtrl.cityName = value!;
        },
      ),
    );
  }
}
