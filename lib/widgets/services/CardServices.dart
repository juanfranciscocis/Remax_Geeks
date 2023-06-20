import 'package:flutter/material.dart';

import '../../ui/common/app_colors.dart';
import '../../ui/common/app_strings.dart';
class CardServices extends StatelessWidget {
  Color color;
  String title;
  String description;
  CardServices({
    super.key, required this.color, required this.title, required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Card(

        //add a title, a description and a checkbox
        color: goldCardColor,
        elevation: 10.0,
        //ROUND CORNERS
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          height: 300.0,
          width: 300.0,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  "titleCard4",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: fontWhiteColor,
                    fontFamily: fontOutfitMedium,
                    fontSize: 40,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'DESCRIPTION',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: fontWhiteColor,
                    fontFamily: fontOutfitRegular,
                    fontSize: 10,
                  ),
                ),
              ),
              //Container for the checkbox
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50.0,
                  //full width of the card
                  width: 1000.0,
                  //round corners of the container
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: secondaryCardColor,
                    //shadow
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  //shadow

                  child: ChooseServiceBox(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//TODO: add a checkbox
class ChooseServiceBox extends StatefulWidget {
  const ChooseServiceBox({
    super.key,
  });

  @override
  State<ChooseServiceBox> createState() => _ChooseServiceBoxState();
}

class _ChooseServiceBoxState extends State<ChooseServiceBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: false,
      onChanged: (value) {
        print(value);
      },
      activeColor: confirmButtonColor,
    );
  }
}