/*
Andy Wang
Programming 1
Winter Term
*/

//initialize class objects 
Catcher catcher;
Ball ball1, ball2;
Timer timer1, timer2;
Score score1;
Drop[] drops;
BadDrop[] baddrops;
Snitch[] snitches;
Hunter hunter1; 

//initialize global variables 
int totalDrops = 0;
int totalSnitches = 0;
int level = 0;
boolean startGame = false;

PImage spaceImage, meteor, star, blackhole, spaceship, alien, earth, winscreen,startscreen; //insert in images using PImage 

void setup() {
  size(900, 900); //create 900 by 900 size 
  startscreen = loadImage("startscreen.jpg");
  winscreen = loadImage("winscreen.png");
  earth = loadImage("earth.png"); //load earth image 
  spaceImage = loadImage("space_wallpaper.jpg"); //loading space wallpaper image 
  meteor = loadImage("Meteor-PNG-Photos.png"); //loading meteor image
  blackhole = loadImage("blackhole.png"); //loading blackhole image
  star = loadImage("star.png"); //loading star image
  spaceship = loadImage("spaceship.png"); //loading spacesip image
  alien = loadImage("alien.png"); //loading alien image
  catcher = new Catcher(25); //create catcher with radius of 25
  drops = new Drop[1000]; //initialize good drops
  baddrops = new BadDrop[500]; //intialize bad drops 
  snitches = new Snitch[500]; //intialize snitches 
  ball1 = new Ball(25, 2, 1, 5, color(255, 125, 150)); //initalize ball1
  ball2 = new Ball(25, 1, 3, 10, color(255, 150, 190)); //initialize ball2
  timer1 = new Timer(1000); //create new timer for every second 
  timer1.start(); //start timer at program startup
  timer2 = new Timer(9000); //create new timer for snitch
  timer2.start(); //start tuner at program startup 
  score1 = new Score(20); //intialize score, requiring 20 points to win
  hunter1 = new Hunter(50,3,3,3, 0.01); //intialize hunter
  smooth(); //makes everything smooth looking 

}
void draw() {
  if (!startGame) {
    image(startscreen,0,0);
    noLoop();
  }
  else {
  image(spaceImage,0,0);
  catcher.setLocation(mouseX, mouseY); //set catcher so it follows the mouse 
  catcher.display(); //display the catcher 
  
  score1.display(); //display raw score 
  score1.displayBar(250, 810, 25); //display scorebar which is correlated to how much score you have 
  
  //change the level depending on the amount of points the player has
  if (score1.myScore<5) { 
    level = 1;
  } else if (score1.myScore<10 && score1.myScore>=5) {
    level = 2;
  } else if (score1.myScore<20 && score1.myScore>=10) {
    level = 3;
  }
  
  //switch cases using levels 
  switch(level) {
    case 3: //level 3 
      hunter1.display(color(100,100,150)); //display the hunter 
      hunter1.move(); //make the hunter chase the player 
      
      
      
    case 2: //level 2 
      ball1.move(); //make the balls move 
      ball1.display(); //display the balls 
      ball2.move();
      ball2.display();
       
       
       
    
    case 1: //level 1 
    //nothing 
      
}
  
  for (int i = 0; i < totalDrops; i++) {
    drops[i].move(); //move gooddrops
    drops[i].display(); //display gooddrops
    baddrops[i].move(); //move baddrops
    baddrops[i].display(); //display baddrops
    
    if (catcher.intersect(drops[i])) { //check if gooddrop was caught 
      drops[i].caught(); //remove gooddrop
      score1.addPoints(1); //add 1 point
    }
    if (catcher.intersect(baddrops[i])) { //check if baddrop was caught 
      baddrops[i].caught(); //remove baddrop
      score1.addPoints(-1); //subtract 1 point 
    }
  }
  
  if (catcher.intersect1(hunter1)) { //check if the hunter intersects with the catcher 
    score1.addPoints(-1); //subtract a point if it intersects 
    hunter1.moveAway(); //move the hunter away from catcher
  }

  
  
  if (timer2.isFinished()) { //check if timer2 is finished
    snitches[totalSnitches] = new Snitch(); //intializes a new snitch 
    totalSnitches++; //increase total snitches by 1 
    if (totalSnitches >= snitches.length) { //checks if total number of snitches is greater than the snitch array length 
      totalSnitches = 0;
    }
    timer2.start(); //start the timer again 
  }
  
  for (int i = 0; i < totalSnitches; i++) {
    snitches[i].move(); //move snitches
    snitches[i].display(); //show the snitches 
    if (catcher.intersect2(snitches[i])) { //check if catcher intersects with the snitch 
      snitches[i].caught(); 
      score1.addPoints(20);
      score1.displayWinner();  //if snitch is caught then display winner screen 
    }  
  }
 
  if (timer1.isFinished()) {
    drops[totalDrops] = new Drop (); //intializes a new drop 
    baddrops[totalDrops] = new BadDrop(); //initializes a bad drop 
    totalDrops++; //increase totalDrops by 1 
    if (totalDrops >= drops.length) { //checks if totalDrops is greater than the drops array 
      totalDrops = 0;
    }
    timer1.start(); //start timer again 
  }

  if (score1.isWinner()) { //check if you are a winner 
    score1.displayWinner(); //display winning screen
  }
  //display loser screen
  if (score1.isLoser()) {
    score1.displayLoser();
  }
   
   if (ball2.intersect(catcher)) { //check if the ball intersects with the catcher 
     score1.addPoints(-1); //subtract a point
     
     //set the ball to a new location and to a new speed 
     ball2.x = random(width);
     ball2.y = random(height);
     ball2.xspeed = random(2,5);
     ball2.yspeed = random(2,5);
     
   }
   
   if (ball1.intersect(catcher)) { //check if the ball intersects with the catcher 
     score1.addPoints(-1); //subtract a point 
     
     //set the ball to a new location and to a new speed 
     ball1.x = random(width);
     ball1.y = random(height);
     ball1.xspeed = random(2,5);
     ball1.yspeed = random(2,5);
   }
   
   
}
}





void keyPressed() { //keypressed function 
    startGame = true;
    if ( key == 32  ) { //check if keypressed is space bar 
      totalDrops = 0; //set totaldrops to 0
      totalSnitches = 0; //set total snitches to 0 
      level = 0; //set level back to 0 
      score1.resetScore(); //reset score to 0 
      hunter1.x = random(width); //set hunter to a random x position
      hunter1.y = random(height); //set hunter to a random y position 
      catcher.r = 25; //reset catcher to original radius 
      hunter1.easing = 0.01; //set hunter to original speed 
      loop(); //start the loop 
    }
  }
