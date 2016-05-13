ArrayList<Moveable> thingsToMove = new ArrayList<Moveable>();
ArrayList<Changeable> thingsThatChange = new ArrayList<Changeable>();
ArrayList<Positionable> thingsThatExist = new ArrayList<Positionable>();
Player player = new Player();

public void setup(){
  size(500,300);
}

public void draw(){
  background(200);
  player.display();
}