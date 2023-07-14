import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/article.dart';
import '../../../providers/dbProvider.dart';
import '../../../ui/common/app_colors.dart';
import '../../../ui/common/ui_helpers.dart';
import '../../../ui/views/article/article_view.dart';
import '../../../widgets/landingPage/MainTabletNavBar.dart';
import '../../common/app_strings.dart';
import 'getToKnowUs_view.desktop.dart';
import 'getToKnowUs_viewmodel.dart';

class GetToKnowUsViewTablet extends StatefulWidget {
  const GetToKnowUsViewTablet({Key? key}) : super(key: key);

  @override
  State<GetToKnowUsViewTablet> createState() => _GetToKnowUsViewTabletState();
}

class _GetToKnowUsViewTabletState extends State<GetToKnowUsViewTablet> {
  void openGoogleMap() async {
    const googleMapUrl =
        'https://www.google.com/maps/dir/42.3821312,-88.080384/remax+american+dream/@42.379145,-88.0896378,16z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x880f9caaaab4d5eb:0xb174ca526d7918d!2m2!1d-88.0901364!2d42.3779509?entry=ttu';
    if (await canLaunch(googleMapUrl)) {
      await launch(googleMapUrl);
    } else {
      print('Failed to open Google Map');
    }
  }

  Future<void> openWebPage(String page) async {
    String launchP = 'https://' + page;
    if (await canLaunch(launchP)) {
      await launch(launchP);
    } else {
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
                Center(
                  child: Container(
                    width: 1000,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
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
                                          fontSize: 30,
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
                                            fontSize: 20,
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
                                            fontSize: 20,
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
                                            fontSize: 20,
                                            //color blue, underline
                                            fontFamily: fontOutfitRegular,
                                            color: primaryColor,
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
                                                fontSize: 15,
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
                                                fontSize: 15,
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
                                  onTap: () {
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
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
