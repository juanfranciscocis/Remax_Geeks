

import 'package:flutter/material.dart';
import 'package:remax_geeks/models/sellNowFormModel.dart';

import '../models/costumer.dart';

class SellFormProvider extends ChangeNotifier{
  //PROPERTIES
  late final SellingForm _sellingFormModel = SellingForm();


  //SETTERS
  set address (String address){
    _sellingFormModel.address = address;
    notifyListeners();
  }
  set condition (String condition){
    _sellingFormModel.condition = condition;
    notifyListeners();
  }
  set type (String type){
    _sellingFormModel.typeProperty = type;
    notifyListeners();
  }
  set serviceType (String serviceType){
    _sellingFormModel.serviceType = serviceType;
    notifyListeners();
  }
  set apiPrices (List<double> apiPrices){
    _sellingFormModel.apiPrices = apiPrices;
    notifyListeners();
  }
  set averageApiPrice (double averageApiPrice){
    _sellingFormModel.averageApiPrice = averageApiPrice;
    notifyListeners();
  }
  set costumerPrice (String costumerPrice){
    _sellingFormModel.costumerPrice = costumerPrice;
    notifyListeners();
  }
  set sendAgent (bool sendAgent){
    _sellingFormModel.sendAgent = sendAgent;
    notifyListeners();
  }
  set servicesChosen (String servicesChosen){
    _sellingFormModel.addService(servicesChosen);
    notifyListeners();
  }

  set deleteService (String service){
    _sellingFormModel.servicesChosen.remove(service);
    print(_sellingFormModel.servicesChosen);
    notifyListeners();
  }

  set costumer(Costumer costumer){
    _sellingFormModel.costumer = costumer;
    notifyListeners();
  }

  //GETTERS
  String get condition => _sellingFormModel.condition ?? 'NO CONDITION';
  String get address => _sellingFormModel.address ?? 'NO ADDRESS';
  String get type => _sellingFormModel.typeProperty ?? 'NO TYPE';
  String get serviceType => _sellingFormModel.serviceType ?? 'NO SERVICE TYPE';
  List<double> get apiPrices => _sellingFormModel.apiPrices ?? [0,0];
  String get costumerPrice => _sellingFormModel.costumerPrice ?? "0";
  bool get sendAgent => _sellingFormModel.sendAgent ?? false;
  List<String>  getServicesChosen() => _sellingFormModel.servicesChosen ?? [];
  Costumer get costumer => _sellingFormModel.costumer ?? Costumer();

  double getAverage(){
    double sum = 0;
    for (var i = 0; i < apiPrices.length; i++) {
      sum += apiPrices[i];
    }
    return sum / apiPrices.length;
  }

  List<String> getCostumerInformation(){
    List<String> costumerInformation = [];
    costumerInformation.add(costumer.fullName!);
    costumerInformation.add(costumer.email!);
    costumerInformation.add(costumer.phoneNumber!);
    return costumerInformation;
  }

}