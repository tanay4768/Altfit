import 'dart:async';

import 'package:altfit/routes/routes.dart';
import 'package:altfit/services/preference_manager.dart';
import 'package:altfit/utils/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if(PreferenceManager.isloggedIn()) {
        Get.offNamed(Routes.home);
      } else {
        Get.offNamed(Routes.login);
      }
       });
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body:
              orientation == Orientation.portrait
                  ? _buildPortrait(context, orientation)
                  : _buildLandscape(context, orientation),
        );
      },
    );
  }

  Widget _buildPortrait(BuildContext context, Orientation orientation) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return SafeArea(
      child: Column(
        children: [
          Flexible(
            flex: 3,
            child: SizedBox(
              width: width,
              child: Image.asset("assets/splashscreen.png", fit: BoxFit.cover),
            ),
          ),
          Flexible(
            flex: 1,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  color: Theme.of(context).primaryColor,
                  child: Center(
                    child: Text(
                      "ALTFIT",
                      style: theme.textTheme.displayMedium!.copyWith(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Positioned(
                  top: -16,
                  child: Center(
                    child: SizedBox(
                      width: width,
                      child: CircleAvatar(
                        radius: 36,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 32,
                          foregroundImage: AssetImage("assets/logo.png"),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLandscape(BuildContext context, Orientation orientation) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return Container(
      color: theme.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: width / 10,
              height: width / 10,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 4),
              ),
              child: Image.asset(
                "assets/logo.png",
                height: width / 10,
                width: width / 10,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Space(height: 20),
          Text(
            "ALTFIT",
            style: theme.textTheme.displayMedium!.copyWith(
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }


}
