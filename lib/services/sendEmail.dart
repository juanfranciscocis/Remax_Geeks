import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/costumer.dart';

class SendMail {
  final String apiUrl = 'https://api.emailjs.com/api/v1.0/email/send';

  Future<void> sendEmail(Costumer customer) async {
    final Map<String, dynamic> requestData = {
      'service_id': 'service_uokb2lq',
      'template_id': 'template_zru6058',
      'user_id': 'fFN-2175jctQykHBS',
      'template_params': {
        'fullName': customer.fullName,
        'email': customer.email,
        'phoneNumber': customer.phoneNumber,
      },
    };

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: json.encode(requestData),
    );

    if (response.statusCode == 200) {
      print('Email sent successfully!');
    } else {
      print('Failed to send email. Error: ${response.body}');
    }
  }
}