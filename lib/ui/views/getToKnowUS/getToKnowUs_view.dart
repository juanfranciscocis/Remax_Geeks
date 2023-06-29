import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remax_geeks/models/article.dart';
import 'package:remax_geeks/providers/dbProvider.dart';
import 'package:remax_geeks/services/googlePlacesService.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'getToKnowUs_view.desktop.dart';
import 'getToKnowUs_view.tablet.dart';
import 'getToKnowUs_view.mobile.dart';
import 'getToKnowUs_viewmodel.dart';

class GetToKnowUsView extends StackedView<GetToKnowUsViewModel> {
  const GetToKnowUsView({super.key});

  @override
  Widget builder(
    BuildContext context,
    GetToKnowUsViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const GetToKnowUsViewMobile(),
      tablet: (_) => const GetToKnowUsViewTablet(), //ADD TABLET VIEW IF NEEDED
      desktop: (_) =>  GetToKnowUsViewDesktop(),
    );
  }

  @override
  GetToKnowUsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      GetToKnowUsViewModel();
}
