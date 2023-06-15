
import 'package:flutter/material.dart';

import '../../ui/common/app_colors.dart';
import '../../ui/common/app_strings.dart';
import '../../ui/common/ui_helpers.dart';


class LandingPageTabletSite extends StatelessWidget {
  const LandingPageTabletSite({
    super.key,
  });

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
            textAlign: TextAlign.justify,
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
            textAlign: TextAlign.justify,
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
                },
                child: const Padding(
                  padding: EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 15.0, bottom: 15.0),
                  child: Text(
                    landingPageSellNowButton,
                    style: TextStyle(
                      color: Colors.white,
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
                onPressed: () {
                  print('BUY NOW PRESSED');
                },
                child: const Padding(
                  padding: EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 15.0, bottom: 15.0),
                  child: Text(
                    landingPageBuyNowButton,
                    style: TextStyle(
                      color: Colors.white,
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

