
import 'package:flutter/material.dart';


class Costumer{

  String? fullName;
  String? email;
  String? phoneNumber;
  String? password;

  Costumer({
    this.fullName,
    this.email,
    this.phoneNumber,
    this.password,
  });

  toJson() => {
    'fullName': fullName,
    'email': email,
    'phoneNumber': phoneNumber,
    'password': password,
  };

}