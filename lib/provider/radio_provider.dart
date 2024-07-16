import 'package:flutter/cupertino.dart';

class RadioProvider extends ChangeNotifier {
  String strMainURL = "https://www.google.com/";
  String strSearchURL = "https://www.google.com/search?q";

  void updateURL(String strMainURL,String strSearchURL) {
    this.strMainURL=strSearchURL;
    this.strSearchURL=strSearchURL;
    notifyListeners();
  }
}
