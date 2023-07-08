import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remax_geeks/providers/dbProvider.dart';
import 'package:remax_geeks/services/googlePlacesService.dart';
import 'package:remax_geeks/ui/views/signUp/signUp_view.desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../services/pixelsService.dart';
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
    PixelService().trackCurrentPage('SignUpView');
    return ScreenTypeLayout.builder(
      mobile: (_) => SignUpViewMobile(),
      desktop: (_) => SignUpViewDesktop(),
    );
  }

  @override
  SignUpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignUpViewModel();
}
