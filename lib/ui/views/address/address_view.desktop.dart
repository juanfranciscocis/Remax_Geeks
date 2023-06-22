import 'package:provider/provider.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/app_constants.dart';
import 'package:remax_geeks/ui/common/app_strings.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../providers/dbProvider.dart';
import '../../../providers/sellFormProvider.dart';
import '../../../widgets/landingPage/LandingPageDesktopSite.dart';
import '../../../widgets/landingPage/MainDesktopNavBar.dart';
import '../chooseServiceType/chooseServiceType_view.dart';
import 'address_viewmodel.dart';





class AddressViewDesktop extends ViewModelWidget<AddressViewModel> {
  DBProvider dbProvider;
  SellFormProvider sellFormProvider;

  AddressViewDesktop({super.key, required this.dbProvider, required this.sellFormProvider});

  @override
  Widget build(BuildContext context, viewModel) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 200.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceMedium,
              const Text(
                addressLocationOfProperty,
                style: TextStyle(
                  color: fontMainColor,
                  fontFamily: fontOutfitBold,
                  fontSize: 80,
                ),
              ),
              verticalSpaceMedium,
              const TextField(
                decoration: InputDecoration(
                  labelText: addressBox,
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
                  fillColor: inputColor,
                ),
              ),
              verticalSpaceLarge,
              const Text(
                addressCondition,
                style: TextStyle(
                  color: fontMainColor,
                  fontFamily: fontOutfitBold,
                  fontSize: 80,
                ),
              ),
              verticalSpaceMedium,
              //A COLUMN WITH TWO ROWS WITH TWO BUTTONS IN EACH ROW,
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildMaterialButton(
                          title: condition1,
                          onPressed: () {
                            // FILL SELLING FORM
                            sellFormProvider.condition = condition1;
                          },
                        ),
                      ),
                      SizedBox(width: 16.0), // Adjust the spacing between buttons
                      Expanded(
                        child: _buildMaterialButton(
                          title: condition2,
                          onPressed: () {
                            // FILL SELLING FORM
                            sellFormProvider.condition = condition2;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0), // Adjust the spacing between rows
                  Row(
                    children: [
                      Expanded(
                        child: _buildMaterialButton(
                          title: condition3,
                          onPressed: () {
                            // FILL SELLING FORM
                            sellFormProvider.condition = condition3;
                          },
                        ),
                      ),
                      SizedBox(width: 16.0), // Adjust the spacing between buttons
                      Expanded(
                        child: _buildMaterialButton(
                          title: condition4,
                          onPressed: () {
                            // FILL SELLING FORM
                            sellFormProvider.condition = condition4;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),


              verticalSpaceLarge,
              const Text(
                addressTypeOfProperty,
                style: TextStyle(
                  color: fontMainColor,
                  fontFamily: fontOutfitBold,
                  fontSize: 80,
                ),
              ),
              verticalSpaceMedium,
              //A COLUMN WITH TWO ROWS WITH TWO BUTTONS IN ROW 1 AND ONE BUTTON IN ROW 2 CENTERED
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildMaterialButton(
                          title: type1,
                          onPressed: () {
                            // FIll SELLING FORM
                            sellFormProvider.type = type1;
                          },
                        ),
                      ),
                      SizedBox(width: 16.0), // Adjust the spacing between buttons
                      Expanded(
                        child: _buildMaterialButton(
                          title: type2,
                          onPressed: () {
                            // FIll SELLING FORM
                            sellFormProvider.type = type2;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0), // Adjust the spacing between rows
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: _buildMaterialButton(
                          title: type3,
                          onPressed: () {
                            //FILL SELLING FORM
                            sellFormProvider.type = type3;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              verticalSpaceLarge,
              Align(
                alignment: Alignment.centerRight,
                child: FractionallySizedBox(
                  widthFactor: 0.2, // Adjust the width as needed
                  child: MaterialButton(
                    onPressed: () async {
                      // Navigate to the ChooseServiceTypeView
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ChooseServiceTypeView()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        addressContinueButton,
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
              ),
              verticalSpaceLarge,
            ],
          ),
        ),
      ),
    );
  }



  Widget _buildMaterialButton({
    required String title,
    required VoidCallback onPressed,
  }) {
    return MaterialButton(
      //round the corners of the button
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 5.0,
      onPressed: onPressed,
      color: primaryButtonColor,
      textColor: Colors.white,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: fontOutfitBold,
          fontSize: 50,
        ),
      ),
    );
  }




}


