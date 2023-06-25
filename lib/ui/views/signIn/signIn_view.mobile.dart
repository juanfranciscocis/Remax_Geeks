import 'package:provider/provider.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:remax_geeks/ui/views/signIn/signIn_view.desktop.dart';
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
import 'signIn_viewmodel.dart';

class SignInViewMobile extends ViewModelWidget<SignInViewModel> {
  const SignInViewMobile({super.key});

  @override
  Widget build(BuildContext context, SignInViewModel viewModel) {
    CostumerProvider costumer = Provider.of<CostumerProvider>(context);
    AuthManager auth = Provider.of<AuthManager>(context);
    SellFormProvider sellForm = Provider.of<SellFormProvider>(context);
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
                                await auth.signUpWithEmailAndPassword(email:costumer.email, password: costumer.password, fullName: costumer.fullName,phoneNumber: costumer.phoneNumber);
                                String serviceChoose = sellForm.serviceType;
                                if(serviceChoose == chooseServiceTypeCard1Title ){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => FullServiceView()));
                                }else{
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CustomServiceView()));
                                }
                              },
                              color: primaryButtonColor,
                              textColor: fontWhiteColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Sign In",
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
                              "Or Sign In With",
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

