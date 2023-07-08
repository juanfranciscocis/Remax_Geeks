import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remax_geeks/providers/dbProvider.dart';
import 'package:remax_geeks/services/googlePlacesService.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../services/pixelsService.dart';
import 'addPhoneNumber_view.desktop.dart';
import 'addPhoneNumber_view.mobile.dart';
import 'addPhoneNumber_viewmodel.dart';

class AddPhoneNumberView extends StackedView<AddPhoneNumberViewModel> {

  bool isGoogle;

  AddPhoneNumberView({super.key, required this.isGoogle});

  @override
  Widget builder(
    BuildContext context,
    AddPhoneNumberViewModel viewModel,
    Widget? child,
  ) {
    PixelService().trackCurrentPage('AddPhoneNumberView');
    return ScreenTypeLayout.builder(
      mobile: (_) => AddPhoneNumberMobile(isGoogle: this.isGoogle,),
      //tablet: (_) => const LogInViewTablet(), //ADD TABLET VIEW IF NEEDED
      desktop: (_) => AddPhoneNumberDesktop(isGoogle: this.isGoogle,),
    );
  }

  @override
  AddPhoneNumberViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddPhoneNumberViewModel();
}
