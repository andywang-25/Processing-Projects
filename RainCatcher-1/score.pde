/*
Andy Wang
Programming 1
Winter Term
Score class
*/

class Score {
  
  //instance variables
  int myScore=0;
  int totalScore=0;
  int increment=1;
  int x;
  int y;
  int barHeight;
  int value;
  
  //basic constructor
  Score() {
    myScore = 0;
    totalScore = 10;
    increment = 1;
  }
  //first constructor
  Score(int myTotalScore) {
    myScore = 0;
    this.totalScore = myTotalScore;
    increment = 1;
  }
  //second constructor
  Score(int totalScore, int increment) {
    myScore = 0;
    this.totalScore = totalScore;
    this.increment = increment;
  }
  //get score method 
  int getScore () {
    return myScore;
  }
  
  //add points to score method
  void addPoints(int myIncrement) { //modifier
    myScore += myIncrement;
  }
  //display the score method 
  void display() { //display raw score
    fill(0);
    textSize(70);
    fill(100,200,150);
    text("Score: " + myScore, 320, 800);
  }
  //display scorebar method 
  void displayBar(int x, int y, int barHeight) {  
    this.x = x;
    this.y = y;
    this.barHeight = barHeight;
    fill(255);
    rect(x, y, 400, barHeight);
    if (myScore>0) {
      fill(color(100, 150, 250));
      rect(x, y, myScore*20, barHeight); //takes myscore and draws another rectangle over a rectangle in a different color 
    }
  }
  //reset score method 
  void resetScore() {
    myScore = 0;
  }
  //check if winner 
  boolean isWinner() { 
    return (myScore >= totalScore);
  }
  //check if loser 
  boolean isLoser() {
    return(myScore<=-5);
  }
  

    
  //display loser screen 
  void displayLoser() {
    textSize(50);
    fill(100,255,100);
    text("You lose, press space to play again", 100, 450);
    noLoop();
  }
  
  
  //winner display screen
  void displayWinner() { 
    int timeSpent = (millis()/1000); //display the amount of time you spent
    textSize(50);
    fill(255,100,100);
    text("You win! You spent: " + timeSpent + " seconds.", 160, 450); //shows how much time you have spent
    text("Press space to play again.",200,700);
    winscreen.resize(200,200);
    image(winscreen,350,150);
    noLoop(); //noloop the program
    
  }
  
  
  
  
    
  
  
}
