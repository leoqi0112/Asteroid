class Ship extends GameObject {

  //1. Instance Variables
  PVector direction;
  PVector reference;
  int  shotTimer, threshold;
  float cooldown;
  boolean clear;
  

  //2. Constructor(s)
  Ship() {
    lives = 3;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
    shotTimer = 0;
    threshold = 30;
    immunityT = 0;
    immunityThreshold = 200;
    cooldown = 0;
    reference = new PVector((int)random(50, width-50), (int)random(50, height-50));
    clear = false;
  }

  //3. Behaviour Functions
  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    noFill();
    stroke(aqua, 220);
    strokeWeight(4);
    quad(-25, 12.5, 25, 0, -25, -12.5, -10, 0);
    
    if (immunityT < immunityThreshold) { 
    noFill();
    stroke(pink, 220);
    strokeWeight(4);
    quad(-25, 12.5, 25, 0, -25, -12.5, -10, 0);
    circle(0, 0, 80);
    }
    popMatrix();
  }

  void act() {
    super.act();
 
    if (velocity.mag() > 3)
      velocity.setMag(3);

    shotTimer++;
    
    immunityT++;

    //controls
    if (upkey) {
      velocity.add(direction);
      myObjects.add(new Fire());
      myObjects.add(new Fire());
      myObjects.add(new Fire());
      myObjects.add(new Shadow());
    }
    if (downkey) velocity.sub(direction);
    if (leftkey) {
      direction.rotate( -radians(5) );
      velocity.rotate( -radians(5) );
    }
    if (rightkey) {
      direction.rotate( radians(5) );
      velocity.rotate( radians(5) );
    }
    if (spacekey && shotTimer > threshold) {
      myObjects.add(new Bullet());
      shotTimer = 0;
    }
    
    //ship life control
    if (immunityT > immunityThreshold) {
    int i = 0;

    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Asteroid) {
        if ( dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size) {
          lives = lives - 1;
          immunityT = 0;
        }
      }
      i++;
    }

    int ii = 0;
    while (ii < myObjects.size()) {
      GameObject myObj = myObjects.get(ii);
      if (myObj instanceof UFOBullet) {
        if ( dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size) {
          lives = lives - 1;
          immunityT = 0;
        }
      }
      ii++;
    }
    }

    //life indicator

    if (lives == 3) {
      //life 1
      image (life[ff], 50, height/15, 40, 40);
      //life 2
      image (life[ff], 100, height/15, 40, 40);
      //life 3
      image (life[ff], 150, height/15, 40, 40);

      //modulus
      if (frameCount % 8 == 0)
        ff = ff + 1;
      if (ff == heartFrames) ff = 0;
      
    } else if (lives == 2) {
      //life 1
      image (life[ff], 50, height/15, 40, 40);
      //life 2
      image (life[ff], 100, height/15, 40, 40);

      //modulus
      if (frameCount % 8 == 0)
        ff = ff + 1;
      if (ff == heartFrames) ff = 0;
    } else if (lives == 1) {
      //life 1
      image (life[ff], 50, height/15, 40, 40);
      
       //modulus
      if (frameCount % 8 == 0)
      ff = ff + 1;
      if (ff == heartFrames) ff = 0;
    }
    
    //teleport function
    //cooldown display
    rectMode(CORNER);
    noStroke();
    if (cooldown < 200){
    cooldown = cooldown + 0.5;
    fill(red);
    rect(600, 20, cooldown, 25);
    }
    if (cooldown >= 200) {
    fill(green);
    rect(600, 20, cooldown, 25);
    }
    
    if (Skey == true && cooldown >= 200) {
      
      location.x = (int)random(50, width-50);
      location.y = (int)random(50, height-50);
      
      int i = 0;
      while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Asteroid) {
      
      if ( dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size + 200) {
        clear = false;
      }

      while(clear == false) {
        location.x = (int)random(50, width-50);
        location.y = (int)random(50, height-50);
      if ( dist(location.x, location.y, myObj.location.x, myObj.location.y) >= size/2 + myObj.size + 200) {
        clear = true;
      }
        }
      }
      i++;
      }
      
      cooldown = 0;
    }
    
    if (lives == 0) {
      mode = GAMEOVER;
      win = false;
    }
  }
}
