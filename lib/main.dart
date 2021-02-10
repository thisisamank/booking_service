import 'package:booking_service/constants/colors.dart';
import 'package:booking_service/screens/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Brand-Font',
        backgroundColor: BrandColors.backgroundColor,
      ),
      home: HomePage(),
    );
  }
}
