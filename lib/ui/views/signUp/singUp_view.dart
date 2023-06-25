import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remax_geeks/providers/dbProvider.dart';
import 'package:remax_geeks/services/googlePlacesService.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'signUp_view.desktop.dart';
import 'signUp_view.tablet.dart';
import 'signUp_view.mobile.dart';
import 'signUp_viewmodel.dart';

class SignUpView extends StackedView<SignUpViewModel> {
  const SignUpView({super.key});

  @override
  Widget builder(
    BuildContext context,
    SignUpViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const SignUpViewMobile(),
      //tablet: (_) => const SignInViewTablet(), //ADD TABLET VIEW IF NEEDED
      desktop: (_) => const SignUpViewDesktop(),
    );
  }

  @override
  SignUpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignUpViewModel();
}
