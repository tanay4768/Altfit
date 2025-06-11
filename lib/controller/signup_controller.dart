import 'package:altfit/routes/routes.dart';
import 'package:altfit/services/auth_service.dart';
import 'package:altfit/services/preference_manager.dart';
import 'package:altfit/utils/status.dart';
import 'package:get/get.dart';

class SignupController extends GetxController{
    RxBool obscureText = true.obs;


   void handleSignup({required email, required password})async{
  final StatusResponse response = await AuthService.handleSignup(email: email, password: password);
  if(response.status == Status.failed) {Get.snackbar("Error", response.data);}
  else{
    PreferenceManager.setLoggedIn(true);
    Get.offNamed(Routes.home);

  }
  }
}