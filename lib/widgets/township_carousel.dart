import 'dart:html';

import 'package:flutter/material.dart';

class TownshipCarousel extends StatelessWidget {
  final List<String> townships = [
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
    var expanded = Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.35,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: townships.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Card(
                  color: Colors.red,
                  child: Container(
                    child: Center(
                        child: Text(
                      townships[index].toString(),
                      style: TextStyle(color: Colors.white, fontSize: 36.0),
                    )),
                  ),
                ),
              );
            }),
      ),
    );
    return expanded;
  }
}
