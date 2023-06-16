import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

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
    return ScreenTypeLayout.builder(
      mobile: (_) => const AddressViewMobile(),
      tablet: (_) => const AddressViewTablet(), //ADD TABLET VIEW IF NEEDED
      desktop: (_) => const AddressViewDesktop(),
    );
  }

  @override
  AddressViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddressViewModel();
}
