import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remax_geeks/helpers/getLearnMorePaths.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/app_constants.dart';
import 'package:remax_geeks/ui/common/app_strings.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import '../../../providers/costumerProvider.dart';
import '../../../providers/dbProvider.dart';
import '../../../providers/sellFormProvider.dart';
import '../../../services/authEmailPassword.dart';
import '../../../services/authFacebook.dart';
import '../../../services/authGoogle.dart';
import '../../../widgets/landingPage/LandingPageDesktopSite.dart';
import '../../../widgets/landingPage/MainDesktopNavBar.dart';
import '../addPhoneNumber/addPhoneNumber_view.dart';
import '../customService/customService_view.dart';
import '../fullService/fullService_view.dart';
import '../signUp/singUp_view.dart';
import 'learnMore_viewmodel.dart';

class LearnMoreViewDesktop extends ViewModelWidget<LearnMoreViewModel> {

  List<String> paths = [];
  LearnMoreViewDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, LearnMoreViewModel viewModel) {
    DBProvider db = Provider.of<DBProvider>(context, listen: false);
    paths = getLearnMorePaths();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              verticalSpaceLarge,
              //for each path in paths create a article
              ...paths.map((e) => Padding(
                padding: const EdgeInsets.only(left:100, right: 100, bottom: 50),
                child: learnMoreArticle(
                  title: 'Title1',
                  subtitle: 'Subtitle',
                  imagePath: e,
                ),
              )),
            ],




          ),
        ),
      ),
    );
  }
}



class learnMoreArticle extends StatelessWidget {

  String title = 'Title';
  String subtitle = 'Subtitle';
  String imagePath = 'path';
  learnMoreArticle({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: navColor,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 200,
              height: 200,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: fontOutfitBold,
                    color: fontMainColor,

                  ),
                ),
                Text(subtitle,
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: fontOutfitMedium,
                    color: fontMainColor,
                  ),
                ),
              ],
            ),
          ),
      ],
      ),
    );
  }
}

// Rest of the code...
