import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PixelService extends ChangeNotifier {
  final String pixelId = '2609680725849537';

  PixelService();

  Future<void> trackEvent(String eventName, [Map<String, dynamic>? eventParams]) async {
    /*
    String eventUrl = 'https://www.facebook.com/tr?id=$pixelId&ev=$eventName&noscript=1';

    if (eventParams != null) {
      eventUrl += '&${_buildQueryString(eventParams)}';
    }

    try {
      await http.get(Uri.parse(eventUrl));
      print('$eventName event tracked.');
    } catch (e) {
      print('Failed to track $eventName event: $e');
    }

     */
  }

  String _buildQueryString(Map<String, dynamic> params) {
    return params.entries.map((entry) => '${entry.key}=${entry.value}').join('&');
  }

  void trackLogin(String loginMethod) {
    Map<String, dynamic> eventParams = {
      'login_method': loginMethod,
    };
    trackEvent('Login', eventParams);
    // Add additional login logic here if needed
  }

  void trackSignup(String signupMethod) {
    Map<String, dynamic> eventParams = {
      'signup_method': signupMethod,
    };
    trackEvent('Signup', eventParams);
    // Add additional signup logic here if needed
  }

  void trackButtonPress(String buttonName) {
    trackEvent('ButtonPress_$buttonName');
    // Add additional button press logic here if needed
  }

  void trackTextInput(String inputName, String value) {
    Map<String, dynamic> eventParams = {
      'value': value,
    };
    trackEvent('TextInput_$inputName', eventParams);
    // Add additional text input logic here if needed
  }

  void trackForms(String formName,Map<String,dynamic> eventParams){
    trackEvent(formName, eventParams);
  }

  void trackCurrentPage(String pageName) {
    trackEvent('PageView', {'page_name': pageName});
    // Add additional logic here if needed
  }

  void trackSellingLocation(String location) {
    trackEvent('SellingLocation', {'location': location});
    // Add additional logic here if needed
  }

}
