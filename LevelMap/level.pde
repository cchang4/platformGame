class level{
  
  final int empty = 0;
  final int floor = 1;
  final int ladder = 2;
  final int changed = 3;
  final int wall = 4;
  
  String[] tilesInLine = new String[heightT];

  void readFile(String stage){
    try{
      BufferedReader reader = createReader(stage);
      String line;
      int i = 0;
      while((line = reader.readLine()) != null){
        tilesInLine = line.split(" ");
        for(int j=0; j<heightT; j++){
          world[i][j] = int(tilesInLine[j]);
        }
        i++;
      }
    }catch(IOException e){
      e.printStackTrace();
    }
  }
  /*int [][] start= {
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},//1
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},//2
  {0,0,0,1,1,1,1,1,1,1,2,1,1,0,0,1,1,1,1,1,1,1,1,0,0},//3
  {0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0},//4
  {0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0},//5
  {0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0},//6
  {0,0,0,0,0,0,0,0,0,0,2,1,1,1,1,1,1,1,1,1,1,1,1,0,0},//7
  {0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0},//8
  {0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0},//9
  {0,0,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0},//10
  {0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},//11
  {0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},//12
  {0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},//13
  {0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},//14
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},//15
  };*/


  void drawTile(){ 
    for(int i=0; i<widthT; i++){ //each colunm
      for(int j=0; j<heightT; j++){ //each tile in that column
        switch(world[j][i]){
        case 1: //floor
          stroke(35,170,33);
          fill(30,200,30);
          break;
        case 2: //ladder
          stroke(150,120,25);
          fill(157,126,21);
          break;
        case 3:
          stroke(0, 232, 255);
          fill(0, 255, 255);
          break;
        default: //empty space
          //stroke(235);
          noStroke();
          fill(240,63);
          //tint(255, 126);
          break;
        }
        rect(i*tileSize, j*tileSize, //x,y top left corner
          tileSize-1, tileSize-1); //width and height of tile
      }
    }
  }
  
  //determine what tile is at a given position
  int tileAt(float x, float y){
    int gridX = int(x/tileSize);
    int gridY = int(y/tileSize);
    
    //boundary checks
    if(gridX < 0 || gridX >= widthT || gridY < 0 || gridY >= heightT){
      return wall;
    }
    //println(world[gridY][gridX]);
    return world[gridY][gridX];
  }
  
  //change tile at given position
  void setTile(float x, float y, int newTile){
    int gridX = int(x/tileSize);
    int gridY = int(y/tileSize);
   
     if(gridX<0 || gridX>=widthT || gridY<0 || gridY>=heightT) {
      return; // boundary check
    }
    world[gridY][gridX] = newTile;
}

 int cTiles(){
      int needChange = 0;
    for(int i=0; i<widthT; i++){ //each colunm
      for(int j=0; j<heightT; j++){
             if(world[j][i] == 1 || world[j][i] == 2){
           needChange++;
         }
      }
    }
    return needChange;
  }
  
  void winLevel(){
    if(cTiles() == 0){
      fill(0);
      rectMode(CENTER);
      rect(width/2, height/2, width/2, height/2);
      fill(250);
      textSize(tileSize);
      textAlign(CENTER);
      text("LEVEL COMPLETE", width/2, height/2);
      p.xspeed = 0;
      
    }
  }
}