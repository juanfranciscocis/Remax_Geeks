import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthManager extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? user;
  String errorMessage = '';

  Future<User?> signUpWithEmailAndPassword({required String email, required String password, required String fullName, required String phoneNumber}) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        await user.updateProfile(displayName: fullName);
        this.user = user;
        // You can also save the phone number to a user document in Firestore or any other database
      }
      return user;
    } catch (e) {
      // Handle any errors
      print(e);
      errorMessage = e.toString();
      return null;
    }
  }

  Future<User?> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      return user;
    } catch (e) {
      // Handle any errors
      print(e);
      errorMessage = e.toString();
      return null;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
