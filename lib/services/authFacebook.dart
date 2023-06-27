import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';




class AuthFacebook extends ChangeNotifier{

  Map<String,dynamic>? userData;
  String errorMessage = '';
  User? user;
  late String uid;

  Future<void> signIn()async {
    try{
      final LoginResult result = await FacebookAuth.i.login(
        permissions: ['email'],
      );
      if(result.status == LoginStatus.success){
        final data = await FacebookAuth.i.getUserData(
          fields: "email, name",
        );
        userData = data;
        print(userData);
        final OAuthCredential credential = FacebookAuthProvider.credential(
          result.accessToken!.token,
        );
        final User? fbUser = (await FirebaseAuth.instance.signInWithCredential(credential)).user;
        print('FACEBOOK USER ID' + fbUser!.uid);
        this.uid = fbUser.uid;
        user = fbUser;

      }
    }catch(e){
      print(e);
      errorMessage = e.toString();
    }

  }



}