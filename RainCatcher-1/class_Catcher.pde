/*
Andy Wang
Programming 1
Winter Term
Catcher class 
*/

class Catcher {
  
  //instance variables
  float r;
  float x, y;
  //constructor
  Catcher(float tempR) {
    r = tempR;
    x=0;
    y=0;
  }
  ///set location method 
  void setLocation(float tempX, float tempY) {
    x=tempX;
    y=tempY;
  }
  //display method 
  void display () {
    earth.resize(50,50);
    image(earth,mouseX-20,mouseY-20);
    
  }
  //check if the catcer intersects with drops 
  boolean intersect(Drop d) {
    float distance = dist(x, y, d.x, d.y);
    return (distance < r +d.r);
  }
  //check if the catcer intersects with the hunter 
  boolean intersect1(Hunter d) {
    float distance = dist(x, y, d.x, d.y);
    return (distance < r +d.r*.5);
  }
  //check if the catcer intersects with snitches 
  boolean intersect2(Snitch d) {
    float distance = dist(x, y, d.x, d.y*8);
    return (distance < r +d.r);
  }
  
}
