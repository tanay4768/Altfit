import 'package:altfit/routes/routes.dart';
import 'package:altfit/services/preference_manager.dart';
import 'package:altfit/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await PreferenceManager.init();
  final isDarkMode = PreferenceManager.getThemeMode() == true;
  runApp(MyApp(isDarkMode: isDarkMode));
}

class MyApp extends StatelessWidget {
  final bool isDarkMode;
  const MyApp({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      darkTheme: AppThemes.darkTheme,
      theme: AppThemes.lightTheme,
      getPages: Routes.getxRoutes,
      initialRoute: Routes.splash,
    );
  }
}

