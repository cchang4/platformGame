level test = new level();
int tileSize = 20; //size of each tile in pixels
int heightT = 20; //number of tiles vertically
int widthT = 25; //number of tiles horizontally
player p = new player(0, 260);
int[][]world;
int blue;
int score;
int lives = 3;
monster mons = new monster(400, 260);

void setup() {
  size(500, 300);
  p.playerSetup();
  world = new int[heightT][widthT];
  test.readFile("level.txt");

  frameRate(60);

  mons.setup();
}

float ground = p.getY();
final float max = ground - 50;

void draw() {
  background(200);
  test.drawTile();
  p.display();
  p.movement();
  if (p.getY() < ground) {
    p.fall();
  }
  p.collide(mons);
  p.invin();

  changeTile();
  textAlign(LEFT);
  textSize(tileSize/1.5);
  fill(0);
  text("changed:"+blue, tileSize, tileSize);
  //text("changed:"+blue+"  leftover:"+test.cTiles(), tileSize,tileSize);
  textAlign(RIGHT);
  text("lives:"+lives, width-tileSize, tileSize);
  test.winLevel();

  lose();
  score = blue * 10;

  mons.display();
  mons.move();
  mons.hitWall();
  /*if (mons.collide(p, mons)) {
    lives--;
  }*/
 
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      p.setLeft(1);
      if (keyCode == UP) {
        p.setJump(false);
      }
    }

    if (keyCode == RIGHT) {
      p.setRight(1);
      if (keyCode == UP) {
        p.setJump(false);
      }
    }

    if (keyCode == UP) { 
      if (p.getY() != ground) {
        p.setJump(false);
      } else {
        p.setJump(true);
      }
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      p.setLeft(0);
    }

    if (keyCode == RIGHT) {
      p.setRight(0);
    }

    if (keyCode == UP) {
      p.setJump(false);
    }
  }
}  

void changeTile() {
  //float pcenterX = p.getX()+tileSize/2;
  //float pcenterY = p.getY()+tileSize/2;
  if (test.tileAt(p.getX(), p.getY()+tileSize) == 1) { //if tile under is floor
    test.setTile(p.getX(), p.getY()+tileSize, 3);
    blue++;
  }
  if (test.tileAt(p.getX()+tileSize/2, p.getY()+tileSize) == 1) { //if tile under is floor
    test.setTile(p.getX()+tileSize/2, p.getY()+tileSize, 3);
    blue++;
  }
  if (test.tileAt(p.getX(), p.getY()) == 2) {
    test.setTile(p.getX(), p.getY(), 3);
    blue++;
  }
  if (test.tileAt(p.getX()+tileSize/1.5, p.getY()) == 2) {
    test.setTile(p.getX()+tileSize/1.5, p.getY(), 3);
    blue++;
  }
}

void lose() {
  if (p.isDead) {
    fill(0, 200);
    rectMode(CENTER);
    rect(width/2, height/2, width/2, height/2);
    fill(250);
    textSize(tileSize);
    textAlign(CENTER);
    text("YOU LOSE", width/2, height/2);
  }
}