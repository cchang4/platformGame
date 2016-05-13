public class Player implements Movable{

    PShape square;
    
    float x, y;
    
    player(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  void playerSetup(){
    square = createShape(RECT, 0, 0, 20, 20);
    square.setFill(color(0,0,255));
    square.setStroke(false);
  }
  
  void display(){
    shape(square, x, y);
  } 
}