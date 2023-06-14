//import material
import 'package:flutter/material.dart';

import '../../ui/common/app_colors.dart';

class MainMobileNavBar extends StatelessWidget {
  const MainMobileNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: navColor,
        borderRadius: BorderRadius.circular(8),
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
                image: AssetImage('assets/landingPage/logo.png'),
                width: 100,
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
                  onPressed: () {
                    print('BURGER MENU PRESSED');
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top:5.0, bottom: 5.0, left: 20.0, right: 10.0),
                    child: Container(
                      //MAKE IT secondaryCardColor, add a shadow to it
                        decoration: BoxDecoration(
                          color: secondaryButtonColor,
                          borderRadius: BorderRadius.circular(8),
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
                        child: const Image(
                          image: AssetImage('assets/landingPage/burgerMenu.png'),
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