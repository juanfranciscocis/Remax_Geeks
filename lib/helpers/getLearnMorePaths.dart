


import 'package:flutter/material.dart';

List<String>getLearnMorePaths(){
  //inside my assets i have a folder called learnMoreImages, lets get the paths of all the images inside it
  List<String> paths = [];
  //read the folder until the end
  for(int i = 0; i < 3; i++){
    //try to get the image path
    try{
      //if the image exists, add it to the list
      String path = 'assets/learnMoreImages/no_image_learn_more.png';
      paths.add(path);
    }catch(e){
      //if the image does not exist, break the loop
      break;
    }
  }
  //return the list of paths
  return paths;
}