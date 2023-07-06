import 'package:provider/provider.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:remax_geeks/ui/views/article/article_view.dart';
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
import 'learnMore_view.desktop.dart';
import 'learnMore_viewmodel.dart';

class LearnMoreViewMobile extends StatefulWidget {
  const LearnMoreViewMobile({super.key});

  @override
  State<LearnMoreViewMobile> createState() => _LearnMoreViewMobileState();
}

class _LearnMoreViewMobileState extends State<LearnMoreViewMobile> {

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
                                  textSubtitleSize: 15,
                                  textTitleSize: 25,
                                  imageSize: 100,
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
        ));
  }
}

