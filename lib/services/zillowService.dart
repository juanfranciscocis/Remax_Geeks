import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:remax_geeks/models/realtyMoleModel.dart';
import 'package:remax_geeks/models/zillowModel.dart';

class ZillowService extends ChangeNotifier {
  String _baseURL = "zillow56.p.rapidapi.com";
  String _endPoint = "/search";
  String _apiKey = "d85572692bmshafabd3e3490a627p199f7djsn413da74bd549";
  late double price = 0.0;

  Future<String> getJasonData(String address) async {
    var url = Uri.https(_baseURL, _endPoint, {
      'location': address,
    });
    var response = await http.get(url, headers: {'X-RapidAPI-Key': _apiKey});
    print(response.body + ' response body');
    return response.body;
  }

  getPrice(String address) async {
    final response = await getJasonData(address);
    final realtyModel = ZillowModel.fromRawJson(response);
    price = realtyModel.zestimate ?? 0.0;
    print(price.toString() + ' price');
  }
}
