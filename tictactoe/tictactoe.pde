/*
Andy Wang
 Spring 2022
 Programming 2
 Tic tac toe
 */

//main runner class

Score score1; //instantiate new score class, score1
Grid grid1; //instantiate new grid class, grid1
int turn = 0; //whos turn is
boolean gameOver = false; //boolean checking if the game is over
int playerOneWins = 0; //number of wins player one has
int playerTwoWins = 0; //number of wins player two has

void setup() { //setup game
  size(1200, 900); //initialize a board of 1200 by 900
  background(100, 150, 200); //background color
  score1 = new Score(3, 3); //new score class
  grid1 = new Grid(); //new grid class
  grid1.display(); //display the grid
}

void draw() { //draw
}



void mousePressed() { //draw a X or O depending on where the user clicks and whos turn it is
  int row = mouseX/300; //which array the user clicked in (0,1,2)
  int column = mouseY/300; //which column the user clicked in (0,1,2)
  if (mouseX<1150 && mouseX>950 && mouseY>450 && mouseY <550) { //check if user clicks on restart box 
    grid1.resetGame(playerOneWins,playerTwoWins); //resets the grid 
    score1.scoreReset(); //resets all the values in the grid 
  }
  if (!gameOver) { //while the game is not over, execute the code below
    textSize(32); //set text size to 32
    fill(100, 100, 150); //set color
    if (turn%2==0 && row<=2 && score1.isEmptySquare(row, column)) { //is the square empty and is it within the game board
      circle(150+(row*300), 150+(column*300), 220); //draw circle
      score1.setScore(row, column, 1); //set score to square clicked on
      turn++; //turn plus one
    } else if (turn%2!=0 && row<=2 && score1.isEmptySquare(row, column)) { //is the square empty and is it within the game board
      rect(50+(row*300), 50+(column*300), 200, 200); //draw rectangle
      score1.setScore(row, column, 5); //set square to square clicked on
      turn++; //turn plus one
    }
    if (score1.isWinner()) { //check if winner
      gameOver = true; //set game over to true
      grid1.displayResetBox(); //display the reset box
      if (turn%2 == 0) {
        playerOneWins++; //add a win to player one
        text("Player one wins!!!", 450, 600); //display victory text
        turn++;
      } else {
        playerTwoWins++; //add a win to player two
        text("Player two wins!!!", 450, 600); //disolay victory text
        turn++;
      }
    } else if (score1.isTie()) { //check if its a tie
      fill(250, 100, 150);
      text("Game has been tied, press reset to reset game", 250, 450); //display tie game text
      grid1.displayResetBox(); //display reset game box
      gameOver = true; //game over is true
    }
  } else {
    if (mouseX<1150 && mouseX>950 && mouseY>600 && mouseY<750) { //if the user is clicking on the reset box
      grid1.resetGame(playerOneWins, playerTwoWins); //reset the grid
      score1.scoreReset(); //reset the score
      gameOver = false; //game over is false
    }
  }
}
