level test;
int tileSize = 20; //size of each tile in pixels
int heightT = 20; //number of tiles vertically
int widthT = 25; //number of tiles horizontally
player p = new player(0, 260);
int[][]world;
int blue;
int score;
int lives;
//monster mons = new monster(400, 260);
monster[]m = new monster[3];

void setup() {
  size(500, 300);
  p = new player(0, 260);
  p.playerSetup();
  world = new int[heightT][widthT];


  test = new level();
  test.readFile("level.txt");

  score = 0;
  lives = 3;
  blue = 0;
  //test.drawTile();

  frameRate(60);

  //mons.setup();
  m[0] = new monster(400, 260);
  m[1] = new monster(200, 180);
  m[2] = new monster(400, 60);
  for (int i=0; i<m.length; i++) {
    m[i].setup();
  }
  //text(test.cTiles(), tileSize+40, tileSize);
}

float ground = p.getY();

void setGround(float newGround) {
  ground = newGround;
}

void draw() {
  background(200);


  //gameScreen();
  test.drawTile();

  p.display();
  p.movement();

  p.invin();

  changeTile();
  textAlign(LEFT);
  textSize(tileSize/1.5);
  fill(0);
  text("changed:"+blue, tileSize, tileSize);
  //text("changed:"+blue+"  leftover:"+test.cTiles(), tileSize,tileSize);
  textAlign(RIGHT);
  text("lives:"+lives, width-tileSize, tileSize);

  score = blue * 10;

  for (int i=0; i<m.length; i++) {
    m[i].display();
    m[i].move();
    m[i].hitWall();
    p.collide(m[i]);
  }

  test.winLevel();

  test.lose();
}
  
boolean reset = false;

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {  
      if (p.getY() < ground) {
        p.setLeft(0);
      } else {      
        p.setLeft(1);
      }

      p.setFlip(true);
    }

    if (keyCode == RIGHT) {
      if (p.getY() < ground) {
        p.setRight(0);
      } else {  
        p.setRight(1);
      }

      p.setFlip(false);
    }

    if (keyCode == UP) { 
      if (test.tileAt(p.getX()-10, p.getY()) == 2 || 
        test.tileAt(p.getX()-10, p.getY()) == 4 ||
        test.tileAt(p.getX()+5, p.getY()) == 2 || 
        test.tileAt(p.getX()+5, p.getY()) == 4) {
        p.setJump(false);
        p.setClimb(true);
        
      } else {
        if (test.tileAt(p.getX(), p.getY()) == 0 &&
        (test.tileAt(p.getX(), p.getY()+20) == 3 )){
        p.setJump(true);
          }
      }
      
    if (  test.tileAt(p.getX(), p.getY()) == 0 &&
          test.tileAt(p.getX(), p.getY()+20) == 4)
          {
            setGround(p.getY() -20);
          }
         
      
    } 
   
    }
  

    if (reset) {
      if (key == ' ') {
        setup();
        reset = false;
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
        test.setTile(p.getX(), p.getY(), 4);
        blue++;
      }
      if (test.tileAt(p.getX()+tileSize/1.5, p.getY()) == 2) {
        test.setTile(p.getX()+tileSize/1.5, p.getY(), 4);
        blue++;
      }
    }
  }

  void gameScreen() {
    test.drawTile();

    p.display();
    p.movement();

    p.invin();

    changeTile();
    textAlign(LEFT);
    textSize(tileSize/1.5);
    fill(0);
    text("changed:"+blue, tileSize, tileSize);
    //text("changed:"+blue+"  leftover:"+test.cTiles(), tileSize,tileSize);
    textAlign(RIGHT);
    text("lives:"+lives, width-tileSize, tileSize);

    score = blue * 10;

    for (int i=0; i<m.length; i++) {
      m[i].display();
      m[i].move();
      m[i].hitWall();
      p.collide(m[i]);
    }
  }