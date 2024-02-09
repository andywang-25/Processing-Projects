/*
Andy Wang
 Spring 2022
 Programming 2
 Tic tac toe
 */


/*
This class keeps track of the state of the current game.
 */

public class Score { //score class
  int score[][]; //instantiate new matrix
  int row = 0; //new integer row
  int column = 0; //new integer column


  Score(int row, int col) { //constructor, takes in parameters row and column
    score = new int [row][col];
  }

  void scoreReset() { //reset score method, set each square's's value to 0
    for (int r = 0; r < 3; r++) { //for loop running through every square
      for (int c = 0; c < 3; c++) {
        score[r][c]=0; //set square's value to 0
      }
    }
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

    //first for loop checking the columns
    for (int r = 0; r < 3; r++) {
      for (int c = 0; c < 3; c++) {
        sum += score[r][c];
      }
      if (sum==3 || sum==15)
        return true;
      else sum = 0;
    }
    //second for loop checcking the rows
    for (int c = 0; c < 3; c++) {
      for (int r = 0; r < 3; r++) {
        sum += score[r][c];
      }
      if (sum==3 || sum ==15)
        return true;
      else sum = 0;
    }
    //for loop to check first diagonal
    for (int i = 0; i < 3; i++) { //checks (0,0), then (1,1) and then (2,2)
      sum += score[i][i];
    }
    if (sum==15 || sum==3)
      return true; //if the sum is 15 or 3, then someone has won, return true 
    else {
      sum = 0;
    }
    //for loop to check the second diagonal
    for (int j = 2; j >-1; j--) { //a subtracting for loop, goes from left to right top to bottom
      sum += score[j][2-j];
    }
    if (sum==15 || sum==3)
      return true;
    else {
      sum = 0;
    }

    return false; //if it passes none of the conditions above, no one has won, returning false 
  }




  boolean isTie() { //check if the game is tied 
    int empty = 0; //integer empty 
    for (int r = 0; r < 3; r++) { //for loop running through every square 
      for (int c = 0; c < 3; c++) {
        if (score[r][c]==0) //if there is a empty square, add one to empty 
          empty++;
      }
    }
    return (empty==0);
  }
}
