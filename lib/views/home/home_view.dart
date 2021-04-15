import 'package:flutter/material.dart';
import 'package:madcotowers_1/widgets/contact_drawer.dart';
import 'package:madcotowers_1/widgets/township_carousel.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';
//import 'package:madcotowers_1/CustomMaterialColor.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  static const List<String> townships = [
    'Alton',
    'Edwardsville',
    'TW3',
    'TW4',
    'TW5',
    'TW6',
    'TW7',
    'TW8',
    'TW9'
  ];

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool showBottomMenu = false;
  var showThreshold = 10;

  @override
  Widget build(BuildContext context) {
    //getData();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/MCHS-Identity-WHiteText-340-300x134.png',
              fit: BoxFit.contain,
              height: 60,
            ),
            //Text('MADCOTOWERS'),
            /*
            Container(
                padding: const EdgeInsets.all(8.0),
                child: Text('Hello, Visitor'))*/
          ],
        ),
      ),
      body: GestureDetector(
        onPanEnd: (details) {
          if (details.velocity.pixelsPerSecond.dy > showThreshold) {
            this.setState(() {
              showBottomMenu = false;
            });
          } else if (details.velocity.pixelsPerSecond.dy < -showThreshold) {
            this.setState(() {
              showBottomMenu = true;
            });
          }
        },
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Welcome, Visitor",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.w800, height: 0.9, fontSize: 80),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "What would you like to learn about today?",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.w500, height: 0.9, fontSize: 50),
                  ),
                ),
                TownshipCarousel(),
              ],
            ),
            AnimatedPositioned(
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: 200),
                left: 0,
                bottom: (showBottomMenu)
                    ? 0
                    : -(MediaQuery.of(context).size.height / 3),
                child: ContactDrawer())
          ],
        ),
      ),
    );
  }
}
