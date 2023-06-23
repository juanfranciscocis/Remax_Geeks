// To parse this JSON data, do
//
//     final sellingForm = sellingFormFromJson(jsonString);

import 'dart:convert';

class SellingForm {
  String? address = '';
  String? condition = '';
  String? typeProperty = '';
  String? serviceType = '';
  List<int>? apiPrices = [];
  int? averageApiPrice = 0;
  int? costumerPrice = 0;
  bool? sendAgent = false;
  List<String>? servicesChosen = [];

  SellingForm({
    this.address = '',
    this.condition  = '',
    this.typeProperty = '',
    this.serviceType = '',
    this.apiPrices = const [0, 0, 0],
    this.averageApiPrice = 0,
    this.costumerPrice = 0,
    this.sendAgent  = false,
    this.servicesChosen = const [],
  });

  factory SellingForm.fromRawJson(String str) => SellingForm.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SellingForm.fromJson(Map<String, dynamic> json) => SellingForm(
    address: json["ADDRESS"],
    condition: json["CONDITION"],
    typeProperty: json["TYPE_PROPERTY"],
    serviceType: json["SERVICE_TYPE"],
    apiPrices: List<int>.from(json["API_PRICES"].map((x) => x)),
    averageApiPrice: json["AVERAGE_API_PRICE"],
    costumerPrice: json["COSTUMER_PRICE"],
    sendAgent: json["SEND_AGENT"],
    servicesChosen: List<String>.from(json["SERVICES_CHOSEN"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "ADDRESS": address,
    "CONDITION": condition,
    "TYPE_PROPERTY": typeProperty,
    "SERVICE_TYPE": serviceType,
    "API_PRICES": List<dynamic>.from(apiPrices!.map((x) => x)),
    "AVERAGE_API_PRICE": averageApiPrice,
    "COSTUMER_PRICE": costumerPrice,
    "SEND_AGENT": sendAgent,
    "SERVICES_CHOSEN": List<dynamic>.from(servicesChosen!.map((x) => x)),
  };



}
