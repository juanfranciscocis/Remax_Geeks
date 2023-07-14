//Import material
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remax_geeks/providers/costumerProvider.dart';
import 'package:remax_geeks/providers/storageProvider.dart';
import 'package:remax_geeks/ui/common/app_strings.dart';
import 'package:remax_geeks/ui/views/learnMore/learnMore_view.dart';

import '../../providers/dbProvider.dart';
import '../../ui/common/app_colors.dart';
import '../../ui/views/getToKnowUS/getToKnowUs_view.dart';

class MainDesktopNavBar extends StatelessWidget {
  const MainDesktopNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1300,
      height: 75,
      decoration: BoxDecoration(
        color: navColor,
        borderRadius: BorderRadius.circular(8),

      ),

      //inside the rectangle, add an image to the left, and two buttons to the right
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //MIAN NAV IMAGE
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: GestureDetector (
              onTap: () {
                print('RETURN TO HOME PRESSED');
              },
              child: const Image(
                image: AssetImage(landingPageNavBarLogo),
                width: 150,
                height: 100,
              ),
            ),
          ),
          //buttons
          Row(
            children: [
              //LEARN MORE
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: MaterialButton(
                  onPressed: () async {
                    StorageProvider storageProvider = Provider.of<StorageProvider>(context, listen: false);
                    await storageProvider.getImages();
                    Navigator.pushNamed(context, '/learnMore');
                  }, //TODO: CHANGE TO LEARN MORE SCREEN
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      landingPageNavBarLearnMore,
                      style: TextStyle(
                        fontFamily: fontOutfitMedium,
                        color: fontWhiteColor,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  color: backgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  //shadow
                  elevation: 5,
                ),
              ),
              //GET TO KNOW US
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/getToKnowUs');
                  }, //TODO: CHANGE TO LEARN MORE SCREEN
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      landingPageNavBarGetToKnowUs,
                      style: TextStyle(
                        fontFamily: fontOutfitMedium,
                        color: fontWhiteColor,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  color: backgroundColor,
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


    );
  }
}