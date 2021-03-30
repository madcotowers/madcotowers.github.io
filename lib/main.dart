import 'package:flutter/material.dart';
import 'package:madcotowers_1/views/home/home_view.dart';
import 'package:madcotowers_1/CustomMaterialColor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final customColor =
      CustomMaterialColor().createMaterialColor(Color(0xFF8b0d04));
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: customColor,
      ),
      home: HomeView(),
    );
  }
}
