void intro() {
  background(0);
  imageMode (CENTER);
  //gif background
  image (gif[f], width/2, height/2, width, height);
  
  //modulus
  if (frameCount % 4 == 0) 
  f = f + 1;
  if (f == numberOfFrames) f = 0;

  //Intro text
  textAlign(CENTER, CENTER);
  textSize(100);
  fill(orange);
  textFont (Airstrike);
  text ("Asteroid", width/2, height/2);
  textFont (Lemon);
  textSize(20);
  text ("*click anywhere to start", width/2, 2*height/3);
  
  noStroke();
  fill (21, 20, 29);
  rect(9*width/10, height, width/5, height/7);
}

void introClicks() {
  mode = GAME;
}
