import 'package:adv_flutter_exam1/provider/country_flag_provider.dart';
import 'package:adv_flutter_exam1/views/detail_page.dart';
import 'package:adv_flutter_exam1/views/home_page.dart';
import 'package:adv_flutter_exam1/views/save.dart';
import 'package:adv_flutter_exam1/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CountryProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => SplashScreen(),
        '/home': (context) => HomePage(),
        '/detail': (context) => DetailPage(),
        '/saved': (context) => SavedPage(),
      },
    );
  }
}