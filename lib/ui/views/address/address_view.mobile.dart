import 'package:provider/provider.dart';
import 'package:remax_geeks/providers/dbProvider.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:remax_geeks/widgets/landingPage/LandingPageMobileSite.dart';
import 'package:stacked/stacked.dart';

import '../../../providers/sellFormProvider.dart';
import '../../../services/GooglePlacesService.dart';
import '../../../widgets/landingPage/MainMobileNavBar.dart';
import '../../common/app_strings.dart';
import '../chooseServiceType/chooseServiceType_view.dart';
import 'address_viewmodel.dart';

class AddressViewMobile extends StatefulWidget {

  DBProvider dbProvider;
  SellFormProvider sellFormProvider;

  AddressViewMobile({super.key, required this.dbProvider, required this.sellFormProvider});

  @override
  State<AddressViewMobile> createState() => _AddressViewMobileState(sellFormProvider: sellFormProvider);
}

class _AddressViewMobileState extends State<AddressViewMobile> {

  late GooglePlacesService google;
  TextEditingController addressController = TextEditingController();
  SellFormProvider sellFormProvider;

  _AddressViewMobileState({required this.sellFormProvider});

  void changeTextFieldToSuggestion(String suggestion){
    setState(() {
      addressController.text = suggestion;
      sellFormProvider.address = suggestion;
      google.listOfPredictions = ['','',''];
    });
  }

  @override
  Widget build(BuildContext context) {
    google = Provider.of<GooglePlacesService>(context);
    return  Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceLarge,
                const Text(
                  addressLocationOfProperty,
                  style: TextStyle(
                    color: fontMainColor,
                    fontFamily: fontOutfitBold,
                    fontSize: 40,
                  ),
                ),
                verticalSpaceMedium,
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: addressBox,
                    labelStyle: TextStyle(
                      color: fontSecondColor,
                      fontFamily: fontOutfitRegular,
                      fontSize: 10,
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
                  style: TextStyle(
                    color: fontMainColor,
                    fontFamily: fontOutfitRegular,
                    fontSize: 15,
                  ),
                  onChanged: (value) {
                    google.getMax3PredictionsGoogle(value);
                  },

                ),
                verticalSpaceTiny,
                //LIST OF SUGGESTIONS
                Visibility(
                  visible: google.listOfPredictions[0] != '',
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: _buildMaterialButton(
                              buttonColor: fontMainColor,
                              textSize: 15,
                              title: google.listOfPredictions[0],
                              onPressed: () {
                                changeTextFieldToSuggestion(google.listOfPredictions[0]);
                              },
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceSmall,
                    ],
                  ),
                ),
                Visibility(
                  visible: google.listOfPredictions[1] != '',
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: _buildMaterialButton(
                              buttonColor: fontMainColor,
                              textSize: 15,
                              title: google.listOfPredictions[1],
                              onPressed: () {
                                changeTextFieldToSuggestion(google.listOfPredictions[1] );
                              },
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceSmall,
                    ],
                  ),
                ),
                Visibility(
                  visible: google.listOfPredictions[2] != '',
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: _buildMaterialButton(
                              buttonColor: fontMainColor,
                              textSize: 15,
                              title: google.listOfPredictions[2],
                              onPressed: () {
                                changeTextFieldToSuggestion(google.listOfPredictions[2] );
                              },
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceSmall,
                    ],
                  ),
                ),
                verticalSpaceLarge,
                const Text(
                  addressCondition,
                  style: TextStyle(
                    color: fontMainColor,
                    fontFamily: fontOutfitBold,
                    fontSize: 40,
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
                              widget.sellFormProvider.condition = condition1;
                            },
                          ),
                        ),
                        SizedBox(width: 16.0), // Adjust the spacing between buttons
                        Expanded(
                          child: _buildMaterialButton(
                            title: condition2,
                            onPressed: () {
                              // FILL SELLING FORM
                              widget.sellFormProvider.condition = condition2;
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
                              widget.sellFormProvider.condition = condition3;
                            },
                          ),
                        ),
                        SizedBox(width: 16.0), // Adjust the spacing between buttons
                        Expanded(
                          child: _buildMaterialButton(
                            title: condition4,
                            onPressed: () {
                              // FILL SELLING FORM
                              widget.sellFormProvider.condition = condition4;
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
                    fontSize: 40,
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
                              // FILL SELLING FORM
                              widget.sellFormProvider.type = type1;
                            }
                          ),
                        ),
                        SizedBox(width: 16.0), // Adjust the spacing between buttons
                        Expanded(
                          child: _buildMaterialButton(
                            title: type2,
                            onPressed: () {
                              // FILL SELLING FORM
                              widget.sellFormProvider.type = type2;
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
                              // FILL SELLING FORM
                              widget.sellFormProvider.type = type3;
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
                    child: _buildMaterialButton(title: 'NEXT', onPressed: (){
                      // VERIFY ADDRESS, BUTTONS PRESS AND GO TO NEXT PAGE
                      if (sellFormProvider.address != '' && sellFormProvider.condition != '' && sellFormProvider.type != '') {
                        // GO TO NEXT PAGE
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ChooseServiceTypeView()));

                      } else {
                        // SHOW ERROR MESSAGE
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Please fill all the fields',
                              style: TextStyle(
                                fontFamily: fontOutfitRegular,
                                fontSize: 15,
                              ),
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }, buttonColor: confirmButtonColor)),
                verticalSpaceLarge,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMaterialButton({
    required String title,
    required VoidCallback onPressed,
    Color? buttonColor,
    double? textSize,
  }) {
    return MaterialButton(
      height: 50,
      //round the corners of the button
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 5.0,
      onPressed: onPressed,
      color: buttonColor ?? (buttonColor = primaryButtonColor),
      textColor: Colors.white,
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: fontOutfitBold,
          fontSize: textSize ?? ( textSize = 15),
        ),
      ),
    );
  }
}

