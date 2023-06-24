import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:remax_geeks/ui/views/signIn/signIn_view.desktop.dart';
import 'package:remax_geeks/widgets/landingPage/LandingPageMobileSite.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/landingPage/MainMobileNavBar.dart';
import '../../common/app_constants.dart';
import '../../common/app_strings.dart';
import 'signIn_viewmodel.dart';

class SignInViewMobile extends ViewModelWidget<SignInViewModel> {
  const SignInViewMobile({super.key});

  @override
  Widget build(BuildContext context, SignInViewModel viewModel) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(child: CirclesBackground(circleCount: 5,)), // Add the background circles
          Center(
            child: SingleChildScrollView(
              child: Align(
                alignment: Alignment.center,
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
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Welcome back... Sign In",
                            style: TextStyle(
                              color: fontMainColor,
                              fontFamily: fontOutfitBold,
                              fontSize: 30,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        verticalSpaceMedium,
                        TextWidget(
                          text: "Enter your email:",
                          color: fontMainColor,
                          fontFamily: fontOutfitMedium,
                          fontSize: 20,
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
                            // Update email value in the view model
                            //viewModel.updateEmail(value);
                          },
                        ),
                        verticalSpaceMedium,
                        TextWidget(
                          text: "Enter your password:",
                          color: fontMainColor,
                          fontFamily: fontOutfitMedium,
                          fontSize: 20,
                        ),
                        verticalSpaceSmall,
                        TextFieldWidget(
                          labelText: "Password...",
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
                            // Update password value in the view model
                            //viewModel.updatePassword(value);
                          },
                          obscureText: true, // Password field should be obscured
                        ),
                        verticalSpaceMedium,
                        MaterialButton(
                          height: 15,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          elevation: 5.0,
                          onPressed: () {
                            // Perform login action using the view model
                            //viewModel.login();
                          },
                          color: primaryButtonColor,
                          textColor: fontWhiteColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                fontFamily: fontOutfitBold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        verticalSpaceMedium,
                        // Google sign-in button
                        InkWell(
                          onTap: () {
                            // Perform Google sign-in action using the view model
                            //viewModel.googleSignIn();
                          },
                          child: Image.asset(
                            googleIcon, // Replace with the path to your Google icon
                            width: 75,
                            height: 75,
                          ),
                        ),
                      ],
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

