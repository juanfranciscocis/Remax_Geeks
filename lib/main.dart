import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remax_geeks/providers/dbProvider.dart';
import 'package:remax_geeks/providers/sellFormProvider.dart';
import 'package:remax_geeks/services/GooglePlacesService.dart';
import 'package:remax_geeks/services/realtyMoleService.dart';
import 'package:remax_geeks/services/zillowService.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:remax_geeks/app/app.bottomsheets.dart';
import 'package:remax_geeks/app/app.dialogs.dart';
import 'package:remax_geeks/app/app.locator.dart';
import 'package:remax_geeks/app/app.router.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  setPathUrlStrategy();
  setupLocator(
    stackedRouter: stackedRouter,
  );
  setupDialogUi();
  setupBottomSheetUi();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseDatabase.instance;

  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DBProvider()),
        ChangeNotifierProvider(create: (_) => SellFormProvider()),
        ChangeNotifierProvider(create: (_) => GooglePlacesService()),
        ChangeNotifierProvider(create: (_) => RealtyMoleService()),
        ChangeNotifierProvider(create: (_) => ZillowService()),
      ],
      child: ResponsiveApp(
          preferDesktop: true,
          builder: (_) => MaterialApp.router(
                title: 'Remax Geeks',
                theme: Theme.of(context).copyWith(
                  primaryColor: backgroundColor,
                  textTheme: Theme.of(context).textTheme.apply(
                        bodyColor: backgroundColor,
                      ),
                ),
                debugShowCheckedModeBanner: false,
                routerDelegate: stackedRouter.delegate(),
                routeInformationParser: stackedRouter.defaultRouteParser(),
              ).animate().fadeIn(
                    delay: const Duration(milliseconds: 50),
                    duration: const Duration(milliseconds: 400),
                  )),
    );
  }
}
