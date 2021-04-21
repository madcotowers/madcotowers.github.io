import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class AudioPlayerBackgroundPlaylist extends StatefulWidget {
  final int index;
  AudioPlayerBackgroundPlaylist({Key key, @required this.index})
      : super(key: key);
  @override
  _AudioPlayerBackgroundPlaylistState createState() =>
      _AudioPlayerBackgroundPlaylistState(index);
}

class _AudioPlayerBackgroundPlaylistState
    extends State<AudioPlayerBackgroundPlaylist> {
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  int index;
  _AudioPlayerBackgroundPlaylistState(this.index);
  //obtain the index to start the audio playlist from the township menu page
  final List<StreamSubscription> _subscriptions = [];
  @override
  void initState() {
    super.initState();
    setupPlaylist();
    fetchFileData(); //added for text implementation
    _subscriptions.add(audioPlayer.playlistAudioFinished.listen((data) {
      index = index + 1;
      print("here");
      fetchFileData();
    }));
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  void setupPlaylist() async {
    audioPlayer.open(
        Playlist(audios: [
          Audio("assets/godfrey.mp3",
              metas: Metas(
                title: "godfrey.mp3",
                artist: "Panel1",
                image: MetasImage.asset("assets.img1.jpg"),
              )),
          Audio("assets/Hamel.mp3",
              metas: Metas(
                title: "Hamel.mp3",
                artist: "Panel2",
                image: MetasImage.asset("assets.img1.jpg"),
              )),
          Audio("assets/Moro.mp3",
              metas: Metas(
                title: "Moro.mp3",
                artist: "Panel3",
                image: MetasImage.asset("assets.img1.jpg"),
              )),
          Audio("assets/Alton.mp3",
              metas: Metas(
                title: "Alton1",
                artist: "Panel4",
                image: MetasImage.asset("assets.img1.jpg"),
              )),
        ]),
        showNotification: true,
        autoStart: false);

//we update where the player starts here by specifiying the index
    audioPlayer.playlistPlayAtIndex(index);
  }

  playMusic() async {
    await audioPlayer.play();
  }

  pauseMusic() async {
    await audioPlayer.pause();
  }

  skipPrevious() async {
    if (index != 0) {
      index--;
      await audioPlayer.previous();
    } else {
      index = 0;
    }
    audioPlayer.playlistPlayAtIndex(index);
    await fetchFileData();
    print("index now is: ");
    print(index);
  }

  skipNext() async {
    await audioPlayer.next();
    //index is incremented by listener
    await fetchFileData(); //added
    audioPlayer.playlistPlayAtIndex(index);
    print("we clicked next, the index here is: ");
    print(index);
  }

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  String data = '';
  int maxIndex = 3;
  String indexString;

  fetchFileData() async {
    String responseText;
    indexString = index.toString(); //added
    print("index value is: " + indexString); //added
    responseText =
        await rootBundle.loadString('assets/textFiles/' + indexString + '.txt');

    setState(() {
      data = responseText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8b0d04),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/mchslogo.png',
              fit: BoxFit.contain,
              height: 60,
            ),
            Text(
              'Now Playing',
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      body: Center /*Container*/ (
        //alignment: Alignment.center,
        child: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 400,
              child: new SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.fromLTRB(100, 100, 100, 100),
                child: Text(
                  data,
                  style: TextStyle(fontSize: 28, fontFamily: "Roboto"),
                ),
              ),
            ),
            Expanded(child:
                audioPlayer.builderIsPlaying(builder: (context, isPlaying) {
              //music controls
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    tooltip: "Closed Captions",
                    icon: Icon(Icons.closed_caption),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text("Closed Captions Pressed"),
                        backgroundColor: Color(0xFF8b0d04),
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(30),
                        duration: const Duration(seconds: 2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                      ));
                    },
                    iconSize: 50,
                  ),
                  IconButton(
                    tooltip: "Previous Chapter",
                    icon: Icon(Icons.skip_previous_rounded),
                    onPressed: () {
                      skipPrevious();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text("Previous Chapter"),
                        backgroundColor: Color(0xFF8b0d04),
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(30),
                        duration: const Duration(seconds: 2),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ));
                    },
                    iconSize: 50,
                  ),
                  IconButton(
                      tooltip: "Play/Pause",
                      iconSize: 50,
                      icon: Icon(isPlaying
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded),
                      onPressed: () => isPlaying ? pauseMusic() : playMusic()),
                  IconButton(
                    tooltip: "Next Chapter",
                    icon: Icon(Icons.skip_next_rounded),
                    onPressed: () {
                      skipNext();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text("Next Chapter"),
                        backgroundColor: Color(0xFF8b0d04),
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(30),
                        duration: const Duration(seconds: 2),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ));
                    },
                    iconSize: 50,
                  ),
                  IconButton(
                    tooltip: "View Chapters",
                    icon: Icon(Icons.list),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text("View Chapters"),
                        backgroundColor: Color(0xFF8b0d04),
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(30),
                        duration: const Duration(seconds: 2),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ));
                    },
                    iconSize: 50,
                  )
                ],
              );
            })),
          ],
        ),
      ),
    );
  }
}
