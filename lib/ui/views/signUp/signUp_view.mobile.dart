import 'package:provider/provider.dart';
import 'package:remax_geeks/providers/dbProvider.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:remax_geeks/widgets/landingPage/LandingPageMobileSite.dart';
import 'package:stacked/stacked.dart';

import '../../../providers/costumerProvider.dart';
import '../../../providers/sellFormProvider.dart';
import '../../../services/authEmailPassword.dart';
import '../../../widgets/landingPage/MainMobileNavBar.dart';
import '../../common/app_constants.dart';
import '../../common/app_strings.dart';
import '../customService/customService_view.dart';
import '../fullService/fullService_view.dart';
import '../logIn/logIn_view.desktop.dart';
import 'signUp_viewmodel.dart';

class SignUpViewMobile extends ViewModelWidget<SignUpViewModel> {
  const SignUpViewMobile({super.key});

  @override
  Widget build(BuildContext context, SignUpViewModel viewModel) {
    CostumerProvider costumer = Provider.of<CostumerProvider>(context);
    AuthManager auth = Provider.of<AuthManager>(context);
    SellFormProvider sellForm = Provider.of<SellFormProvider>(context);
    DBProvider db = Provider.of<DBProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(child: CirclesBackground(circleCount: 10,)), // Add the background circles
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
                                fontSize: 48,
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
                              // Update email value in the view model
                              //viewModel.updateEmail(value);
                            },
                          ),
                          verticalSpaceMedium,
                          TextWidget(
                            text: "Enter a New Password:",
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
                              // Update new password value in the view model
                              //viewModel.updateNewPassword(value);
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
                              // Update full name value in the view model
                              //viewModel.updateFullName(value);
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
                              // Update phone number value in the view model
                              //viewModel.updatePhoneNumber(value);
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
                            child: InkWell(
                              onTap: () {
                                // Perform Google sign-in action using the view model
                                //viewModel.googleSignIn();
                              },
                              child: Image.asset(
                                googleIcon, // Replace with the path to your Google icon
                                width: 90,
                                height: 90,
                              ),
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
}

