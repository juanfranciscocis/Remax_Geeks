import 'package:flutter/physics.dart';
import 'package:provider/provider.dart';
import 'package:remax_geeks/providers/dbProvider.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:remax_geeks/widgets/landingPage/LandingPageMobileSite.dart';
import 'package:remax_geeks/widgets/services/forMobile/CardAverageApiMobile.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/currencyFormater.dart';
import '../../../providers/sellFormProvider.dart';
import '../../../widgets/landingPage/MainMobileNavBar.dart';
import '../../../widgets/services/CardServices.dart';
import '../../../widgets/services/forDesktop/CardSendAgentDesktop.dart';
import '../../../widgets/services/forMobile/CardApiInformationMobile.dart';
import '../../../widgets/services/forTabletView/CardApiInformationTablet.dart';
import '../../../widgets/services/forTabletView/CardAverageApiTablet.dart';
import '../../common/app_strings.dart';
import '../home/home_view.dart';
import 'fullService_viewmodel.dart';

class FullServiceMobile extends ViewModelWidget<FullServiceViewModel> {

  DBProvider dbProvider;
  SellFormProvider sellFormProvider;
  List<String> premiumTitles;
  List<String> premiumDescriptions;
  String fullServiceIncludes;
  List<double> apiPrices = [];
  String averageApiPrice = '';
  bool needAgent = false;
  TextEditingController customPrice = TextEditingController();


  FullServiceMobile({super.key, required this.dbProvider, required this.sellFormProvider, required this.premiumTitles, required this.premiumDescriptions, required this.fullServiceIncludes});

  @override
  Widget build(BuildContext context, FullServiceViewModel viewModel) {
    apiPrices = sellFormProvider.apiPrices;
    averageApiPrice = formatCurrency(sellFormProvider.getAverage());
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
                CardApiInformationMobile(imagePath:imageZillow,estimatedPriceApi: formatCurrency(apiPrices[0]) ,),
                verticalSpaceTiny,
                CardApiInformationMobile(imagePath: imageRM,estimatedPriceApi: formatCurrency(apiPrices[1]),),
                verticalSpaceTiny,
                CardApiInformationMobile(imagePath: imageAmericanRealState, estimatedPriceApi: formatCurrency(apiPrices[2]),),
                verticalSpaceTiny,
                CardAverageApiMobile(averageApiPrice: averageApiPrice),
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
                      height: 500.0,
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
                            padding: EdgeInsets.only(left: 50.0, right: 50.0),
                            child: CustomerPrice(sellFormProvider: sellFormProvider, onTextChanged: (text){
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
                          CheckBoxAgent(sellFormProvider: sellFormProvider, isButtonDisabled: needAgent, textSize: 60,text: '           ',),
                        ],
                      ),
                    ),
                  ),
                ),
                verticalSpaceTiny,

                //another card, centered, color main card, with a title and a description
                //CARD 3
                Center(
                  child: Card(
                    color: primaryCardColor,
                    elevation: 10.0,
                    //ROUND CORNERS
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Container(
                      height: 800.0,
                      width: 1000.0,
                      child:  Column(
                        children: [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 0.0),
                              child: Text(
                                whatYouGet,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: fontWhiteColor,
                                  fontFamily: fontOutfitMedium,
                                  fontSize: 50,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0, bottom: 0.0),
                              child: Text(
                                fullServiceIncludes,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: fontWhiteColor,
                                  fontFamily: fontOutfitRegular,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),



                verticalSpaceMedium,
                //add a text color main, outfit bold
                Text(
                  addPremiumServices,
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
                    ...premiumTitles.map((e) => CardServices(sellformProvider: sellFormProvider,title: e, description: premiumDescriptions[premiumTitles.indexOf(e)], color: goldCardColor,)).toList(),
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
                          'PREMIUM_SERVICES': sellFormProvider.getServicesChosen(),
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
    ));
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
      //controller: customPrice,
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

