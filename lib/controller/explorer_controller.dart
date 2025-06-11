import 'package:altfit/model/progam.dart';
import 'package:altfit/utils/logging.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';


class ExplorerController extends GetxController{
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
    _setListners();
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


 void _setListners(){
    DatabaseReference ref = FirebaseDatabase.instance.ref("programs");
    ref.keepSynced(true);
    ref.onChildAdded.listen((event) {
  final value = event.snapshot.value;
  Logging.log.d(value);
  if (value is Map<dynamic, dynamic>) {
    final Program prog = Program.fromJson(value);
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
    rawList.add(prog);
  } else {
    Logging.log.e('Unexpected value type: ${value.runtimeType}');
  }
}, onError: (error) {
  Logging.log.e(error.toString());
}); 

ever(rawList,(_)=> filterList());

  }

}