/*
Andy Wang
Programming 1
Winter Term
Bad Drop class 
*/

class BadDrop extends Drop {
 
  //baddrop extends the drop 
  BadDrop() {
    super();
  }

  //function displaying the bad drops 
  void display() {    
    meteor.resize(50,50); //display image of meteor 
    image(meteor,x-20,y-15);

  }
    
 
    
}
