level test = new level();

player p = new player(0,260);

void setup(){
  size(500, 300);
  p.playerSetup();
  
}

void draw(){
  background(200);
  test.drawTile();
  p.display();
}


  