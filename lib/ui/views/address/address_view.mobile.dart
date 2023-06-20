import 'package:remax_geeks/providers/dbProvider.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:remax_geeks/widgets/landingPage/LandingPageMobileSite.dart';
import 'package:stacked/stacked.dart';

import '../../../providers/sellFormProvider.dart';
import '../../../widgets/landingPage/MainMobileNavBar.dart';
import '../../common/app_strings.dart';
import 'address_viewmodel.dart';

class AddressViewMobile extends ViewModelWidget<AddressViewModel> {

  DBProvider dbProvider;
  SellFormProvider sellFormProvider;

  AddressViewMobile({super.key, required this.dbProvider, required this.sellFormProvider});

  @override
  Widget build(BuildContext context, AddressViewModel viewModel) {
    return  Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //ADD A TITLE IN THE TOP OF THE SCREEN, fontPrimaryColor, OutfitBold
                const Text(
                  addressLocationOfProperty,
                  style: TextStyle(
                    color: fontMainColor,
                    fontFamily: fontOutfitBold,
                    fontSize: 50,
                  ),
                ),
                verticalSpaceMedium,
                const TextField(
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
                verticalSpaceLarge,
                //add another title adressCondition, fontPrimaryColor, OutfitBold
                const Text(
                  addressCondition,
                  style: TextStyle(
                    color: fontMainColor,
                    fontFamily: fontOutfitBold,
                    fontSize: 50,
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
                            //ADD NEW/EXCELLENT TO THE FORM PROVIDER
                            sellFormProvider.condition = condition1;
                            print(sellFormProvider.condition);
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              condition1,
                              style: TextStyle(
                                color: fontWhiteColor,
                                fontFamily: fontOutfitMedium,
                                fontSize: 20,
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
                            //ADD GOOD TO THE FORM PROVIDER
                            sellFormProvider.condition = condition2;
                            print(sellFormProvider.condition);
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              condition2,
                              style: TextStyle(
                                color: fontWhiteColor,
                                fontFamily: fontOutfitMedium,
                                fontSize: 20,
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
                          //ADD FAIR TO THE FORM PROVIDER
                          sellFormProvider.condition = condition3;
                          print(sellFormProvider.condition);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            condition3,
                            style: TextStyle(
                              color: fontWhiteColor,
                              fontFamily: fontOutfitMedium,
                              fontSize: 20,
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
                          //ADD POOR TO THE FORM PROVIDER
                          sellFormProvider.condition = condition4;
                          print(sellFormProvider.condition);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            condition4,
                            style: TextStyle(
                              color: fontWhiteColor,
                              fontFamily: fontOutfitMedium,
                              fontSize: 20,
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
                    fontSize: 50,
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
                            //ADD RESIDENTIAL TO THE FORM PROVIDER
                            sellFormProvider.type = type1;
                            print(sellFormProvider.type);
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              type1,
                              style: TextStyle(
                                color: fontWhiteColor,
                                fontFamily: fontOutfitMedium,
                                fontSize: 20,
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
                            //ADD COMMERCIAL TO THE FORM PROVIDER
                            sellFormProvider.type = type2;
                            print(sellFormProvider.type);
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              type2,
                              style: TextStyle(
                                color: fontWhiteColor,
                                fontFamily: fontOutfitMedium,
                                fontSize: 20,
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
                          //ADD LAND TO THE FORM PROVIDER
                          sellFormProvider.type = type3;
                          print(sellFormProvider.type);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            type3,
                            style: TextStyle(
                              color: fontWhiteColor,
                              fontFamily: fontOutfitMedium,
                              fontSize: 20,
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
                    onPressed: () async {
                      print('NEXT PART OF THE FORM PRESSED');
                      Map<String, dynamic> data = {
                        'ADDRESS': sellFormProvider.address,
                        'CONDITION': sellFormProvider.condition,
                        'TYPE': sellFormProvider.type,
                      };
                      await dbProvider.setSellingFormData(data);
                      await dbProvider.incrementNumberOfCostumers();
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
            ],
            ),
        ),
      ),
    ));
  }
}

