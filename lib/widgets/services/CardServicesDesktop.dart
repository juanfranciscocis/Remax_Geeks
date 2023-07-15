
import 'package:flutter/material.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';

import '../../providers/sellFormProvider.dart';
import '../../ui/common/app_colors.dart';
import '../../ui/common/app_strings.dart';

class CardServicesDesktop extends StatefulWidget {
  final Color color;
  final String title;
  final String description;
  final String price;
  final SellFormProvider sellformProvider;

  const CardServicesDesktop({
    Key? key,
    required this.color,
    required this.title,
    required this.description,
    required this.sellformProvider,
    required this.price,
  }) : super(key: key);

  @override
  State<CardServicesDesktop> createState() => _CardServicesDesktopState();
}

class _CardServicesDesktopState extends State<CardServicesDesktop> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.0,
      height: 500,
      child: Card(
        color: widget.color,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
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
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: secondaryCardColor,
                      borderRadius: BorderRadius.circular(2.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(0, 3),
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
                              if (isChecked) {
                                widget.sellformProvider.servicesChosen =
                                    widget.title;
                              } else {
                                widget.sellformProvider.deleteService =
                                    widget.title;
                              }
                            });
                          },
                        ),
                      ],
                    ),
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
