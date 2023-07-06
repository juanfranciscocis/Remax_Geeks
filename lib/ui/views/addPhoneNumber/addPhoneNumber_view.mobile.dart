import 'package:provider/provider.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:remax_geeks/widgets/landingPage/LandingPageMobileSite.dart';
import 'package:stacked/stacked.dart';

import '../../../providers/costumerProvider.dart';
import '../../../providers/dbProvider.dart';
import '../../../providers/sellFormProvider.dart';
import '../../../services/authEmailPassword.dart';
import '../../../services/authFacebook.dart';
import '../../../services/authGoogle.dart';
import '../../../widgets/landingPage/MainMobileNavBar.dart';
import '../../common/app_constants.dart';
import '../../common/app_strings.dart';
import '../customService/customService_view.dart';
import '../fullService/fullService_view.dart';
import '../logIn/logIn_view.desktop.dart';
import '../signUp/singUp_view.dart';
import 'addPhoneNumber_view.desktop.dart';
import 'addPhoneNumber_viewmodel.dart';

class AddPhoneNumberMobile extends ViewModelWidget<AddPhoneNumberViewModel> {
  bool isGoogle = false;
  AddPhoneNumberMobile({super.key, required this.isGoogle});

  @override
  Widget build(BuildContext context, AddPhoneNumberViewModel viewModel) {
    CostumerProvider costumer = Provider.of<CostumerProvider>(context);
    AuthManager auth = Provider.of<AuthManager>(context);
    AuthGoogle authGoogle = Provider.of<AuthGoogle>(context);
    AuthFacebook authFacebook = Provider.of<AuthFacebook>(context);
    SellFormProvider sellForm = Provider.of<SellFormProvider>(context);
    DBProvider db = Provider.of<DBProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Align(
                alignment: Alignment.center,
                child: Card(
                  color: Colors.white,
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  margin: EdgeInsets.all(50.0),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "One More Thing...",
                            style: TextStyle(
                              color: fontMainColor,
                              fontFamily: fontOutfitBold,
                              fontSize: 30,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        verticalSpaceMedium,
                        TextWidget(
                          text: "Please enter your phone so that we can contact you:",
                          color: fontMainColor,
                          fontFamily: fontOutfitMedium,
                          fontSize: 20,
                        ),
                        verticalSpaceSmall,
                        TextFieldWidget(
                          labelText: "Phone Number...",
                          labelColor: fontMainColor,
                          labelFontFamily: fontOutfitRegular,
                          labelFontSize: 15,
                          enabledBorderColor: fontMainColor,
                          filled: true,
                          fillColor: inputColor,
                          textColor: fontMainColor,
                          textFontFamily: fontOutfitRegular,
                          textFontSize: 15,
                          onChanged: (value) {
                            costumer.phoneNumber = value;
                          },
                        ),
                        verticalSpaceMedium,
                        Align(
                          alignment: Alignment.center,
                          child: MaterialButton(
                            height: 15,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            elevation: 5.0,
                            onPressed: () async {
                              if(costumer.phoneNumber != '') {
                                String serviceChoose = sellForm.serviceType;
                                if(this.isGoogle){
                                  Map<String, dynamic> newCostumer = {
                                    'EMAIL': costumer.email,
                                    'FULL_NAME': costumer.fullName,
                                    'PHONE_NUMBER': costumer.phoneNumber,
                                    'UID': authGoogle.user?.uid.toString(),
                                  };
                                  db.setNewCostumer(newCostumer);
                                }else{
                                  Map<String, dynamic> newCostumer = {
                                    'EMAIL': costumer.email,
                                    'FULL_NAME': costumer.fullName,
                                    'PHONE_NUMBER': costumer.phoneNumber,
                                    'UID': authFacebook.uid,
                                  };
                                  db.setNewCostumer(newCostumer);
                                }
                                sellForm.costumer = costumer.costumer;
                                if (serviceChoose ==
                                    chooseServiceTypeCard1Title) {
                                  Navigator.of(context).pushNamed("/fullService");
                                } else {
                                  Navigator.of(context).pushNamed("/customService");
                                }
                              } else {
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
                            },
                            color: primaryButtonColor,
                            textColor: fontWhiteColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  fontFamily: fontOutfitBold,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ),

                        verticalSpaceSmall,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

