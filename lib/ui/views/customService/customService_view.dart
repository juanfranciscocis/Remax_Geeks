import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../providers/dbProvider.dart';
import '../../../providers/sellFormProvider.dart';
import '../../../services/pixelsService.dart';
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
    PixelService().trackCurrentPage('CustomServiceView');
    final dbProvider = Provider.of<DBProvider>(context);
    final sellFormProvider = Provider.of<SellFormProvider>(context);
    return ScreenTypeLayout.builder(
      mobile: (_) => CustomServiceMobile(customPrices: dbProvider.cPrices,dbProvider: dbProvider, sellFormProvider: sellFormProvider, customTitles: dbProvider.cTitles, customDescriptions: dbProvider.cDescriptions),
      tablet: (_) => CustomServiceTablet(customPrices: dbProvider.cPrices,dbProvider: dbProvider, sellFormProvider: sellFormProvider, customTitles: dbProvider.cTitles, customDescriptions: dbProvider.cDescriptions),
      desktop: (_) => CustomServiceDesktop(customPrices: dbProvider.cPrices,dbProvider: dbProvider,sellFormProvider: sellFormProvider, customTitles: dbProvider.cTitles, customDescriptions: dbProvider.cDescriptions),
    );
  }

  @override
  CustomServiceViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CustomServiceViewModel();
}
