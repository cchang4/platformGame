class player{
    
  PShape square;  // The PShape object
  
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
  
  float left;
  float right;
  float xspeed = 5.0;
  float smoothen = .001;
  
  void movement(){
   x += (right - left) * xspeed;   
   x -= (right - left) * (xspeed * smoothen);
  }
  
  void setLeft( float newLeft){
    left = newLeft;
  }
  
  void setRight(float newRight){
    right = newRight;
  }
  
}