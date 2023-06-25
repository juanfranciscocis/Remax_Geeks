


import 'package:flutter/material.dart';

import '../models/costumer.dart';

class CostumerProvider extends ChangeNotifier{

  Costumer _costumer = Costumer(fullName: '', email: '', phoneNumber: '', password: '');

  set fullName(String fullName) => _costumer.fullName = fullName;
  set email(String email) => _costumer.email = email;
  set phoneNumber(String phoneNumber) => _costumer.phoneNumber = phoneNumber;
  set password(String password) => _costumer.password = password;

  Costumer get costumer => _costumer;
  String get fullName => _costumer.fullName!;
  String get email => _costumer.email!;
  String get phoneNumber => _costumer.phoneNumber!;
  String get password => _costumer.password!;


}