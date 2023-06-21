import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../providers/dbProvider.dart';
import '../../../providers/sellFormProvider.dart';
import 'chooseServiceType.desktop.dart';
import 'chooseServiceType.tablet.dart';
import 'chooseServiceType.mobile.dart';
import 'chooseServiceType_viewmodel.dart';

class ChooseServiceTypeView extends StackedView<ChooseServiceTypeViewModel> {
  const ChooseServiceTypeView({super.key});

  @override
  Widget builder(
    BuildContext context,
    ChooseServiceTypeViewModel viewModel,
    Widget? child,
  ) {
    final dbProvider = Provider.of<DBProvider>(context, listen: false);
    dbProvider.getTitlesAndDescriptions(); //GETTING TITLES BEFORE BUILDING THE WIDGETS
    final sellFormProvider = Provider.of<SellFormProvider>(context);
    return ScreenTypeLayout.builder(
      mobile: (_) => ChooseServiceTypeMobile(dbProvider: dbProvider, sellFormProvider: sellFormProvider, fullServiceDescription: dbProvider.pFullServiceIncludes ?? 'Loading', customServiceDescription: '', ),
      tablet: (_) => ChooseServiceTypeTablet(dbProvider: dbProvider, sellFormProvider: sellFormProvider, fullServiceDescription: dbProvider.pFullServiceIncludes ?? 'Loading', customServiceDescription: '', ), //ADD TABLET VIEW IF NEEDED
      desktop: (_) => ChooseServiceTypeDesktop(dbProvider: dbProvider,sellFormProvider: sellFormProvider, fullServiceDescription: dbProvider.pFullServiceIncludes ?? 'Loading', customServiceDescription: '', ),
    );
  }

  @override
  ChooseServiceTypeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChooseServiceTypeViewModel();
}
