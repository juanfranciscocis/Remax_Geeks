import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:remax_geeks/models/realtyMoleModel.dart';
import 'package:remax_geeks/models/zillowModel.dart';

class _ZillowZpidService extends ChangeNotifier {
  String _baseURL = "zillow-zestimate.p.rapidapi.com";
  String _endPoint = "/search";
  String _apiKey = "d85572692bmshafabd3e3490a627p199f7djsn413da74bd549";
  late int? zpid;

  Future<String> getJasonData(String address) async {
    var url = Uri.https(_baseURL, _endPoint, {'query': address});
    var response = await http.get(url, headers: {'X-RapidAPI-Key': _apiKey});
    return response.body;
  }

  Future<int?> getZpid(String address) async {
    final response = await getJasonData(address);
    final zillowZpidModel = ZillowSearchModel.fromRawJson(response);
    zpid = zillowZpidModel.results?[0].metaData?.zpid;
    return zpid;
  }
}

class ZillowService extends ChangeNotifier {
  String _baseURL = "zillow-zestimate.p.rapidapi.com";
  String _endPoint = "/zestimate";
  String _apiKey = "d85572692bmshafabd3e3490a627p199f7djsn413da74bd549";
  late double price;
  late int? zpid;

  Future<String> getJasonData(String address) async {
    zpid = await _ZillowZpidService().getZpid(address);
    print(zpid.toString() + ' returned');
    var url = Uri.https(_baseURL, _endPoint, {'zpid': zpid.toString()});
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
