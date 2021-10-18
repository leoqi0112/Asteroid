class Fire extends GameObject {
  
  int t; //transparency
  PVector nudge;
  
  Fire() {
    lives = 1;
    size = int(random(5, 12));
    t = int(random(200,255));
    //location = new PVector(myShip.loc.x, myShip.loc.y)
    location = myShip.location.copy();
    nudge = myShip.direction.copy();
    nudge.rotate(PI);
    nudge.setMag(15);
    location.add(nudge);
    velocity = myShip.direction.copy();
    velocity.rotate(PI+random(-0.5, 0.5)); //180 degrees
    velocity.setMag(3);
  }
  
  void show() {
    rectMode(CENTER);
    noStroke();
    fill(coral, t);
    square(location.x, location.y, size);
  }
  
  void act() {
    super.act();
    t = t-10;
    if (t <= 0) lives = 0;
  }
}
