class monster{
  
  PShape mons;
  float x, y;
  
  monster(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  void setup(){
    mons = createShape(RECT, 0, 0, tileSize, tileSize);
    mons.setFill(color(255, 0, 0));
    mons.setStroke(false);
  }
  
  void display(){
    shape(mons, x, y);
  }
  
}