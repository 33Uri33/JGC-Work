import java.util.Random;

public class Apple{
  int[] pos = new int[2];
  
  final int RADIUS = 20;
  
  Random rand = new Random();
  
  public Apple(){
    this.pos[0] = rand.nextInt(1,WIDTH/25) * 25 ;
    this.pos[1] = rand.nextInt(1,HEIGHT/25) * 25 ;
  }
  
  //returns the apple position
  public int[] getPos(){
  return this.pos;
  }
  
  //draws apple
  public void show(){
  noStroke();
  fill(255,0,0);
  circle(pos[0], pos[1], RADIUS);
  }
  
  //relocates apple
  public void respawn(){
    this.pos[0] = rand.nextInt(1,WIDTH/25) * 25 ;
    this.pos[1] = rand.nextInt(1,HEIGHT/25) * 25 ;
  }
  
}
