import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remax_geeks/helpers/getLearnMorePaths.dart';
import 'package:remax_geeks/models/article.dart';
import 'package:remax_geeks/providers/storageProvider.dart';
import 'package:remax_geeks/services/pixelsService.dart';
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
import '../article/article_view.dart';
import '../customService/customService_view.dart';
import '../fullService/fullService_view.dart';
import '../signUp/singUp_view.dart';
import 'learnMore_viewmodel.dart';

class LearnMoreViewDesktop extends StatefulWidget {


  LearnMoreViewDesktop({Key? key}) : super(key: key);

  @override
  State<LearnMoreViewDesktop> createState() => _LearnMoreViewDesktopState();
}

class _LearnMoreViewDesktopState extends State<LearnMoreViewDesktop> {
  List paths = [];

  late List<Article> articles=[];

  void initState() {
    DBProvider db = Provider.of<DBProvider>(context, listen: false);
    paths = getLearnMorePaths();
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              verticalSpaceLarge,
              //for each path in paths create a article, using the articles list get the title and subtitle
              if(articles.length == 0)
                CircularProgressIndicator(),
              if(articles.length != 0)
              for (int i = 0; i < articles.length; i++)
                Container(
                  width: 1400,
                  child: GestureDetector(
                    onTap: () {
                      String articleTitle = articles[i].title;
                      PixelService().trackEvent('ARTICLE_$articleTitle');
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleView(article: articles[i],)));
                    },
                    child: learnMoreArticle(
                      title: articles[i].title,
                      subtitle: articles[i].subtitle,
                      imagePath: paths[0],
                    ),
                  ),
                ),
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
  double? textTitleSize;
  double? textSubtitleSize;
  double? imageSize;

  learnMoreArticle({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.textTitleSize,
    this.textSubtitleSize,
    this.imageSize,
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
              width: imageSize??200,
              height: imageSize??200,
              child: Image.network(
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
                    fontSize: textTitleSize ??50,
                    fontFamily: fontOutfitBold,
                    color: fontMainColor,

                  ),
                ),
                Text(subtitle,
                  style: TextStyle(
                    fontSize: textSubtitleSize??30,
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
