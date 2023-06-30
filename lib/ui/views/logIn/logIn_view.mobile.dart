import 'package:provider/provider.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:remax_geeks/widgets/landingPage/LandingPageMobileSite.dart';
import 'package:stacked/stacked.dart';

import '../../../providers/costumerProvider.dart';
import '../../../providers/dbProvider.dart';
import '../../../providers/sellFormProvider.dart';
import '../../../services/authEmailPassword.dart';
import '../../../services/authFacebook.dart';
import '../../../services/authGoogle.dart';
import '../../../widgets/landingPage/MainMobileNavBar.dart';
import '../../common/app_constants.dart';
import '../../common/app_strings.dart';
import '../addPhoneNumber/addPhoneNumber_view.dart';
import '../customService/customService_view.dart';
import '../fullService/fullService_view.dart';
import '../signUp/signUp_view.desktop.dart';
import '../signUp/singUp_view.dart';
import 'logIn_viewmodel.dart';

class LogInViewMobile extends ViewModelWidget<LogInViewModel> {
  const LogInViewMobile({super.key});

  @override
  Widget build(BuildContext context, LogInViewModel viewModel) {
    CostumerProvider costumer = Provider.of<CostumerProvider>(context);
    AuthManager auth = Provider.of<AuthManager>(context);
    AuthGoogle authGoogle = Provider.of<AuthGoogle>(context);
    AuthFacebook authFacebook = Provider.of<AuthFacebook>(context);
    SellFormProvider sellForm = Provider.of<SellFormProvider>(context);
    DBProvider db = Provider.of<DBProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(child: CirclesBackground(circleCount: 10,)), // Add the background circles
            Center(
              child: SingleChildScrollView(
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Card(
                        color: Colors.white,
                        elevation: 8.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        margin: EdgeInsets.only(left:20.0, right: 20.0, top: 20.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              welcomeMessageLogin,
                              style: TextStyle(
                                color: fontMainColor,
                                fontFamily: fontOutfitBold,
                                fontSize: 30,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      verticalSpaceSmall,
                      Card(
                        color: Colors.white,
                        elevation: 8.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        margin: EdgeInsets.only(left:20.0, right: 20.0, bottom: 20.0),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              verticalSpaceMedium,
                              TextWidget(
                                text: enterEmail,
                                color: fontMainColor,
                                fontFamily: fontOutfitMedium,
                                fontSize: 20,
                              ),
                              verticalSpaceSmall,
                              TextFieldWidget(
                                labelText: emailBox,
                                labelColor: fontMainColor,
                                labelFontFamily: fontOutfitRegular,
                                labelFontSize: 15,
                                enabledBorderColor: fontMainColor,
                                filled: true,
                                fillColor: inputColor,
                                textColor: fontMainColor,
                                textFontFamily: fontOutfitRegular,
                                textFontSize: 15,
                                onChanged: (value) {
                                  costumer.email = value;
                                },
                              ),
                              verticalSpaceMedium,
                              TextWidget(
                                text: enterPassword,
                                color: fontMainColor,
                                fontFamily: fontOutfitMedium,
                                fontSize: 20,
                              ),
                              verticalSpaceSmall,
                              TextFieldWidget(
                                labelText: passwordBox,
                                labelColor: fontMainColor,
                                labelFontFamily: fontOutfitRegular,
                                labelFontSize: 10,
                                enabledBorderColor: fontMainColor,
                                filled: true,
                                fillColor: inputColor,
                                textColor: fontMainColor,
                                textFontFamily: fontOutfitRegular,
                                textFontSize: 10,
                                onChanged: (value) {
                                  costumer.password = value;
                                },
                                obscureText: true, // Password field should be obscured
                              ),
                              verticalSpaceMedium,
                              Align(
                                alignment: Alignment.center,
                                child: MaterialButton(
                                  height: 15,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  elevation: 5.0,
                                  onPressed: () async {
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
                                          Navigator.push(context, MaterialPageRoute(
                                              builder: (context) =>
                                                  FullServiceView()));
                                        } else {
                                          Navigator.push(context, MaterialPageRoute(
                                              builder: (context) =>
                                                  CustomServiceView()));
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
                                  },
                                  color: primaryButtonColor,
                                  textColor: fontWhiteColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Log In",
                                      style: TextStyle(
                                        fontFamily: fontOutfitBold,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              verticalSpaceSmall,
                              Align(
                                alignment: Alignment.center,
                                child: MaterialButton(
                                  height: 50,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  elevation: 5.0,
                                  onPressed: () {
                                    //NAVIGATE TO SIGN UP PAGE
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignUpView(),
                                      ),
                                    );
                                  },
                                  color: inputColor,
                                  textColor: fontWhiteColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        fontFamily: fontOutfitBold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              verticalSpaceMedium,
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Or Login With",
                                  style: TextStyle(
                                    color: inputColor,
                                    fontFamily: fontOutfitBold,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              verticalSpaceMedium,
                              // Google sign-in button
                              Align(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        await authGoogle.signInWithGoogle();
                                        checkForGoogleSignIn(authGoogle, db, sellForm, costumer, context);
                                      },
                                      child: Image.asset(
                                        googleIcon, // Replace with the path to your Google icon
                                        width: 75,
                                        height: 75,
                                      ),
                                    ),
                                    horizontalSpaceSmall,
                                    InkWell(
                                      onTap: () async {
                                        await authFacebook.signIn();
                                        checkForFacebookSignin(authFacebook, db, sellForm, costumer, context);
                                        //checkForGoogleSignIn(authGoogle, db, sellForm, costumer, context);
                                      },
                                      child: Image.asset(
                                        facebookIcon, // Replace with the path to your Google icon
                                        width: 75,
                                        height: 75,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void checkForGoogleSignIn(AuthGoogle authGoogle, DBProvider db, SellFormProvider sellForm,CostumerProvider costumer, BuildContext context) async{
    if(authGoogle.errorMessage == ''){
      String serviceChoose = sellForm.serviceType;
      costumer.fullName = authGoogle.user!.displayName!;
      costumer.email = authGoogle.user!.email!;
      String authUID = authGoogle.user!.uid.toString();
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
        Navigator.push(context, MaterialPageRoute(
            builder: (context) =>
                FullServiceView()));
        return;
      } else {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) =>
                CustomServiceView()));
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

  void checkForFacebookSignin(AuthFacebook authFacebook, DBProvider db, SellFormProvider sellForm,CostumerProvider costumer, BuildContext context) async{
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
        Navigator.push(context, MaterialPageRoute(
            builder: (context) =>
                FullServiceView()));
        return;
      } else {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) =>
                CustomServiceView()));
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


}

