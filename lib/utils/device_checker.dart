

import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

bool isWeb(){
  if(kIsWeb){
    return true;
  }else {
    return false;
  }

}

bool isIOS(){
  if(!kIsWeb && Platform.isIOS){
    return true;
  }else {
    return false;
  }
}

bool isWebView(){

  final Size screenSize = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;

  // Calculate the diagonal size of the screen
  final double diagonalSize = sqrt(
    (screenSize.width * screenSize.width) + (screenSize.height * screenSize.height),
  );

  if(kIsWeb){
    //if(diagonalSize >= 1100.0){
    if(diagonalSize >= 1000.0){
      return true;
    }else{
      return false;
    }
  }else {
    return false;
  }

}

bool isMenuWebView(){

  final Size screenSize = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;

  // Calculate the diagonal size of the screen
  final double diagonalSize = sqrt(
    (screenSize.width * screenSize.width) + (screenSize.height * screenSize.height),
  );

  if(kIsWeb){
    //if(diagonalSize >= 1100.0){
    if(diagonalSize >= 1300.0){
      return true;
    }else{
      return false;
    }
  }else {
    return false;
  }

}