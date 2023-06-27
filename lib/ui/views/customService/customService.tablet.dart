import 'package:provider/provider.dart';
import 'package:remax_geeks/providers/dbProvider.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import '../../../helpers/currencyFormater.dart';
import '../../../providers/sellFormProvider.dart';
import '../../../widgets/landingPage/LandingPageTabletSite.dart';
import '../../../widgets/landingPage/MainTabletNavBar.dart';
import '../../../widgets/services/forDesktop/CardApiInformationDesktop.dart';
import '../../../widgets/services/forDesktop/CardAverageApiDesktop.dart';
import '../../../widgets/services/CardServices.dart';
import '../../../widgets/services/forDesktop/CardSendAgentDesktop.dart';
import '../../../widgets/services/forTabletView/CardApiInformationTablet.dart';
import '../../../widgets/services/forTabletView/CardAverageApiTablet.dart';
import '../../common/app_strings.dart';
import '../home/home_view.dart';
import 'customService_viewmodel.dart';

class CustomServiceTablet extends ViewModelWidget<CustomServiceViewModel> {

  DBProvider dbProvider;
  SellFormProvider sellFormProvider;
  List<String> customTitles;
  List<String> customDescriptions;
  List<double> apiPrices = [];
  String averageApiPrice = '';
  bool needAgent = false;
  TextEditingController customPrice = TextEditingController();

  CustomServiceTablet({super.key, required this.dbProvider, required this.sellFormProvider, required this.customTitles, required this.customDescriptions});

  @override
  Widget build(BuildContext context, CustomServiceViewModel viewModel) {
    apiPrices = sellFormProvider.apiPrices;
    averageApiPrice = formatCurrency(sellFormProvider.getAverage());

    return  Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  verticalSpaceLarge,
                  // A CARD, WITH 1 IMAGE AT THE LEFT INSIDE THE CARD, 1 TEXT ON THE RIGHT INSIDE THE CARD AND FINIALY ANOTHER TEXT BELOW CENTERED INSIDE THE CARD
                  //CARD 1
                  Text(
                    thisIsWhatWeFound,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: fontMainColor,
                      fontFamily: fontOutfitBold,
                      fontSize: 60,
                    ),
                  ),

                  verticalSpaceLarge,
                  //TODO: API CALL AS A LIST
                  CardApiInformationTablet(imagePath:imageZillow,estimatedPriceApi: formatCurrency(apiPrices[0]) ,),
                  verticalSpaceTiny,
                  CardApiInformationTablet(imagePath: imageRM,estimatedPriceApi: formatCurrency(apiPrices[1]),),
                  verticalSpaceTiny,
                  //CardApiInformationTablet(imagePath: imageAmericanRealState, estimatedPriceApi: formatCurrency(apiPrices[2]),),
                  //verticalSpaceTiny,
                  CardAverageApiTablet(averageApiPrice: averageApiPrice),
                  verticalSpaceTiny,
                  //Card, with a text centered inside the card, a textfield bellow the text
                  //CARD 2
                  Center(
                    child: Card(
                      color: secondaryCardColor,
                      elevation: 10.0,
                      //ROUND CORNERS
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        height: 325.0,
                        width: 1000.0,
                        child:  Column(
                          children: [
                            const Center(
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  enterYourDesiredPrice,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: fontWhiteColor,
                                    fontFamily: fontOutfitMedium,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                            //Textfield
                            Padding(
                              padding: EdgeInsets.only(left: 100.0, right: 100.0),
                              child: CustomerPrice(sellFormProvider: sellFormProvider,onTextChanged: (text){
                                sellFormProvider.costumerPrice = text;
                              }),
                            ),
                            Center(
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  sendAgent,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: fontWhiteColor,
                                    fontFamily: fontOutfitMedium,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                            //checkbox, when checked color confirmation, else main color
                            CheckBoxAgent(sellFormProvider: sellFormProvider, isButtonDisabled: needAgent,),
                          ],
                        ),
                      ),
                    ),
                  ),

                  verticalSpaceMedium,
                  //add a text color main, outfit bold
                  Text(
                    addCustomServices,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: fontMainColor,
                      fontFamily: fontOutfitBold,
                      fontSize: 60,
                    ),
                  ),
                  verticalSpaceMedium,

                  //A row of three cards, color will be gold, with a title a description and a checkbox centered
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...customTitles.map((e) => CardServices(
                        sellformProvider: sellFormProvider,
                        title: e,
                        description: customDescriptions[customTitles.indexOf(e)], color: primaryCardColor,
                      )),
                    ],
                  ),
                  verticalSpaceLarge,
                  Align(
                      alignment: Alignment.centerRight,
                      child: _buildMaterialButton(title: 'SEND INFORMATION', onPressed: () async {
                        String enteredText = customPrice.text;
                        print('Entered text: $enteredText');

                        // VERIFY ADDRESS, BUTTONS PRESS AND GO TO NEXT PAGE
                        if (sellFormProvider.costumerPrice != "0") {
                          DBProvider db = Provider.of<DBProvider>(context, listen: false);
                          Map<String,dynamic> data = {
                            'ADDRESS': sellFormProvider.address,
                            'HOUSE_CONDITION': sellFormProvider.condition,
                            'HOUSE_TYPE': sellFormProvider.type,
                            'SERVICE_TYPE': sellFormProvider.serviceType,
                            'API_PRICES': sellFormProvider.apiPrices,
                            'API_AVERAGE_PRICE': averageApiPrice,
                            'CUSTOMER_PRICE': sellFormProvider.costumerPrice,
                            'NEED_AGENT': sellFormProvider.sendAgent,
                            'CUSTOM_SERVICES': sellFormProvider.getServicesChosen(),
                            'COSTUMER': sellFormProvider.getCostumerInformation(),
                          };
                          await db.setSellingFormData(data);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeView()));
                        } else {
                          // SHOW ERROR MESSAGE
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Please fill Custom Price',
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

class CustomerPrice extends StatelessWidget {

  final SellFormProvider sellFormProvider;
  final ValueChanged<String> onTextChanged;


  CustomerPrice({
    super.key,
    required this.onTextChanged,
    required this.sellFormProvider,
  });



  @override
  Widget build(BuildContext context) {
    return TextField(
      //get the value from the textfield
      onChanged: onTextChanged,
      decoration: InputDecoration(
        labelText: enterYourDesiredPriceBox,
        //label text style
        labelStyle: TextStyle(
          color: fontSecondColor,
          fontFamily: fontOutfitRegular,
          fontSize: 15,
        ),
        filled: true,
        //fill color red
        fillColor: inputColor2,
      ),
    );
  }
}
