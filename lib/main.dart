import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean/Features/splash/presentation/views/splash_screen.dart';
import 'package:bookly_app_clean/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
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


