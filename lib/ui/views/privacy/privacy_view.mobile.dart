import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/app_constants.dart';
import 'package:remax_geeks/ui/common/app_strings.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:remax_geeks/ui/views/logIn/logIn_viewmodel.dart';
import 'package:remax_geeks/ui/views/privacy/privacy_viewmodel.dart';
import 'package:remax_geeks/ui/views/signUp/signUp_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/authHelpers.dart';
import '../../../providers/costumerProvider.dart';
import '../../../providers/dbProvider.dart';
import '../../../providers/sellFormProvider.dart';
import '../../../services/authEmailPassword.dart';
import '../../../services/authFacebook.dart';
import '../../../services/authGoogle.dart';
import '../../../widgets/landingPage/LandingPageDesktopSite.dart';
import '../../../widgets/landingPage/MainDesktopNavBar.dart';
import '../../../widgets/privacy/headingsAndDescriptions.dart';
import '../addPhoneNumber/addPhoneNumber_view.dart';

class PrivacyViewMobile extends ViewModelWidget<PrivacyViewModel> {

  List<String> headings = [privacyHeading1,privacyHeading2,privacyHeading3,privacyHeading4,privacyHeading5,privacyHeading6,privacyHeading7];
  List<String> descriptions= [privacyDescription1,privacyDescription2,privacyDescription3,privacyDescription4,privacyDescription5,privacyDescription6,privacyDescription7];

  @override
  Widget build(BuildContext context, PrivacyViewModel viewModel) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpaceLarge,
            // TITLE, OUTFITBOLD, FONTMAINCOLOR
            Align(
              alignment: Alignment.center,
              child: Text(
                privacyTitle,
                style: TextStyle(
                  fontFamily: fontOutfitBold,
                  fontSize: 50,
                  color: fontMainColor,
                ),
              ),
            ),
            verticalSpaceMedium,
            // SUBTITLE OF TITLE, OUTFITREGULAR, FONTMAINCOLOR
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              width: 800,
              child: Text(
                privacyTitleDescription,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: fontOutfitBold,
                  fontSize: 25,
                  color: fontMainColor,
                ),
              ),
            ),
            verticalSpaceMedium,
            ...headings.map((e) => HeadingAndDescription(heading: e,description: descriptions[headings.indexOf(e)],)).toList(),
            verticalSpaceLarge,

          ],
        ),
      ),
    );
  }
}
