import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/landingPage/LandingPageTabletSite.dart';
import '../../../widgets/landingPage/MainTabletNavBar.dart';
import '../../common/app_strings.dart';
import 'addPhoneNumber_viewmodel.dart';

class LogInViewTablet extends ViewModelWidget<AddPhoneNumberViewModel> {
  const LogInViewTablet({super.key});

  @override
  Widget build(BuildContext context, AddPhoneNumberViewModel viewModel) {
    return const Scaffold(
      backgroundColor: backgroundColor,
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
