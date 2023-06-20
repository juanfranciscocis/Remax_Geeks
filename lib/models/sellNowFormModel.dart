// To parse this JSON data, do
//
//     final sellingForm = sellingFormFromJson(jsonString);

import 'dart:convert';

class SellingForm {
  String? address;
  String? condition;
  String? type;
  String? serviceType;
  List<int> apiPrices;
  int? averageApiPrice;
  int? costumerPrice;
  bool? sendAgent = false;

  SellingForm({
    this.address,
    this.condition,
    this.type,
    this.serviceType,
    this.apiPrices = const [0, 0, 0],
    this.averageApiPrice,
    this.costumerPrice,
    this.sendAgent,
  });

  factory SellingForm.fromRawJson(String str) => SellingForm.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SellingForm.fromJson(Map<String, dynamic> json) => SellingForm(
    address: json["ADDRESS"],
    condition: json["CONDITION"],
    type: json["TYPE"],
    serviceType: json["SERVICE_TYPE"],
    apiPrices: List<int>.from(json["API_PRICES"].map((x) => x)),
    averageApiPrice: json["AVERAGE_API_PRICE"],
    costumerPrice: json["COSTUMER_PRICE"],
    sendAgent: json["SEND_AGENT"],
  );

  Map<String, dynamic> toJson() => {
    "ADDRESS": address,
    "CONDITION": condition,
    "TYPE": type,
    "SERVICE_TYPE": serviceType,
    "API_PRICES": List<dynamic>.from(apiPrices.map((x) => x)),
    "AVERAGE_API_PRICE": averageApiPrice,
    "COSTUMER_PRICE": costumerPrice,
    "SEND_AGENT": sendAgent,
  };



}
