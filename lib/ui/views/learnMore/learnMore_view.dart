import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remax_geeks/providers/dbProvider.dart';
import 'package:remax_geeks/services/googlePlacesService.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'learnMore_view.desktop.dart';
import 'learnMore_view.tablet.dart';
import 'learnMore_view.mobile.dart';
import 'learnMore_viewmodel.dart';

class LearnMoreView extends StackedView<LearnMoreViewModel> {
  const LearnMoreView({super.key});

  @override
  Widget builder(
    BuildContext context,
    LearnMoreViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const LearnMoreViewMobile(),
      //tablet: (_) => const LogInViewTablet(), //ADD TABLET VIEW IF NEEDED
      desktop: (_) =>  LearnMoreViewDesktop(),
    );
  }

  @override
  LearnMoreViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LearnMoreViewModel();
}
