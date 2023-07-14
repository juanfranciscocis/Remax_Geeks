import 'package:g_recaptcha_v3/g_recaptcha_v3.dart';
import 'package:provider/provider.dart';
import 'package:remax_geeks/helpers/apiRequest.dart';
import 'package:remax_geeks/providers/dbProvider.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../providers/sellFormProvider.dart';
import '../../../services/GooglePlacesService.dart';
import '../../../services/analyticsService.dart';
import '../../../services/pixelsService.dart';
import '../../../services/realtyMoleService.dart';
import '../../../services/zillowService.dart';
import '../../../widgets/landingPage/LandingPageTabletSite.dart';
import '../../../widgets/landingPage/MainTabletNavBar.dart';
import '../../common/app_strings.dart';
import '../chooseServiceType/chooseServiceType_view.dart';
import '../home/home_view.dart';
import 'address_viewmodel.dart';

class AddressViewTablet extends StatefulWidget {

  DBProvider dbProvider;
  SellFormProvider sellFormProvider;

  AddressViewTablet({super.key, required this.dbProvider, required this.sellFormProvider});

  @override
  State<AddressViewTablet> createState() => _AddressViewTabletState(sellFormProvider: sellFormProvider);
}

class _AddressViewTabletState extends State<AddressViewTablet> {
  late GooglePlacesService google;
  TextEditingController addressController = TextEditingController();
  SellFormProvider sellFormProvider;
  int pressedCondition = -1;
  int pressedPropertyType = -1;

  _AddressViewTabletState({required this.sellFormProvider});

  void changeTextFieldToSuggestion(String suggestion){
    PixelService().trackSellingLocation(suggestion);
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
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceLarge,
                const Text(
                  addressLocationOfProperty,
                  style: TextStyle(
                    color: fontMainColor,
                    fontFamily: fontOutfitBold,
                    fontSize: 60,
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
                      fontSize: 30,
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
                    fontSize: 30,
                  ),
                  onChanged: (value) {
                    google.getMax3PredictionsGoogle(value);
                  },
                ),
                verticalSpaceTiny,

                //GOOGLE SUGGESTION
                Visibility(
                  visible: google.listOfPredictions[0] != '',
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: _buildMaterialButton(
                              buttonColor: secondaryCardColor,
                              textSize: 30,
                              title: google.listOfPredictions[0],
                              onPressed: () {
                                changeTextFieldToSuggestion(google.listOfPredictions[0]);
                              }, isPressed: false,
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
                              buttonColor: secondaryCardColor,
                              textSize: 30,
                              title: google.listOfPredictions[1],
                              onPressed: () {
                                changeTextFieldToSuggestion(google.listOfPredictions[1] );
                              }, isPressed: false,
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
                              buttonColor: secondaryCardColor,
                              textSize: 30,
                              title: google.listOfPredictions[2],
                              onPressed: () {
                                changeTextFieldToSuggestion(google.listOfPredictions[2] );
                              }, isPressed: false,
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
                    fontSize: 60,
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
                              setState(() {
                                pressedCondition = 1;
                              });
                              // Handle button 1 press
                              widget.sellFormProvider.condition = condition1;
                            }, isPressed: pressedCondition == 1,
                          ),
                        ),
                        SizedBox(width: 16.0), // Adjust the spacing between buttons
                        Expanded(
                          child: _buildMaterialButton(
                            title: condition2,
                            onPressed: () {
                              setState(() {
                                pressedCondition = 2;
                              });
                              // Handle button 2 press
                              widget.sellFormProvider.condition = condition2;
                            }, isPressed: pressedCondition == 2,
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
                              setState(() {
                                pressedCondition = 3;
                              });
                              // Handle button 3 press
                              widget.sellFormProvider.condition = condition3;
                            }, isPressed: pressedCondition == 3,
                          ),
                        ),
                        SizedBox(width: 16.0), // Adjust the spacing between buttons
                        Expanded(
                          child: _buildMaterialButton(
                            title: condition4,
                            onPressed: () {
                              setState(() {
                                pressedCondition = 4;
                              });
                              // Handle button 4 press
                              widget.sellFormProvider.condition = condition4;
                            }, isPressed: pressedCondition == 4,
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
                    fontSize: 60,
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
                              setState(() {
                                pressedPropertyType = 1;
                              });
                              // Handle button 1 press
                              widget.sellFormProvider.type = type1;
                            }, isPressed: pressedPropertyType == 1,
                          ),
                        ),
                        SizedBox(width: 16.0), // Adjust the spacing between buttons
                        Expanded(
                          child: _buildMaterialButton(
                            title: type2,
                            onPressed: () {
                              setState(() {
                                pressedPropertyType = 2;
                              });
                              // Handle button 2 press
                              widget.sellFormProvider.type = type2;
                            }, isPressed: pressedPropertyType == 2,
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
                              setState(() {
                                pressedPropertyType = 3;
                              });
                              // Handle button 3 press
                              widget.sellFormProvider.type = type3;

                            }, isPressed: pressedPropertyType == 3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                verticalSpaceLarge,
                Align(
                    alignment: Alignment.centerRight,
                    child: _buildMaterialButton(title: 'NEXT', onPressed: () async {

                      AnalyticsService analyticsService = Provider.of<AnalyticsService>(context,listen: false);
                      analyticsService.analytics.logEvent(name: 'SELL_LOCATION',parameters:{
                        'LOCATION': widget.sellFormProvider.address,
                        'PROPERTY_TYPE':  widget.sellFormProvider.type,
                        'PROPERTY_CONDITION': widget.sellFormProvider.condition
                      });
                      PixelService().trackForms('SELL_LOCATION', {
                        'LOCATION': widget.sellFormProvider.address,
                        'PROPERTY_TYPE':  widget.sellFormProvider.type,
                        'PROPERTY_CONDITION': widget.sellFormProvider.condition
                      });
                      //CHECK FOR CAPTCHA TOKEN
                      navigate(context);
                    }, buttonColor: confirmButtonColor, isPressed: false)),

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
    required bool isPressed,
    Color? buttonColor,
    double? textSize,
  }) {
    final Color? pressedColor =pressedButtonColor;
    return MaterialButton(
      height: 80,
      //round the corners of the button
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 5.0,
      onPressed: onPressed,
      color: isPressed ? pressedColor : buttonColor ?? primaryButtonColor,
      textColor: Colors.white,
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: fontOutfitBold,
          fontSize: textSize ?? (textSize = 25),
        ),
      ),
    );
  }
}
