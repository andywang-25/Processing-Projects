/*
Andy Wang
Programming 1
Winter Term
Timer class 
*/





class Timer {
  //instance variables 
  int savedTime;
  int totalTime;
  int passedTime;
  //constructor 
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  //start the timer method 
  void start() {
    savedTime = millis();
  }
  
  //check if the timer is finished 
  boolean isFinished() {
    passedTime = millis()-savedTime;
    return (passedTime > totalTime);
    
  }
}
