import 'package:altfit/model/progam.dart';
import 'package:altfit/utils/logging.dart';
import 'package:altfit/utils/status.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class MyPlanViewmodel {
  static Future<StatusResponse<List<Program>>> getPrograms() async {
try{
    final credentials = FirebaseAuth.instance;

    final db = FirebaseFirestore.instance.collection("users").doc(credentials.currentUser!.uid);
    final DocumentSnapshot snapshot = await db.get();

    final data = snapshot.data() as Map<String, dynamic>?;
    List<String> myPlans = (data?['myPlans'] as List<dynamic>?)?.cast<String>() ?? [];

    final List<Program> programs = [];
  for(String plan in myPlans){
    DatabaseReference ref = FirebaseDatabase.instance.ref("programs/$plan");
   final event = await ref.once();
    programs.add(Program.fromJson(event.snapshot.value as Map<dynamic, dynamic>));
  
  }

 return StatusResponse(status:Status.success, data: programs);
}
catch(e){
    Logging.log.e(e.toString());
    return StatusResponse(status:Status.failed, data: []);
}
  }
}
