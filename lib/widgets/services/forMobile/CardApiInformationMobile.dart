import 'package:flutter/material.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';

import '../../../ui/common/app_colors.dart';
import '../../../ui/common/app_strings.dart';


class CardApiInformationMobile extends StatelessWidget {
  final String imagePath;
  final String estimatedPriceApi;
  const CardApiInformationMobile({
    super.key, required this.imagePath, required this.estimatedPriceApi,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: secondaryCardColor,
        elevation: 10.0,
        //ROUND CORNERS
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          width: 1000.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //cross axis, top left
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceMedium,
                  //IMAGE
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Container(
                        height: 100.0,
                        width: 200.0,
                        child: Image.asset(
                          imagePath,
                          //fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  //1 Title
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      estimatesPrice,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: fontSecondColor,
                        fontFamily: fontOutfitMedium,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ],
              ),
              //SizedBox(height: 2.0,),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Text(
                    estimatedPriceApi,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: fontOutfitMedium,
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
              verticalSpaceMedium,

            ],
          ),
        ),
      ),
    );
  }
}