import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:holy_quran/core/constants/gloabals.dart';
import 'package:holy_quran/view/screens/home.dart';
import 'package:holy_quran/view/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    // Status bar color
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Holy Quran',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
        useMaterial3: true,
      ),
      home:  Splash(),
      // home:  Home(),
    );
  }
}
