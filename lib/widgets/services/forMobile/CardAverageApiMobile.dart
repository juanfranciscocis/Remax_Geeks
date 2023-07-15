import 'package:flutter/material.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';

import '../../../ui/common/app_colors.dart';
import '../../../ui/common/app_strings.dart';




class CardAverageApiMobile extends StatelessWidget {
  const CardAverageApiMobile({
    super.key,
    required this.averageApiPrice,
  });

  final String averageApiPrice;

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
            children: [
              verticalSpaceMedium,
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 30, right: 30,bottom: 10.0),
                  child: Text(
                    averagePrice,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: fontMainColor,
                      fontFamily: fontOutfitMedium,
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
              //SizedBox(height: 2.0,),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Text(
                    averageApiPrice,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: fontWhiteColor,
                      fontFamily: fontOutfitMedium,
                      fontSize: 30,
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


