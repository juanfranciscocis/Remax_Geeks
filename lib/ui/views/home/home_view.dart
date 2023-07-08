import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remax_geeks/providers/dbProvider.dart';
import 'package:remax_geeks/services/analyticsService.dart';
import 'package:remax_geeks/services/authEmailPassword.dart';
import 'package:remax_geeks/services/googlePlacesService.dart';
import 'package:remax_geeks/services/pixelsService.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../providers/storageProvider.dart';
import 'home_view.desktop.dart';
import 'home_view.tablet.dart';
import 'home_view.mobile.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    //StorageProvider storageProvider = Provider.of<StorageProvider>(context,listen: false);
    //storageProvider.getImages(['article1.jpg']);
    AnalyticsService analyticsService = Provider.of<AnalyticsService>(context, listen: false);
    analyticsService.analytics.logAppOpen();
    //PixelService pixelService = Provider.of<PixelService>(context, listen: false);
    //pixelService.trackCurrentPage('HomeView');
    DBProvider db = Provider.of<DBProvider>(context);
    db.getNumberOfCostumers();
    db.getNumberOfSellingForms();
    db.getNumberOfArticles();
    return ScreenTypeLayout.builder(
      mobile: (_) => const HomeViewMobile(),
      tablet: (_) => const HomeViewTablet(), //ADD TABLET VIEW IF NEEDED
      desktop: (_) => const HomeViewDesktop(),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
