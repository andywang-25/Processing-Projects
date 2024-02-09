/*
Andy Wang
Programming 1
Winter Term
Snitch class
*/

class Snitch extends Drop {
  
  //constructor 
  Snitch() {
    super(); //superclass of drop 
  }
  //display the snitch
  void display() {
    spaceship.resize(35,35); //display the snitch using spaceship image
    image(spaceship,x-15,(y*8)-15);
    

  }
}
