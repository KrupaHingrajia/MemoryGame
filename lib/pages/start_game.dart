import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:memory_game/data/data.dart';

var count = 0;

class StartGame extends StatefulWidget {
  @override
  _StartGameState createState() => _StartGameState();
}

class _StartGameState extends State<StartGame> with WidgetsBindingObserver {
  GlobalKey<FlipCardState> lastFlipped;
  var cardKeys = Map<int, GlobalKey<FlipCardState>>();

  AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;
  AudioCache audioCache;
  String path = 'PlayBackground.mp3';

  @override
  void initState() {
    super.initState();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState s) {
      setState(() {
        audioPlayerState = s;
      });
    });
    myPairs = getPairs();
    myPairs.shuffle();
    visiblePairs = myPairs;
    // selected = true;
    ///Start cards
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        visiblePairs = getQuestionPairs();
        selected = false;
      });
    });
    if (count == 8) {
      count = 0;
    }
    playMusic();
    pauseMusic();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
    audioCache.clearCache();
    WidgetsBinding.instance?.removeObserver(this);
  }

  playMusic() async {
    await audioCache.play(path);
    await audioPlayer.setReleaseMode(ReleaseMode.LOOP);
  }

  pauseMusic() async {
    await audioPlayer.pause();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.inactive) {
      pauseMusic();
    } else if (state == AppLifecycleState.resumed) {
      playMusic();
    }
  }


  @override
  Widget build(BuildContext context) {
    if(count == 8) {
      pauseMusic();
    }
    return Scaffold(
        body: Stack(
          children: [
            // Lottie.asset("assets/61518-confetti.json",
            // height: MediaQuery.of(context).size.height),
            Container(
              color: Colors.pinkAccent.withOpacity(0.20),
              //color: Colors.lightBlueAccent,
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  points != 800
                      ? Column(
                    children: [
                      Text("$points/800"),
                      Text("Points"),
                    ],
                  )
                      : Container(
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  count != 8
                      ? GridView(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 0.0,
                          crossAxisCount: 4,
                          mainAxisExtent: 100),
                      children: List.generate(visiblePairs.length, (index) {
                        cardKeys.putIfAbsent(
                            index, () => GlobalKey<FlipCardState>());
                        GlobalKey<FlipCardState> thisCard = cardKeys[index];
                        return Tile(
                            imageAssetPath:visiblePairs[index].getImageAssetPath(),
                            parent: this,
                            tileIndex: index);
                      }))
                      : Center(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          points = 0;
                        });
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => StartGame()));
                      },
                      child: Stack(
                        children: [
                          Lottie.asset("assets/winner.json",
                            height: MediaQuery.of(context).size.height -220,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 23, horizontal: 30),
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlueAccent,
                                      borderRadius: BorderRadius.circular(2.0)),
                                  child: Text("Replay")),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class Tile extends StatefulWidget {
  String imageAssetPath;
  int tileIndex;
  _StartGameState parent;

  Tile({this.imageAssetPath, this.parent, this.tileIndex});

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;
  AudioCache audioCache;
  String paths = 'Button.mp3';

  @override
  void initState() {
    super.initState();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState s) {
      setState(() {
        audioPlayerState = s;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
    audioCache.clearCache();
  }

  playMusic() async {
    await audioCache.play(paths);
  }

  pauseMusic() async {
    await audioPlayer.pause();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
          onTap: () {
            playMusic();
            print(myPairs[widget.tileIndex].getImageAssetPath());
            if(myPairs[widget.tileIndex].getImageAssetPath().isEmpty){
              print("jmmmmmm3@@@@@@@@@@@@@@@@@@@@");
              setState(() {
                selected = true;
              });
            }
            else{
              setState(() {
                selected = false;
              });
            }
            if (!selected) {
              setState(() {
                myPairs[widget.tileIndex].setIsSelected(true);
              });
              //widget.parent.cardKeys[widget.tileIndex].currentState.toggleCard();
              widget.parent.cardKeys[widget.tileIndex].currentState.toggleCard();

              if (selectedImageAssetPath != "") {
                if (selectedImageAssetPath ==
                    myPairs[widget.tileIndex].getImageAssetPath()) {
                  print("Correct");
                  selected = true;
                  count = count + 1;
                  print("+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+" +
                      count.toString());

                  Future.delayed(const Duration(seconds: 1), () {
                    points = points + 100;
                    setState(() {});
                    selected = false;
                    widget.parent.setState(() {
                      myPairs[widget.tileIndex].setImageAssetPath("");
                      myPairs[selectedTileIndex].setImageAssetPath("");
                    });
                    widget.parent.cardKeys[widget.tileIndex].currentState
                        .toggleCard();
                    widget.parent.lastFlipped.currentState.toggleCard();
                    selectedImageAssetPath = "";
                  });
                } else {
                  print("Wrong");
                  selected = true;
                  Future.delayed(const Duration(seconds: 1), () {
                    points = points - 50;
                    widget.parent.setState(() {
                      print("=--=--=--=--=--=--=--=--=--=--=--=");
                      myPairs[widget.tileIndex].setIsSelected(false);
                      myPairs[selectedTileIndex].setIsSelected(false);
                    });
                    setState(() {
                      selected = false;
                    });
                    widget.parent.cardKeys[widget.tileIndex].currentState
                        .toggleCard();
                    widget.parent.lastFlipped.currentState.toggleCard();
                  });
                  selectedImageAssetPath = "";
                }
              } else {
                widget.parent.lastFlipped =
                widget.parent.cardKeys[widget.tileIndex];
                print("lastFlipped");
                selectedTileIndex = widget.tileIndex;
                selectedImageAssetPath =
                    myPairs[widget.tileIndex].getImageAssetPath();
              }
              setState(() {
                myPairs[widget.tileIndex].setIsSelected(true);
              });
              print("Click me");
            }
          },
          child: Container(
            margin: EdgeInsets.all(5),
            // child: myPairs[widget.tileIndex].getImageAssetPath() != ""
            //           ? Image.asset(myPairs[widget.tileIndex].getIsSelected()
            //           ? myPairs[widget.tileIndex].getImageAssetPath()
            //           : widget.imageAssetPath)
            //           : Image.asset("assets/right_image.jpeg"),
            child: FlipCard(
              flipOnTouch: false,
              key: widget.parent.cardKeys[widget.tileIndex],
              direction: FlipDirection.HORIZONTAL,
              front: myPairs[widget.tileIndex].getImageAssetPath() != ""
                  ? Image.asset(myPairs[widget.tileIndex].getIsSelected()
                  ? myPairs[widget.tileIndex].getImageAssetPath()
                  : widget.imageAssetPath)
                  : Image.asset("assets/MWallMonster@2x.png"),
              back: Image.asset(myPairs[widget.tileIndex].getImageAssetPath() == ""
                  ? "assets/MWallMonster@2x.png"
                  : myPairs[widget.tileIndex].getImageAssetPath()),
            ),
          ),
        ));
  }
}