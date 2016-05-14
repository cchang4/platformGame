public class Player implements Moveable{

    PShape square;
    
    float x, y;
    
    public Player(float x, float y){
    this.x = x;
    this.y = y;
  }
  
   public float getX() { 
    return x;
  }
  public float getY() { 
    return y;
  }
  public void move(){}
  public void collide(ArrayList<Positionable> others) {}
  
  void playerSetup(){
    square = createShape(RECT, 0, 0, 20, 20);
    square.setFill(color(0,0,255));
    square.setStroke(false);
  }
  
  void display(){
    //shape(square, x, y);
  } 
}