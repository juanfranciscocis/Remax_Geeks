import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remax_geeks/services/authFacebook.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/app_constants.dart';
import 'package:remax_geeks/ui/common/app_strings.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:remax_geeks/ui/views/addPhoneNumber/addPhoneNumber_view.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/authHelpers.dart';
import '../../../providers/costumerProvider.dart';
import '../../../providers/dbProvider.dart';
import '../../../providers/sellFormProvider.dart';
import '../../../services/analyticsService.dart';
import '../../../services/authEmailPassword.dart';
import '../../../services/authGoogle.dart';
import '../../../widgets/landingPage/LandingPageDesktopSite.dart';
import '../../../widgets/landingPage/MainDesktopNavBar.dart';
import '../customService/customService_view.dart';
import '../fullService/fullService_view.dart';
import '../signUp/singUp_view.dart';
import 'addPhoneNumber_viewmodel.dart';

class AddPhoneNumberDesktop extends ViewModelWidget<AddPhoneNumberViewModel> {

  bool isGoogle = false;

  AddPhoneNumberDesktop({Key? key, required this.isGoogle}) : super(key: key);

  @override
  Widget build(BuildContext context, AddPhoneNumberViewModel viewModel) {
    CostumerProvider costumer = Provider.of<CostumerProvider>(context);
    AuthManager auth = Provider.of<AuthManager>(context);
    AuthGoogle authGoogle = Provider.of<AuthGoogle>(context);
    AuthFacebook authFacebook = Provider.of<AuthFacebook>(context);
    SellFormProvider sellForm = Provider.of<SellFormProvider>(context);
    DBProvider db = Provider.of<DBProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
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
                              "One More Thing...",
                              style: TextStyle(
                                color: inputColor2,
                                fontFamily: fontOutfitBold,
                                fontSize: 55,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          verticalSpaceMedium,
                          TextWidget(
                            text: "Please enter your phone so that we can contact you:",
                            color: inputColor2,
                            fontFamily: fontOutfitMedium,
                            fontSize: 40,
                          ),
                          verticalSpaceSmall,
                          Center(child: LogSingForm(phoneNumber: true,height:70, label: "Phone Number", font: 20, onChanged: (value) {if(validatePhoneNumber(value)==null) {costumer.phoneNumber = '';}else{
                            costumer.phoneNumber = value;}},)),
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
                                if(costumer.phoneNumber != '') {
                                  AnalyticsService analyticsService = Provider.of<AnalyticsService>(context,listen: false);
                                  analyticsService.analytics.logEvent(name: "PHONE_NUMBER_ADDED");
                                    String serviceChoose = sellForm.serviceType;
                                    if(this.isGoogle){
                                      Map<String, dynamic> newCostumer = {
                                        'EMAIL': costumer.email,
                                        'FULL_NAME': costumer.fullName,
                                        'PHONE_NUMBER': costumer.phoneNumber,
                                        'UID': authGoogle.firebaseUser?.uid.toString(),
                                      };
                                      db.setNewCostumer(newCostumer);
                                    }else{
                                      Map<String, dynamic> newCostumer = {
                                        'EMAIL': costumer.email,
                                        'FULL_NAME': costumer.fullName,
                                        'PHONE_NUMBER': costumer.phoneNumber,
                                        'UID': authFacebook.uid,
                                      };
                                      db.setNewCostumer(newCostumer);
                                    }
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
                                          'US Phone number is required',
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
                                  "Next",
                                  style: TextStyle(
                                    fontFamily: fontOutfitBold,
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          verticalSpaceSmall,
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


