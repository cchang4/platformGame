public abstract class Tile{
  int row, col;
  PShape square;
  
  public Tile(int r, int c){
    row = r;
    col = c;
  }
  
  public abstract void intialize();
  
  public PShape image(){
    return square;
  }
 
}