class Bullet extends GameObject {
  
  int timer;
  PVector direction;
  
  Bullet() {
    timer = 50;
    lives = 1;
    location = new PVector(myShip.location.x, myShip.location.y);
    velocity = new PVector (myShip.direction.x, myShip.direction.y);
    velocity.setMag(10); 
    velocity.add(myShip.velocity);
    size = 10;
  }
  
  void show() {
  stroke(aqua);
  noFill();
  ellipse(location.x, location.y, size, size);
  }

  void act() {
    location.add(velocity);
    
    timer--;
    if (timer == 0) {
      lives = 0;
    }
  }
}
