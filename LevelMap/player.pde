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
  float once;
  boolean jump;
  
  
  void movement(){
   x += (right - left) * xspeed;   
   x -= (right - left) * (xspeed * smoothen);
   
   if(jump){
   y = max;
   
   }
   
   
   if(x>=480){
     x = 480;
   }
   
   if(x<0){
<<<<<<< HEAD
     x = 0;
   }
=======
     x = 500;
   }  
>>>>>>> b2b6ae9dc0b1426778b2613990267b938bb05d04
  }
  
  void fall(){
    y += 5;
  } 
  
  float getX(){
    return x;
  }
  
  float getY(){
    return y;
  }
    
  void setLeft( float newLeft){
    left = newLeft;
  }
  
  void setRight(float newRight){
    right = newRight;
  }
  
  void setJump(boolean newJump){
    jump = newJump;
  }
  
}