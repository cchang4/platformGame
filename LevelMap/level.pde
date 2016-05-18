class level{
  static final int empty = 0;
  static final int floor = 1;
  static final int ladder = 2;
  static final int wall = 3;
  static final int changed = 4;
  
  int[][] world = new int[widthT][heightT];

  int [][] start= {
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
  };

  void drawTile(){ 
    for(int i=0; i<widthT; i++){ //each colunm
      for(int j=0; j<heightT; j++){ //each tile in that column
        switch(start[j][i]){
        case 1: //floor
          stroke(35,170,33);
          fill(30,200,30);
          break;
        case 2: //ladder
          stroke(150,120,25);
          fill(157,126,21);
          break;
        default: //empty space
          stroke(225);
          fill(240);
          break;
        }
        rect(i*tileSize, j*tileSize, //x,y top left corner
          tileSize-1, tileSize-1); //width and height of tile
      }
    }
  }
  
  //determine what tile is at a given position
  int tileBelow(float x, float y){
    float gridX = x/tileSize;
    float gridY = y/tileSize;
    
    //boundary checks
    if(gridX < 0 || gridX >= widthT || gridY < 0 || gridY >= heightT){
      return wall;
    }
    
    return start[int(gridY)][int(gridX)];
  }
  
  //change tile at given position
  void setTile(float x, float y, int newTile){
    int gridX = int(x/tileSize);
    int gridY = int(y/tileSize);
   
     if(gridX<0 || gridX>=widthT || gridY<0 || gridY>=heightT) {
      return; // boundary check
    }
    start[gridX][gridY] = newTile;
    stroke(11,215,225);
    fill(11,224,219);
    rect(gridY*tileSize, gridX*tileSize, tileSize, tileSize);
    println(start[gridX][gridY]);
}
}