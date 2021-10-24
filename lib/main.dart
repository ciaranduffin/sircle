import 'package:flutter/material.dart';
import 'package:sircle/constants.dart';
import 'package:sircle/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterShare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColourPalette.CaribbeanGreen,
        colorScheme: ColorScheme(
          primary: ColourPalette.CaribbeanGreen,
          primaryVariant: ColourPalette.BlueNCSLightened,
          secondary: ColourPalette.OrangeYellowCrayola,
          secondaryVariant: ColourPalette.MidnightEagleGreenLightened,
          brightness: Brightness.light,
          surface: Colors.white,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.white,
          background: Colors.white,
          error: Colors.red,
        ),
      ),
      home: Home(),
    );
  }
}
