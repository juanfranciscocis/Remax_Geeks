import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/landingPage/MainMobileNavBar.dart';
import '../../common/app_strings.dart';
import 'home_viewmodel.dart';

class HomeViewMobile extends ViewModelWidget<HomeViewModel> {
  const HomeViewMobile({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //ADD A RECTANGLE IN THE TOP OF THE SCREEN, NAVBAR COLOR
                  MainMobileNavBar(),
                  verticalSpaceLarge,
                  //MAIN CONTENT
                  //Three texts in a column two titles 1 and 2, a subtitle. Then a image and two buttons in a row.
                  //Texts
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: const Text(
                          landingPageTitle1,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: fontThirdColor,
                            fontFamily: fontOutfitBold,
                            fontSize: 40,
                          ),
                        ),
                      ),
                      Center(
                        child: const Text(
                          landingPageTitle2,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: fontMainColor,
                            fontFamily: fontOutfitBold,
                            fontSize: 40,
                          ),
                        ),
                      ),
                      Center(
                        child: const Text(
                          landingPageSubtitle,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: fontMainColor,
                            fontFamily: fontOutfitRegular,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      verticalSpaceLarge,
                      Center(
                        child: Image.asset(
                          landingPageHouseImage,
                          height: 400,
                          width: 400,
                        ),
                      ),
                      verticalSpaceLarge,
                      //Buttons
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //SELL NOW
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: MaterialButton(
                              onPressed: () {
                                print('SELL NOW PRESSED');
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: const Text(
                                  landingPageSellNowButton,
                                  style: TextStyle(
                                    color: fontWhiteColor,
                                    fontFamily: fontOutfitMedium,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              color:primaryButtonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              elevation: 5.0,
                            ),
                          ),
                          //BUY NOW
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: MaterialButton(
                              onPressed: () {
                                print('BUY NOW PRESSED');
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: const Text(
                                  landingPageBuyNowButton,
                                  style: TextStyle(
                                    color: fontWhiteColor,
                                    fontFamily: fontOutfitMedium,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              color: primaryButtonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              elevation: 5.0,
                            ),
                          ),
                      ],
                    ),
                ],
              ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}


