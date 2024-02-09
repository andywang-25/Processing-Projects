/*
Andy Wang
 Spring 2022
 Programming 2
 Connect 4 
 */


/*
This class will handle drawing the grid and determining what players are clicking on.
 */

public class Grid {


  void display() { //display the grid
    textSize(25);
    fill(250, 150, 220);
    line(100, 0, 100, 900);
    line(200, 0, 200, 900);
    line(300, 0, 300, 900);
    line(400, 0, 400, 900);
    line(500, 0, 500, 900);
    line(600, 0, 600, 900);
    line(700, 0, 700, 900);
    line(0, 100, 700, 100);
    line(0, 200, 700, 200);
    line(0, 300, 700, 300);
    line(0, 400, 700, 400);
    line(0, 500, 700, 500);
    line(0, 600, 700, 600);
    line(0,700,900,700);
    fill(100,100,100);
    rect(25,25,50,50);
    rect(125,25,50,50);
    rect(225,25,50,50);
    rect(325,25,50,50);
    rect(425,25,50,50);
    rect(525,25,50,50);
    rect(625,25,50,50);
    fill(100,250,100);
    text("Player 1 wins: 0", 725, 200);
    text("Player 2 wins: 0", 725, 350);
  }

  void resetGame(int wins1, int wins2) { //reset game method
    textSize(25); //draw grid 
    fill(250, 150, 220);
    background(100,150,200);
    line(100, 0, 100, 900);
    line(200, 0, 200, 900);
    line(300, 0, 300, 900);
    line(400, 0, 400, 900);
    line(500, 0, 500, 900);
    line(600, 0, 600, 900);
    line(700, 0, 700, 900);
    line(0, 100, 700, 100);
    line(0, 200, 700, 200);
    line(0, 300, 700, 300);
    line(0, 400, 700, 400);
    line(0, 500, 700, 500);
    line(0, 600, 700, 600);
    line(0,700,900,700);
    fill(100,100,100);
    rect(25,25,50,50);
    rect(125,25,50,50);
    rect(225,25,50,50);
    rect(325,25,50,50);
    rect(425,25,50,50);
    rect(525,25,50,50);
    rect(625,25,50,50);
    fill(100,250,100);
    text("Player 1 wins: " + wins1, 725, 200); //text showing wins of player 1
    text("Player 2 wins: " + wins2, 725, 350); //text showing wins of player 2
  }

  void displayResetBox() { //reset box that player clicks on
    textSize(30);
    fill(101, 120, 200);
    rect(725, 400, 150, 100); //draw rectangle
    fill(210, 120, 200);
    text("Play Again", 725, 475); //text inside rectangle
  }
}
