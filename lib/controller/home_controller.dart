import 'package:altfit/model/progam.dart';
import 'package:altfit/services/preference_manager.dart';
import 'package:altfit/utils/status.dart';
import 'package:altfit/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<Program> programs = <Program>[].obs;
  RxBool isDarkMode =(PreferenceManager.getThemeMode() || ThemeMode.system == ThemeMode.dark).obs;

  @override
  void onInit() {
    super.onInit();
    fetchPrograms();
  }

  void fetchPrograms() async {
    StatusResponse response = await HomeViewmodel.getPrograms();
    programs.value = response.data;
  }

  void toggleTheme() async {
    isDarkMode.value = !isDarkMode.value;
    PreferenceManager.saveThemeMode(isDarkMode.value);
    Get.changeThemeMode(isDarkMode.value? ThemeMode.dark : ThemeMode.light);
  }
}