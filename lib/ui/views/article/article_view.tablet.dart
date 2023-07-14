import 'package:provider/provider.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../models/article.dart';
import '../../../providers/dbProvider.dart';
import '../../../widgets/landingPage/LandingPageTabletSite.dart';
import '../../../widgets/landingPage/MainTabletNavBar.dart';
import '../../common/app_strings.dart';
import 'article_view.desktop.dart';
import 'article_viewmodel.dart';

class ArticleViewTablet extends StatefulWidget {
  late final Article article;

  ArticleViewTablet({super.key, required this.article});

  @override
  State<ArticleViewTablet> createState() => _ArticleViewTabletState();
}

class _ArticleViewTabletState extends State<ArticleViewTablet> {
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
            padding: EdgeInsets.symmetric(horizontal: 25.0),
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
                        fontSize: 80,
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
                      width: 400,
                      height: 400,
                      child: Image.network(
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
        ),
      );
  }
}
