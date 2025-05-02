public class Paddle{
  
  final int WIDTH = 20, LENGTH = 200, SPEED = 5;
  boolean isRight;
  int posX, posY, extrude, direction = 1;
  
  public Paddle(boolean isRight){
    this.isRight = isRight;
    this.posY = 1;
    if (isRight){
      this.posX = GAME_WIDTH;
      extrude = -WIDTH;
    }
    else{
      this.posX = 0;
      extrude = WIDTH;
    }
  }
  
  //returns y position
  public int getPosY(){
    return posY;
  }

  //returns x position
  public int getWidth(){
    return extrude;
  }
  
  //returns paddle length
  public int getLength(){
    return LENGTH;
  }
  
  //displays paddle
  public void show(){
    noStroke();
    rect(posX, posY, extrude, LENGTH);
  }
  
  //updates paddle position
  public void move(){
    posY += direction * SPEED;
    if (posY < 0)
      posY = 0;
    else if (posY > GAME_HEIGHT - LENGTH)
      posY = GAME_HEIGHT - LENGTH;
  }
  
  //flips movement direction
  public void flipDirection(){
    if (direction == 1)
      direction = -1;
    else
      direction = 1;
  }
  
}
