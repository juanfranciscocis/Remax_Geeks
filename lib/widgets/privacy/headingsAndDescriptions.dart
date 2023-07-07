
import 'package:flutter/material.dart';

import '../../ui/common/app_colors.dart';
import '../../ui/common/app_strings.dart';
import '../../ui/common/ui_helpers.dart';
class HeadingAndDescription extends StatelessWidget {
  String heading;
  String description;

  HeadingAndDescription({
    required this.heading,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      width: 800,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textAlign: TextAlign.justify,
            heading,
            style: TextStyle(
              fontFamily: fontOutfitBold,
              fontSize: 25,
              color: fontMainColor,
            ),
          ),
          verticalSpaceSmall,
          //DESCRIPTION OF THE HEADING 1, OUTFITREGULAR, FONT SECOND COLOR
          Text(
            textAlign: TextAlign.justify,
            description,
            style: TextStyle(
              fontFamily: fontOutfitRegular,
              fontSize: 20,
              color: fontMainColor,
            ),
          ),
          verticalSpaceMedium,
        ],
      ),
    );
  }
}