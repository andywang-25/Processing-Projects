/*
Andy Wang
Programming 1
Winter Term
Ball class 
*/


class Ball {
  //instance variables 
  float r;
  float x, y;
  float xspeed, yspeed, mySpeed;
  color c = color(100, 50, 125);
  
  //constructer for ball 
  Ball(float tempR, float xspeed, float yspeed,float mySpeed, color c) {
    r=tempR;
    x = random(width);
    y = random(height);
    this.mySpeed = mySpeed;
    this.xspeed = xspeed;
    this.yspeed=yspeed;
    this.c = c;
    
  }
  
  //another constructer for ball 
  Ball(float tempR, float xspeed, float yspeed, float mySpeed) {
    r = tempR;
    x = random(width);
    y=random(height);
    this.mySpeed = mySpeed;
    this.xspeed = xspeed;
    this.yspeed = yspeed;
  }
  
  //function to move the ball 
  void move() {
    x+=xspeed;
    y+=yspeed;

    if (x>width || x <0) {
      xspeed*= -1;
    }

    if (y>height || y<0) {
      yspeed *= -1;
    }
  }
  
  //highlight function 
  void highlight () {
    c = color(75, 255, 100);
  }

  //function to display the ball 
  void display () {
    blackhole.resize(65,65); //display the ball using blackhole image
    image(blackhole,x-30,y-30);
  }
  
  //boolean to check if the ball is intersecting 
  boolean intersect(Ball b) {
    float distance = dist(x, y, b.x, b.y);
    return (distance < r+ b.r);
  }
  
  //boolean to check if the ball intersecting catcher 
  boolean intersect(Catcher c){
    float distance = dist(x, y, c.x, c.y);
    return (distance <r+c.r);
  }
  
}
