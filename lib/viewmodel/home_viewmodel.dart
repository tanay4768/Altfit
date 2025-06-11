import 'package:altfit/model/progam.dart';
import 'package:altfit/utils/status.dart';
import 'package:firebase_database/firebase_database.dart';

import '../utils/logging.dart';

class HomeViewmodel {

  static Future<StatusResponse<List<Program>>> getPrograms() async {
    Logging.log.d("In the function");
 
    DatabaseReference ref = FirebaseDatabase.instance.ref("programs");
   ref.keepSynced(true);    
   final List<Program> programs = [];

    try {
      final snapshot = await ref.once();
      if (snapshot.snapshot.value != null) {
        final data = snapshot.snapshot.value as Map<dynamic, dynamic>;
        data.forEach((key, value) {
          programs.add(Program.fromJson(value as Map<dynamic, dynamic>));
        });
      }
      return StatusResponse(status: Status.success, data: programs);
    } catch (e) {
      Logging.log.e(e.toString());
      return StatusResponse(status: Status.failed, data: []);
    }
  }
}
