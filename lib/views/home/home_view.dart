import 'package:flutter/material.dart';
import 'package:madcotowers_1/widgets/township_carousel.dart';
import 'package:madcotowers_1/CustomMaterialColor.dart';
//import 'package:madcotowers_1/widgets/navigation_bar/course_details/course_details.dart';

//import 'package:madcotowers_1/townshipMenu.dart';
//import 'package:madcotowers_1/widgets/navigation_bar/centered_view/centered_view.dart';
//import 'package:madcotowers_1/widgets/navigation_bar/course_details/course_details.dart';
//import 'package:madcotowers_1/widgets/navigation_bar/navigation_bar.dart';
//import 'package:madcotowers_1/widgets/township_carousel.dart'

class HomeView extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var pageNavigatedTo = await Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) =>
                      TownshipMenu())); //navigates to township menu page, awaits result, then stores the destination
        },
      ),*/

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
      body: Column(
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
    );
  }
}