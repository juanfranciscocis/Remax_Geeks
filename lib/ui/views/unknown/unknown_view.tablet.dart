import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'unknown_viewmodel.dart';

class UnknownViewTablet extends ViewModelWidget<UnknownViewModel> {
  const UnknownViewTablet({super.key});

  @override
  Widget build(BuildContext context, UnknownViewModel viewModel) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '404',
              style: TextStyle(
                color: fontMainColor,
                fontFamily: 'OutfitBold',
                fontSize: 80,
                fontWeight: FontWeight.w800,
                height: 0.95,
                letterSpacing: 20.0,
              ),
            ),
            verticalSpaceSmall,
            Text(
              'PAGE NOT FOUND',
              style: TextStyle(
                color: fontMainColor,
                fontFamily: "OutfitMedium",
                fontSize: 20,
                letterSpacing: 20.0,
                wordSpacing: 10.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
