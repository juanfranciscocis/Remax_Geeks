import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remax_geeks/providers/costumerProvider.dart';
import 'package:remax_geeks/providers/dbProvider.dart';
import 'package:remax_geeks/providers/sellFormProvider.dart';
import 'package:remax_geeks/services/authEmailPassword.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/app_constants.dart';
import 'package:remax_geeks/ui/common/app_strings.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:remax_geeks/ui/views/customService/customService_view.dart';
import 'package:remax_geeks/ui/views/fullService/fullService_view.dart';
import 'package:stacked/stacked.dart';

import '../../../services/authFacebook.dart';
import '../../../services/authGoogle.dart';
import '../../../widgets/landingPage/LandingPageDesktopSite.dart';
import '../../../widgets/landingPage/MainDesktopNavBar.dart';
import '../addPhoneNumber/addPhoneNumber_view.dart';
import 'signUp_viewmodel.dart';

class SignUpViewDesktop extends ViewModelWidget<SignUpViewModel> {
  const SignUpViewDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, SignUpViewModel viewModel) {
    CostumerProvider costumer = Provider.of<CostumerProvider>(context);
    AuthGoogle authGoogle = Provider.of<AuthGoogle>(context);
    AuthFacebook authFacebook = Provider.of<AuthFacebook>(context);
    AuthManager auth = Provider.of<AuthManager>(context);
    SellFormProvider sellForm = Provider.of<SellFormProvider>(context);
    DBProvider db = Provider.of<DBProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(child: CirclesBackground()), // Add the background circles
          Center(
            child: SizedBox(
              width: kdDesktopMaxContentWidth,
              height: kdDesktopMaxContentHeight,
              child: Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Card(
                    color: Colors.white,
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    margin: EdgeInsets.all(50.0),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Welcome... Sign In",
                              style: TextStyle(
                                color: fontMainColor,
                                fontFamily: fontOutfitBold,
                                fontSize: 50,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          verticalSpaceMedium,
                          TextWidget(
                            text: "Enter your Email:",
                            color: fontMainColor,
                            fontFamily: fontOutfitMedium,
                            fontSize: 35,
                          ),
                          verticalSpaceSmall,
                          TextFieldWidget(
                            labelText: "Email...",
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
                            text: "Enter a new Password:",
                            color: fontMainColor,
                            fontFamily: fontOutfitMedium,
                            fontSize: 35,
                          ),
                          verticalSpaceSmall,
                          TextFieldWidget(
                            labelText: "New Password...",
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
                              costumer.password = value;
                            },
                            obscureText: true, // Password field should be obscured
                          ),
                          verticalSpaceMedium,
                          TextWidget(
                            text: "Enter your Full Name:",
                            color: fontMainColor,
                            fontFamily: fontOutfitMedium,
                            fontSize: 35,
                          ),
                          verticalSpaceSmall,
                          TextFieldWidget(
                            labelText: "Full Name...",
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
                              costumer.fullName = value;
                            },
                          ),
                          verticalSpaceMedium,
                          TextWidget(
                            text: "Enter your Phone Number:",
                            color: fontMainColor,
                            fontFamily: fontOutfitMedium,
                            fontSize: 35,
                          ),
                          verticalSpaceSmall,
                          TextFieldWidget(
                            labelText: "Phone Number...",
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
                              costumer.phoneNumber = value;
                            },
                          ),
                          verticalSpaceMedium,
                          Align(
                            alignment: Alignment.center,
                            child: MaterialButton(
                              height: 50,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              elevation: 5.0,
                              onPressed: () async {
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
                                  "Sign Up",
                                  style: TextStyle(
                                    fontFamily: fontOutfitBold,
                                    fontSize: 35,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          verticalSpaceMedium,
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Or Sign Up With",
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
                                    width: 90,
                                    height: 90,
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
                ),
              ),
            ),
          ),
        ],
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

// Rest of the code...


class TextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final String fontFamily;
  final double fontSize;

  const TextWidget({
    required this.text,
    required this.color,
    required this.fontFamily,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize: fontSize,
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final Color labelColor;
  final String labelFontFamily;
  final double labelFontSize;
  final Color enabledBorderColor;
  final bool filled;
  final Color fillColor;
  final Color textColor;
  final String textFontFamily;
  final double textFontSize;
  final ValueChanged<String> onChanged;
  final bool obscureText;

  const TextFieldWidget({
    required this.labelText,
    required this.labelColor,
    required this.labelFontFamily,
    required this.labelFontSize,
    required this.enabledBorderColor,
    required this.filled,
    required this.fillColor,
    required this.textColor,
    required this.textFontFamily,
    required this.textFontSize,
    required this.onChanged,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: labelColor,
          fontFamily: labelFontFamily,
          fontSize: labelFontSize,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: enabledBorderColor,
            width: 2.0,
          ),
        ),
        filled: filled,
        fillColor: fillColor,
      ),
      style: TextStyle(
        color: textColor,
        fontFamily: textFontFamily,
        fontSize: textFontSize,
      ),
      onChanged: onChanged,
      obscureText: obscureText,
    );
  }
}

class CirclesBackground extends StatelessWidget {
  final int circleCount;

  CirclesBackground({
    Key? key,
    this.circleCount = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final random = Random();

        return Container(
          height: constraints.maxHeight,
          child: Stack(
            children: List.generate(circleCount, (index) {
              final circleSize = random.nextInt(200) + 50;
              final leftPosition = random.nextDouble() * (constraints.maxWidth - circleSize);
              final topPosition = random.nextDouble() * (constraints.maxHeight - circleSize);

              return Positioned(
                left: leftPosition,
                top: topPosition,
                child: Container(
                  width: circleSize.toDouble(),
                  height: circleSize.toDouble(),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: bubbleColor, // Adjust the color and opacity as needed
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
