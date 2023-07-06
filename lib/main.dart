import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:g_recaptcha_v3/g_recaptcha_v3.dart';
import 'package:provider/provider.dart';
import 'package:remax_geeks/providers/costumerProvider.dart';
import 'package:remax_geeks/providers/dbProvider.dart';
import 'package:remax_geeks/providers/sellFormProvider.dart';
import 'package:remax_geeks/services/GooglePlacesService.dart';
import 'package:remax_geeks/services/analyticsService.dart';
import 'package:remax_geeks/services/authEmailPassword.dart';
import 'package:remax_geeks/services/authFacebook.dart';
import 'package:remax_geeks/services/authGoogle.dart';
import 'package:remax_geeks/services/realtyMoleService.dart';
import 'package:remax_geeks/services/sendEmail.dart';
import 'package:remax_geeks/services/zillowService.dart';
import 'package:remax_geeks/ui/views/addPhoneNumber/addPhoneNumber_view.dart';
import 'package:remax_geeks/ui/views/address/address_view.dart';
import 'package:remax_geeks/ui/views/burgerMenu/burgerMenu_view.dart';
import 'package:remax_geeks/ui/views/chooseServiceType/chooseServiceType_view.dart';
import 'package:remax_geeks/ui/views/customService/customService_view.dart';
import 'package:remax_geeks/ui/views/fullService/fullService_view.dart';
import 'package:remax_geeks/ui/views/getToKnowUS/getToKnowUs_view.dart';
import 'package:remax_geeks/ui/views/home/home_view.dart';
import 'package:remax_geeks/ui/views/learnMore/learnMore_view.dart';
import 'package:remax_geeks/ui/views/logIn/logIn_view.dart';
import 'package:remax_geeks/ui/views/signUp/signUp_view.desktop.dart';
import 'package:remax_geeks/ui/views/signUp/singUp_view.dart';
import 'package:remax_geeks/ui/views/unknown/unknown_view.dart';
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
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

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

  // initialiaze the facebook javascript SDK
  await FacebookAuth.i.webAndDesktopInitialize(
    appId: "793162869008453",
    cookie: true,
    xfbml: true,
    version: "v14.0",
  );

  bool ready = await GRecaptchaV3.ready("6LcIKvEmAAAAAGkSLtJYmH12dp0USLJx8AdEoExt");
  print("Is Recaptcha ready? $ready");

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
        ChangeNotifierProvider(create: (_) => AuthManager()),
        ChangeNotifierProvider(create: (_) => CostumerProvider()),
        ChangeNotifierProvider(create: (_) => AuthGoogle()),
        ChangeNotifierProvider(create: (_) => AuthFacebook()),
        ChangeNotifierProvider(create: (_) => AnalyticsService()),
      ],
      child: ResponsiveApp(
          preferDesktop: true,
          builder: (_) => MaterialApp(
                title: 'Remax Geeks',
                theme: Theme.of(context).copyWith(
                  primaryColor: backgroundColor,
                  textTheme: Theme.of(context).textTheme.apply(
                        bodyColor: backgroundColor,
                      ),
                ),
                debugShowCheckedModeBanner: false,
                initialRoute: '/home',
                routes: {
                  '/home':(context) => HomeView(),
                  '/addressView':(context) => AddressView(),
                  '/chooseService':(context) => ChooseServiceTypeView(),
                  '/login':(context) => LogInView(),
                  '/signUp':(context) => SignUpView(),
                  '/fullService':(context) => FullServiceView(),
                  '/customService':(context) => CustomServiceView(),
                  '/burgerMenu':(context) => BurgerMenuView(),
                  '/learnMore':(context) => LearnMoreView(),
                  '/getToKnowUs':(context) => GetToKnowUsView(),
                },
                navigatorObservers: [
                  AnalyticsService().getAnalyticsObserver,
                ],
            onUnknownRoute: (settings) => MaterialPageRoute(builder: (_) => UnknownView()),
                //routerDelegate: stackedRouter.delegate(),
                //routeInformationParser: stackedRouter.defaultRouteParser(),
              ).animate().fadeIn(
                    delay: const Duration(milliseconds: 50),
                    duration: const Duration(milliseconds: 400),
                  )),
    );
  }
}
