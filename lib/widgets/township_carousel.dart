import 'dart:html';
import 'package:flutter/material.dart';
import 'package:madcotowers_1/views/AudioPlayer/audio_player_background_playlist.dart';
//import 'package:madcotowers_1/views/TownshipMenu/townshipMenu.dart';
import 'package:madcotowers_1/CustomMaterialColor.dart';

class TownshipCarousel extends StatelessWidget {
  final customColor =
      CustomMaterialColor().createMaterialColor(Color(0xFF8b0d04));
  final List<String> townships = [
    'Alton',
    'Foster',
    'Godfrey',
    'Hamel',
    'Moro',
    'New Douglas-Leef',
    'New Fort Russel',
    'Omphegent - Olive',
    'The Gentle Giant',
    'Venice'
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
                    onTap: () async {
                      var pageNavigatedTo = await Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  /*TownshipMenu(
                                    township: townships[index],
                                  )*/
                                  AudioPlayerBackgroundPlaylist(
                                      index:
                                          index))); //navigates to township menu page, awaits result, then stores the destination
                    },
                    child: Card(
                      color: customColor,
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
