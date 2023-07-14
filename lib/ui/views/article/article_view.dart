import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remax_geeks/models/article.dart';
import 'package:remax_geeks/providers/dbProvider.dart';
import 'package:remax_geeks/services/googlePlacesService.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'article_view.desktop.dart';
import 'article_view.tablet.dart';
import 'article_view.mobile.dart';
import 'article_viewmodel.dart';

class ArticleView extends StackedView<LearnMoreViewModel> {

  Article article;


  ArticleView({super.key, required this.article});

  @override
  Widget builder(
    BuildContext context,
    LearnMoreViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => ArticleViewMobile(article: this.article,),
      tablet: (_) => ArticleViewTablet(article: this.article), //ADD TABLET VIEW IF NEEDED
      desktop: (_) =>  ArticleViewDesktop(article: this.article,),
    );
  }

  @override
  LearnMoreViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LearnMoreViewModel();
}
