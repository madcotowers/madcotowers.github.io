import 'package:flutter/material.dart';
import 'package:madcotowers_1/mediaPlayer.dart';
import 'package:madcotowers_1/views/home/home_view.dart';

class townshipMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, true);
          return false;
        },
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context, true);
                  }),
              title: Text('Township Menu'),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) =>
                            mediaPlayer())); // navigate back, pass in navigation boolean
              },
            ),
            body: Container(
                child: Center(
                    child: Text(
              'Township Menu',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            )))));
  }
}
