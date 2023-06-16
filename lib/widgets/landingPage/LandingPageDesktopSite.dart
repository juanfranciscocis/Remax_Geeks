//import material
import 'package:flutter/material.dart';

import '../../ui/common/app_colors.dart';
import '../../ui/common/app_strings.dart';
import '../../ui/common/ui_helpers.dart';
import '../../ui/views/address/address_view.dart';

class LandingPageDesktopSite extends StatelessWidget {
  const LandingPageDesktopSite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  fontFamily: fontOutfitBold,
                  fontSize: 55,
                ),
              ),
              const Text(
                landingPageTitle2,
                style: TextStyle(
                  color: fontMainColor,
                  fontFamily: fontOutfitBold,
                  fontSize: 55,
                ),
              ),
              const Text(
                landingPageSubtitle,
                style: TextStyle(
                  color: fontMainColor,
                  fontFamily: fontOutfitRegular,
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const AddressView()));
                      }, //TODO: CHANGE TO START SELLING PAGE
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          landingPageSellNowButton,
                          style: TextStyle(
                            fontFamily: fontOutfitMedium,
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
                          landingPageBuyNowButton,
                          style: TextStyle(
                            fontFamily: fontOutfitMedium,
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
        const Expanded(child: Image(image: AssetImage(landingPageHouseImage), width: 500, height: 500,))
      ],
    );
  }
}