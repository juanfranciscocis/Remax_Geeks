import 'package:flutter/material.dart';
import 'package:remax_geeks/providers/sellFormProvider.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';

import '../../ui/common/app_colors.dart';
import '../../ui/common/app_strings.dart';

class CardServices extends StatefulWidget {
  final Color color;
  final String title;
  final String description;
  final SellFormProvider sellformProvider;
  final String price;

  const CardServices({
    Key? key,
    required this.color,
    required this.title,
    required this.description,
    required this.sellformProvider,
    required this.price,
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
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                widget.description,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: fontOutfitRegular,
                  fontSize: 10,
                ),
              ),
              SizedBox(height: 8.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 300,
                  height: 50,
                  //shadow
                  decoration: BoxDecoration(
                    color: thirdCardColor,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      horizontalSpaceMedium,
                      Text(
                        widget.price,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: fontOutfitBold,
                          fontSize: 20,
                        ),
                      ),
                      horizontalSpaceTiny,
                      Checkbox(
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
                    ],
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
