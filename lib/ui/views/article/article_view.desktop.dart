import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remax_geeks/models/article.dart';
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
import 'article_viewmodel.dart';

class ArticleViewDesktop extends StatefulWidget {

  late final Article article;

  ArticleViewDesktop({Key? key, required this.article}) : super(key: key);

  @override
  State<ArticleViewDesktop> createState() => _ArticleViewDesktopState();
}

class _ArticleViewDesktopState extends State<ArticleViewDesktop> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 5000,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpaceLarge,
                Container(
                  width: 1000,
                  child: Text(
                    widget.article.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 80,
                      fontFamily: fontOutfitBold,
                      color: fontMainColor,
                    ),
                  ),
                ),
                verticalSpaceMedium,
                Container(
                  width: 1000,
                  child: Text(
                    widget.article.subtitle,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 60,
                      fontFamily: fontOutfitMedium,
                      color: fontMainColor,
                    ),
                  ),
                ),

                verticalSpaceMedium,

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: 500,
                    height: 500,
                    child: Image.network(
                      widget.article.path ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                verticalSpaceMedium,

                Container(
                  width: 1000,
                  child: Text(
                    widget.article.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: fontOutfitRegular,
                      color: fontMainColor,
                    ),
                  ),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}



// Rest of the code...

