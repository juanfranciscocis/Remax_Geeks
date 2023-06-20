import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../providers/dbProvider.dart';
import '../../../providers/sellFormProvider.dart';
import 'customService.desktop.dart';
import 'customService.tablet.dart';
import 'customService.mobile.dart';
import 'customService_viewmodel.dart';

class CustomServiceView extends StackedView<CustomServiceViewModel> {
  const CustomServiceView({super.key});

  @override
  Widget builder(
    BuildContext context,
    CustomServiceViewModel viewModel,
    Widget? child,
  ) {
    final dbProvider = Provider.of<DBProvider>(context);
    final sellFormProvider = Provider.of<SellFormProvider>(context);
    return ScreenTypeLayout.builder(
      mobile: (_) => CustomServiceMobile(dbProvider: dbProvider, sellFormProvider: sellFormProvider),
      tablet: (_) => CustomServiceTablet(dbProvider: dbProvider, sellFormProvider: sellFormProvider), //ADD TABLET VIEW IF NEEDED
      desktop: (_) => CustomServiceDesktop(dbProvider: dbProvider,sellFormProvider: sellFormProvider),
    );
  }

  @override
  CustomServiceViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CustomServiceViewModel();
}
