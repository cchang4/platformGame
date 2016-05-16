class Block extends Tile{
  String type;
  int x, y;
  
  public Block(String type, int r, int c){
    super(r, c);
    this.type = type;
    loadTile();
  }
  
  
  void loadTile(){
      switch(type){
      case "-": //floor
        stroke(35,170,33);
        fill(30,200,30);
        break;
      case "#": //ladder
        stroke(150,120,25);
        fill(157,126,21);
        break;
      }
      square = createShape(RECT, x, y, tileSize, tileSize);
      //return square;
  }
  
   void intialize(){
    x = col * tileSize;
    y = row * tileSize;
  }
  
}