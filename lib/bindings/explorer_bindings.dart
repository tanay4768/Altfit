import 'package:altfit/controller/explorer_controller.dart';
import 'package:get/get.dart';

class ExplorerBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExplorerController()); 
  
  }
}