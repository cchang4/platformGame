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
}