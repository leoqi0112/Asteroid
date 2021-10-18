class AsteroidP extends GameObject {
  
  int t;
  
  AsteroidP(int s, float x, float y) {
    lives = 1;
    size = int (random(s/5, 4*(s/5)));
    t = int(random(200,255));
    location = new PVector(x, y);
    velocity = new PVector (0, 1);
    velocity.rotate(PI+random(-3.14, 3.14));
    velocity.setMag(1);
  }
  
  void show() {
    rectMode(CENTER);
    noFill();
    stroke(slate, t);
    square(location.x, location.y, size);
  }
  
  void act() {
    super.act();
    t = t-2;
    if (t <= 0) lives = 0;
    
  }
}
