import 'package:remax_geeks/providers/dbProvider.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:remax_geeks/widgets/landingPage/LandingPageMobileSite.dart';
import 'package:stacked/stacked.dart';

import '../../../providers/sellFormProvider.dart';
import '../../../widgets/landingPage/MainMobileNavBar.dart';
import '../../common/app_strings.dart';
import 'chooseServiceType_viewmodel.dart';

class ChooseServiceTypeMobile extends ViewModelWidget<ChooseServiceTypeViewModel> {

  DBProvider dbProvider;
  SellFormProvider sellFormProvider;

  ChooseServiceTypeMobile({super.key, required this.dbProvider, required this.sellFormProvider});

  @override
  Widget build(BuildContext context, ChooseServiceTypeViewModel viewModel) {
    return  Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

            ],
            ),
        ),
      ),
    ));
  }
}

