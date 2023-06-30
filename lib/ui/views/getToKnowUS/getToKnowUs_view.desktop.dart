import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remax_geeks/helpers/getLearnMorePaths.dart';
import 'package:remax_geeks/models/article.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/app_constants.dart';
import 'package:remax_geeks/ui/common/app_strings.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../providers/costumerProvider.dart';
import '../../../providers/dbProvider.dart';
import '../../../providers/sellFormProvider.dart';
import '../../../services/authEmailPassword.dart';
import '../../../services/authFacebook.dart';
import '../../../services/authGoogle.dart';
import '../../../widgets/landingPage/LandingPageDesktopSite.dart';
import '../../../widgets/landingPage/MainDesktopNavBar.dart';
import '../addPhoneNumber/addPhoneNumber_view.dart';
import '../article/article_view.dart';
import '../customService/customService_view.dart';
import '../fullService/fullService_view.dart';
import '../signUp/singUp_view.dart';
import 'getToKnowUs_viewmodel.dart';

class GetToKnowUsViewDesktop extends StatefulWidget {


  GetToKnowUsViewDesktop({Key? key}) : super(key: key);

  @override
  State<GetToKnowUsViewDesktop> createState() => _GetToKnowUsViewDesktopState();
}

class _GetToKnowUsViewDesktopState extends State<GetToKnowUsViewDesktop>{

  void openGoogleMap() async {
    const googleMapUrl = 'https://www.google.com/maps/dir/42.3821312,-88.080384/remax+american+dream/@42.379145,-88.0896378,16z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x880f9caaaab4d5eb:0xb174ca526d7918d!2m2!1d-88.0901364!2d42.3779509?entry=ttu';
    if (await canLaunch(googleMapUrl)) {
      await launch(googleMapUrl);
    } else {
      print('Failed to open Google Map');
    }
  }

  Future<void> openWebPage(String page) async {
    String launchP = 'https://'+page;
    if(await canLaunch(launchP)){
      await launch(launchP);
    }else{
      print('Failed to open $launchP');
    }
  }

  void callPhoneNumber(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Failed to make a phone call');
    }
  }





  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              //CARD, COLOR WHITE CARD COLOR, ROUND CORNERS 8, ELEVATION 5, INSIDE IT:
              //ROW WITH 2 COLUMNS, SECOND COLUMN: IMAGE, FIRST COLUMN: TEXT, TEXT AND TWO ACTION BUTTONS
              //ACTION BUTTONS: 1. CALL ME, 2. TEXT ME
              //TEXT: "WE ARE HERE TO HELP YOU"
              //IMAGE: PATH: assets/images/landingPage/landingPageImage.png
              Container(
                width: 1200,
                child: Card(
                  color: whiteCardColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  titleGetToKnowUs,
                                  style: TextStyle(
                                    fontSize: 70,
                                    fontFamily: fontOutfitBold,
                                    color: fontMainColor,
                                  ),
                                ),
                              ),
                              verticalSpaceMedium,
                              GestureDetector(
                                onTap: () {
                                  openGoogleMap();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    subtitle1,
                                    style: TextStyle(
                                      fontSize: 45,
                                      fontFamily: fontOutfitRegular,
                                      color: fontMainColor,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  callPhoneNumber(phoneNumber);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    subtitle2,
                                    style: TextStyle(
                                      fontSize: 45,
                                      fontFamily: fontOutfitRegular,
                                      color: fontMainColor,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  openWebPage(webpageLink);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    webpageLink,
                                    style: TextStyle(
                                      fontSize: 40,
                                      //color blue, underline
                                      fontFamily: fontOutfitRegular,
                                      color: Colors.blueAccent,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                              verticalSpaceMedium,
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: TextButton(
                                      onPressed: () {
                                        callPhoneNumber(phoneNumber);
                                      },
                                      child: Text(
                                        "CALL ME",
                                        style: TextStyle(
                                          color: fontWhiteColor,
                                          fontFamily: fontOutfitBold,
                                          fontSize: 30,

                                        ),
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(
                                          primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  horizontalSpaceMedium,
                                  Expanded(
                                    flex: 1,
                                    child: TextButton(
                                      onPressed: () {
                                        openWebPage(whatsAppLink);
                                      },
                                      child: Text(
                                        "TEXT ME",
                                        style: TextStyle(
                                          color: fontWhiteColor,
                                          fontFamily: fontOutfitBold,
                                          fontSize: 30,
                                        ),
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(
                                          primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        horizontalSpaceMedium,
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: (){
                              openGoogleMap();
                            },
                            child: Image.asset(
                              map,
                              fit: BoxFit.cover,
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
      ),
    );
  }
}



