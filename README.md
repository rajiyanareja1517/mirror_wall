
# mirror_wall

A mirror_wall project created in flutter. mirror_wall supports both ios and android, clone the appropriate branches mentioned below:

* For Mobile: https://github.com/rajiyanareja1517/mirror_wall
 

Download or clone this repo by using the link below:

```
https://github.com/rajiyanareja1517/mirror_wall.git
```

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- screens/
|- utils/
|- view/
|- provider/
|- main.dart
```

### screens

This directory screens all the screen of the application together in one place. A separate file is created for each type as shown in example below:

```
screens/
|- AllBookmark.dart
|- HomePage.dart
|- SplashScreen.dart
```

### utils

Contains the common file(s) and utilities used in a project. The folder structure is as follows:

```

|- utils/
    |- data/

```


### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.

```dart
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


```
![Screenshot_20240716_134138](https://github.com/user-attachments/assets/b2c63ffc-64e3-4221-bf45-b8679033bece)
![Screenshot_20240716_134156](https://github.com/user-attachments/assets/91666d62-4706-42a2-89cc-6ef8b4a1d3c6)
![Screenshot_20240716_134114](https://github.com/user-attachments/assets/935d29b3-a508-4310-8987-91eb0f390d94)
![Screenshot_20240716_134059](https://github.com/user-attachments/assets/c3461531-69cf-4e31-b7bf-ed042e2068ee)
![Screenshot_20240716_134049](https://github.com/user-attachments/assets/0afe3f87-8f2d-4a53-8d6b-cd4e87e1fecf)
![Screenshot_20240716_134030](https://github.com/user-attachments/assets/8ac6470c-433f-4699-b311-5fece91c1fe0)



https://github.com/user-attachments/assets/504741d4-1cea-4e9b-8ac2-6fce56709585




## Conclusion

Again to note, this is example can appear as my code for what it is - but it is an example only. If you liked my work, don’t forget to ⭐ star the repo to show your support.
