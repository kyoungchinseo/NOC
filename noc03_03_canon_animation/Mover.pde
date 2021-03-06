class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float mass;
  
  float angle = 0;
  float aVelocity = 0;
  float aAcceleration = 0.001;
  
  float G;
  
  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    G = 1.0;
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void update(){   
    
    velocity.add(acceleration);    
    location.add(velocity);
    
    aVelocity += aAcceleration;
    angle += aVelocity;
    
    acceleration.mult(0);
  }
  
  void display() {
    stroke(0);
    fill(175,200);
    rectMode(CENTER);
    
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    rect(0,0,mass*16,mass*16);
    popMatrix();
    
  }  
  
  boolean outside() {    
    if (location.x > width) {
      return true;
    }    
    return false;
  }
  
  void checkEdges() {
    if (location.x > width) {      
      velocity.x *= -1;
    } else if (location.x < 0) {      
      velocity.x *= -1;      
    }    
    
    if (location.y > height) {
      velocity.y *= -1;
    } else if (location.y < 0) {
      velocity.y *= -1;
    }
  }  
    
}