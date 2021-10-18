void gameOver() {
  background (black);
  
  if (win == true) {
    textFont(Airstrike);
    textSize(100);
    textAlign(CENTER, CENTER);
    fill(aqua);
    text("You", width/2, height/2-30);
    text("Win", width/2, height/2+30);
    textSize(30);
    text("*Click anywhere to restart", width/2, height/2+200);
  } else if (win == false) {
  textFont(Airstrike);
  textSize(100);
  fill(coral);
  textAlign(CENTER, CENTER);
  text("You Lost", width/2, height/2);
  textSize(30);
  text("*Click anywhere to restart", width/2, height/2+200);
  }
  
  
}

void gameOverClicks() {
  mode = INTRO;
  
  //resetting all vaiables
  
  timer = 0;
  AsterCounter = 8;
  
  win = false;
 
 rectMode(CENTER);
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
 myObjects.add(new UFO(UFOx, UFOy, UFOdx, UFOdy));
 
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
 
  appearTimer = 1000;
  
  
}
