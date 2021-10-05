import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey();
  late TextEditingController cityNameTextController;
  String cityName = "";

  @override
  void onInit() {
    super.onInit();
    cityNameTextController = TextEditingController();
  }

  @override
  void onClose() {
    cityNameTextController.dispose();
    super.onClose();
  }

  String? validateCityNametext(String value) {
    if (value.isEmpty) {
      return "Please enter your localization city";
    }
    return null;
  }

  void checkCityName() {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
  }
}
