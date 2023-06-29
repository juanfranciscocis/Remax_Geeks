import 'package:flutter/material.dart';
import 'package:remax_geeks/ui/views/getToKnowUS/getToKnowUs_view.dart';

import '../../ui/common/app_colors.dart';
import '../../ui/common/app_strings.dart';
import '../../ui/views/learnMore/learnMore_view.dart';

class MainTabletNavBar extends StatelessWidget {
  const MainTabletNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Container(
        width: 1300,
        height: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: navColor,
          //shadow
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        //inside the rectangle, add an image to the left, and two buttons to the right
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //MIAN NAV IMAGE
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: GestureDetector(
                onTap: () {
                  print('RETURN TO HOME PRESSED');
                },
                child: const Image(
                  image: AssetImage(landingPageNavBarLogo),
                  width: 150,
                  height: 75,
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
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LearnMoreView()));
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 15.0, bottom: 15.0),
                      child: Text(
                        landingPageNavBarLearnMore,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: fontOutfitMedium,
                        ),
                      ),
                    ),
                    color: secondaryButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 5,
                  ),
                ),

                //GET TO KNOW US
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const GetToKnowUsView()));
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 15.0, bottom: 15.0),
                      child: Text(
                        landingPageNavBarGetToKnowUs,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: fontOutfitMedium,
                        ),
                      ),
                    ),
                    color: secondaryButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 5,
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
      //MAIN CONTENT
    );
  }
}
