import java.util.Arrays;

public ArrayList<SnakePart> snake = new ArrayList<SnakePart>();

int[] newPos = {200,200};
int[] diff = {25, 0};

int timer = 5;

final int HEIGHT = 500;
final int WIDTH = 800;

Apple apple = new Apple();

void setup(){
  size(800,500);
  background(0);
  for(int i = 0; i < 3; i++){
  snake.add(new SnakePart(3-i, newPos[0]-(i*25), newPos[1]));
      snake.get(0).show();
  }
}

void draw(){
  timer -= 1;
  if (timer<=0){
  timer = 5;
  background(0);
  setNewPos();
  
  if(isDead())
    exit();
  
  apple.show();
  
  if (Arrays.equals(apple.getPos(), newPos)){
    apple.respawn();
    for (int i = 0; i < snake.size(); i++)
      snake.get(i).increamentTimer();
    snake.add(new SnakePart(1, newPos[0], newPos[1]));
  }
    
  for (int i = 0; i < snake.size(); i++){
    snake.get(i).move(newPos);
    snake.get(i).show();
  }
  
  }
  
  
}

void keyPressed(){
  setDirection();
}

//sets the direction
void setDirection(){
  if (keyCode == UP){
    diff[0] = 0;
    diff[1] = -25;
  }
  else if (keyCode == DOWN){
    diff[0] = 0;
    diff[1] = 25;
  }
  else if (keyCode == LEFT){
    diff[0] = -25;    
    diff[1] = 0;
  }
  else if (keyCode == RIGHT){
    diff[0] = +25;
    diff[1] = 0;
  }
}

//updates the next position
void setNewPos(){
  newPos[0] += diff[0];
  newPos[1] += diff[1];
}

//returns true when the snake touches itself or edges
boolean isDead(){
  if (newPos[0] >= WIDTH || newPos[0] <= 0 || newPos[1] >= HEIGHT || newPos[1] <= 0)
    return true;
  for (int i = 0; i < snake.size(); i++){
    if (Arrays.equals(newPos, snake.get(i).getPos()))
      return true;
  }
  return false;
}
