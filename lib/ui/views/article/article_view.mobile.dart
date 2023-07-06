import 'package:provider/provider.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:remax_geeks/widgets/landingPage/LandingPageMobileSite.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/getLearnMorePaths.dart';
import '../../../models/article.dart';
import '../../../providers/costumerProvider.dart';
import '../../../providers/dbProvider.dart';
import '../../../providers/sellFormProvider.dart';
import '../../../services/authEmailPassword.dart';
import '../../../services/authFacebook.dart';
import '../../../services/authGoogle.dart';
import '../../../widgets/landingPage/MainMobileNavBar.dart';
import '../../common/app_constants.dart';
import '../../common/app_strings.dart';
import '../addPhoneNumber/addPhoneNumber_view.dart';
import '../customService/customService_view.dart';
import '../fullService/fullService_view.dart';
import '../signUp/singUp_view.dart';
import 'article_view.desktop.dart';
import 'article_viewmodel.dart';

class ArticleViewMobile extends StatefulWidget {
  late final Article article;
  ArticleViewMobile({super.key, required this.article});

  @override
  State<ArticleViewMobile> createState() => _ArticleViewMobileState();
}

class _ArticleViewMobileState extends State<ArticleViewMobile> {

  late List<Article> articles=[];

  void initState() {
    articlesInit();
    super.initState();
  }

  Future<void> articlesInit() async {
    DBProvider db = Provider.of<DBProvider>(context, listen: false);
    await db.getArticles();
    setState(() {
      articles = db.articles;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    verticalSpaceLarge,
                    Container(
                      width: 800,
                      child: Text(
                        widget.article.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: fontOutfitBold,
                          color: fontMainColor,
                        ),
                      ),
                    ),
                    verticalSpaceMedium,
                    Container(
                      width: 800,
                      child: Text(
                        widget.article.subtitle,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: fontOutfitMedium,
                          color: fontMainColor,
                        ),
                      ),
                    ),

                    verticalSpaceMedium,

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: 200,
                        height: 200,
                        child: Image.asset(
                          widget.article.path ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    verticalSpaceMedium,
                    Container(
                      width: 800,
                      child: Text(
                        widget.article.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
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
        ));
  }
}

