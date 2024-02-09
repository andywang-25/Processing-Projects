/*
Andy Wang
Programming 1
Winter Term
Drop class 
*/


class Drop {
  //instance variables 
  float x, y;
  float speed;
  color c;
  float r;
  
  //constructor for drop 
  Drop() {
    r = 8; 
    x = random(width); 
    y = -r*4; 
    speed = random(1, 5);
    c = color(50, 100, 150);
  }
  
  //move function 
  void move() {
    y += speed;
  }
  
  //check if the drop has reached the bottom 
  boolean reachedBottom () {
    return (y>height+r*4);
  }
  
  //function checking if the drop has been caught by the catcher 
  void caught() {
    speed = 0;
    y = -1000;
  }
  
  
  
  //display the drops 
  void display () {
    star.resize(30,30);
    image(star,x-15,y-15);


    
  }
}
