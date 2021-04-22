import 'dart:math';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class MediaPlayer extends StatelessWidget {
  //final String chapter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key); //added for flip card
  final String title; //added for flip card

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showFrontSide; //added for flip card
  bool _flipXAxis; //added for flip card
  bool playing;

  /*AudioPlayer _player; //added for just_audio
  final _playlist = ConcatenatingAudioSource(children: [
    AudioSource.uri(
      Uri.parse("assets/Alton.mp3"),
      tag: AudioMetadata(
        album: "Alton",
        title: "Chapter 1",
        artwork: 
        "assets/MCHS-Identity-WHiteText-340-300x134.png",
      ),
    ),
    AudioSource.uri(
      Uri.parse("assets/Alton.mp3"),
      tag: AudioMetadata(
        album: "Alton",
        title: "Chapter 1",
        artwork: 
        "assets/MCHS-Identity-WHiteText-340-300x134.png",
      ),
    ),
  ]);
  */

  AssetsAudioPlayer audioPlayer;
  IconData playBtn = Icons.pause_circle_filled_rounded;

  //AudioPlayer audioPlayer = AudioPlayer();

  Duration totalDuration;
  Duration position;
  String audioState;

  void _switchCard() {
    setState(() {
      _showFrontSide = !_showFrontSide;
    });
  }

  Widget _buildFlipAnimation() {
    return GestureDetector(
      onTap: _switchCard,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 800),
        transitionBuilder: _transitionBuilder,
        layoutBuilder: (widget, list) => Stack(children: [widget, ...list]),
        child: _showFrontSide ? _buildFront() : _buildRear(),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInBack.flipped,
      ),
    );
  }

  Widget _transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_showFrontSide) != widget.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: _flipXAxis
              ? (Matrix4.rotationY(value)..setEntry(3, 0, tilt))
              : (Matrix4.rotationX(value)..setEntry(3, 1, tilt)),
          child: widget,
          alignment: Alignment.center,
        );
      },
    );
  }

  Widget _buildFront() {
    return _buildLayout(
      key: ValueKey(true),
      backgroundColor: Colors.blue,
      faceName: "Front",
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcATop),
        ),
      ),
    );
  }

  Widget _buildRear() {
    return _buildLayout(
      key: ValueKey(false),
      backgroundColor: Colors.blue.shade700,
      faceName: "T",
      child: Padding(
        padding: EdgeInsets.all(20.0),
        // child: Expanded(
        //   child: SingleChildScrollView(
        //     scrollDirection: Axis.horizontal,
        //     child: Text(
        //       "hey this is a test\n again just a test \n hey this is a test\n again just a test \n hey this is a test\n again just a test \n",
        //       style: TextStyle(
        //         fontWeight: FontWeight.bold,
        //         fontSize: 20,
        //         letterSpacing: 3,
        //         wordSpacing: 3,
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }

  Widget _buildLayout(
      {Key key, Widget child, String faceName, Color backgroundColor}) {
    return Container(
      key: key,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      width: 300,
      height: 400,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20.0),
        color: backgroundColor,
      ),
      child: Container(
        width: 250,
        height: 300,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Text(
            " hey this is a test\n again just a test \n hey this is a test\n again just a test \n hey this is a test\n again just a test \n hey this is a test\n again just a test \n hey this is a test\n again just a test \n hey this is a test\n again just a test \n hey this is a test\n again just a test \n hey this is a test\n again just a test \n hey this is a test\n again just a test \n hey this is a test\n again just a test \n hey this is a test\n again just a test \n hey this is a test\n again just a test \nhey this is a test\n again just a test \n hey this is a test\n again just a test \n hey this is a test\n again just a test \n hey this is a test\n again just a test \n hey this is a test\n again just a test \n hey this is a test\n again just a test \n hey this is a test\n again just a test \n hey this is a test\n again just a test \n hey this is a test\n again just a test \n hey this is a test\n again just a test \n hey this is a test\n again just a test \n hey this is a test\n again just a test \n",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              letterSpacing: 3,
              wordSpacing: 3,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    //initAudio();
    super.initState();
    _showFrontSide = true;
    _flipXAxis = true;
    playing = false;

    audioPlayer = AssetsAudioPlayer();
    audioPlayer.open(
      Playlist(
        audios: [
          Audio("assets/Alton.mp3"),
          Audio("assets/Alton2.mp3"),
          Audio("assets/Foster.mp3"),
          Audio("assets/godfrey.mp3"),
          Audio("assets/Hamel.mp3"),
          Audio("assets/Moro.mp3")
        ],
      ),
      loopMode: LoopMode.playlist,
    );
    audioPlayer.next();
    audioPlayer.previous();
    audioPlayer.playlistPlayAtIndex(1);
  }

  playAudio() {
    audioPlayer.play();
  }

  pauseAudio() {
    audioPlayer.pause();
  }

  stopAudio() {
    audioPlayer.stop();
  }

  nextAudio() {
    audioPlayer.next();
  }

  previousAudio() {
    audioPlayer.previous();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      appBar: AppBar(
        backgroundColor: Color(0xFF8b0d04),
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
      body: Center(
        // Container(
        //   constraints:
        //     BoxConstraints.tight(Size.square(200.0)),
        //     child: _buildFlipAnimation(),
        child: ListView(
          children: <Widget>[
            Container(
              //constraints: BoxConstraints.tight(Size.square(300)),
              alignment: Alignment.center,
              child: _buildFlipAnimation(),
            ),
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          iconSize: 45.0,
                          color: Colors.black,
                          onPressed: () {
                            //flip card
                            _switchCard();
                          },
                          tooltip: "Closed Captions",
                          icon: Icon(
                            Icons.closed_caption,
                          ),
                          // icon: RotatedBox(
                          //   child: Icon(Icons.flip),
                          //   quarterTurns: _flipXAxis ? 0 : 1,
                          // ),
                        ),
                        IconButton(
                          iconSize: 45.0,
                          color: Colors.black,
                          onPressed: () {
                            previousAudio();
                          },
                          tooltip: "Previous Chapter",
                          icon: Icon(Icons.skip_previous),
                        ),
                        IconButton(
                          iconSize: 62.0,
                          color: Colors.black,
                          onPressed: () {
                            if (!playing) {
                              playAudio();
                              setState(() {
                                playBtn = Icons.pause_circle_filled_rounded;
                                playing = true;
                              });
                            } else {
                              pauseAudio();
                              setState(() {
                                playBtn = Icons.play_circle_fill_rounded;
                                playing = false;
                              });
                            }
                          },
                          tooltip: "Play/Pause",
                          icon: Icon(
                            playBtn,
                          ),
                        ),
                        IconButton(
                          iconSize: 45.0,
                          color: Colors.black,
                          onPressed: () {
                            nextAudio();
                          },
                          tooltip: "Next Chapter",
                          icon: Icon(
                            Icons.skip_next,
                          ),
                        ),
                        IconButton(
                          iconSize: 45.0,
                          color: Colors.black,
                          onPressed: () {},
                          tooltip: "View Chapters",
                          icon: Icon(
                            Icons.list,
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
