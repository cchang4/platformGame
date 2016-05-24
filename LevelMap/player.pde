class player {

  PShape square;  // The PShape object

  float x, y;

  player(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void playerSetup() {
    square = createShape(RECT, 0, 0, 20, 20);
    square.setFill(color(0, 0, 255));
    square.setStroke(false);
  }

  void display() {
    shape(square, x, y);
  } 

  float left;
  float right;
  float xspeed = 5.0;
  float smoothen = .001;
  boolean jump;
  boolean ladder;
  
  
  void movement(){
   x += (right - left) * xspeed;   
   x -= (right - left) * (xspeed * smoothen);
   
   if(jump){
     y = max;
   
   }
   
   if(ladder){
     y -= 2;
   }
   
   
   if(x>=480){
     x = 480;
   }
   
   if(x<0){
     x = 0;
   }
  }



 void fall() {
    y += 5;
  } 

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  
  boolean getClimb(){
    return ladder;
  }
    
 
  void setLeft( float newLeft) {

    left = newLeft;
  }

  void setRight(float newRight) {
    right = newRight;
  }

  void setJump(boolean newJump) {
    jump = newJump;
  }

  
  void setClimb(boolean newLadder){
    ladder = newLadder;
  }
  



  //collision/die
  boolean isDead = false;
  boolean colli = false;
  int noColTime = 80;
  int timer = noColTime;

  boolean collide(monster m) {
    if (colli == false) {
      float x2 = m.getX();
      float y2 = m.getY();
      if (x >= x2 && x >= x2 + tileSize) {
        return false;
      } else if (x <= x2 && x + tileSize <= x2) {
        return false;
      } else if (y >= y2 && y >= y2 + tileSize) {
        return false;
      } else if (y <= y2 && y + tileSize <= y2) {
        return false;
      }
      colli = true;
      dead();
      return true;
    } else {
      return false;
    }
  }

  public void dead() {
    lives--;
    if (lives == 0) {
      isDead = true;
    }
  }

  //invincible after collision
  void invin() {
    if (colli) {
      timer--;
      textAlign(LEFT);
      textSize(tileSize/1.5);
      fill(0);
      text("invincible time:"+timer/10, tileSize, height-5);
      if (timer <= 0) {
        timer = noColTime;
        colli = false;
      }
    }
  }

}