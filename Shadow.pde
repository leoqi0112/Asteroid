//shows a trail effect behind the ship
class Shadow extends GameObject {
   PVector direction;
   int t;
   
   Shadow() {
    lives = 1;
    t = 50;
    location = myShip.location.copy();
    direction = myShip.direction.copy();
    
  }
  
     
    void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    
    if (immunityT < immunityThreshold) { 
    noFill();
    stroke(pink, t);
    strokeWeight(4);
    quad(-25, 12.5, 25, 0, -25, -12.5, -10, 0);
    circle(0, 0, 80);
    } 
    if (immunityT > immunityThreshold) {
    noFill();
    stroke(aqua, t);
    strokeWeight(4);
    quad(-25, 12.5, 25, 0, -25, -12.5, -10, 0);
    }
    
    popMatrix();
    }
    
    void act() {
    t = t-5;
    if (t <= 0) lives = 0;
  }
    
}
