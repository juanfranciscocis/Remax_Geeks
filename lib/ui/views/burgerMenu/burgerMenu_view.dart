import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remax_geeks/models/article.dart';
import 'package:remax_geeks/providers/dbProvider.dart';
import 'package:remax_geeks/services/googlePlacesService.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'burgerMenu_view.mobile.dart';
import 'burgerMenu_viewmodel.dart';

class BurgerMenuView extends StackedView<BurgerMenuViewModel> {
  const BurgerMenuView({super.key});

  @override
  Widget builder(
    BuildContext context,
    BurgerMenuViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const BurgerMenuViewMobile(),
    );
  }

  @override
  BurgerMenuViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BurgerMenuViewModel();
}
