



import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class StorageProvider extends ChangeNotifier{

  final ref = FirebaseStorage.instance;
  late List paths = [];

  Future<List> getImages() async {
    //GET ALL IMAGES FROM FIREBASE STORAGE
    ListResult result = await ref.ref().child('ARTICLES_IMAGES').listAll();
    List<Reference> allFiles = result.items;
    for (var file in allFiles) {
      String path = await file.getDownloadURL();
      paths.add(path);
    }
    notifyListeners();
    return paths;
  }



}