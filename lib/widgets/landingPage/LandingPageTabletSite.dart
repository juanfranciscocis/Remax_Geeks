
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../ui/common/app_colors.dart';
import '../../ui/common/app_strings.dart';
import '../../ui/common/ui_helpers.dart';
import '../../ui/views/address/address_view.dart';


class LandingPageTabletSite extends StatelessWidget {
  const LandingPageTabletSite({
    super.key,
  });

  Future<void> openWebPage(String page) async {
    String launchP = 'https://'+page;
    if(await canLaunch(launchP)){
      await launch(launchP);
    }else{
      print('Failed to open $launchP');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            landingPageTitle1,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 50,
              color: fontThirdColor,
              fontFamily: fontOutfitBold,
            ),
          ),
        ),
        const Center(
          child: Text(
            landingPageTitle2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 50,
              color: fontMainColor,
              fontFamily: fontOutfitBold,
            ),
          ),
        ),
        const Center(
          child: Text(
            landingPageSubtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 35,
              color: fontMainColor,
              fontFamily: fontOutfitRegular,
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
        verticalSpaceSmall,
        //buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //SELL NOW
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: MaterialButton(
                onPressed: () {
                  print('SELL NOW PRESSED');
                  Navigator.of(context).pushNamed("/addressView");
                },
                child: const Padding(
                  padding: EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 15.0, bottom: 15.0),
                  child: Text(
                    landingPageSellNowButton,
                    style: TextStyle(
                      color: fontWhiteColor,
                      fontSize: 30,
                      fontFamily: fontOutfitMedium,
                    ),
                  ),
                ),
                color: primaryButtonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            //BUY NOW
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: MaterialButton(
                onPressed: () async {
                  await openWebPage('luigui.com');
                },
                child: const Padding(
                  padding: EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 15.0, bottom: 15.0),
                  child: Text(
                    landingPageBuyNowButton,
                    style: TextStyle(
                      color: fontWhiteColor,
                      fontSize: 30,
                      fontFamily: fontOutfitMedium,
                    ),
                  ),
                ),
                color: primaryButtonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

