import 'package:provider/provider.dart';
import 'package:remax_geeks/services/sendEmail.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/app_constants.dart';
import 'package:remax_geeks/ui/common/app_strings.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:remax_geeks/ui/views/home/home_view.dart';
import 'package:remax_geeks/widgets/services/CardServicesDesktop.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/currencyFormater.dart';
import '../../../providers/dbProvider.dart';
import '../../../providers/sellFormProvider.dart';
import '../../../services/pixelsService.dart';
import '../../../widgets/landingPage/LandingPageDesktopSite.dart';
import '../../../widgets/landingPage/MainDesktopNavBar.dart';
import '../../../widgets/services/forDesktop/CardApiInformationDesktop.dart';
import '../../../widgets/services/forDesktop/CardAverageApiDesktop.dart';
import '../../../widgets/services/CardServices.dart';
import '../../../widgets/services/forDesktop/CardSendAgentDesktop.dart';
import 'fullService_viewmodel.dart';

class FullServiceDesktop extends StatefulWidget {

  DBProvider dbProvider;
  SellFormProvider sellFormProvider;
  List<String> premiumTitles;
  List<String> premiumDescriptions;
  List<String> premiumPrices;

  String fullServiceIncludes;

  FullServiceDesktop({super.key, required this.premiumPrices,required this.dbProvider, required this.sellFormProvider, required this.premiumTitles, required this.premiumDescriptions, required this.fullServiceIncludes});

  @override
  State<FullServiceDesktop> createState() => _FullServiceDesktopState();
}

class _FullServiceDesktopState extends State<FullServiceDesktop> {
  List<String> premiumServices = [];

  bool needAgent = false;

  TextEditingController customPrice = TextEditingController();

  List<double> apiPrices = [];

  //CONTROLLER FOR THE TEXTFIELD
  String averageApiPrice = '';

  late DateTime selectedDateTime;

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        final DateTime combinedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        setState(() {
          selectedDateTime = combinedDateTime;
          String formattedDate = selectedDateTime.toString();
          widget.sellFormProvider.sendAgent = formattedDate;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    apiPrices = widget.sellFormProvider.apiPrices;
    averageApiPrice = formatCurrency(widget.sellFormProvider.getAverage());
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
              CardApiInformationDesktop(imagePath:imageZillow,estimatedPriceApi: formatCurrency(apiPrices[0]),),
              verticalSpaceTiny,
              CardApiInformationDesktop(imagePath: imageRM,estimatedPriceApi: formatCurrency(apiPrices[1])),
              verticalSpaceTiny,
              //CardApiInformationDesktop(imagePath: imageAmericanRealState, estimatedPriceApi: formatCurrency(apiPrices[2]),),
              //verticalSpaceTiny,
              CardAverageApiDesktop(averageApiPrice: averageApiPrice),
              verticalSpaceTiny,
              //Card, with a text centered inside the card, a textfield bellow the text
              //CARD 2
              Center(
                child: Card(
                  color: primaryCardColor,
                  elevation: 10.0,
                  //ROUND CORNERS
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    width: 1000.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        verticalSpaceLarge,
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left:20, right: 20.0),
                            child: Text(
                              sendAgentFullService,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: fontWhiteColor,
                                fontFamily: fontOutfitMedium,
                                fontSize: 50,
                              ),
                            ),
                          ),
                        ),
                        verticalSpaceMedium,
                        _buildMaterialButton(title: 'PICK DATE AND TIME', onPressed: () => _selectDateTime(context),buttonColor: secondaryCardColor, textSize: 20),
                        verticalSpaceLarge,
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
                    width: 1000.0,
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        verticalSpaceMedium,
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0, bottom: 0.0),
                            child: Text(
                              whatYouGet,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: fontWhiteColor,
                                fontFamily: fontOutfitMedium,
                                fontSize: 50,
                              ),
                            ),
                          ),
                        ),
                        verticalSpaceSmall,
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 5.0, left: 40.0, right: 40.0, bottom: 0.0),
                            child: Text(
                              widget.fullServiceIncludes,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: fontWhiteColor,
                                fontFamily: fontOutfitRegular,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                        verticalSpaceMedium,
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



              Wrap(
                alignment: WrapAlignment.center,
                spacing: 16.0, // Adjust the spacing between cards as needed
                children: [
                  // Dynamically create the CardServices based on the titles and descriptions from the API
                  ...widget.premiumTitles.map((e) => CardServicesDesktop(
                    color: goldCardColor,
                    title: e,
                    price: "\$"+widget.premiumPrices[widget.premiumTitles.indexOf(e)],
                    description: widget.premiumDescriptions[widget.premiumTitles.indexOf(e)],
                    sellformProvider: widget.sellFormProvider,
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
                      DBProvider db = Provider.of<DBProvider>(context, listen: false);
                      Map<String,dynamic> data = {
                        'ADDRESS': widget.sellFormProvider.address,
                        'HOUSE_CONDITION': widget.sellFormProvider.condition,
                        'HOUSE_TYPE': widget.sellFormProvider.type,
                        'SERVICE_TYPE': widget.sellFormProvider.serviceType,
                        'API_PRICES': widget.sellFormProvider.apiPrices,
                        'API_AVERAGE_PRICE': averageApiPrice,
                        'NEED_AGENT': widget.sellFormProvider.sendAgent,
                        'PREMIUM_SERVICES': widget.sellFormProvider.getServicesChosen(),
                        'COSTUMER': widget.sellFormProvider.getCostumerInformation(),
                      };
                      await db.setSellingFormData(data);
                      await EmailSender.sendEmail(condition:widget.sellFormProvider.condition,address:widget.sellFormProvider.address,type:widget.sellFormProvider.type,serviceType:widget.sellFormProvider.serviceType,apiPrices: widget.sellFormProvider.apiPrices,averageApiPrice:averageApiPrice,costumerPrice:widget.sellFormProvider.costumerPrice,sendAgent:widget.sellFormProvider.sendAgent,costumerInformation:widget.sellFormProvider.getCostumerInformation(),context: context);

                      PixelService().trackForms('SELL_HOUSE_FORM_FULL_SERVICE', data);
                      showConfirmationDialog(context);
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeView()));
                  }, buttonColor: confirmButtonColor)),
              verticalSpaceLarge,
            ],
          ),
        ),
      ),
    );
  }
  void showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: primaryCardColor,
          title: Text('Thank you for the information...',
          style:TextStyle(
            color: fontWhiteColor,
            fontFamily: fontOutfitBold,
            fontSize: 50,
          )),
          content: Text('An agent will contact you soon!!!',
          style:TextStyle(
            color: fontWhiteColor,
            fontFamily: fontOutfitMedium,
            fontSize: 30,
          )),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(confirmButtonColor),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('OK',
                style:TextStyle(
                  color: fontWhiteColor,
                  fontFamily: fontOutfitBold,
                  fontSize: 30,
                )),
              ),
            ),
          ],
        );
      },
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






