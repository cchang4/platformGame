class Block extends Tile{
  int type;
  int x, y;
  
  public Block(int type, int r, int c){
    super(r, c);
    this.type = type;
  }
  
  private void intialize(){
    x = col * tileSize;
    y = row * tileSize;
    square = createShape(RECT, x, y, tileSize, tileSize);
  }
  
}