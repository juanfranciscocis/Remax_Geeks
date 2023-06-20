import 'package:flutter/material.dart';

import '../../ui/common/app_colors.dart';
import '../../ui/common/app_strings.dart';


class CardAverageApiDesktop extends StatelessWidget {
  const CardAverageApiDesktop({
    super.key,
    required this.averageApiPrice,
  });

  final String averageApiPrice;

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
          height: 320.0,
          width: 1000.0,
          child: Column(
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    averagePrice,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: fontMainColor,
                      fontFamily: fontOutfitMedium,
                      fontSize: 110,
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
                      color: Colors.black,
                      fontFamily: fontOutfitMedium,
                      fontSize: 100,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


