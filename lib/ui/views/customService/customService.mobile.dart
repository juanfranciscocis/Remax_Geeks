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
import '../../../services/pixelsService.dart';
import '../../../services/sendEmail.dart';
import '../../../widgets/landingPage/MainMobileNavBar.dart';
import '../../../widgets/services/CardServices.dart';
import '../../../widgets/services/forDesktop/CardSendAgentDesktop.dart';
import '../../../widgets/services/forMobile/CardApiInformationMobile.dart';
import '../../../widgets/services/forTabletView/CardApiInformationTablet.dart';
import '../../../widgets/services/forTabletView/CardAverageApiTablet.dart';
import '../../common/app_strings.dart';
import '../home/home_view.dart';
import 'customService_viewmodel.dart';

class CustomServiceMobile extends StatefulWidget {

  DBProvider dbProvider;
  SellFormProvider sellFormProvider;
  List<String> customTitles;
  List<String> customDescriptions;
  List<String> customPrices;

  CustomServiceMobile({super.key, required this.customPrices,required this.dbProvider, required this.sellFormProvider, required this.customTitles, required this.customDescriptions});

  @override
  State<CustomServiceMobile> createState() => _CustomServiceMobileState();
}

class _CustomServiceMobileState extends State<CustomServiceMobile> {
  List<double> apiPrices = [];

  String averageApiPrice = '';

  bool needAgent = false;

  TextEditingController customPrice = TextEditingController();


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
                    fontSize: 40,
                  ),
                ),

                verticalSpaceLarge,
                //TODO: API CALL AS A LIST
                CardApiInformationMobile(imagePath:imageZillow,estimatedPriceApi: formatCurrency(apiPrices[0]) ,),
                verticalSpaceTiny,
                CardApiInformationMobile(imagePath: imageRM,estimatedPriceApi: formatCurrency(apiPrices[1]),),
                verticalSpaceTiny,
                //CardApiInformationMobile(imagePath: imageAmericanRealState, estimatedPriceApi: formatCurrency(apiPrices[2]),),
                //verticalSpaceTiny,
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
                      width: 1000.0,
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          verticalSpaceMedium,
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: 20.0, right: 20.0),
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
                          verticalSpaceMedium,
                          //Textfield
                          Padding(
                            padding: EdgeInsets.only(left: 50.0, right: 50.0, bottom: 20.0),
                            child: CustomerPrice(sellFormProvider: widget.sellFormProvider, onTextChanged: (text){
                              widget.sellFormProvider.costumerPrice = text;
                            }),
                          ),
                          verticalSpaceMedium,
                        ],
                      ),
                    ),
                  ),
                ),

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
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                              child: Text(
                                sendAgentCustomService,
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
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: _buildMaterialButton(title: 'PICK DATE AND TIME', onPressed: () => _selectDateTime(context),buttonColor: pressedButtonColor, textSize: 20),
                          ),
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
                    ...widget.customTitles.map((e) => CardServices(price:  "\$"+widget.customPrices[widget.customTitles.indexOf(e)], sellformProvider:widget.sellFormProvider,title: e, description: widget.customDescriptions[widget.customTitles.indexOf(e)], color: primaryCardColor,)).toList(),
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
                          'CUSTOMER_PRICE': widget.sellFormProvider.costumerPrice,
                          'NEED_AGENT': widget.sellFormProvider.sendAgent,
                          'CUSTOM_SERVICES': widget.sellFormProvider.getServicesChosen(),
                          'COSTUMER': widget.sellFormProvider.getCostumerInformation(),
                        };
                        await db.setSellingFormData(data);
                      await EmailSender.sendEmail(condition:widget.sellFormProvider.condition,address:widget.sellFormProvider.address,type:widget.sellFormProvider.type,serviceType:widget.sellFormProvider.serviceType,apiPrices: widget.sellFormProvider.apiPrices,averageApiPrice:averageApiPrice,costumerPrice:widget.sellFormProvider.costumerPrice,sendAgent:widget.sellFormProvider.sendAgent,costumerInformation:widget.sellFormProvider.getCostumerInformation(),context: context);;
                        PixelService().trackForms('SELL_HOUSE_FORM_CUSTOM', data);
                        showConfirmationDialog(context);
                    }, buttonColor: confirmButtonColor)),
                verticalSpaceLarge,












              ],
            ),
        ),
      ),
    ));
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
                fontSize: 20,
              )),
          content: Text('An agent will contact you soon!!!',
              style:TextStyle(
                color: fontWhiteColor,
                fontFamily: fontOutfitMedium,
                fontSize: 15,
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
                      fontSize: 15,
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
          color: fontWhiteColor,
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

