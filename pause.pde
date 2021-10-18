void pause() {
  imageMode(CORNER);
  image(pauseImg, 0, 0, width, height);
  
  textAlign(CENTER, CENTER);
  textSize(100);
  textFont(Lemon);
  fill(255);
  text("on", width/2+100, height/2-100);
  text("pause", width/2+100, height/2);
  
  //pause button
  
  if(dist(50, 50, mouseX, mouseY) < 25) {
  fill(black);
  noStroke();
  circle(50, 50, 50);
  noStroke();
  fill(255);
  strokeWeight(3);
  triangle(40, 40, 40, 60, 60, 50);
  } else {
  fill(black);
  noStroke();
  circle(50, 50, 50);
  stroke(255);
  strokeWeight(3);
  line(40, 40, 40, 60);
  line(60, 40, 60, 60);
  }
  
}

void pauseClicks() {
  if(dist(50, 50, mouseX, mouseY) < 25) {
    mode = GAME;
  }
}
