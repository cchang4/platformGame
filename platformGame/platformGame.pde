ArrayList<Moveable> thingsToMove = new ArrayList<Moveable>();
ArrayList<Positionable> thingsThatExist = new ArrayList<Positionable>();
Player player = new Player(0,260);
World world = new World();

static final int tileSize = 20; //size of each tile in pixels

public void setup(){
  size(500,300);
}

public void draw(){
  background(200);
  player.display();
  world.initialize("levelOne.txt");
  textSize(10);
  for(int r=0; r<height; r+=tileSize){
    line(0,r,width,r);
  }
  for(int c=0; c<width;c+=tileSize){
    line(c,0,c,height);
  }
}