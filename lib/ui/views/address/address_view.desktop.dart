
import 'package:g_recaptcha_v3/g_recaptcha_v3.dart';
import 'package:provider/provider.dart';
import 'package:remax_geeks/services/realtyMoleService.dart';
import 'package:remax_geeks/services/zillowService.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/app_constants.dart';
import 'package:remax_geeks/ui/common/app_strings.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:remax_geeks/ui/views/home/home_view.dart';
import 'package:stacked/stacked.dart';

import '../../../providers/dbProvider.dart';
import '../../../providers/sellFormProvider.dart';
import '../../../services/GooglePlacesService.dart';
import '../../../widgets/landingPage/LandingPageDesktopSite.dart';
import '../../../widgets/landingPage/MainDesktopNavBar.dart';
import '../chooseServiceType/chooseServiceType_view.dart';
import 'address_viewmodel.dart';


class AddressViewDesktop extends StatefulWidget {
  DBProvider dbProvider;
  SellFormProvider sellFormProvider;

  AddressViewDesktop({super.key, required this.dbProvider, required this.sellFormProvider});

  @override
  State<AddressViewDesktop> createState() => _AddressViewDesktopState(sellFormProvider: sellFormProvider);
}

class _AddressViewDesktopState extends State<AddressViewDesktop> {
  late GooglePlacesService google;
  TextEditingController addressController = TextEditingController();
  SellFormProvider sellFormProvider;
  int pressedCondition = -1;
  int pressedPropertyType = -1;

  _AddressViewDesktopState({required this.sellFormProvider});

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
                  // MAKE GOOGLE API CALL TO GET ADDRESS SUGGESTIONS
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
                            buttonColor: fontMainColor,
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
                            buttonColor: fontMainColor,
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
                            buttonColor: fontMainColor,
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
                            setState(() {
                              pressedCondition = 0; // Update with the corresponding button index
                              // FILL SELLING FORM
                              widget.sellFormProvider.condition = condition1;
                            });
                            // FILL SELLING FORM
                          }, isPressed: pressedCondition == 0,
                        ),
                      ),
                      SizedBox(width: 16.0), // Adjust the spacing between buttons
                      Expanded(
                        child: _buildMaterialButton(
                          title: condition2,
                          onPressed: () {
                            setState(() {
                              pressedCondition = 1; // Update with the corresponding button index
                            });
                            // FILL SELLING FORM
                            widget.sellFormProvider.condition = condition2;
                          }, isPressed: pressedCondition == 1,
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
                              pressedCondition = 2; // Update with the corresponding button index
                            });
                            // FILL SELLING FORM
                            widget.sellFormProvider.condition = condition3;
                          }, isPressed: pressedCondition == 2,
                        ),
                      ),
                      SizedBox(width: 16.0), // Adjust the spacing between buttons
                      Expanded(
                        child: _buildMaterialButton(
                          title: condition4,
                          onPressed: () {
                            setState(() {
                              pressedCondition = 3; // Update with the corresponding button index
                            });
                            // FILL SELLING FORM
                            widget.sellFormProvider.condition = condition4;
                          }, isPressed: pressedCondition == 3,
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
                            setState(() {
                              pressedPropertyType = 0; // Update with the corresponding button index
                            });
                            // FIll SELLING FORM
                            widget.sellFormProvider.type = type1;
                          }, isPressed: pressedPropertyType == 0,
                        ),
                      ),
                      SizedBox(width: 16.0), // Adjust the spacing between buttons
                      Expanded(
                        child: _buildMaterialButton(
                          title: type2,
                          onPressed: () {
                            setState(() {
                              pressedPropertyType = 1; // Update with the corresponding button index
                            });
                            // FIll SELLING FORM
                            widget.sellFormProvider.type = type2;
                          }, isPressed: pressedPropertyType == 1,
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
                              pressedPropertyType = 2; // Update with the corresponding button index
                            });
                            //FILL SELLING FORM
                            widget.sellFormProvider.type = type3;
                          }, isPressed: pressedPropertyType == 2,
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

                    //CHECK FOR CAPTCHA TOKEN

                    if (await getCaptcha() == 'NULL'){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeView()));
                    }




                    // VERIFY ADDRESS, BUTTONS PRESS AND GO TO NEXT PAGE
                    if (sellFormProvider.address != '' && sellFormProvider.condition != '' && sellFormProvider.type != '') {
                      RealtyMoleService realty = RealtyMoleService();
                      await realty.getPrice(sellFormProvider.address);
                      ZillowService zillow = ZillowService();
                      await zillow.getPrice(sellFormProvider.address);
                      List<double> prices = [0,0];
                      prices[0] = zillow.price;
                      prices[1] = realty.price;
                      sellFormProvider.apiPrices = prices;
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
                  }, buttonColor: confirmButtonColor, isPressed: false)),
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
    required bool isPressed,
    Color? buttonColor,
    double? textSize,
  }) {
    const Color? pressedColor =pressedButtonColor; // Change to the desired pressed color

    return MaterialButton(
      height: 80,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 5.0,
      onPressed: onPressed,
      color: isPressed ? pressedColor : buttonColor ?? primaryButtonColor,
      textColor: fontWhiteColor,
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: fontOutfitBold,
          fontSize: textSize ?? 30,
        ),
      ),
    );
  }

  Future<String> getCaptcha() async {
    String token = await GRecaptchaV3.execute('submit') ?? 'NULL';
    return token;
  }


}


