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
import '../../../widgets/landingPage/MainMobileNavBar.dart';
import '../../common/app_constants.dart';
import '../../common/app_strings.dart';
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
    SellFormProvider sellForm = Provider.of<SellFormProvider>(context);
    DBProvider db = Provider.of<DBProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(child: CirclesBackground(circleCount: 10,)), // Add the background circles
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Welcome back... Log In",
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
                            costumer.email = value;
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
                                "Sign In",
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
                          child: InkWell(
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

