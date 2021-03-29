import 'package:flutter/material.dart';
//import 'package:madcotowers_1/mediaPlayer.dart';
//import 'package:madcotowers_1/views/home/home_view.dart';

class TownshipMenu extends StatelessWidget {
  final String township;
  final List<String> chapters = [
    'Chapter 1',
    'Chapter 2',
    'Chapter 3',
    'Chapter 4',
    'Chapter 5',
    'Chapter 6',
    'Chapter 7',
  ];

  // receive data from the FirstScreen as a parameter
  TownshipMenu({Key key, @required this.township}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, true);
          return false;
        },
        child: Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/MCHS-Identity-WHiteText-340-300x134.png',
                    fit: BoxFit.contain,
                    height: 60,
                  ),
                  //Text(township),
                ],
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    township,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.w500, height: 0.9, fontSize: 50),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: chapters.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.width * 0.2,
                            child: GestureDetector(
                                onTap: () {
                                  /*
                                  () {
                                      Navigator.push(
                                          context,
                                          new MaterialPageRoute(
                                              builder: (context) =>
                                                  mediaPlayer())); // navigate back, pass in navigation boolean
                                    },  
                                  */
                                  print(
                                      chapters[index].toString() + " clicked");
                                },
                                child: Card(
                                  color: Colors.red,
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                      chapters[index].toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 36.0),
                                    )),
                                  ),
                                )),
                          );
                        }),
                  ),
                ),
              ],
            )));
  }
}
