import 'package:provider/provider.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:remax_geeks/ui/views/article/article_view.dart';
import 'package:stacked/stacked.dart';

import '../../../models/article.dart';
import '../../../providers/dbProvider.dart';
import '../../../providers/storageProvider.dart';
import '../../../services/pixelsService.dart';
import '../../../widgets/landingPage/LandingPageTabletSite.dart';
import '../../../widgets/landingPage/MainTabletNavBar.dart';
import '../../common/app_strings.dart';
import 'learnMore_view.desktop.dart';
import 'learnMore_viewmodel.dart';

class LearnMoreViewTablet extends StatefulWidget {
  const LearnMoreViewTablet({super.key});

  @override
  State<LearnMoreViewTablet> createState() => _LearnMoreViewTabletState();
}

class _LearnMoreViewTabletState extends State<LearnMoreViewTablet> {
  List paths = [];
  late List<Article> articles=[];

  void initState() {
    StorageProvider storageProvider =
    Provider.of<StorageProvider>(context, listen: false);
    paths = storageProvider.paths;
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
                                articles[i].path = paths[i];
                                String articleTitle = articles[i].title;
                                PixelService().trackEvent('ARTICLE_$articleTitle');
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleView(article: articles[i],)));
                              },
                              child: learnMoreArticle(
                                title: articles[i].title,
                                subtitle: articles[i].subtitle,
                                imagePath: paths[i],
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
