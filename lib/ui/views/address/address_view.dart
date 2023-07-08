import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remax_geeks/services/analyticsService.dart';
import 'package:remax_geeks/services/pixelsService.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../providers/dbProvider.dart';
import '../../../providers/sellFormProvider.dart';
import '../../../services/GooglePlacesService.dart';
import 'address_view.desktop.dart';
import 'address_view.tablet.dart';
import 'address_view.mobile.dart';
import 'address_viewmodel.dart';

class AddressView extends StackedView<AddressViewModel> {
  const AddressView({super.key});

  @override
  Widget builder(
    BuildContext context,
    AddressViewModel viewModel,
    Widget? child,
  ) {
    AnalyticsService analyticsService = Provider.of<AnalyticsService>(context);
    analyticsService.analytics.logEvent(name: 'SELL_BUTTON_PRESSED');
    PixelService().trackButtonPress('SELL_BUTTON_PRESSED');
    PixelService().trackCurrentPage('AddressView');
    final dbProvider = Provider.of<DBProvider>(context);
    dbProvider.getFullServiceIncludes();
    dbProvider.getCustomServicesIncludes();
    final sellFormProvider = Provider.of<SellFormProvider>(context);
    return ScreenTypeLayout.builder(
      mobile: (_) => AddressViewMobile(dbProvider: dbProvider, sellFormProvider: sellFormProvider),
      tablet: (_) => AddressViewTablet(dbProvider: dbProvider, sellFormProvider: sellFormProvider), //ADD TABLET VIEW IF NEEDED
      desktop: (_) => AddressViewDesktop(dbProvider: dbProvider,sellFormProvider: sellFormProvider),
    );
  }

  @override
  AddressViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddressViewModel();
}
