import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';


class DBProvider extends ChangeNotifier{

  //INITIALIZE FIREBASE REALTIME
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  //REFERENCE TO THE DATABASE
  DatabaseReference? _databaseReference;

  //CONSTRUCTOR
  DBProvider(){
    _databaseReference = _database.ref();
  }

  //GETTERS
  DatabaseReference? get databaseReference => _databaseReference;





}