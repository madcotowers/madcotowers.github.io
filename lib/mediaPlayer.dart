import 'package:flutter/material.dart';
import 'package:madcotowers_1/CustomMaterialColor.dart';

class MediaPlayer extends StatelessWidget {
  final String chapter;
  final customColor =
      CustomMaterialColor().createMaterialColor(Color(0xFF8b0d04));

  MediaPlayer({Key key, @required this.chapter}) : super(key: key);
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
                  //Text('MADCOTOWERS'),
                  /*
            Container(
                padding: const EdgeInsets.all(8.0),
                child: Text('Hello, Visitor'))*/
                ],
              ),
            ),
            body: Column(
              children: [
                //add media player here
                //MediaPlayerContainerWidget(),
                //end Media player
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      chapter, //display the township in bold text above the chapter carousel
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          height: 0.9,
                          fontSize: 50),
                    ),
                  ),
                ),
              ],
            )));
  }
}
