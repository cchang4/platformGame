level test = new level();
int tileSize = 20; //size of each tile in pixels
int heightT = 20; //number of tiles vertically
int widthT = 25; //number of tiles horizontally
player p = new player(0,260);
int[][]world;
int blue;

void setup(){
  size(500, 300);
  p.playerSetup();
  world = new int[heightT][widthT];
  test.readFile("level.txt");
  
  frameRate(24);
}

float ground = p.getY();
final float max = ground - 50;

void draw(){
  background(200);
  test.drawTile();
  p.display();
  p.movement();
  if (p.getY() < ground){
    p.fall();
  }

  changeTile();
  textAlign(LEFT);
  textSize(tileSize/1.5);
  fill(0);
  text("changed:"+blue+"  leftover:"+test.cTiles(), tileSize,tileSize);
  test.winLevel();
}

void keyPressed(){
  if (key == CODED){
    if (keyCode == LEFT){
      p.setLeft(1);
    }
    
    if (keyCode == RIGHT){
      p.setRight(1);
    }
    
    if (keyCode == UP){ 
      p.setJump(true);      
    }
    
  }
}

void keyReleased(){
  if (key == CODED){
    if (keyCode == LEFT){
      p.setLeft(0);
    }
    
    if (keyCode == RIGHT){
      p.setRight(0);
    }
    
     if (keyCode == UP){
       p.setJump(false);
    }
    
  }
}  
  
void changeTile(){
  //float pcenterX = p.getX()+tileSize/2;
  //float pcenterY = p.getY()+tileSize/2;
  if(test.tileAt(p.getX(),p.getY()+tileSize) == 1){ //if tile under is floor
    test.setTile(p.getX(),p.getY()+tileSize, 3);
    blue++;
  }
  if(test.tileAt(p.getX()+tileSize/2,p.getY()+tileSize) == 1){ //if tile under is floor
    test.setTile(p.getX()+tileSize/2,p.getY()+tileSize, 3);
    blue++;
  }
  if(test.tileAt(p.getX(), p.getY()) == 2){
    test.setTile(p.getX(),p.getY(), 3);
    blue++;
  }
  if(test.tileAt(p.getX()+tileSize/2, p.getY()) == 2){
    test.setTile(p.getX()+tileSize/2,p.getY(), 3);
    blue++;
  }
}