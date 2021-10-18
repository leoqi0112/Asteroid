void game() {
  background(0);
  imageMode(CENTER);
  image(img, width/2, height/2, width, height);

      if (timer == AsterCounter) {
        win = true;
        mode = GAMEOVER;
      }

  int i = 0;
  while (i < myObjects.size()) {
    GameObject myObj = myObjects.get(i);
    myObj.show();
    myObj.act();
    
    if (myObj.lives == 0) {
      myObjects.remove(i);
    } else {
    i++;
    }
    
  }
  
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
   //pause button

  if(dist(50, height-50, mouseX, mouseY) < 25) {
  fill(black);
  noStroke();
  circle(50, height-50, 50);
  noStroke();
  fill(255);
  strokeWeight(3);
  triangle(40, height-40, 40, height-60, 60, height-50);
  } else {
  fill(black);
  noStroke();
  circle(50, height-50, 50);
  stroke(255);
  strokeWeight(3);
  line(40, height-40, 40, height-60);
  line(60, height-40, 60, height-60);
  }

}

void gameClicks() {
  if(dist(50, height-50, mouseX, mouseY) < 25) {
    mode = PAUSE;
  }
}
