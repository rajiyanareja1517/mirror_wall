
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirror_wall/provider/radio_provider.dart';
import 'package:provider/provider.dart';

import 'delete_provider.dart';

class PopupMenuProvider extends ChangeNotifier {

  void allBookmark(BuildContext context, int index) {
    if (index == 1) {
      Navigator.pushNamed(context, 'bookmark');
    } else if (index == 2) {

    }


  }
}
