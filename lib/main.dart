import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashscreen/splashscreen.dart';

import 'package:myVault/screens/onboard.dart';
import 'package:myVault/constants/texts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppName,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(
          seconds: 2,
          navigateAfterSeconds: Onboard(),
          title: Text(
            AppName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          image: Image.asset('assets/vault.png'),
          backgroundColor: Colors.white,
          styleTextUnderTheLoader: TextStyle(),
          photoSize: 100.0,
          loaderColor: Colors.red),
    );
  }
}
