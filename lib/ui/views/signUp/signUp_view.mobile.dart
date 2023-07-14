import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/app_constants.dart';
import 'package:remax_geeks/ui/common/app_strings.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
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

class SignUpViewMobile extends ViewModelWidget<SignUpViewModel> {
  @override
  Widget build(BuildContext context, SignUpViewModel viewModel) {
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
                    welcomeMessageSingUp,
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
                  verticalSpaceMedium,
                  Text(
                    textAlign: TextAlign.center,
                    privacyText,
                    style: TextStyle(
                      color: fontMainColor,
                      fontFamily: fontOutfitRegular,
                      fontSize: 25,
                    ),
                  ),
                  verticalSpaceTiny,
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("/privacy");
                    },
                    child: Text(
                      learnMorePrivacy,
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontFamily: fontOutfitRegular,
                        fontSize: 20,
                      ),
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
                  child: Column(
                    children: [
                      Card(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                          child: Container(
                            child: Column(
                              children: [
                                verticalSpaceMedium,
                                Text(
                                  signUpTitlePhone1,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: fontOutfitBold,
                                    fontSize: 25,
                                  ),
                                ),
                                Text(
                                  signUpTitlePhone2,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: fontOutfitBold,
                                    fontSize: 25,
                                  ),
                                ),
                                verticalSpaceMedium,
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
                              ],
                            ),
                          ),
                        ),
                      ),
                      verticalSpaceMedium,
                      Card(
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
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Or Sign Up Using Email",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: fontOutfitBold,
                                    fontSize: 20,

                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              verticalSpaceMedium,
                              // Full Name
                              Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                child: LogSingForm(
                                  height: 50,
                                  label: "Full Name",
                                  font: 20,
                                  padding: 10,
                                  query: 1.2,
                                  onChanged: (value) {
                                    costumer.fullName = value;
                                  },
                                ),
                              ),
                              verticalSpaceSmall,
                              // Email
                              Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                child: LogSingForm(
                                  height: 50,
                                  label: "Email",
                                  padding: 10,
                                  font: 20,
                                  query: 1.2,
                                  onChanged: (value) {
                                    costumer.email = value;
                                  },
                                ),
                              ),
                              verticalSpaceSmall,
                              // Password
                              Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                child: LogSingForm(
                                  height: 50,
                                  label: "Password",
                                  font: 20,
                                  padding: 10,
                                  query: 1.2,
                                  onChanged: (value) {
                                    costumer.password = value;
                                  },
                                ),
                              ),
                              verticalSpaceSmall,
                              // Phone
                              Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                child: LogSingForm(
                                  phoneNumber: true,
                                  height: 50,
                                  label: "Phone",
                                  font: 20,
                                  padding: 10,
                                  query: 1.2,
                                  onChanged: (value) {
                                    if(validatePhoneNumber(value)==null) {costumer.phoneNumber = '';}else{
                                    costumer.phoneNumber = value;}
                                  },
                                ),
                              ),
                              verticalSpaceMedium,
                              // Sign Up Button
                              MaterialButton(
                                onPressed: () {
                                  authSignUp(costumer, auth, sellForm, db, context);
                                },
                                color: primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: fontOutfitBold,
                                      fontSize: 30,
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
                                    "Already have an account?",
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontFamily: fontOutfitBold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  horizontalSpaceSmall,
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushNamed("/logIn");
                                    },
                                    child: Text(
                                      "Sign In",
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

                              verticalSpaceMedium,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            verticalSpaceMassive,
          ],
        ),
      ),
    );
  }
}
