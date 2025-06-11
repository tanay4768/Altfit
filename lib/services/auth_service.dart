import 'package:altfit/utils/status.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

static Future<StatusResponse<String>> handleSignup({required email, required password}) async {

  final emailPattern = r'^[^@]+@[^@]+\.[^@]+';
  final regExp = RegExp(emailPattern);

  if(email.isEmpty || password.isEmpty) return StatusResponse(status: Status.failed, data: "Kindly fill all fields");
  if (!regExp.hasMatch(email)) {
    return StatusResponse(status: Status.failed, data: "Invalid email format");
  }
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final db = FirebaseFirestore.instance.collection("users").doc(credential.user?.uid);
    db.set(
     { "email" : email,
     "myPlans" : ["a1b2c3d4e5f6g7h8i9j0","c1d2e3f4g5h6i7j8k9l0","k1l2m3n4o5p6q7r8s9t0", "p1q2r3s4t5u6v7w8x9y0"]
     }
    );
    return StatusResponse(status: Status.success, data: credential.user?.uid);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      return StatusResponse(status: Status.failed, data: "Password too weak");
    } else if (e.code == 'email-already-in-use') {
      return StatusResponse(status: Status.failed, data: 'The account already exists for that email.');
    } else {
      return StatusResponse(status: Status.failed, data: 'Authentication failed: ${e.message}');
    }
  } catch (e) {
    return StatusResponse(status: Status.failed, data: 'An unknown error occurred.');
  }
}

static Future<StatusResponse<String>> handleLogin({required email, required password}) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return StatusResponse(status: Status.success, data: credential.user?.uid);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return StatusResponse(status: Status.failed, data: 'No user found for that email.');
    } else if (e.code == 'wrong-password') {
      return StatusResponse(status: Status.failed, data: 'Wrong password provided for that user.');
    } else {
      return StatusResponse(status: Status.failed, data: 'Authentication failed: ${e.message}');
    }
  } catch (e) {
    return StatusResponse(status: Status.failed, data: 'An unknown error occurred.');
  }
}

}