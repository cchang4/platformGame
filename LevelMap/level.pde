class level {

  final int empty = 0;
  final int floor = 1;
  final int ladder = 2;
  final int changed = 3;
  final int wall = 4;

  String[] tilesInLine = new String[heightT];

  void readFile(String stage) {
    try {
      BufferedReader reader = createReader(stage);
      String line;
      int i = 0;
      while ((line = reader.readLine()) != null) {
        tilesInLine = line.split(" ");
        for (int j=0; j<heightT+5; j++) {
          world[i][j] = int(tilesInLine[j]);
        }
        i++;
      }
    }
    catch(IOException e) {
      e.printStackTrace();
    }
  }


  void drawTile() { 
    for (int i=0; i<widthT; i++) { //each colunm
      for (int j=0; j<heightT; j++) { //each tile in that column
        switch(world[j][i]) {
        case 1: //floor
          stroke(35, 170, 33);
          fill(30, 200, 30);
          break;
        case 2: //ladder
          stroke(150, 120, 25);
          fill(157, 126, 21);
          break;
        case 3: //changed
          stroke(0, 232, 255);
          fill(0, 255, 255);
          break;
        default: //empty space
          //stroke(235);
          noStroke();
          fill(240, 63);
          //tint(255, 126);
          break;
        }
        rect(i*tileSize, j*tileSize, //x,y top left corner
          tileSize-1, tileSize-1); //width and height of tile
      }
    }
  }

  //determine what tile is at a given position

  int tileAt(float x, float y) {
    int gridX = int(x/tileSize);
    int gridY = int(y/tileSize);

    //boundary checks
    if (gridX < 0 || gridX >= widthT || gridY < 0 || gridY >= heightT) {
      return wall;
    }
    //println(world[gridY][gridX]);
    return world[gridY][gridX];
  }

  //change tile at given position
  void setTile(float x, float y, int newTile) {
    int gridX = int(x/tileSize);
    int gridY = int(y/tileSize);

    if (gridX<0 || gridX>=widthT || gridY<0 || gridY>=heightT) {
      return; // boundary check
    }

    world[gridY][gridX] = newTile;
  }

  int cTiles() {
    int needChange = 0;
    for (int i=0; i<widthT; i++) { //each colunm
      for (int j=0; j<heightT; j++) {
        if (world[j][i] == 1 || world[j][i] == 2) {
          needChange++;
        }
      }
    }
    return needChange;
  }

  boolean win = false;

  void winLevel() {
    if (cTiles() == 0) {
      fill(0, 200);
      rectMode(CENTER);
      rect(width/2, height/2, width/2, height/2);
      fill(250);
      textSize(tileSize);
      textAlign(CENTER);
      text("LEVEL COMPLETE", width/2, height/2);
      textSize(tileSize/1.5);
      text("score: "+score, width/2, height/2+20);
      win = true;
    }
  }

  void lose() {
    if (win == false) {
      if (p.isDead) {
        fill(0, 200);
        rectMode(CENTER);
        rect(width/2, height/2, width/2, height/2);
        fill(250);
        textSize(tileSize);
        textAlign(CENTER);
        text("YOU LOSE", width/2, height/2);
        textSize(tileSize/1.5);
        text("score: "+score, width/2, height/2+20);
      }
    }
  }
}