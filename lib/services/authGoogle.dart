

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthGoogle extends ChangeNotifier{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  String errorMessage = '';
  late GoogleSignInAccount googleUser;
  late User? firebaseUser;

  Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        //idToken: googleAuth?.idToken,
      );
      this.firebaseUser =
          (await FirebaseAuth.instance.signInWithCredential(credential)).user;
      this.googleUser = googleUser!;
      return googleUser;
    } catch (e) {
      print(e);
      errorMessage = e.toString();
      return null;
    }
  }

  Future<void> signOut() async {
    // Sign out from Firebase
    await _firebaseAuth.signOut();

    // Sign out from Google
    await _googleSignIn.signOut();
  }






}