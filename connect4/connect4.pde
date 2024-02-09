/*
Andy Wang
 Spring 2022
 Programming 2
 Connect 4 
 */

//main runner class

Score score1; //instantiate new score class, score1
Grid grid1; //instantiate new grid class, grid1
int turn = 0; //whos turn is
boolean gameOver = false; //boolean checking if the game is over
int playerOneWins = 0; //number of wins player one has
int playerTwoWins = 0; //number of wins player two has

void setup() { //setup game
  size(900, 700); //initialize a board of 1200 by 900
  background(100, 150, 200); //background color
  score1 = new Score(7, 7); //new score class
  grid1 = new Grid(); //new grid class
  grid1.display(); //display the grid
}

void draw() { //draw
}


void mousePressed() { //draw a X or O depending on where the user clicks and whos turn it is
  int row = mouseX/100; //which array the user clicked in (0,1,2)
  int column = mouseY/100; //which column the user clicked in (0,1,2)

  if (!gameOver) { //while the game is not over, execute the code below
    textSize(32); //set text size to 32
    fill(100, 100, 150); //set color
    if (turn%2==0 && column==0 && row<7) { //is the square empty and is it within the game board
      if (score1.isEmptySquare(row, column)) {
        int lowestSquare = score1.lowestEmptySquare(row);
        if (lowestSquare>0) {
          rect((row*100)+25, (lowestSquare*100)+25, 50, 50);
          score1.setScore(row, lowestSquare, 1); //set score to square clicked on
          turn++; //turn plus one
        }
      }
    } else if (turn%2!=0 && column==0 && row<=7) { //is the square empty and is it within the game board
      if (score1.isEmptySquare(row, column)) {
        int lowestSquare = score1.lowestEmptySquare(row);
        if (lowestSquare>0) {
          fill(100, 250, 100);
          rect((row*100)+25, (lowestSquare*100)+25, 50, 50);
          score1.setScore(row, lowestSquare, 10); //set square to square clicked on
          turn++; //turn plus one
        }
      }
    }

    if (score1.isWinner()) { //check if winner
      gameOver = true; //set game over to true
      grid1.displayResetBox(); //display the reset box
      if (turn%2 == 0) {
        playerOneWins++; //add a win to player one
        text("Player one wins!!!", 450, 450); //display victory text
        turn++;
        grid1.displayResetBox();
      } else {
        playerTwoWins++; //add a win to player two
        text("Player two wins!!!", 450, 450); //disolay victory text
        turn++;
        grid1.displayResetBox();
      }
    } else if (score1.isTie()) { //check if its a tie
      fill(250, 100, 150);
      text("Game has been tied, press reset to reset game", 100, 450); //display tie game text
      grid1.displayResetBox(); //display reset game box
      gameOver = true; //game over is true
    }
  } else if (gameOver) {

    if (mouseX<875 && mouseX>725 && mouseY>400 && mouseY<500) { //if the user is clicking on the reset box
      grid1.resetGame(playerOneWins, playerTwoWins); //reset the grid
      score1.scoreReset(); //reset the score
      gameOver = false; //game over is false
    }
  }
}
