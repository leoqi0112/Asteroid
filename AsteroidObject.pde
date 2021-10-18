class Asteroid extends GameObject {
  
  Asteroid() {
  lives = 1;
  location = new PVector (random(0,width), random(0,height));
  velocity = new PVector (0, 1);
  velocity.rotate( random(0, TWO_PI) );
  size = int(random(50, 100));
  }
  
  Asteroid(int s, float x, float y) {
    lives = 1;
    location = new PVector (x, y);
    velocity = new PVector (0, 1);
    velocity.rotate ( random(0, TWO_PI) );
    size = s;
  }
  
  void show() {
    rectMode(CENTER);
    noFill();
    strokeWeight(5);
    stroke(slate);
    square(location.x, location.y, size);
    
    int i = 0;
    
      while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Ship) {
        if ( dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size) {
          stroke(coral);
          square(location.x, location.y, size);
        }
      }
      i++;
      }
    
  }
  
  void act() {
    super.act();

    //Collision effect and creating particles
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet) {
        if ( dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size) {
          
          myObj.lives = 0;
          lives = 0;
          timer ++;
          
          if (size >= 80) {
            myObjects.add(new Asteroid(size/2, location.x, location.y));
            AsterCounter++;
            myObjects.add(new Asteroid(size/2, location.x, location.y));
            AsterCounter++;
            myObjects.add(new AsteroidP(size/4, location.x, location.y));
            myObjects.add(new AsteroidP(size/4, location.x, location.y));
            myObjects.add(new AsteroidP(size/4, location.x, location.y));
          } else {
          int t = 0;
          while(t < 30) {
          myObjects.add(new AsteroidP(size/2, location.x, location.y));
          t = t + 1;
          }
          }
          
 
        }
      }
      i++;
    }

  } 
}
