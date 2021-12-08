import 'package:derma_scan/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'const.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.grey[850], // navigation bar color
    statusBarColor: Color(0xFFEEEDE7), // status bar color
    statusBarIconBrightness: Brightness.dark,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Derma Scan',
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
