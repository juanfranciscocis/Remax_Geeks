import 'dart:convert';

class SellingForm {
  String? address = '';
  String? condition = '';
  String? typeProperty = '';
  String? serviceType = '';
  List<double>? apiPrices = [];
  double? averageApiPrice = 0;
  int? costumerPrice = 0;
  bool? sendAgent = false;
  List<String> servicesChosen = [];

  SellingForm({
    this.address = '',
    this.condition  = '',
    this.typeProperty = '',
    this.serviceType = '',
    this.apiPrices = const [0, 0, 0],
    this.averageApiPrice = 0,
    this.costumerPrice = 0,
    this.sendAgent  = false,
  });

  String toRawJson() => json.encode(toJson());

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

  void addService(String service) {
    servicesChosen?.add(service);
  }
}
