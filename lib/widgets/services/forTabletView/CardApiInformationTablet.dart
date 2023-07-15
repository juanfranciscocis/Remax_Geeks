import 'package:flutter/material.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';

import '../../../ui/common/app_colors.dart';
import '../../../ui/common/app_strings.dart';


class CardApiInformationTablet extends StatelessWidget {
  final String imagePath;
  final String estimatedPriceApi;
  const CardApiInformationTablet({
    super.key, required this.imagePath, required this.estimatedPriceApi,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: whiteCardColor,
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
              verticalSpaceMedium,
              Center(
                child: Container(
                  height: 200.0,
                  width: 300.0,
                  child: Image.asset(
                    imagePath,
                    //fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              verticalSpaceMedium,
              //SizedBox(height: 2.0,),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Text(
                    estimatedPriceApi,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: fontWhiteColor,
                      fontFamily: fontOutfitMedium,
                      fontSize: 70,
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