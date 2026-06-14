import 'package:favourite_app_with_provider/provider/favourite_provider.dart';
import 'package:favourite_app_with_provider/provider/theme_change_provider.dart';
import 'package:favourite_app_with_provider/screen/dark_theme_screen.dart';
import 'package:favourite_app_with_provider/screen/favourite/favourite_screen.dart';
import 'package:favourite_app_with_provider/screen/favourite/value_notify_listner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   // final themechanger = Provider.of<ThemeChangeProvider>(context);
    return MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (_) => FavouriteProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChangeProvider()),
        ] ,
      child: Builder(builder: (BuildContext context){
        final themeChanger = Provider.of<ThemeChangeProvider>(context);
        return MaterialApp(
          themeMode: themeChanger.themeMode,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.yellowAccent,
              appBarTheme: AppBarTheme(
              backgroundColor: Colors.teal,
          )
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.teal,
            )
          ),
          home: NotifyListnerScreen(),
        );
      })
    );
  }
}

