//import material
import 'package:flutter/material.dart';
import 'package:remax_geeks/ui/common/app_strings.dart';
import 'package:remax_geeks/ui/views/burgerMenu/burgerMenu_view.dart';

import '../../ui/common/app_colors.dart';

class MainMobileNavBar extends StatelessWidget {
  const MainMobileNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: navColor,
        borderRadius: BorderRadius.circular(8),

      ),
      //inside the rectangle, add an image to the left, and one button to the right
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //MAN NAV IMAGE
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: GestureDetector (
              onTap: () {
                print('RETURN TO HOME PRESSED');
              },
              child: const Image(
                image: AssetImage(landingPageNavBarLogo),
                width: 150,
                height: 150,
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
                    Navigator.pushNamed(context, '/burgerMenu');
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top:8.0, bottom: 8.0, left: 20.0, right: 10.0),
                    child: Container(
                      //MAKE IT secondaryCardColor, add a shadow to it
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Image(
                          image: AssetImage(landingPageNavBarBurgerMenu),
                          width: 70,
                          height: 100,
                        )
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}