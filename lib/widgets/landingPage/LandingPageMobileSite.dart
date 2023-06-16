
import 'package:flutter/material.dart';

import '../../ui/common/app_colors.dart';
import '../../ui/common/app_strings.dart';
import '../../ui/common/ui_helpers.dart';
import '../../ui/views/address/address_view.dart';
import '../../ui/views/home/home_view.dart';

class LandingPageMobileSite extends StatelessWidget {
  const LandingPageMobileSite({
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AddressView()));
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
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
            ),
            //BUY NOW
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: MaterialButton(
                onPressed: () {
                  print('BUY NOW PRESSED');
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
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
            ),
          ],
        ),
      ],
    );
  }
}


