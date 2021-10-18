import processing.javafx.*;

//Leo Qi
//Oct 9th
/*
Directions: Use the arrow keys to move around.
The ship is immune to bullets when it is red and has a red ring around it.
A UFO appear every 1000 frames; avoid its bullets
The ship has three lives displayed by the hearts on the top left
Pause the game with the button one bottom left
The bar on the top right indicates the countdown to use the teleport function, which teleports you to a safe place
USE THE S KEY TO TELEPORT WHEN IT IS AVAILABLE
*/

boolean upkey, downkey, leftkey, rightkey, spacekey, Skey, win;
ArrayList<GameObject> myObjects;

//font
PFont Airstrike;
PFont Lemon;

int mode;

//Background images variables
PImage img;
PImage pauseImg;

//Ship
Ship myShip;
int immunityT, immunityThreshold;

//UFO
float r, r2, r3, UFOdx, UFOdy;
int UFOx, UFOy, appearTimer;


//mode framework variable 
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//color pallette
color coral = #EF767A;
color slate = #63768D;
color blue = #8AC6D0;
color aqua = #A3E4D7;
color purple = #BB8FCE;
color orange = #EB984E;
color pink = #F8BBD0;
color red = #E74C3C;
color green = #58D68D;
color black = #212121;

//gif
PImage[] gif;
int numberOfFrames;
int f;

//lifeGIFs
PImage[] life;
int heartFrames;
int ff;

//Asteroid
int timer;
int AsterCounter;

void setup(){
 mode = INTRO;
 
 win = false;
  
 size(900,600,FX2D);
 rectMode(CENTER);
 
 //adding the objects
 myShip = new Ship();
 myObjects = new ArrayList<GameObject>();
 myObjects.add(myShip);
 myObjects.add(new Asteroid());
 myObjects.add(new Asteroid());
 myObjects.add(new Asteroid());
 myObjects.add(new Asteroid());
 myObjects.add(new Asteroid());
 myObjects.add(new Asteroid());
 myObjects.add(new Asteroid());
 myObjects.add(new Asteroid());
 
 //add UFO
 
 r3 = random(0, 1);
 if (r3 < 0.5) {
 r = random(0, 1);
 if (r < 0.5) {
   UFOx = -50;
   UFOy = int(random(50, height-50));
   UFOdx = 0.1;
   UFOdy = random(-0.1,0.1);
 } else {
   UFOx = width+50;
   UFOy = int(random(50, height-50));
   UFOdx = -0.1;
   UFOdy = random(-0.1,0.1);
 }
 } else {
 r2 = random(0, 1);
 if (r2 < 0.5) {
   UFOy = -50;
   UFOx = int(random(50, width-50));
   UFOdy = 0.1;
   UFOdx = random(-0.1,0.1);
 } else {
   UFOy = height+50;
   UFOx = int(random(50, width-50));
   UFOdy = -0.1;
   UFOdx = random(-0.1,0.1);
 }
 }
 
 myObjects.add(new UFO(UFOx, UFOy, UFOdx, UFOdy));
 appearTimer = 1000;
 
 //font
 Airstrike = createFont("airstrike.ttf", 100);
 Lemon = createFont("LEMONMILK-Regular.otf", 100);
 
 //gif
 numberOfFrames = 20;
 gif = new PImage[numberOfFrames];
 
 int i = 0;
 while (i < numberOfFrames) {
   gif [i] = loadImage ("frame_"+i+"_delay-0.1s.gif");
   i = i+1;
 }
 
 //heartGIF
 heartFrames = 2;
 life = new PImage[heartFrames];
 
 int ii = 0;
 while (ii < heartFrames) {
   life [ii] = loadImage ("frame_" + ii + "_delay-0.3s.gif");
   ii = ii + 1;
 }
 
 //add image
 img = loadImage("background.jpeg");
 pauseImg = loadImage("pause.png");
 
 timer = 0;
 AsterCounter = 8;
}

void draw() {
    
  //mode framework
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
    
    appearTimer = appearTimer - 1;
    println (appearTimer);
    if ( appearTimer == 0) {
       myObjects.add(new UFO(UFOx, UFOy, UFOdx, UFOdy));
       appearTimer = 1000;
    }
    
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameOver();
  } else {
    println("Error: Mode = " + mode);
  }
  
}

void keyPressed() {
  
  if (keyCode == UP) upkey = true;
  if (keyCode == DOWN) downkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (key == ' ') spacekey = true;
  if (key == 's' || key == 'S') Skey = true;
  
}

void keyReleased() {
  if (keyCode == UP) upkey = false;
  if (keyCode == DOWN) downkey = false;
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
  if (key == ' ') spacekey = false;
  if (key == 's' || key == 'S') Skey = false;
}
