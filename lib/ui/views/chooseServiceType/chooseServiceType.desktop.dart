import 'package:provider/provider.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/app_constants.dart';
import 'package:remax_geeks/ui/common/app_strings.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../providers/dbProvider.dart';
import '../../../providers/sellFormProvider.dart';
import '../../../widgets/landingPage/LandingPageDesktopSite.dart';
import '../../../widgets/landingPage/MainDesktopNavBar.dart';
import 'chooseServiceType_viewmodel.dart';

class ChooseServiceTypeDesktop extends ViewModelWidget<ChooseServiceTypeViewModel> {

  DBProvider dbProvider;
  SellFormProvider sellFormProvider;

  ChooseServiceTypeDesktop({super.key, required this.dbProvider, required this.sellFormProvider});

  @override
  Widget build(BuildContext context,  viewModel) {
    return  Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 200.0, right: 200.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

            ],
          ),
        ),
      ),
    );
  }
}




