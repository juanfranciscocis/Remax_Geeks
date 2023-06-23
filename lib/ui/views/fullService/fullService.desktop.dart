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
import 'fullService_viewmodel.dart';

class FullServiceDesktop extends StatefulWidget {

  DBProvider dbProvider;
  SellFormProvider sellFormProvider;
  List<String> premiumTitles;
  List<String> premiumDescriptions;
  String fullServiceIncludes;
  List<String> premiumServices = [];

  FullServiceDesktop({super.key, required this.dbProvider, required this.sellFormProvider, required this.premiumTitles, required this.premiumDescriptions, required this.fullServiceIncludes});

  @override
  State<FullServiceDesktop> createState() => _FullServiceDesktopState();
}

class _FullServiceDesktopState extends State<FullServiceDesktop> {
  List<double> apiPrices = [];

  String averageApiPrice = '';

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
              CardApiInformationDesktop(imagePath: imageAmericanRealState, estimatedPriceApi: formatCurrency(apiPrices[2]),),
              verticalSpaceTiny,
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
                          child: TextField(
                            //get the value from the textfield
                            onChanged: (value) {
                              widget.sellFormProvider.costumerPrice = value as int;
                              print(widget.sellFormProvider.costumerPrice);
                            },
                            decoration: InputDecoration(
                              labelText: enterYourDesiredPriceBox,
                              //label text style
                              labelStyle: TextStyle(
                                color: fontSecondColor,
                                fontFamily: fontOutfitRegular,
                                fontSize: 20,
                              ),
                              filled: true,
                              //fill color red
                              fillColor: inputColor2,
                            ),
                          ),
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
                        CheckBoxAgent(sellFormProvider: widget.sellFormProvider),
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
                    height: 350.0,
                    width: 1000.0,
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0, bottom: 0.0),
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
                  ...widget.premiumTitles.map((e) => CardServices(
                    color: goldCardColor,
                    title: e,
                    description: widget.premiumDescriptions[widget.premiumTitles.indexOf(e)],
                    sellformProvider: widget.sellFormProvider,
                  )).toList(),
                ],
              ),

              verticalSpaceLarge,
              MaterialButton(
                //make it round, and color confirmation
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                color: confirmButtonColor,
                //MAKE THE CONFIRMATION BUTTON USIGN THE CONFIRM IAMGE ASSET
                  child: Container(
                    width: 350,
                    child: Row(
                      children: [
                        //Text outfit medium, font main color, size 30
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            sendInformation,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: fontMainColor,
                              fontFamily: fontOutfitMedium,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Image.asset(
                          confirmForm,
                          height: 100.0,
                          width: 100.0,
                        ),
                      ],
                    ),
                  ),

                  onPressed: () {
                    print('SUBMIT FORM');
                    //TODO: VALIDATE FORM
                  }
              ),
              verticalSpaceLarge,







            ],
          ),
        ),
      ),
    );
  }
}






