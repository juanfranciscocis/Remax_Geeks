import 'package:provider/provider.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/app_constants.dart';
import 'package:remax_geeks/ui/common/app_strings.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/currencyFormater.dart';
import '../../../providers/dbProvider.dart';
import '../../../providers/sellFormProvider.dart';
import '../../../widgets/landingPage/LandingPageDesktopSite.dart';
import '../../../widgets/landingPage/MainDesktopNavBar.dart';
import '../../../widgets/services/forDesktop/CardApiInformationDesktop.dart';
import '../../../widgets/services/forDesktop/CardAverageApiDesktop.dart';
import '../../../widgets/services/CardServices.dart';
import '../../../widgets/services/forDesktop/CardSendAgentDesktop.dart';
import '../home/home_view.dart';
import 'customService_viewmodel.dart';

class CustomServiceDesktop extends StatelessWidget {

  DBProvider dbProvider;
  SellFormProvider sellFormProvider;
  List<String> customTitles;
  List<String> customDescriptions;
  List<double> apiPrices = [];
  String averageApiPrice = '';
  bool needAgent = false;
  TextEditingController customPrice = TextEditingController();

  CustomServiceDesktop({super.key, required this.dbProvider, required this.sellFormProvider, required this.customTitles, required this.customDescriptions});

  @override
  Widget build(BuildContext context) {
    apiPrices = sellFormProvider.apiPrices;
    averageApiPrice = formatCurrency(sellFormProvider.getAverage());

    return  Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 100.0, right: 100.0),
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
              CardApiInformationDesktop(imagePath:imageZillow,estimatedPriceApi: formatCurrency(apiPrices[0]) ,),
              verticalSpaceTiny,
              CardApiInformationDesktop(imagePath: imageRM,estimatedPriceApi: formatCurrency(apiPrices[1]),),
              verticalSpaceTiny,
              //CardApiInformationDesktop(imagePath: imageAmericanRealState, estimatedPriceApi: formatCurrency(apiPrices[2]),),
              //verticalSpaceTiny,
              CardAverageApiDesktop(averageApiPrice: averageApiPrice),
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
                    height: 350.0,
                    width: 1000.0,
                    child:  Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              enterYourDesiredPrice,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: fontWhiteColor,
                                fontFamily: fontOutfitMedium,
                                fontSize: 40,
                              ),
                            ),
                          ),
                        ),
                        //Textfield
                        Padding(
                          padding: EdgeInsets.only(left: 200.0, right: 200.0),
                          child: CustomerPrice(sellFormProvider: sellFormProvider,onTextChanged: (text){
                            sellFormProvider.costumerPrice = text;
                          },),
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
                                fontSize: 40,
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
              //MAKE IT DYNAMIC, READ FROM DB, 3 CARDS IN A ROW

              Wrap(
                alignment: WrapAlignment.center,
                spacing: 16.0, // Adjust the spacing between cards as needed
                children: [
                  // Dynamically create the CardServices based on the titles and descriptions from the API
                  ...customTitles.map((e) => CardServices(
                    sellformProvider: sellFormProvider,
                    color: primaryCardColor,
                    title: e,
                    description: customDescriptions[customTitles.indexOf(e)],
                  )).toList(),
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
      // round the corners of the button
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 5.0,
      onPressed: onPressed,
      color: buttonColor ?? (buttonColor = primaryButtonColor),
      textColor: Colors.white,
      child: Text(
        title,
        maxLines: 1, // Set maxLines to 1
        overflow: TextOverflow.ellipsis, // Set overflow to TextOverflow.ellipsis
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: fontOutfitBold,
          fontSize: textSize ?? (textSize = 30),
        ),
      ),
    );
  }

}

class CustomerPrice extends StatefulWidget {

  SellFormProvider sellFormProvider;
  final ValueChanged<String> onTextChanged;

  CustomerPrice({
    super.key,
    required this.sellFormProvider,
    required this.onTextChanged,
  });



  @override
  State<CustomerPrice> createState() => _CustomerPriceState();
}

class _CustomerPriceState extends State<CustomerPrice> {




  @override
  Widget build(BuildContext context) {
    return TextField(
      //onChanged: (value) => setCustomPrice(),
      onChanged: widget.onTextChanged,
      decoration: InputDecoration(
        labelText: enterYourDesiredPriceBox,
        labelStyle: TextStyle(
          color: fontSecondColor,
          fontFamily: fontOutfitRegular,
          fontSize: 20,
        ),
        filled: true,
        fillColor: inputColor2,
      ),
    );
  }
}






