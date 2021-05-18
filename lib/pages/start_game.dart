// // import 'package:flip_card/flip_card.dart';
// // import 'package:flutter/material.dart';
// // import 'package:memory_game/data/data.dart';
// //
// // class StartGame extends StatefulWidget {
// //   @override
// //   _StartGameState createState() => _StartGameState();
// // }
// //
// // class _StartGameState extends State<StartGame> {
// //   @override
// //   void initState() {
// //     super.initState();
// //     myPairs = getPairs();
// //     myPairs.shuffle();
// //     visiblePairs = myPairs;
// //     // selected = true;
// //     ///Start cards
// //     Future.delayed(const Duration(seconds: 3), () {
// //       setState(() {
// //         visiblePairs = getQuestionPairs();
// //         selected = false;
// //       });
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         body: Stack(
// //       children: [
// //         //Lottie.asset("assets/46367-space-rocket.json",
// //         //height: MediaQuery.of(context).size.height),
// //         Container(
// //           padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
// //           child: Column(
// //             children: [
// //               SizedBox(
// //                 height: 20,
// //               ),
// //               points != 800
// //                   ? Column(
// //                       children: [
// //                         Text("$points/800"),
// //                         Text("Points"),
// //                       ],
// //                     )
// //                   : Container(),
// //               SizedBox(
// //                 height: 30,
// //               ),
// //               points != 800
// //                   ? GridView(
// //                       shrinkWrap: true,
// //                       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
// //                           mainAxisSpacing: 0.0, maxCrossAxisExtent: 100),
// //                       children: List.generate(visiblePairs.length, (index) {
// //                         return Tile(
// //                           imageAssetPath:
// //                               visiblePairs[index].getImageAssetPath(),
// //                           parent: this,
// //                           tileIndex: index,
// //                         );
// //                       })
// //               )
// //                   : Center(
// //                       child: GestureDetector(
// //                         onTap: () {
// //                           setState(() {
// //                             points = 0;
// //                           });
// //                           Navigator.of(context).push(
// //                               MaterialPageRoute(builder: (_) => StartGame()));
// //                         },
// //                         child: Container(
// //                             padding: EdgeInsets.symmetric(
// //                                 vertical: 23, horizontal: 30),
// //                             decoration: BoxDecoration(
// //                                 color: Colors.teal,
// //                                 borderRadius: BorderRadius.circular(2.0)),
// //                             child: Text("Replay")),
// //                       ),
// //                     )
// //             ],
// //           ),
// //         )
// //       ],
// //     ));
// //   }
// // }
// //
// // class Tile extends StatefulWidget {
// //   String imageAssetPath;
// //   int tileIndex;
// //   _StartGameState parent;
// //
// //   Tile({this.imageAssetPath, this.parent, this.tileIndex});
// //
// //   @override
// //   _TileState createState() => _TileState();
// // }
// //
// // class _TileState extends State<Tile> {
// //   //  AnimationController controller;
// //   //  Animation flip_anim;
// //   //  @override
// //   //  void initState() {
// //   //
// //   //   super.initState();
// //   //   controller = AnimationController(duration: Duration(seconds: 3),vsync: this);
// //   //
// //   //   flip_anim = Tween(begin: 0.0, end:1.0).animate(CurvedAnimation(
// //   //       parent: controller,
// //   //       curve: Interval(0.0,0.1, curve: Curves.linear)));
// //   // }
// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(
// //       child: GestureDetector(
// //           onTap: () {
// //             // _buildFlipAnimation();
// //             // AlignmentDirectional.centerEnd.start;
// //             // controller.repeat();
// //             //  selected = false;
// //             //    Future.delayed(const Duration(seconds: 1), () {
// //             //   //selected = true;
// //             //     controller.stop();
// //             // });
// //
// //             if (!selected) {
// //               setState(() {
// //                 myPairs[widget.tileIndex].setIsSelected(true);
// //               });
// //               if (selectedImageAssetPath != "") {
// //                 if (selectedImageAssetPath ==
// //                     myPairs[widget.tileIndex].getImageAssetPath()) {
// //                   print("Correct");
// //                   selected = true;
// //
// //                   Future.delayed(const Duration(seconds: 2), () {
// //                     points = points + 100;
// //                     setState(() {});
// //                     selected = false;
// //                     widget.parent.setState(() {
// //                       myPairs[widget.tileIndex].setImageAssetPath("");
// //                       myPairs[selectedTileIndex].setImageAssetPath("");
// //                     });
// //                     selectedImageAssetPath = "";
// //                   });
// //                 } else {
// //                   print("Wrong");
// //                   selected = true;
// //                   Future.delayed(const Duration(seconds: 2), () {
// //                     //selected = false;
// //
// //                     widget.parent.setState(() {
// //                       myPairs[widget.tileIndex].setIsSelected(false);
// //                       myPairs[selectedTileIndex].setIsSelected(false);
// //                     });
// //                     setState(() {
// //                       selected = false;
// //                     });
// //                   });
// //                   selectedImageAssetPath = "";
// //                 }
// //               } else {
// //                 selectedTileIndex = widget.tileIndex;
// //                 selectedImageAssetPath =
// //                     myPairs[widget.tileIndex].getImageAssetPath();
// //               }
// //               setState(() {
// //                 myPairs[widget.tileIndex].setIsSelected(true);
// //               });
// //               print("Click me");
// //             }
// //
// //           },
// //
// //           child: Container(
// //             margin: EdgeInsets.all(5),
// //             // child: myPairs[widget.tileIndex].getImageAssetPath() != ""
// //             //           ? Image.asset(myPairs[widget.tileIndex].getIsSelected()
// //             //           ? myPairs[widget.tileIndex].getImageAssetPath()
// //             //           : widget.imageAssetPath)
// //             //           : Image.asset("assets/right_image.jpeg"),
// //             child: FlipCard(
// //               flipOnTouch: true,
// //               direction: FlipDirection.HORIZONTAL,
// //               front: myPairs[widget.tileIndex].getImageAssetPath() != ""
// //                       ? Image.asset(myPairs[widget.tileIndex].getIsSelected()
// //                       ? myPairs[widget.tileIndex].getImageAssetPath()
// //                       : widget.imageAssetPath)
// //                       : Image.asset("assets/right_image.jpeg"),
// //               back: Image.asset(myPairs[widget.tileIndex].getImageAssetPath()),
// //           ),
// //           ),
// //         ),
// //       );
// //
// //   }
// // }
//

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:memory_game/data/data.dart';

var count = 0;

class StartGame extends StatefulWidget {
  @override
  _StartGameState createState() => _StartGameState();
}

class _StartGameState extends State<StartGame> {
  GlobalKey<FlipCardState> lastFlipped;
  var cardKeys = Map<int, GlobalKey<FlipCardState>>();

  @override
  void initState() {
    super.initState();
    myPairs = getPairs();
    myPairs.shuffle();
    visiblePairs = myPairs;
    // selected = true;
    ///Start cards
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        visiblePairs = getQuestionPairs();
        selected = false;
      });
    });
    if (count == 8) {
      count = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        // Lottie.asset("assets/61518-confetti.json",
        // height: MediaQuery.of(context).size.height),
        Container(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              points != 800
                  ? Column(
                      children: [
                        Text("$points/800"),
                        Text("Points"),
                      ],
                    )
                  : Container(),
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
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 23, horizontal: 30),
                            decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                borderRadius: BorderRadius.circular(2.0)),
                            child: Text("Replay")),
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
  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
      onTap: () {
        if (!selected) {
          setState(() {
            myPairs[widget.tileIndex].setIsSelected(true);
          });
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
              : Image.asset("assets/right_image.jpeg"),
          back: Image.asset(myPairs[widget.tileIndex].getImageAssetPath() == ""
              ? "assets/right_image.jpeg"
              : myPairs[widget.tileIndex].getImageAssetPath()),
        ),
      ),
    ));
  }
}
