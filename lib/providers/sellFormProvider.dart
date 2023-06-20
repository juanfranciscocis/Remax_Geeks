

import 'package:flutter/material.dart';
import 'package:remax_geeks/models/sellNowFormModel.dart';

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
    _sellingFormModel.type = type;
    notifyListeners();
  }
  set serviceType (String serviceType){
    _sellingFormModel.serviceType = serviceType;
    notifyListeners();
  }

  //GETTERS
  String get condition => _sellingFormModel.condition ?? 'NO CONDITION';
  String get address => _sellingFormModel.address ?? 'NO ADDRESS';
  String get type => _sellingFormModel.type ?? 'NO TYPE';
  String get serviceType => _sellingFormModel.serviceType ?? 'NO SERVICE TYPE';



  //TODO: OTHER PROPERTIES


}