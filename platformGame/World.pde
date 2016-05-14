public class World{
  public Tile[][]map;
  int heightT = 15; //number of tiles vertically
  int widthT = 25; //number of tiles horizontally
  
  public World(){
    map = new Tile[widthT][heightT];
  }
  
  public void initialize(String stage){
    String line;
    String[] tilesInLine = new String[heightT];
    BufferedReader reader = createReader(stage);
    try{
    int i=0;
    while((line = reader.readLine()) != null){
      tilesInLine = line.split(line, ' ');
      for(int j=0; j<heightT; j++){
        if(!tilesInLine[j].equals("0")){
          map[i][j] = tileType(tilesInLine[j], i, j);
        }
      }
      i++;
    }
  }catch(IOException e){
    e.printStackTrace();
  }
  }
  
  public Tile tileType(String type, int i, int j){
    switch(type){
    case "-":
      return new Block("-",i,j);
    case "#":
      return new Block("#",i,j);
    default:
      return null;
    }
  }
}