import 'package:flutter/material.dart';
import 'package:mirror_wall/provider/change_provider.dart';
import 'package:mirror_wall/provider/delete_provider.dart';
import 'package:mirror_wall/provider/popupmenu_provider.dart';
import 'package:mirror_wall/provider/radio_provider.dart';
import 'package:mirror_wall/view/screens/all_bookmark.dart';
import 'package:mirror_wall/view/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      builder: (context,_) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(

            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
         routes: {
            '/':(context)=>HomePage(),
            'bookmark':(context)=>AllBookmark(),
         },
        );
      }, providers: [
        ChangeNotifierProvider(create: (context) => ChangeProvider(),),
        ChangeNotifierProvider(create: (context) => PopupMenuProvider(),),
        ChangeNotifierProvider(create: (context) => DeleteProvider(),),
        ChangeNotifierProvider(create: (context) => RadioProvider(),),

    ],
    );
  }
}

