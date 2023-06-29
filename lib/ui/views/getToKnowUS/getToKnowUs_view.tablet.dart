import 'package:provider/provider.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:remax_geeks/ui/views/article/article_view.dart';
import 'package:stacked/stacked.dart';

import '../../../models/article.dart';
import '../../../providers/dbProvider.dart';
import '../../../widgets/landingPage/LandingPageTabletSite.dart';
import '../../../widgets/landingPage/MainTabletNavBar.dart';
import '../../common/app_strings.dart';
import 'getToKnowUs_view.desktop.dart';
import 'getToKnowUs_viewmodel.dart';

class GetToKnowUsViewTablet extends StatefulWidget {
  const GetToKnowUsViewTablet({super.key});

  @override
  State<GetToKnowUsViewTablet> createState() => _GetToKnowUsViewTabletState();
}

class _GetToKnowUsViewTabletState extends State<GetToKnowUsViewTablet> {
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
                  //for each path in paths create a article, using the articles list get the title and subtitle
                  if(articles.length == 0)
                    CircularProgressIndicator(),
                  if(articles.length != 0)
                    for (int i = 0; i < articles.length; i++)
                      Column(
                        children: [
                          Container(
                            width: 1400,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ArticleView(
                                      article: articles[i],
                                    ),
                                  ),
                                );
                              },
                              child: learnMoreArticle(
                                title: articles[i].title,
                                subtitle: articles[i].subtitle,
                                imagePath: '',
                                textSubtitleSize: 20,
                                textTitleSize: 35,
                                imageSize: 150,
                              ),
                            ),
                          ),
                          verticalSpaceMedium,
                        ],
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
