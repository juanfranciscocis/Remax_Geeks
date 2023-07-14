

import 'package:flutter/material.dart';
import 'package:remax_geeks/models/sellNowFormModel.dart';

import '../models/costumer.dart';

class SellFormProvider extends ChangeNotifier{
  //PROPERTIES
  late final SellingForm sellingFormModel = SellingForm();


  //SETTERS
  set address (String address){
    sellingFormModel.address = address;
    notifyListeners();
  }
  set condition (String condition){
    sellingFormModel.condition = condition;
    notifyListeners();
  }
  set type (String type){
    sellingFormModel.typeProperty = type;
    notifyListeners();
  }
  set serviceType (String serviceType){
    sellingFormModel.serviceType = serviceType;
    notifyListeners();
  }
  set apiPrices (List<double> apiPrices){
    sellingFormModel.apiPrices = apiPrices;
    notifyListeners();
  }
  set averageApiPrice (double averageApiPrice){
    sellingFormModel.averageApiPrice = averageApiPrice;
    notifyListeners();
  }
  set costumerPrice (String costumerPrice){
    sellingFormModel.costumerPrice = costumerPrice;
    notifyListeners();
  }
  set sendAgent (String sendAgent){
    sellingFormModel.sendAgent = sendAgent;
    notifyListeners();
  }
  set servicesChosen (String servicesChosen){
    sellingFormModel.addService(servicesChosen);
    notifyListeners();
  }

  set deleteService (String service){
    sellingFormModel.servicesChosen.remove(service);
    print(sellingFormModel.servicesChosen);
    notifyListeners();
  }

  set costumer(Costumer costumer){
    sellingFormModel.costumer = costumer;
    notifyListeners();
  }

  //GETTERS
  String get condition => sellingFormModel.condition ?? 'NO CONDITION';
  String get address => sellingFormModel.address ?? 'NO ADDRESS';
  String get type => sellingFormModel.typeProperty ?? 'NO TYPE';
  String get serviceType => sellingFormModel.serviceType ?? 'NO SERVICE TYPE';
  List<double> get apiPrices => sellingFormModel.apiPrices ?? [0,0];
  String get costumerPrice => sellingFormModel.costumerPrice ?? "0";
  String get sendAgent => sellingFormModel.sendAgent ?? '';
  List<String>  getServicesChosen() => sellingFormModel.servicesChosen ?? [];
  Costumer get costumer => sellingFormModel.costumer ?? Costumer();

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