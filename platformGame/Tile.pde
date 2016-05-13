public abstract class Tile{
  private float row, col;
  PShape square;
  
  public Tile(int r, int c){
    row = r;
    col = c;
  }
  
  abstract void intialize();
  
  public PShape image(){
    return square;
  }
  
  /*public void display(){
    switch(getType()){
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
      rect(getX(), getY(), //x,y top left corner
            tileSize-1, tileSize-1); //width and height of tile
    }
  }
        
    /*if(getType() == 1){
      stroke(35,170,33);
      fill(30,200,30);
      rect(getX(), getY(), tileSize-1, tileSize-1);
      */
    }
  }*/
}