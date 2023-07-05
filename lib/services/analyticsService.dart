import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';


class AnalyticsService extends ChangeNotifier{
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  final FirebaseAnalyticsObserver getAnalyticsObserver = FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance);


}