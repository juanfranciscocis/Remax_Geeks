import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remax_geeks/providers/dbProvider.dart';
import 'package:remax_geeks/services/googlePlacesService.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'privacy_view.desktop.dart';
import 'privacy_view.mobile.dart';
import 'privacy_viewmodel.dart';

class PrivacyView extends StackedView<PrivacyViewModel> {
  const PrivacyView({super.key});

  @override
  Widget builder(
    BuildContext context,
    PrivacyViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => PrivacyViewMobile(),
      //tablet: (_) => const LogInViewTablet(), //ADD TABLET VIEW IF NEEDED
      desktop: (_) => PrivacyViewDesktop(),
    );
  }

  @override
  PrivacyViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PrivacyViewModel();
}
