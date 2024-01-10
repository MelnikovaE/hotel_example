import 'package:flutter/material.dart';
import 'package:hotel/core/constants.dart';
import 'package:hotel/presentation/view/hotel/hotel_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: white,
        iconTheme: IconThemeData(color: black),
        titleTextStyle: MyTextStyle.headLine1
      )),
      home: const HotelScreen(),
    );
  }
}
