import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../providers/dbProvider.dart';
import '../../../providers/sellFormProvider.dart';
import 'fullService.desktop.dart';
import 'fullService.tablet.dart';
import 'fullService.mobile.dart';
import 'fullService_viewmodel.dart';

class FullServiceView extends StackedView<FullServiceViewModel> {
  const FullServiceView({super.key});

  @override
  Widget builder(
    BuildContext context,
    FullServiceViewModel viewModel,
    Widget? child,
  ) {
    final dbProvider = Provider.of<DBProvider>(context, listen: false);
    final sellFormProvider = Provider.of<SellFormProvider>(context);
    return ScreenTypeLayout.builder(
      mobile: (_) => FullServiceMobile(dbProvider: dbProvider, sellFormProvider: sellFormProvider,premiumTitles: dbProvider.pTitles, premiumDescriptions: dbProvider.pDescriptions , fullServiceIncludes: dbProvider.pFullServiceIncludes ?? '',),
      tablet: (_) => FullServiceTablet(dbProvider: dbProvider, sellFormProvider: sellFormProvider, premiumTitles: dbProvider.pTitles, premiumDescriptions: dbProvider.pDescriptions , fullServiceIncludes: dbProvider.pFullServiceIncludes?? '',),
      desktop: (_) => FullServiceDesktop(dbProvider: dbProvider,sellFormProvider: sellFormProvider, premiumTitles: dbProvider.pTitles, premiumDescriptions: dbProvider.pDescriptions , fullServiceIncludes: dbProvider.pFullServiceIncludes?? '',),
    );
  }

  @override
  FullServiceViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FullServiceViewModel();
}
