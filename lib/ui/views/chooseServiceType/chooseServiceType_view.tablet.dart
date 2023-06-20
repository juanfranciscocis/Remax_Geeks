import 'package:remax_geeks/providers/dbProvider.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../providers/sellFormProvider.dart';
import '../../../widgets/landingPage/LandingPageTabletSite.dart';
import '../../../widgets/landingPage/MainTabletNavBar.dart';
import '../../common/app_strings.dart';
import 'chooseServiceType_viewmodel.dart';

class ChooseServiceTypeTablet extends ViewModelWidget<ChooseServiceTypeViewModel> {

  DBProvider dbProvider;
  SellFormProvider sellFormProvider;

  ChooseServiceTypeTablet({super.key, required this.dbProvider, required this.sellFormProvider});

  @override
  Widget build(BuildContext context, ChooseServiceTypeViewModel viewModel) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                ],
            ),
              ),
            ),
          ),
        ),
      );
  }
}
