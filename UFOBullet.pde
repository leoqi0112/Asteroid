class UFOBullet extends GameObject {
  
  int timer;
  PVector direction;
  
  UFOBullet(float x, float y) {
    timer = 100;
    lives = 1;
    location = new PVector(x,y);
    direction = new PVector (myShip.location.x-location.x, myShip.location.y-location.y);
    velocity = new PVector (0, 0);
    velocity = velocity.add(direction);
    velocity.setMag(10);
    size = 10;
  }
  
  void show() {
  noStroke();
  fill(purple);
  ellipse(location.x, location.y, size, size);
  }

  void act() {
    location.add(velocity);
    
        if ( dist(location.x, location.y, myShip.location.x, myShip.location.y) <= size/2 + myShip.size) {
          lives = 0;
        }
    
    timer--;
    if (timer == 0) {
      lives = 0;
    }
  }
  
}
