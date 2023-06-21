import 'package:remax_geeks/providers/dbProvider.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:remax_geeks/ui/views/customService/customService_view.dart';
import 'package:stacked/stacked.dart';

import '../../../providers/sellFormProvider.dart';
import '../../../widgets/landingPage/LandingPageTabletSite.dart';
import '../../../widgets/landingPage/MainTabletNavBar.dart';
import '../../common/app_strings.dart';
import '../fullService/fullService_view.dart';
import 'chooseServiceType_viewmodel.dart';

class ChooseServiceTypeTablet extends ViewModelWidget<ChooseServiceTypeViewModel> {

  DBProvider dbProvider;
  SellFormProvider sellFormProvider;
  String fullServiceDescription;
  String customServiceDescription;

  ChooseServiceTypeTablet({super.key, required this.dbProvider, required this.sellFormProvider, required this.fullServiceDescription, required this.customServiceDescription});

  @override
  Widget build(BuildContext context, ChooseServiceTypeViewModel viewModel) {
    return  Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //TEXT, CENTER IN SCREEN, "Choose a service type...", outfibold, color fontMainColor, size 55
                  verticalSpaceLarge,
                  const Text(
                    chooseServiceTypeTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: fontMainColor,
                      fontFamily: fontOutfitBold,
                      fontSize: 55,
                    ),
                  ),
                  //TO CARDS IN A ROW, WITH A TITLE, A SUBTITLE AND ONE CENTERED BUTTON, A MATERIAL BUTTON
                  //CARD 1
                  verticalSpaceLarge,
                  Center(
                    child: Container(
                      width: 500,
                      height: 800,
                      decoration: BoxDecoration(
                        color: primaryCardColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: const Offset(0, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //TITLE
                            const Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Text(
                                chooseServiceTypeCard1Title,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: fontWhiteColor,
                                  fontFamily: fontOutfitBold,
                                  fontSize: 60,
                                ),
                              ),
                            ),
                            //SUBTITLE
                             Text(
                              fullServiceDescription,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: fontWhiteColor,
                                fontFamily: fontOutfitRegular,
                                fontSize: 25,
                              ),
                            ),
                            //BUTTON
                            MaterialButton(
                              onPressed: () {
                                //SELL FORM PROVIDER => 'Full Service'
                                sellFormProvider.serviceType = chooseServiceTypeCard1Title;
                                print(sellFormProvider.serviceType);
                                // NAVIGATE TO NEXT PAGE
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const FullServiceView()));
                              },
                              color: confirmButtonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.asset(
                                chooseServiceTypeCardConfirmButton,
                                width: 600,
                                height: 70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  verticalSpaceLarge,
                  //CARD 2
                  Container(
                    width: 500,
                    height: 800,
                    decoration: BoxDecoration(
                      color: primaryCardColor,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //TITLE
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              chooseServiceTypeCard2Title,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: fontWhiteColor,
                                fontFamily: fontOutfitBold,
                                fontSize: 60,
                              ),
                            ),
                          ),
                          //SUBTITLE
                           Text(
                            customServiceDescription,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: fontWhiteColor,
                              fontFamily: fontOutfitRegular,
                              fontSize: 25,
                            ),
                          ),
                          //BUTTON
                          MaterialButton(
                            onPressed: () {
                              //SELL FORM PROVIDER => 'Full Service'
                              sellFormProvider.serviceType = chooseServiceTypeCard2Title;
                              print(sellFormProvider.serviceType);
                              //NAVIGATE TO NEXT PAGE
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomServiceView()));
                            },
                            color: confirmButtonColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset(
                              chooseServiceTypeCardConfirmButton,
                              width: 600,
                              height: 70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpaceLarge,

                ],
            ),
              ),
            ),
          ),
        ),
      );
  }
}
