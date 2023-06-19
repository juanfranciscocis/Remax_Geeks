

class SellNowFormModel{

  //PROPERTIES
  String _address;
  String _conditionOfProperty;
  String _propertyType;
  //String _serviceType;
  //List _services;

  //CONSTRUCTOR
  SellNowFormModel(this._address, this._conditionOfProperty, this._propertyType,); // TODO: INITIALIZE SERVICES AND SERVICE TYPE

  //GETTERS
  String get address => _address;
  String get conditionOfProperty => _conditionOfProperty;
  String get propertyType => _propertyType;
  //String get serviceType => _serviceType;
  //List get services => _services;

  //SETTERS
  set address(String address){
    _address = address;
  }
  set conditionOfProperty(String conditionOfProperty){
    _conditionOfProperty = conditionOfProperty;
  }
  set propertyType(String propertyType){
    _propertyType = propertyType;
  }
  // set serviceType(String serviceType){
  //   _serviceType = serviceType;
  // }
  // set services(List services){
  //   _services = services;
  // }
}
