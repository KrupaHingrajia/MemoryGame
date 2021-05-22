import 'package:flutter/cupertino.dart';
import 'package:memory_game/model/tile_model.dart';

String selectedTile = "";
String selectedImageAssetPath = "";
int selectedIndex;
bool selected = true;
int points = 0;
int selectedTileIndex;


List<TileModel> visiblePairs= List<TileModel>();
List<TileModel> myPairs = new List<TileModel>();
List<bool> clicked = new List<bool>();

var _numberOfTiles = 16;

List<bool> getClicked() {
  List<bool> yoClicked = new List<bool>();
  List<TileModel> myairs = new List<TileModel>();
  myairs = getPairs();
  for(int i=0;  i<myairs.length; i++){
    yoClicked[i] = false;
  }
  return yoClicked;
}

List<TileModel> getPairs() {
  List<TileModel> pairs = [];

  //TileModel tileModel = TileModel();
  //print("1234567890-======" +pairs.toString());

  for (int i = 0; i < _numberOfTiles; i++) {
      TileModel tileModel = TileModel();

      // TODO:- Need to update this logic.
      var strAssetName = "";
      switch (i) {
        case 0:
        case 1:
          strAssetName = "assets/MMonster1@2x.png";
          break;

        case 2:
        case 3:
          strAssetName = "assets/MMonster2@2x.png";
          break;

        case 4:
        case 5:
          strAssetName = "assets/MMonster3@2x.png";
          break;

        case 6:
        case 7:
          strAssetName = "assets/MMonster4@2x.png";
          break;

        case 8:
        case 9:
          strAssetName = "assets/MMonster5@2x.png";
          break;

        case 10:
        case 11:
          strAssetName = "assets/MMonster6@2x.png";
          break;

        case 12:
        case 13:
          strAssetName = "assets/MMonster7@2x.png";
          break;

        case 14:
        case 15:
          strAssetName = "assets/MMonster10@2x.png";
          break;

        default:
          break;
      }

      tileModel.setImageAssetPath(strAssetName);
      tileModel.setIsSelected(false);
      pairs.add(tileModel);
  }

  /*//1
  tileModel.setImageAssetPath("assets/MMonster1@2x.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  //2
  tileModel.setImageAssetPath("assets/MMonster2@2x.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //3
  tileModel.setImageAssetPath("assets/MMonster3@2x.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //4
  tileModel.setImageAssetPath("assets/MMonster4@2x.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();
  //5
  tileModel.setImageAssetPath("assets/MMonster5@2x.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //6
  tileModel.setImageAssetPath("assets/MMonster6@2x.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //7
  tileModel.setImageAssetPath("assets/MMonster7@2x.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //8
  tileModel.setImageAssetPath("assets/MMonster10@2x.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();
  */

  return pairs;
}

List<TileModel>  getQuestionPairs(){

  List<TileModel> pairs = new List<TileModel>();

  TileModel tileModel = new TileModel();

  //1
  tileModel.setImageAssetPath("assets/MBlankMonster@2x.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //2
  tileModel.setImageAssetPath("assets/MBlankMonster@2x.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //3
  tileModel.setImageAssetPath("assets/MBlankMonster@2x.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //4
  tileModel.setImageAssetPath("assets/MBlankMonster@2x.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();
  //5
  tileModel.setImageAssetPath("assets/MBlankMonster@2x.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //6
  tileModel.setImageAssetPath("assets/MBlankMonster@2x.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //7
  tileModel.setImageAssetPath("assets/MBlankMonster@2x.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  //8
  tileModel.setImageAssetPath("assets/MBlankMonster@2x.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  return pairs;
}