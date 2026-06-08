import 'package:favourite_app_with_provider/provider/favourite_provider.dart';
import 'package:favourite_app_with_provider/screen/favourite/favourite_screen.dart';
import 'package:flutter/material.dart';
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
        providers:[
          ChangeNotifierProvider(create: (_) => FavouriteProvider()),
        ] ,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        home: FavouriteScreen(),
      ),
    );
  }
}

