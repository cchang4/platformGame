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
/*
  void setup() {
    mons = createShape(RECT, 0, 0, tileSize, tileSize);
    mons.setFill(color(255, 0, 0));
    mons.setStroke(false);
  }
  */
  
  PImage monster;
  PImage monsterflip;

  void display() {
    //shape(mons, x, y);
    
    monster = loadImage("monster.png");
    monsterflip = loadImage("monster left.png");
    
  }

  void move() {
    if (direction.equals("right")) {
      image(monster, x, y);
      x += speed;
    } else {
      image(monsterflip, x, y);
      x -= speed;
    }
  }

  void hitWall() {
    if (x<0 || test.tileAt(x-tileSize, y+tileSize) == 0) {
      direction = "right";
    }
    if (x>width-tileSize || test.tileAt(x+tileSize, y+tileSize) == 0) {
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