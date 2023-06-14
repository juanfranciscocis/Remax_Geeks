import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/app_constants.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeViewDesktop extends ViewModelWidget<HomeViewModel> {
  const HomeViewDesktop({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: kdDesktopMaxContentWidth,
            height: kdDesktopMaxContentHeight,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                verticalSpaceLarge,
                Title(color: fontMainColor,
                child: Text('HomeView', style: TextStyle(fontSize: 100, color: fontMainColor))),
                Row(
                  //mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      child: Padding(padding: EdgeInsets.all(8),
                      child: Text('Show Dialog', style: TextStyle(fontSize: 50, color: fontWhiteColor))),
                      color: secondaryButtonColor,
                      //rounded rectangle button, 8pt
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      //add shadow
                      elevation: 10,
                      onPressed: (){
                        //show popup with ok button
                        viewModel.showDialog();
                      },
                    ),
                    TextButton(
                      onPressed: (){},
                      child: Text('UnknownView', style: TextStyle(fontSize: 50, color: fontSecondColor)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
