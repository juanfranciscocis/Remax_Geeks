import 'package:provider/provider.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/app_constants.dart';
import 'package:remax_geeks/ui/common/app_strings.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../providers/dbProvider.dart';
import '../../../providers/sellFormProvider.dart';
import '../../../widgets/landingPage/LandingPageDesktopSite.dart';
import '../../../widgets/landingPage/MainDesktopNavBar.dart';
import '../../../widgets/services/forDesktop/CardApiInformationDesktop.dart';
import '../../../widgets/services/forDesktop/CardAverageApiDesktop.dart';
import '../../../widgets/services/CardServices.dart';
import '../../../widgets/services/forDesktop/CardSendAgentDesktop.dart';
import 'customService_viewmodel.dart';

class CustomServiceDesktop extends StatelessWidget {

  DBProvider dbProvider;
  SellFormProvider sellFormProvider;
  String averageApiPrice = '\$100,000.00'; //TODO: API CALL AVERAGE PRICE
  String titleCard = 'Title'; //TODO: DB CALL
  String descriptionCard = 'Description'; //TODO: DB CALL
  CustomServiceDesktop({super.key, required this.dbProvider, required this.sellFormProvider});

  @override
  Widget build(BuildContext context) {
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
              CardApiInformationDesktop(imagePath:imageZillow,estimatedPriceApi: '\$100,000.00' ,),
              verticalSpaceTiny,
              CardApiInformationDesktop(imagePath: imageRM,estimatedPriceApi: '\$100,000.00',),
              verticalSpaceTiny,
              CardApiInformationDesktop(imagePath: imageAmericanRealState, estimatedPriceApi: '\$100,000.00',),
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
                              sellFormProvider.costumerPrice = value as int;
                              print(sellFormProvider.costumerPrice);
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
                        CheckBoxAgent(sellFormProvider: sellFormProvider),
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


              //TODO: MAKE IT DYNAMIC
              //A row of three cards, color will be gold, with a title a description and a checkbox centered
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //3 cards, smaller ones
                  //CARD 4
                  //TODO: READ FROM API TITLE AND DESCRIPTION

                  Expanded(child: CardServices(color: primaryCardColor, title: titleCard, description: descriptionCard,)),
                  Expanded(child: CardServices(color: primaryCardColor, title: titleCard, description: descriptionCard,)),
                  Expanded(child: CardServices(color: primaryCardColor, title: titleCard, description: descriptionCard,)),
                ],
              ),
              //A row of three cards, color will be gold, with a title a description and a checkbox centered
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //3 cards, smaller ones
                  //CARD 4
                  //TODO: READ FROM API TITLE AND DESCRIPTION

                  Expanded(child: CardServices(color: primaryCardColor, title: titleCard, description: descriptionCard,)),
                  Expanded(child: CardServices(color: primaryCardColor, title: titleCard, description: descriptionCard,)),
                  Expanded(child: CardServices(color: primaryCardColor, title: titleCard, description: descriptionCard,)),
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






