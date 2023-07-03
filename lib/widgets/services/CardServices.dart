import 'package:flutter/material.dart';
import 'package:remax_geeks/providers/sellFormProvider.dart';

import '../../ui/common/app_colors.dart';
import '../../ui/common/app_strings.dart';

class CardServices extends StatefulWidget {
  final Color color;
  final String title;
  final String description;
  final SellFormProvider sellformProvider;

  const CardServices({
    Key? key,
    required this.color,
    required this.title,
    required this.description,
    required this.sellformProvider,
  }) : super(key: key);

  @override
  State<CardServices> createState() => _CardServicesState();
}

class _CardServicesState extends State<CardServices> {
  bool isChecked = false; // New line added

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.0, // Adjust the width as needed
      child: Card(
        color: widget.color,
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
                widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: fontOutfitBold,
                  fontSize: 35,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                widget.description,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: fontOutfitRegular,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 8.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 100,
                  height: 50,
                  //shadow
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(2.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Checkbox(
                    activeColor: confirmButtonColor,
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value ?? false;
                        // if checked, add to form; otherwise, remove
                        if (isChecked) {
                          widget.sellformProvider.servicesChosen = widget.title;
                        } else {
                          widget.sellformProvider.deleteService = widget.title;
                        }
                      });
                    },
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
