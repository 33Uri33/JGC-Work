
final int  GAME_WIDTH = 1000, GAME_HEIGHT = 600;

Paddle right = new Paddle(true);
Paddle left = new Paddle(false);
Ball ball = new Ball();

int score = 0;
  
void settings(){
  size(GAME_WIDTH,GAME_HEIGHT);
}
void setup(){
  ball.spawn();
}

void draw(){
  background(0);
  
  show();
  move();

  ballDirectionUpdate();

    
  if (ball.getPosX() <= 0){
    win("Right");
  }
  else if (ball.getPosX() >= GAME_WIDTH){
    win("Left");
  }
    
}

void keyPressed(){
  if (key == ENTER)
    right.flipDirection();
  else
    left.flipDirection();
}

//shows game objects
void show(){
  right.show();
  left.show();
  ball.show();
}

//updates game object positions
void move(){
  left.move();
  right.move();
  ball.move();
}

//checks if the ball has hit a surface and flips it's horizontal or vertical direction accordingly
void ballDirectionUpdate(){
  if(ball.getPosY() >= GAME_HEIGHT || ball.getPosY() <= 0 ){
    ball.hitTopOrBottom();
  }
  
  if(ball.getPosX() == left.getWidth() && ball.getPosY() >= left.getPosY() && ball.getPosY() <= left.getPosY() + left.getLength()){
    ball.hitPaddle();
    score += 1;
  }
  else if(ball.getPosX() == right.getWidth() + GAME_WIDTH  && ball.getPosY() >= right.getPosY() && ball.getPosY() <= right.getPosY() + right.getLength()){
    ball.hitPaddle();  
    score += 1;
  }
}

//parameter: side that won
//displays game results and resets
void win(String side){
    println(side +" Won!");
    println("Score: " + score);
    score = 0;
    ball.spawn();
}
