class monster {

  PShape mons;
  float x, y;
  float speed = 1.0;
  String direction;

  monster(float x, float y) {
    this.x = x;
    this.y = y;
    direction = "right";
  }

  void setup() {
    mons = createShape(RECT, 0, 0, tileSize, tileSize);
    mons.setFill(color(255, 0, 0));
    mons.setStroke(false);
  }

  void display() {
    shape(mons, x, y);
  }

  void move() {
    if (direction.equals("right")) {
      x += speed;
    } else {
      x -= speed;
    }
  }

  void hitWall() {
    if (x<0) {
      direction = "right";
    }
    if (x>width-tileSize) {
      direction = "left";
    }
  }
  
  float getX(){
    return x;
  }
  float getY(){
    return y;
  }
  
}