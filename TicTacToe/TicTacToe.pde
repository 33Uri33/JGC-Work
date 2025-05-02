public int size = 600;
Square[] board = new Square[9];
char shape = 'X';

void setup() {
 size(600,600);
 line(0, size/3, size, size/3);
 line(0, 2*size/3, size,2*size/3);
 line(size/3, 0, size/3, size);
 line(2*size/3, 0, 2*size/3, size);
 
 for (int i = 0; i < 9; i++){
   board[i] = new Square(i%3 * (size/3), i/3 * (size/3));
 }
}

void draw(){};

void mouseClicked(){
  Square selected = board[squareClicked()];
  if (selected.getState() == ' '){
    selected.setState(shape);
  
  if (hasWon()){
    print(shape + " WON!");
    exit();
  }
 
    if (shape == 'X')
      shape = 'O';
    else 
      shape = 'X';
  }
}

//returns true when there is 3 in a row
boolean hasWon(){
  for (int i = 0; i < 3; i++){
    if(board[i*3].getState() == board[i*3+1].getState() && 
       board[i*3].getState() == board[i*3 +2].getState() &&
       board[i*3].getState() != ' ')
      return true;
  }
  for (int i = 0; i < 3; i++){
    if(board[i].getState() == board[i+3].getState() &&
       board[i].getState() == board[i+6].getState() &&
       board[i].getState() != ' ')
      return true;
  }
  if (board[0].getState() == board[4].getState() &&
      board[0].getState() == board[8].getState() &&
      board[0].getState() != ' ')
    return true;
  if (board[2].getState() == board[4].getState() &&
      board[2].getState()  == board[6].getState() &&
      board[2].getState() != ' ')
    return true;
  return false;
}

//returns the clicked square's number
int squareClicked(){
  if(mouseX < size/3){
    if (mouseY < size/3)
      return 0;
    else if ( mouseY < 2*size/3)
      return 3;
    else
      return 6;
  }    
  else if (mouseX < 2*size/3){
    if (mouseY < size/3)
      return 1;
    else if ( mouseY < 2*size/3)
      return 4;
    else
      return 7;
  }
  else{
    if (mouseY < size/3)
      return 2;
    else if ( mouseY < 2*size/3)
      return 5;
    else
      return 8;
  }
}
