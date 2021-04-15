import 'package:flutter/material.dart';
import 'package:madcotowers_1/widgets/township_carousel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:madcotowers_1/CustomMaterialColor.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);
  /*
  Future getData() async {
    var url = Uri.parse('https://madcotowers.000webhostapp.com/get.php');
    http.Response response = await http.get(url);
    response.headers.add("Access-Control-Allow-Origin", "*");
    response.headers.add("Access-Control-Allow-Methods", "POST,GET,DELETE,PUT,OPTIONS");
    var data = jsonDecode(response.body);
    print(data.toString());
  }
  */
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
    //getData();
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
          /*
            add phone number, county museum website, historical society website, and email address
          */
          Text(
            "What would you like to learn about today?",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontWeight: FontWeight.w500, height: 0.9, fontSize: 50),
          ),
        ],
      ),
    );
  }
}
