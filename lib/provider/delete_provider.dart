import 'package:flutter/cupertino.dart';

import '../utils/data.dart';

class DeleteProvider extends ChangeNotifier{
 void deleteAll(){
   Data.bookURL.clear();
   Data.bookMarkURL.clear();
   notifyListeners();
 }
 void deleteBookMark(int index){
   Data.bookURL.remove( Data.bookMarkURL[index]);
   Data.bookMarkURL.removeAt(index);
   notifyListeners();
 }
}