import 'package:flutter/material.dart';
import 'package:memory_game/data/data.dart';
import 'package:memory_game/model/tile_model.dart';

class StartGame extends StatefulWidget {
  @override
  _StartGameState createState() => _StartGameState();
}

class _StartGameState extends State<StartGame> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myPairs = getPairs();
    myPairs.shuffle();
    visiblePairs = myPairs;
    selected = true;

    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        visiblePairs = getQuestionPairs();
        selected = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text("$points/800"),
          Text("Points"),
          SizedBox(
            height: 20,
          ),
          GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisSpacing: 0.0, maxCrossAxisExtent: 100),
            children: List.generate(visiblePairs.length, (index) {
              return Tile(
                imageAssetPath: visiblePairs[index].getImageAssetPath(),
                parent: this,
                tileIndex: index,
              );
            }),
          )
        ],
      ),
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
    return GestureDetector(
      onTap: ()
          // {
          //   if (!selected) {
          //     setState(() {
          //       myPairs[widget.tileIndex].setIsSelected(true);
          //     });
          //     if (selectedTile != "") {
          //       /// testing if the selected tiles are same
          //       if (selectedTile == myPairs[widget.tileIndex].getImageAssetPath()) {
          //         print("add point");
          //         points = points + 100;
          //         print(selectedTile + " thishis" + widget.imageAssetPath);
          //
          //         TileModel tileModel = new TileModel();
          //         print(widget.tileIndex);
          //         selected = true;
          //         Future.delayed(const Duration(seconds: 2), () {
          //           tileModel.setImageAssetPath("");
          //           myPairs[widget.tileIndex] = tileModel;
          //           print(selectedIndex);
          //           myPairs[selectedIndex] = tileModel;
          //           this.widget.parent.setState(() {});
          //           setState(() {
          //             selected = false;
          //           });
          //           selectedTile = "";
          //         });
          //       } else {
          //         print(selectedTile +
          //             " thishis " +
          //             myPairs[widget.tileIndex].getImageAssetPath());
          //         print("wrong choice");
          //         print(widget.tileIndex);
          //         print(selectedIndex);
          //         selected = true;
          //         Future.delayed(const Duration(seconds: 2), () {
          //           this.widget.parent.setState(() {
          //             myPairs[widget.tileIndex].setIsSelected(false);
          //             myPairs[selectedIndex].setIsSelected(false);
          //           });
          //           setState(() {
          //             selected = false;
          //           });
          //         });
          //
          //         selectedTile = "";
          //       }
          //     } else {
          //       setState(() {
          //         selectedTile = myPairs[widget.tileIndex].getImageAssetPath();
          //         selectedIndex = widget.tileIndex;
          //       });
          //
          //       print(selectedTile);
          //       print(selectedIndex);
          //     }
          //   }
          // },
          {
        if (!selected) {
          if (selectedImageAssetPath != "") {
            if (selectedImageAssetPath ==
                myPairs[widget.tileIndex].getImageAssetPath()) {
              print("Correct");
              selected = true;

              Future.delayed(const Duration(seconds: 2), () {
                points = points + 100;
                setState(() {});
                selected = false;
                widget.parent.setState(() {
                  myPairs[widget.tileIndex].setImageAssetPath("");
                  myPairs[selectedTileIndex].setImageAssetPath("");
                });
                selectedImageAssetPath = "";
              });
            } else {
              print("Wrong");
              selected = true;
              Future.delayed(const Duration(seconds: 2), (){
                selected = true;
                widget.parent.setState(() {
                  myPairs[widget.tileIndex].setIsSelected(false);
                  myPairs[selectedTileIndex].setIsSelected(false);
                });
              });
              selectedImageAssetPath = "";

            }
          } else {
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
        child: myPairs[widget.tileIndex].getImageAssetPath() != ""
            ?  Image.asset(myPairs[widget.tileIndex].getIsSelected()
                ? myPairs[widget.tileIndex].getImageAssetPath()
                : widget.imageAssetPath) :Image.asset("assets/right_image.jpeg"),
      ),
    );
  }
}
