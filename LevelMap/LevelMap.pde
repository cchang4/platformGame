level test = new level();
int tileSize = 20; //size of each tile in pixels
int heightT = 15; //number of tiles vertically
int widthT = 25; //number of tiles horizontally
player p = new player(0,260);

void setup(){
  size(500, 300);
  p.playerSetup();
  
}

void draw(){
  background(200);
  test.drawTile();
  p.display();
  p.movement();
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

    }
    
  }
}  
  