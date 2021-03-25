import 'dart:html';

import 'package:flutter/material.dart';

class TownshipCarousel extends StatelessWidget {
  final List<String> townships = [
    'Alton',
    'Edwardsville',
    'Township 3',
    'Township 4',
    'Township 5',
    'Township 6',
    'Township 7',
    'Township 8',
    'Township 9',
  ];

  @override
  Widget build(BuildContext context) {
    var expanded = Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.35,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: townships.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.width * 0.2,
                child: GestureDetector(
                    onTap: () {
                      print(townships[index].toString() + " clicked");
                    },
                    child: Card(
                      color: Colors.red,
                      child: Container(
                        child: Center(
                            child: Text(
                          townships[index].toString(),
                          style: TextStyle(color: Colors.white, fontSize: 36.0),
                        )),
                      ),
                    )),
              );
            }),
      ),
    );
    return expanded;
  }
}
