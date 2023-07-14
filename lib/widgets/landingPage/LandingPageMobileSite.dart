
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../ui/common/app_colors.dart';
import '../../ui/common/app_strings.dart';
import '../../ui/common/ui_helpers.dart';
import '../../ui/views/address/address_view.dart';
import '../../ui/views/home/home_view.dart';

class LandingPageMobileSite extends StatelessWidget {
  const LandingPageMobileSite({
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
              color: fontThirdColor,
              fontFamily: fontOutfitBold,
              fontSize: 40,
            ),
          ),
        ),
        const Center(
          child: Text(
            landingPageTitle2,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: fontMainColor,
              fontFamily: fontOutfitBold,
              fontSize: 40,
            ),
          ),
        ),
        const Center(
          child: Text(
            landingPageSubtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: fontMainColor,
              fontFamily: fontOutfitRegular,
              fontSize: 25,
            ),
          ),
        ),
        verticalSpaceMedium,
        Center(
          child: Image.asset(
            landingPageHouseImage,
            height: 400,
            width: 400,
          ),
        ),
        verticalSpaceMedium,
        //Buttons
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //SELL NOW
            MaterialButton(
              onPressed: () {
                print('SELL NOW PRESSED');
                Navigator.of(context).pushNamed("/addressView");
              },
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
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
            //BUY NOW
            MaterialButton(
              onPressed: () async {
                await openWebPage('luigui.com');
              },
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
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
          ],
        ),
      ],
    );
  }
}


