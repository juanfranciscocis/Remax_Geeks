import 'package:flutter/material.dart';

import '../../ui/common/app_colors.dart';
import '../../ui/common/app_strings.dart';
class CardServices extends StatelessWidget {
  final Color color;
  final String title;
  final String description;

  const CardServices({
    Key? key,
    required this.color,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.0, // Adjust the width as needed
      child: Card(
        color: color,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: fontOutfitBold,
                  fontSize: 35,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                description,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: fontOutfitRegular,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 8.0),
              Center(
                child: Checkbox(
                  // Add your checkbox logic here
                  value: false,
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
