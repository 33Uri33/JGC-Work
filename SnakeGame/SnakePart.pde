public class SnakePart{
  final int RADIUS = 20;
  int moveTimer;
  int[] pos = new int[2];
  
  
  public SnakePart(int totalParts, int xPos,int yPos){
    this.moveTimer = totalParts;
    this.pos[0] = xPos;
    this.pos[1] = yPos;
  }
  
  //returns the SnakePart position
  public int[] getPos(){
    return this.pos;
  }
  
  //returns the SnakePart timer
  public int getTimer(){
    return this.moveTimer;
  }
  
  //increases timer by 1
  public void increamentTimer(){
    this.moveTimer += 1;
  }
  
  //draws the SnakePart
  public void show(){
    noStroke();
    fill(255);
    circle(pos[0], pos[1], RADIUS);
  }
  
  //updates timer and changes the SnakePart position when the timer ends
  public void move(int[] newPos){
    moveTimer-=1;
    if (moveTimer == 0){
      moveTimer = snake.size();
      pos[0] = newPos[0];
      pos[1] = newPos[1];
    }
    
  }
}

  
