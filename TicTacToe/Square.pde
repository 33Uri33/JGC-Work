public class Square
{
    int xPos,yPos;
    char state = ' ';
    
    public Square(int xPos, int yPos){
        this.xPos = xPos + size/6;
        this.yPos = yPos + size/6;
    }
    
    //returns the square's state
    public char getState(){
      return this.state;
    }
    
    //updates the setss state
    public void setState(char state){
      if (state == 'X') {
        this.state = 'X';
        line(xPos-size/8, yPos-size/8, xPos+size/8, yPos+size/8);
        line(xPos-size/8, yPos+size/8, xPos+size/8, yPos-size/8);
      }
      else {
        this.state = 'O';
        circle(xPos, yPos, size/4);
      }
      
    }
    
    //returns the ssquare's position (i used this for debugging)
    public String toString(){
      return "x = " + xPos + ", y = " + yPos + ". ";
    }
}
