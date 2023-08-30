// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future logInWithEmailAndPassword(email, password) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = FirebaseAuth.instance.currentUser;
  }
}
