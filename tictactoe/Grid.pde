/*
Andy Wang
 Spring 2022
 Programming 2
 Tic tac toe
 */


/*
This class will handle drawing the grid and determining what players are clicking on.
 */

public class Grid {


  void display() { //display the grid
    textSize(32);
    fill(250, 150, 220);
    line(300, 0, 300, 900);
    line(600, 0, 600, 900);
    line(900, 0, 900, 900);
    line(0, 300, 900, 300);
    line(0, 600, 900, 600);
    text("Player 1 wins: 0", 950, 200);
    text("Player 2 wins: 0", 950, 400);
    rect(950,450,200,100); //draw restart box
    fill(100,120,100);
    text("RESTART", 975,500);
  }

  void resetGame(int wins1, int wins2) { //reset game method
    textSize(32);
    fill(250, 150, 220);
    background(100, 150, 200); //background color
    line(300, 0, 300, 900); //drawing grid lines
    line(600, 0, 600, 900);
    line(900, 0, 900, 900);
    line(0, 300, 900, 300);
    line(0, 600, 900, 600);
    text("Player 1 wins: " + wins1, 950, 200); //text showing wins of player 1
    text("Player 2 wins: " + wins2, 950, 400); //text showing wins of player 2
    rect(950,450,200,100); //draw restart box 
    fill(100,120,100);
    text("RESTART", 975,500);

  }

  void displayResetBox() { //reset box that player clicks on
    textSize(32);
    fill(10, 120, 200);
    rect(950, 600, 200, 150); //draw rectangle
    fill(210, 120, 200);
    text("Play Again", 970, 690); //text inside rectangle
  }
}
