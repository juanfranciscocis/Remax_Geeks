import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/costumerProvider.dart';
import '../providers/dbProvider.dart';
import '../providers/sellFormProvider.dart';
import '../services/analyticsService.dart';
import '../services/authEmailPassword.dart';
import '../services/authFacebook.dart';
import '../services/authGoogle.dart';
import '../ui/common/app_colors.dart';
import '../ui/common/app_strings.dart';
import '../ui/views/addPhoneNumber/addPhoneNumber_view.dart';

Future<void> checkForGoogleSignIn(AuthGoogle authGoogle, DBProvider db, SellFormProvider sellForm,CostumerProvider costumer, BuildContext context) async{
  //AuthGoogle authGoogle = AuthGoogle();
  AnalyticsService analyticsService = Provider.of<AnalyticsService>(context,listen: false);
  analyticsService.analytics.logLogin(loginMethod: "GOOGLE");
  await authGoogle.signInWithGoogle();
  if(authGoogle.errorMessage == ''){
    String serviceChoose = sellForm.serviceType;
    costumer.fullName = authGoogle.googleUser!.displayName!;
    costumer.email = authGoogle.googleUser!.email!;
    String authUID = authGoogle.firebaseUser!.uid.toString();
    await db.getPhoneNumberByUID(authUID);
    if(db.phoneNumber.isEmpty){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => AddPhoneNumberView(isGoogle: true,)));
      return;
    }
    costumer.phoneNumber = db.phoneNumber;
    sellForm.costumer = costumer.costumer;
    if (serviceChoose ==
        chooseServiceTypeCard1Title) {
      Navigator.of(context).pushNamed("/fullService");
      return;
    } else {
      Navigator.of(context).pushNamed("/customService");
      return;
    }
  }else{
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Can not Login with Google',
          style: TextStyle(
            fontFamily: fontOutfitRegular,
            fontSize: 15,
          ),
        ),
        backgroundColor: Colors.red,
      ),
    );
    authGoogle.errorMessage = '';
  }


}


Future<void> checkForFacebookSignin(AuthFacebook authFacebook, DBProvider db, SellFormProvider sellForm,CostumerProvider costumer, BuildContext context) async{
  AnalyticsService analyticsService = Provider.of<AnalyticsService>(context,listen: false);
  analyticsService.analytics.logLogin(loginMethod: "FACEBOOK");
  if(authFacebook.errorMessage == ''){
    String serviceChoose = sellForm.serviceType;
    print(serviceChoose);
    costumer.fullName = authFacebook.userData?['name'];
    print(costumer.fullName);
    costumer.email = authFacebook.userData?['email'];
    print(costumer.email);
    String authUID = authFacebook.uid;
    print(authUID);
    await db.getPhoneNumberByUID(authUID);
    if(db.phoneNumber.isEmpty){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) =>
              AddPhoneNumberView(isGoogle: false,)));
      return;
    }
    costumer.phoneNumber = db.phoneNumber;
    print(costumer.phoneNumber);
    sellForm.costumer = costumer.costumer;
    print(sellForm.costumer);
    if (serviceChoose ==
        chooseServiceTypeCard1Title) {
      print(chooseServiceTypeCard1Title);
      Navigator.of(context).pushNamed("/fullService");
      return;
    } else {
      Navigator.of(context).pushNamed("/customService");
      return;
    }
  }else{
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Can not Login with Facebook',
          style: TextStyle(
            fontFamily: fontOutfitRegular,
            fontSize: 15,
          ),
        ),
        backgroundColor: Colors.red,
      ),
    );
    authFacebook.errorMessage = '';
  }


}



class LogSingForm extends StatelessWidget {
  double height;
  String label;
  double font;
  void Function(String)? onChanged;
  double? padding = 70;
  double? query = 3;
  LogSingForm({
    required this.height,
    required this.label,
    required this.font,
    required this.onChanged,
    this.padding = 70,
    this.query = 3,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: padding!, right: padding! ),
      child: Container(
        height: height,
        width: MediaQuery.of(context).size.width/query!,

        child: TextFormField(
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              color: inputColor,
              fontFamily: fontOutfitBold,
              fontSize: font,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: inputColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: inputColor),
            ),
          ),
          style: TextStyle(
            color: fontMainColor,
            fontFamily: fontOutfitBold,
            fontSize: font,
          ),
        ),
      ),
    );
  }
}


Future<void> authSignUp(CostumerProvider costumer, AuthManager auth, SellFormProvider sellForm, DBProvider db,BuildContext context) async {
  AnalyticsService analyticsService = Provider.of<AnalyticsService>(context,listen: false);
  analyticsService.analytics.logSignUp(signUpMethod: "EMAIL");
  if(costumer.email != '' && costumer.password != '' && costumer.fullName != '' && costumer.phoneNumber != '') {
    await auth.signUpWithEmailAndPassword(
        email: costumer.email,
        password: costumer.password,
        fullName: costumer.fullName,
        phoneNumber: costumer.phoneNumber);
    if(auth.errorMessage == '') {
      String serviceChoose = sellForm.serviceType;
      sellForm.costumer = costumer.costumer;
      Map<String, dynamic> newCostumer = {
        'EMAIL': costumer.email,
        'FULL_NAME': costumer.fullName,
        'PHONE_NUMBER': costumer.phoneNumber,
        'UID': auth.user?.uid,
      };
      db.setNewCostumer(newCostumer);
      if (serviceChoose ==
          chooseServiceTypeCard1Title) {
        Navigator.of(context).pushNamed("/fullService");
      } else {
        Navigator.of(context).pushNamed("/customService");;
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            auth.errorMessage,
            style: TextStyle(
              fontFamily: fontOutfitRegular,
              fontSize: 15,
            ),
          ),
          backgroundColor: Colors.red,
        ),
      );
      auth.errorMessage = '';
    }
  }else{
    // SHOW ERROR MESSAGE
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Please fill all the fields',
          style: TextStyle(
            fontFamily: fontOutfitRegular,
            fontSize: 15,
          ),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

}


Future<void> authLogIn(CostumerProvider costumer, AuthManager auth, SellFormProvider sellForm,DBProvider db, BuildContext context) async {
  AnalyticsService analyticsService = Provider.of<AnalyticsService>(context,listen: false);
  analyticsService.analytics.logLogin(loginMethod: "EMAIL");
  if(costumer.email != '' && costumer.password != '') {
    await auth.signInWithEmailAndPassword(
        email: costumer.email,
        password: costumer.password);
    if(auth.errorMessage == '') {
      String serviceChoose = sellForm.serviceType;
      costumer.fullName = auth.user!.displayName!;
      String authUID = auth.user!.uid.toString();
      await db.getPhoneNumberByUID(authUID);
      costumer.phoneNumber = db.phoneNumber;
      sellForm.costumer = costumer.costumer;
      if (serviceChoose ==
          chooseServiceTypeCard1Title) {
        Navigator.of(context).pushNamed("/fullService");
      } else {
        Navigator.of(context).pushNamed("/customService");
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            auth.errorMessage,
            style: TextStyle(
              fontFamily: fontOutfitRegular,
              fontSize: 15,
            ),
          ),
          backgroundColor: Colors.red,
        ),
      );
      auth.errorMessage = '';
    }
  }else{
    // SHOW ERROR MESSAGE
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Please fill all the fields',
          style: TextStyle(
            fontFamily: fontOutfitRegular,
            fontSize: 15,
          ),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}