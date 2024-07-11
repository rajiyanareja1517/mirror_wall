import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

class ChangeProvider extends ChangeNotifier{
  ConnectivityResult connectivityResult=ConnectivityResult.none;
  bool isLoad=true;
  double webProgress=0;

  void checkingConnection(){
    Connectivity().onConnectivityChanged.listen((event) {
      connectivityResult=event;
      notifyListeners();
    });
  }
  void onChangeLoad(bool isLoad){
    this.isLoad=isLoad;
    notifyListeners();

  }
  void onWebProgress(double webProgress){
    this.webProgress=webProgress;
    notifyListeners();
  }

}