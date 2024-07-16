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
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a purple toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
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

