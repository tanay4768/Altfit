import 'package:altfit/controller/signup_controller.dart';
import 'package:get/get.dart';

class SignupBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController()); 
  
  }
}