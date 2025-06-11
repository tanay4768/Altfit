import 'package:altfit/bindings/explorer_bindings.dart';
import 'package:altfit/bindings/home_bindings.dart';
import 'package:altfit/bindings/login_bindings.dart';
import 'package:altfit/bindings/my_plans_bindings.dart';
import 'package:altfit/bindings/signup_bindings.dart';
import 'package:altfit/view/auth/login_screen.dart';
import 'package:altfit/view/auth/signup_screen.dart';
import 'package:altfit/view/explorer/explorer_screen.dart';
import 'package:altfit/view/homescreen/home_screen.dart';
import 'package:altfit/view/myplans/my_plan_screen.dart';
import 'package:altfit/view/splash/splash_screen.dart';
import 'package:get/get.dart';

class Routes {
static const splash = "/";
static const login = "/login";
static const home = "/home";
static const signup = "/signup";
static const myPlans = "/myplans";
static const explore = "/explore";

static final getxRoutes = [
  GetPage(
    name: splash,
    page: () => SplashScreen(),
     transition: Transition.cupertino, 
      transitionDuration: Duration(milliseconds: 1000),
  ),
  GetPage(
    name: login,
    page: () => LoginScreen(),
    binding: LoginBindings(),
     transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 1000),
  ),
    GetPage(
    name: home,
    page: () => HomeScreen(),
    binding: HomeBindings(),
     transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 1000),
  ),
  GetPage(
    name: signup,
    page: () => SignupScreen(),
    binding: SignupBindings(),
  ),
  GetPage(
    name: myPlans,
    page: () => MyPlanScreen(),
    binding: MyPlansBindings(),
  ),
  GetPage(
    name: explore,
    page: () => ExplorerScreen(),
    binding: ExplorerBindings(),
  ),
];

}