import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:remax_geeks/widgets/landingPage/LandingPageMobileSite.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/landingPage/MainMobileNavBar.dart';
import '../../common/app_strings.dart';
import 'home_viewmodel.dart';

class HomeViewMobile extends ViewModelWidget<HomeViewModel> {
  const HomeViewMobile({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //ADD A RECTANGLE IN THE TOP OF THE SCREEN, NAVBAR COLOR
                  MainMobileNavBar(),
                  verticalSpaceLarge,
                  //MAIN CONTENT
                  LandingPageMobileSite(),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

