class TileModel{
   String imageAssetPath;
   bool isSelected;
   bool isTileOpened = false;

   TileModel({ this.imageAssetPath,  this.isSelected });

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setIsSelected(bool getIsSelected){
    isSelected = getIsSelected;
  }

   void setIsTileOpened(bool isTileOpened){
     isTileOpened = isTileOpened;
   }

  String getImageAssetPath(){
    return imageAssetPath;
  }

  bool getIsSelected() {
    return isSelected;
  }

  bool getIsTileOpened() {
    return isTileOpened;
  }
}