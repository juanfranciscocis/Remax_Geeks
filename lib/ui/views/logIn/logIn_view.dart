import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remax_geeks/providers/dbProvider.dart';
import 'package:remax_geeks/services/googlePlacesService.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'logIn_view.desktop.dart';
import 'logIn_view.tablet.dart';
import 'logIn_view.mobile.dart';
import 'logIn_viewmodel.dart';

class LogInView extends StackedView<LogInViewModel> {
  const LogInView({super.key});

  @override
  Widget builder(
    BuildContext context,
    LogInViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const LogInViewMobile(),
      //tablet: (_) => const LogInViewTablet(), //ADD TABLET VIEW IF NEEDED
      desktop: (_) => const LogInViewDesktop(),
    );
  }

  @override
  LogInViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LogInViewModel();
}
