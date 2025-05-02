import java.util.Random;

Random rand = new Random();

public class Ball{
  final int BASE_SPEED = 12, SIZE = 10;
  int posX, posY, xSpeed = BASE_SPEED, ySpeed = BASE_SPEED;
  
  //returns ball's x position
  public int getPosX(){
    return posX;
  }
  
  //returns ball's y position  
  public int getPosY(){
    return posY;
  }
  
  //resets speed and ball position
  public void spawn(){ 
    posX = GAME_WIDTH/2; posY = GAME_HEIGHT/2;
    xSpeed = BASE_SPEED/3;
    ySpeed = BASE_SPEED * rand.nextInt(-100,100)/100;
  }
  
  //displays the ball
  public void show(){
    fill(255);
    square(posX, posY, SIZE);
  }
  
  //updates position
  public void move(){
    posX += xSpeed;
    posY += ySpeed;
  }

  //flips and increases vertical speed
  public void hitTopOrBottom(){
    addSpeed();
    flipY();
  }
  
  //flips and increases horizontal speed 
  public void hitPaddle(){
    addSpeed();
    flipX();
  }
  
  //increases speed
  public void addSpeed(){
    xSpeed *= 1.1;
    ySpeed *= 1.1;
  }
  
  //flips y speed
  public void flipY(){
    ySpeed *= -1;
  }
  
  //flips x speed
  public void flipX(){
    xSpeed *= -1;
  }
}
