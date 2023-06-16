import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/app_constants.dart';
import 'package:remax_geeks/ui/common/app_strings.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/landingPage/LandingPageDesktopSite.dart';
import '../../../widgets/landingPage/MainDesktopNavBar.dart';
import 'address_viewmodel.dart';

class AddressViewDesktop extends ViewModelWidget<AddressViewModel> {
  const AddressViewDesktop({super.key});

  @override
  Widget build(BuildContext context,  viewModel) {
    return  Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 200.0, right: 200.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              verticalSpaceLarge,

              //ADD A TITLE IN THE TOP OF THE SCREEN, fontPrimaryColor, OutfitBold
              const Text(
                addressLocationOfProperty,
                style: TextStyle(
                  color: fontMainColor,
                  fontFamily: fontOutfitBold,
                  fontSize: 120,
                ),
              ),
              verticalSpaceMedium,
              const Padding(
                padding: EdgeInsets.only(left: 100.0, right: 100.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: addressBox,
                    //label text style
                    labelStyle: TextStyle(
                      color: fontSecondColor,
                      fontFamily: fontOutfitRegular,
                      fontSize: 20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: fontSecondColor,
                        width: 2.0,
                      ),
                    ),
                    filled: true,
                    //fill color red
                    fillColor: inputColor,
                  ),
                ),
              ),
              verticalSpaceLarge,
              //add another title adressCondition, fontPrimaryColor, OutfitBold
              const Text(
                addressCondition,
                style: TextStyle(
                  color: fontMainColor,
                  fontFamily: fontOutfitBold,
                  fontSize: 120,
                ),
              ),
              //add 4 material buttons, 2 in each row
              verticalSpaceMedium,
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 20.0),
                      child: MaterialButton(
                        onPressed: () {
                          print('NEW/EXCELLENT PRESSED');
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            condition1,
                            style: TextStyle(
                              color: fontWhiteColor,
                              fontFamily: fontOutfitMedium,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        color: primaryButtonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 5.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: MaterialButton(
                        onPressed: () {
                          print('GOOD PRESSED');
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            condition2,
                            style: TextStyle(
                              color: fontWhiteColor,
                              fontFamily: fontOutfitMedium,
                              fontSize: 25
                            ),
                          ),
                        ),
                        color: primaryButtonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 5.0,
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpaceTiny,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {
                      print('UNDER CONSTRUCTION PRESSED');
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        condition3,
                        style: TextStyle(
                          color: fontWhiteColor,
                          fontFamily: fontOutfitMedium,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    color: primaryButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 5.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: MaterialButton(
                      onPressed: () {
                        print('NEEDS RENOVATION PRESSED');
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          condition4,
                          style: TextStyle(
                            color: fontWhiteColor,
                            fontFamily: fontOutfitMedium,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      color: primaryButtonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 5.0,
                    ),
                  ),
                ],
              ),
              verticalSpaceLarge,
              //add another title adressCondition, fontPrimaryColor, OutfitBold
              const Text(
                addressTypeOfProperty,
                style: TextStyle(
                  color: fontMainColor,
                  fontFamily: fontOutfitBold,
                  fontSize: 120,
                ),
              ),
              //add 4 material buttons, 2 in each row
              verticalSpaceMedium,
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: MaterialButton(
                        onPressed: () {
                          print('RESIDENTIAL PRESSED');
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            type1,
                            style: TextStyle(
                              color: fontWhiteColor,
                              fontFamily: fontOutfitMedium,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        color: primaryButtonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 5.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: MaterialButton(
                        onPressed: () {
                          print('COMMERCIAL PRESSED');
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            type2,
                            style: TextStyle(
                              color: fontWhiteColor,
                              fontFamily: fontOutfitMedium,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        color: primaryButtonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 5.0,
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpaceTiny,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: MaterialButton(
                      onPressed: () {
                        print('LAND PRESSED');
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          type3,
                          style: TextStyle(
                            color: fontWhiteColor,
                            fontFamily: fontOutfitMedium,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      color: primaryButtonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 5.0,
                    ),
                  ),
                ],
              ),
              verticalSpaceLarge,
              //add a button to the right of the screen, confirmation color
              Center(
                child: MaterialButton(
                  onPressed: () {
                    print('NEXT PART OF THE FORM PRESSED');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/confirm.png',
                      height: 50,
                      width: 100,
                    ),
                  ),
                  color: confirmButtonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 5.0,
                ),
              ),
              verticalSpaceLarge,

            ],
          ),
        ),
      ),
    );
  }
}




