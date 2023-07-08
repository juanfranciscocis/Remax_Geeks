



import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class StorageProvider extends ChangeNotifier{

  final ref = FirebaseStorage.instance;
  late List paths = [];

  Future<List> getImages(List<String> imageNames) async {
    for (String imageName in imageNames) {
      var path;
      path = await ref.ref().child(imageName).getDownloadURL();
      print(path);
      paths.add(path);
    }
    return paths;
  }



}