import 'package:altfit/model/progam.dart';
import 'package:altfit/utils/status.dart';
import 'package:altfit/viewmodel/my_plan_viewmodel.dart';
import 'package:get/get.dart';

class MyPlanController extends GetxController{
  RxList<Program> rawList = <Program> [].obs;
RxList<Program> finalList = <Program> [].obs;
RxList<String> modeSelected = <String> [].obs;
RxList<String> levelSelected = <String> [].obs;
RxList<Map<String, dynamic>> modes = <Map<String, dynamic>>[].obs;
RxList<Map<String, dynamic>> levels = <Map<String, dynamic>>[].obs;
RxString searchText = "".obs;

    @override
  void onInit() {
    super.onInit();
    _loadData();
  }
     filterList(){
    finalList.value = rawList.where((program) {
  
      if (modeSelected.isEmpty && levelSelected.isEmpty) {
        return true;
      }
      else if (modeSelected.isNotEmpty && levelSelected.isNotEmpty) {
        return modeSelected.contains(program.mode) && levelSelected.contains(program.level);
      }
      else if (modeSelected.isNotEmpty) {
        return modeSelected.contains(program.mode);
      }
     else if (levelSelected.isNotEmpty) {
        return levelSelected.contains(program.level);
      }
      return false;
    }).toList();
if(searchText.value.isNotEmpty) {
  finalList.value = finalList.where((program)=>program.title.toLowerCase().contains(searchText.value)).toList();
}
  }

  _loadData()async{
   StatusResponse response = await MyPlanViewmodel.getPrograms();
   if(response.status == Status.success) {
     rawList.value = response.data;
     for(Program prog in rawList){
         if (!modes.any((element) => element["field"] == prog.mode)) {
      modes.add({
      "field": prog.mode,
      "val": false
      });
    }
    if (!levels.any((element) => element["field"] == prog.level)) {
      levels.add({
      "field": prog.level,
      "val": false
      });
    }
     }
     filterList();
   } else {
     Get.snackbar("Error", "Kindly check device logs");
   }
  }

}