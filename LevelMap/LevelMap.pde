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
monster[]m = new monster[3];

void setup() {
  size(500, 300);
  p.playerSetup();
  world = new int[heightT][widthT];
  test.readFile("level.txt");

  frameRate(60);

  mons.setup();
  m[0] = new monster(400, 260);
  m[1] = new monster(200, 180);
  m[2] = new monster(400, 60);
  for (int i=0; i<m.length; i++) {
    m[i].setup();
  }
  text(test.cTiles(), tileSize+40, tileSize);
}

float ground = p.getY() - 1;
final float max = ground - 50;

void draw() {
  background(200);
  test.drawTile();
  p.display();
  p.movement();

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

  test.lose();
  score = blue * 10;

  mons.display();
  mons.move();
  mons.hitWall();
  for (int i=0; i<m.length; i++) {
    m[i].display();
    m[i].move();
    m[i].hitWall();
    p.collide(m[i]);
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      p.setLeft(1);
    }

    if (keyCode == RIGHT) {
      p.setRight(1);
    }

    if (keyCode == UP) { 
      if (test.tileAt(p.getX(), p.getY()) == 2 || 
        test.tileAt(p.getX(), p.getY()) == 3) {
        p.setJump(false);
        p.setClimb(true);
      }

      p.setJump(true);
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
      p.setClimb(false);
    }
  }
}  

void changeTile() {
  if (p.isDead == false) {
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
}