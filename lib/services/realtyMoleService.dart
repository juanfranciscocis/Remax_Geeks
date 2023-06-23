

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:remax_geeks/models/realtyMoleModel.dart';

class RealtyMoleService extends ChangeNotifier{

  String _baseURL = "realty-mole-property-api.p.rapidapi.com";
  String _endPoint = "/salePrice";
  String _apiKey = "d85572692bmshafabd3e3490a627p199f7djsn413da74bd549";
  late double price = 0.0;

  getJasonData(String address)async{
    //make http request, base url, endpoint, params = address, headers = api key
    var url = Uri.https(_baseURL, _endPoint, {'address': address});
    var response = await http.get(url, headers: {'X-RapidAPI-Key': _apiKey});
    //return json data
    //print(response.body);
    return response.body;

  }

  getPrice(String address) async {
    final response = await getJasonData(address);
    final realtyModel = RealtyMoleModel.fromRawJson(response);
    price = realtyModel.price ?? 0.0;
  }

}