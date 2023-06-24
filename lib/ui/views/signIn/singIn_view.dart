import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remax_geeks/providers/dbProvider.dart';
import 'package:remax_geeks/services/googlePlacesService.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'signIn_view.desktop.dart';
import 'signIn_view.tablet.dart';
import 'signIn_view.mobile.dart';
import 'signIn_viewmodel.dart';

class SignInView extends StackedView<SignInViewModel> {
  const SignInView({super.key});

  @override
  Widget builder(
    BuildContext context,
    SignInViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const SignInViewMobile(),
      //tablet: (_) => const SignInViewTablet(), //ADD TABLET VIEW IF NEEDED
      desktop: (_) => const SignInViewDesktop(),
    );
  }

  @override
  SignInViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignInViewModel();
}
