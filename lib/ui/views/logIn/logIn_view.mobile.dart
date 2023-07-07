import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/app_constants.dart';
import 'package:remax_geeks/ui/common/app_strings.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:remax_geeks/ui/views/logIn/logIn_viewmodel.dart';
import 'package:remax_geeks/ui/views/signUp/signUp_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/authHelpers.dart';
import '../../../providers/costumerProvider.dart';
import '../../../providers/dbProvider.dart';
import '../../../providers/sellFormProvider.dart';
import '../../../services/authEmailPassword.dart';
import '../../../services/authFacebook.dart';
import '../../../services/authGoogle.dart';
import '../../../widgets/landingPage/LandingPageDesktopSite.dart';
import '../../../widgets/landingPage/MainDesktopNavBar.dart';
import '../addPhoneNumber/addPhoneNumber_view.dart';

class LogInViewMobile extends ViewModelWidget<LogInViewModel> {
  @override
  Widget build(BuildContext context, LogInViewModel viewModel) {
    CostumerProvider costumer = Provider.of<CostumerProvider>(context);
    AuthGoogle authGoogle = Provider.of<AuthGoogle>(context);
    AuthFacebook authFacebook = Provider.of<AuthFacebook>(context);
    AuthManager auth = Provider.of<AuthManager>(context);
    SellFormProvider sellForm = Provider.of<SellFormProvider>(context);
    DBProvider db = Provider.of<DBProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpaceMedium,
            // Left side with text and image
            Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    welcomeMessageLogin,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: fontMainColor,
                      fontSize: 30,
                      fontFamily: fontOutfitBold,
                    ),
                  ),

                  SizedBox(height: 40),
                  Container(
                    width: 100,
                    height: 100,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Image.asset(lockIcon),
                    ),
                  ),
                ],
              ),
            ),
            // Right side card with a column
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Card(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          verticalSpaceMedium,
                          Text(
                            logInTitlePhone1,
                            style: TextStyle(
                              color: inputColor2,
                              fontFamily: fontOutfitBold,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            logInTitlePhone2,
                            style: TextStyle(
                              color: inputColor2,
                              fontFamily: fontOutfitBold,
                              fontSize: 25,
                            ),
                          ),
                          verticalSpaceSmall,
                          // Two images in a row
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
                                    googleIcon,
                                    width: 90,
                                    height: 90,
                                  ),
                                ),
                                horizontalSpaceSmall,
                                InkWell(
                                  onTap: () async {
                                    await authFacebook.signIn();
                                    checkForFacebookSignin(authFacebook, db, sellForm, costumer, context);
                                  },
                                  child: Image.asset(
                                    facebookIcon,
                                    width: 75,
                                    height: 75,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          verticalSpaceMedium,
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Or Sign In Using Email",
                              style: TextStyle(
                                color: inputColor2,
                                fontFamily: fontOutfitBold,
                                fontSize: 20,

                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          verticalSpaceMedium,
                          // Email
                          LogSingForm(
                            height: 50,
                            label: "Email",
                            padding: 10,
                            font: 20,
                            query: 1.2,
                            onChanged: (value) {
                              costumer.email = value;
                            },
                          ),
                          verticalSpaceSmall,
                          // Password
                          LogSingForm(
                            height: 50,
                            label: "Password",
                            font: 20,
                            padding: 10,
                            query: 1.2,
                            onChanged: (value) {
                              costumer.password = value;
                            },
                          ),
                          verticalSpaceMedium,
                          // Sign Up Button
                          MaterialButton(
                            onPressed: () {
                              authLogIn(costumer, auth, sellForm, db, context);
                            },
                            color: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Log In",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: fontOutfitBold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          verticalSpaceMedium,
                          // Sign In Text
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account yet?",
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontFamily: fontOutfitBold,
                                  fontSize: 18,
                                ),
                              ),
                              horizontalSpaceSmall,
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/signUp');
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontFamily: fontOutfitBold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          verticalSpaceTiny,
                          Text(
                            privacyText,
                            style: TextStyle(
                              color: Colors.black38,
                              fontFamily: fontOutfitRegular,
                              fontSize: 10,
                            ),
                          ),
                          verticalSpaceMedium,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
