import 'package:bookly_app_clean/Features/splash/presentation/views/splash_screen.dart';
import 'package:bookly_app_clean/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(scaffoldBackgroundColor: kPrimaryColor,
      appBarTheme: const AppBarTheme(color: kPrimaryColor)),
      home: const SplashScreen(),
    );
  }
}


