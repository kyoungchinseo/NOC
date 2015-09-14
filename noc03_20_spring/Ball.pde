class Ball {
  PVector anchor;  
  PVector location;  
  float restLength;
  
  PVector velocity;
  PVector acceleration;
  
  float k = 0.01;
  
  Ball(float anchorX, float anchorY, float locX, float locY) {
    anchor = new PVector(anchorX,anchorY);
    location = new PVector(locX,locY);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    
    restLength = 150;
  }
  
  void applyForce(PVector force) {    
     acceleration.add(force);
  }
  
  void applySpringForce() {
    PVector force = new PVector(0,0); 
    force = PVector.sub(location, anchor);
    float currentLength = force.mag();
    float x = currentLength - restLength;
    
    force.normalize();
    force.mult(-1*k*x);
           
    applyForce(force);   
    
  }
  
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    
    acceleration.mult(0);
  }
  
  void display() {
    background(255);
    stroke(0);
    strokeWeight(2);
    fill(175);
    line(anchor.x,anchor.y,location.x,location.y);
    
    ellipse(location.x,location.y,16,16);
  }
  
}