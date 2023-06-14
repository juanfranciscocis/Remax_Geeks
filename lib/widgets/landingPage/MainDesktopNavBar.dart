//Import material
import 'package:flutter/material.dart';

import '../../ui/common/app_colors.dart';

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
        //shadow
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
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
                image: AssetImage('assets/landingPage/logo.png'),
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
                  onPressed: () {
                    print('LEARN MORE PRESSED');
                  }, //TODO: CHANGE TO LEARN MORE SCREEN
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Learn More',
                      style: TextStyle(
                        fontFamily: 'OutfitMedium',
                        color: fontWhiteColor,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  color: secondaryButtonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  //shadow
                  elevation: 5,
                ),
              ),
              //GET TO KNOW US
              Padding(
                padding: const EdgeInsets.only(right: 50.0),
                child: MaterialButton(
                  onPressed: () {
                    print('GET TO KNOW US PRESSED');
                  }, //TODO: CHANGE TO LEARN MORE SCREEN
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Get To Know Us',
                      style: TextStyle(
                        fontFamily: 'OutfitMedium',
                        color: fontWhiteColor,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  color: secondaryButtonColor,
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