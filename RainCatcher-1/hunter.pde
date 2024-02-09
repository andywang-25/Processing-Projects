/*
Andy Wang
Programming 1
Winter Term
Hunter class 
*/


class Hunter extends Ball {
  
  //instance variables
  final static int point = -25;
  float easing;
  
  //constructor 1 
  Hunter(float tempR, float xspeed, float yspeed, color c, float easing) {
    super(tempR,xspeed,yspeed,c);
    this.easing = easing;
  }
  //constructor 2 
  Hunter(float tempR, float xspeed, float yspeed, float mySpeed, float easing) {
    super(tempR,xspeed,yspeed,mySpeed);
    this.easing = easing;
    
  }
  //move away method 
  void moveAway() {
    x = random(width);
    y = random(height);
  }
  //hunter move method 
  void move() {
     float targetX = mouseX;
     float dx = targetX - x;
     x += dx * easing;
     float targetY = mouseY;
     float dy = targetY - y;
     y += dy * easing;
  }
  //display method 
  void display(color c) { 
    alien.resize(60,40); //display alien image of hunter 
    image(alien,x-20,y-20);

  }
}
