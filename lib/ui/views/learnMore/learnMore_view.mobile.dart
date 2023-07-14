import 'package:provider/provider.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:remax_geeks/ui/views/article/article_view.dart';
import 'package:remax_geeks/widgets/landingPage/LandingPageMobileSite.dart';
import 'package:stacked/stacked.dart';

import '../../../models/article.dart';
import '../../../providers/costumerProvider.dart';
import '../../../providers/dbProvider.dart';
import '../../../providers/sellFormProvider.dart';
import '../../../providers/storageProvider.dart';
import '../../../services/authEmailPassword.dart';
import '../../../services/authFacebook.dart';
import '../../../services/authGoogle.dart';
import '../../../services/pixelsService.dart';
import '../../../widgets/landingPage/MainMobileNavBar.dart';
import '../../common/app_constants.dart';
import '../../common/app_strings.dart';
import '../addPhoneNumber/addPhoneNumber_view.dart';
import '../customService/customService_view.dart';
import '../fullService/fullService_view.dart';
import '../signUp/singUp_view.dart';
import 'learnMore_view.desktop.dart';
import 'learnMore_viewmodel.dart';

class LearnMoreViewMobile extends StatefulWidget {


  LearnMoreViewMobile({super.key});

  @override
  State<LearnMoreViewMobile> createState() => _LearnMoreViewMobileState();
}

class _LearnMoreViewMobileState extends State<LearnMoreViewMobile> {
  late List paths;
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
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    verticalSpaceLarge,
                    //for each path in paths create a article, using the articles list get the title and subtitle
                    if(articles.isEmpty)
                      CircularProgressIndicator(),

                    if(articles.isNotEmpty)
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
                                  textSubtitleSize: 15,
                                  textTitleSize: 25,
                                  imageSize: 100,
                                ),
                              ),
                            ),
                            //verticalSpaceMedium,
                          ],
                        ),

                  ],
                ),
              ),
            ),
          ),
        ));
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

