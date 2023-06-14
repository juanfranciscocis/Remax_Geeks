import 'package:flutter_svg/flutter_svg.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/app_constants.dart';
import 'package:remax_geeks/ui/common/app_strings.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/landingPage/mainDesktopNavBar.dart';
import 'home_viewmodel.dart';

class HomeViewDesktop extends ViewModelWidget<HomeViewModel> {
  const HomeViewDesktop({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: kdDesktopMaxContentWidth,
            height: kdDesktopMaxContentHeight,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                verticalSpaceLarge,
                //MAIN NAV BAR
                const MainDesktopNavBar(),
                verticalSpaceMassive,
                //MAIN CONTENT
                //ON THE LEFT SIDE, ADD A COLUMN WITH A TITLE, SUBTITLE, AND 2 BUTTONS. ON THE RIGHT SIDE, ADD AN IMAGE
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //LEFT SIDE
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            landingPageTitle1,
                            style: TextStyle(
                                color: fontThirdColor,
                                fontFamily: 'OutfitBold',
                                fontSize: 55,
                            ),
                          ),
                          const Text(
                            landingPageTitle2,
                            style: TextStyle(
                              color: fontMainColor,
                              fontFamily: 'OutfitBold',
                              fontSize: 55,
                            ),
                          ),
                          const Text(
                            landingPageSubtitle,
                            style: TextStyle(
                              color: fontMainColor,
                              fontFamily: 'OutfitRegular',
                              fontSize: 35,
                            ),
                          ),
                          verticalSpaceLarge,
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //SELL NOW
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: MaterialButton(
                                  onPressed: () {
                                    print('SELL NOW PRESSED');
                                  }, //TODO: CHANGE TO START SELLING PAGE
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Sell Now',
                                      style: TextStyle(
                                        fontFamily: 'OutfitMedium',
                                        color: fontWhiteColor,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                  color: primaryButtonColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  //shadow
                                  elevation: 5,
                                ),
                              ),

                              //BUY NOW
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: MaterialButton(
                                  onPressed: () {
                                    print('BUY NOW PRESSED');
                                  }, //TODO: CHANGE TO GET TO KNOW US PAGE
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Buy Now',
                                      style: TextStyle(
                                        fontFamily: 'OutfitMedium',
                                        color: fontWhiteColor,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                  color: primaryButtonColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  //shadow
                                  elevation: 5,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //RIGHT SIDE
                    //VECTOR IMAGE
                    const Image(image: AssetImage('assets/landingPage/landingPageHouse.png'), width: 500, height: 500,)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


