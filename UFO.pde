class UFO extends GameObject{
  
  //instance variables
  PVector direction;
  int shotTimer, threshold;
  
  UFO(float x, float y, float dx, float dy) {
    lives = 1;
    location = new PVector(x, y);
    direction = new PVector(dx, dy);
    velocity = new PVector(direction.x*50,direction.y*50);
    shotTimer = 0;
    threshold = 60;
  }
  
  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    fill(purple);
    noStroke();
    ellipse(15, 0, 30, 15);
    ellipse(-15, 0, -30, 15);
    ellipse(0, 15, 15, 30);
    ellipse(0, -15, 15, -30);
    popMatrix();
  }
  
  void act() {
    location.add(velocity);
    
    shotTimer++;
    if (shotTimer > threshold) {
      myObjects.add(new UFOBullet(location.x, location.y));
      shotTimer = 0;
    }
    
    //if (location.y < -50) location.y = height+50;
    //if (location.y > height+50) location.y = -50;
    //if (location.x < -50) location.x = width +50;
    //if (location.x > width+50) location.x =  -50;
    
    if (location.y < -60) 
    location.y = lives=0;
    if (location.y > height+60) 
    lives=0;
    if (location.x < -60) location.x = lives=0;
    if (location.x > width+60) lives=0;
    
    if (velocity.mag() > 3)
    velocity.setMag(3);
    
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet) {
        if ( dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size) {
          lives = 0;
          appearTimer = -1;
        }
      }
      i++;
    }
  }
}
