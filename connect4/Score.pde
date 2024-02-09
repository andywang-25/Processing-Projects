/*
Andy Wang
 Spring 2022
 Programming 2
 Connect 4 
 */


/*
This class keeps track of the state of the current game.
 */

public class Score { //score class
  int score[][]; //instantiate new matrix
  int row = 7; //new integer row
  int column = 7; //new integer column


  Score(int row, int col) { //constructor, takes in parameters row and column
    score = new int [row][col];
  }

  void scoreReset() { //reset score method, set each square's's value to 0
    for (int r = 0; r < row; r++) { //for loop running through every square
      for (int c = 0; c < column; c++) {
        score[r][c]=0; //set square's value to 0
      }
    }
  }

  int lowestEmptySquare(int row) { //check the lowest empty square 
    for (int c = column-1; c >=0; c--) {
      if (isEmptySquare(row, c)) {
        return c;
      }
    }
    return -1;
  }


  boolean isEmptySquare(int row, int col) { //check if the square is empty
    if (score[row][col]==0)
      return true; //return true if the square is empty

    return false; //otherwise, return false
  }

  void setScore(int row, int col, int value) { //set score method
    score[row][col] = value; //sets square to value parameter
  }


  boolean isWinner() { //check if winner. Sum all rows and columns to check if they are 3 or 15
    int sum = 0; //set sum to 0 first
    
    //first for loop checking columns
    for (int r = 0; r < row; r++) {
      for (int i = 0; i <= 3; i++) {
        for (int c = column-1-i; c > 2-i; c--) {
          sum += score[r][c];
        }
        if (sum==4 || sum==40)
          return true;
        else sum = 0;
      }
    }

    //second for loop checking the rows
    for (int c = 0; c < column; c++) {
      for (int i = 0; i <= 3; i++) {
        for (int r = row-1-i; r > 2-i; r--) {
          sum += score[r][c];
        }
        if (sum==4 || sum ==40)
          return true;
        else sum = 0;
      }
    }
    
    //for loop checking diagonals 
    for (int c = 6; c > 3; c--) {
      for (int r = 0; r < 4; r++ ) {
        for (int i = 0; i < 4; i++) { //checks (0,0), then (1,1) and then (2,2)
          sum += score[r+i][c-i];
        }
        if (sum==4 || sum==40)
          return true; //if the sum is 15 or 3, then someone has won, return true
        else {
          sum = 0;
        }
      }
    }

    //second for loop checking diagonals 
    for (int r = row-1; r > 2; r--) {
      for (int c = column-1; c > 3; c-- ) {
        for (int i = 0; i < 4; i++) { //checks (0,0), then (1,1) and then (2,2)
          sum += score[r-i][c-i];
        }
        if (sum==4 || sum==40)
          return true; //if the sum is 15 or 3, then someone has won, return true
        else {
          sum = 0;
        }
      }
    }

    return false; //if it passes none of the conditions above, no one has won, returning false
  }




  boolean isTie() { //check if the game is tied
    int empty = 0; //integer empty
    for (int r = 1; r < row; r++) { //for loop running through every square
      for (int c = 1; c < column; c++) {
        if (score[r][c]==0) //if there is a empty square, add one to empty
          empty++;
      }
    }
    return (empty==0); //return true if there are no empty spaces 
  }
}
