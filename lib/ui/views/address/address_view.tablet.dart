import 'package:provider/provider.dart';
import 'package:remax_geeks/providers/dbProvider.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../providers/sellFormProvider.dart';
import '../../../services/GooglePlacesService.dart';
import '../../../services/realtyMoleService.dart';
import '../../../widgets/landingPage/LandingPageTabletSite.dart';
import '../../../widgets/landingPage/MainTabletNavBar.dart';
import '../../common/app_strings.dart';
import '../chooseServiceType/chooseServiceType_view.dart';
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

  _AddressViewTabletState({required this.sellFormProvider});

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
                              buttonColor: fontMainColor,
                              textSize: 30,
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
                              textSize: 30,
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
                              textSize: 30,
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
                              // Handle button 1 press
                              widget.sellFormProvider.condition = condition1;
                            },
                          ),
                        ),
                        SizedBox(width: 16.0), // Adjust the spacing between buttons
                        Expanded(
                          child: _buildMaterialButton(
                            title: condition2,
                            onPressed: () {
                              // Handle button 2 press
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
                              // Handle button 3 press
                              widget.sellFormProvider.condition = condition3;
                            },
                          ),
                        ),
                        SizedBox(width: 16.0), // Adjust the spacing between buttons
                        Expanded(
                          child: _buildMaterialButton(
                            title: condition4,
                            onPressed: () {
                              // Handle button 4 press
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
                              // Handle button 1 press
                              widget.sellFormProvider.type = type1;
                            },
                          ),
                        ),
                        SizedBox(width: 16.0), // Adjust the spacing between buttons
                        Expanded(
                          child: _buildMaterialButton(
                            title: type2,
                            onPressed: () {
                              // Handle button 2 press
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
                              // Handle button 3 press
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
                    child: _buildMaterialButton(title: 'NEXT', onPressed: () async {
                      // VERIFY ADDRESS, BUTTONS PRESS AND GO TO NEXT PAGE
                      if (sellFormProvider.address != '' && sellFormProvider.condition != '' && sellFormProvider.type != '') {
                        RealtyMoleService realty = RealtyMoleService();
                        await realty.getPrice(sellFormProvider.address);
                        List<double> prices = [0,0,0];
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
      height: 80,
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
          fontSize: textSize ?? (textSize = 25),
        ),
      ),
    );
  }
}
