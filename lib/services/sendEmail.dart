import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:remax_geeks/providers/sellFormProvider.dart';

class EmailSender {
  static Future<void> sendEmail({required String condition, required String address, required String type, required String serviceType,
      required List<double> apiPrices, required String averageApiPrice, required String costumerPrice, required String sendAgent,
      required List<String> costumerInformation,required BuildContext context}) async {
    String apiPricesString = apiPrices.join(',');
    SellFormProvider sellFormProvider = Provider.of<SellFormProvider>(context, listen: false);
    List<String> servicesChosen = sellFormProvider.sellingFormModel.servicesChosen;
    String servicesChosenString = servicesChosen.join(',');

    final url = 'https://us-central1-remax-geeks.cloudfunctions.net/sendMail?dest=remaxgeeks@gmail.com'
        '&name=${costumerInformation[0]}'
        '&email=${costumerInformation[1]}'
        '&phone=${costumerInformation[2]}'
        '&address=$address'
        '&condition=$condition'
        '&type=$type'
        '&serviceType=$serviceType'
        '&apiPrices= $apiPricesString'
        '&averageApiPrice=$averageApiPrice'
        '&costumerPrice=$costumerPrice'
        '&sendAgent=$sendAgent'
        '&services=$servicesChosenString';

    final response = await http.get(
      Uri.parse(url),
    );
    print(response.body);
  }
}
