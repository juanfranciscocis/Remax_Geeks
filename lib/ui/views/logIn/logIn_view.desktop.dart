import 'dart:math';

import 'package:flutter/material.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/app_constants.dart';
import 'package:remax_geeks/ui/common/app_strings.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:remax_geeks/ui/views/signIn/singIn_view.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/landingPage/LandingPageDesktopSite.dart';
import '../../../widgets/landingPage/MainDesktopNavBar.dart';
import 'logIn_viewmodel.dart';

class LogInViewDesktop extends ViewModelWidget<LogInViewModel> {
  const LogInViewDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, LogInViewModel viewModel) {
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
                              "Welcome back... Log In",
                              style: TextStyle(
                                color: fontMainColor,
                                fontFamily: fontOutfitBold,
                                fontSize: 55,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          verticalSpaceMedium,
                          TextWidget(
                            text: "Enter your email:",
                            color: fontMainColor,
                            fontFamily: fontOutfitMedium,
                            fontSize: 40,
                          ),
                          verticalSpaceSmall,
                          TextFieldWidget(
                            labelText: "Email...",
                            labelColor: fontMainColor,
                            labelFontFamily: fontOutfitRegular,
                            labelFontSize: 20,
                            enabledBorderColor: fontMainColor,
                            filled: true,
                            fillColor: inputColor,
                            textColor: fontMainColor,
                            textFontFamily: fontOutfitRegular,
                            textFontSize: 20,
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
                            fontSize: 40,
                          ),
                          verticalSpaceSmall,
                          TextFieldWidget(
                            labelText: "Password...",
                            labelColor: fontMainColor,
                            labelFontFamily: fontOutfitRegular,
                            labelFontSize: 20,
                            enabledBorderColor: fontMainColor,
                            filled: true,
                            fillColor: inputColor,
                            textColor: fontMainColor,
                            textFontFamily: fontOutfitRegular,
                            textFontSize: 20,
                            onChanged: (value) {
                              // Update password value in the view model
                              //viewModel.updatePassword(value);
                            },
                            obscureText: true, // Password field should be obscured
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
                                    fontSize: 40,
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
                                    builder: (context) => SignInView(),
                                  ),
                                );
                              },
                              color: inputColor,
                              textColor: fontWhiteColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                    fontFamily: fontOutfitBold,
                                    fontSize: 20,
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
                            child: InkWell(
                              onTap: () {
                                // Perform Google sign-in action using the view model
                                //viewModel.googleSignIn();
                              },
                              child: Image.asset(
                                googleIcon, // Replace with the path to your Google icon
                                width: 100,
                                height: 100,
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

   int circleCount;

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


