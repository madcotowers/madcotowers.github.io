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
    return Scaffold(
      /*
      appBar: AppBar(
        title: Text('Horizontal ListView'),
      ),*/
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        height: MediaQuery.of(context).size.height * 0.35,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: townships.length,
            itemBuilder: (context, index) {
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
  }
}
