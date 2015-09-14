class Ball {
    
  PVector location;  
  PVector velocity;
  PVector acceleration;
  
   
  Ball(float locX, float locY) {
    location = new PVector(locX,locY);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);    
  }
  
  void applyForce(PVector force) {    
     acceleration.add(force);
  }
   
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    
    acceleration.mult(0);
  }
  
  void display() {
    
    stroke(0);
    strokeWeight(2);
    fill(175);    
    ellipse(location.x,location.y,16,16);
  }
  
}