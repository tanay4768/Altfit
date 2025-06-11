import 'package:altfit/controller/my_plan_controller.dart';
import 'package:get/get.dart';

class MyPlansBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyPlanController()); 
  
  }
}