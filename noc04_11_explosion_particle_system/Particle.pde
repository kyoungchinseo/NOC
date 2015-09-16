class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float angle;
  float aVelocity;
  float aAcceleration;
  
  float lifespan;
  
  boolean startFlag;
  
  Particle(PVector l) {
    startFlag = false;
    acceleration = new PVector(0,0.0);
    velocity = new PVector(0.0,0.0);
    
    location = l.get();
    
    angle = 0;
    aVelocity = 0.0;
    aAcceleration = 0.0;
        
    
    lifespan = 200;
  }
  
  void run(boolean start,PVector force, float aForce) {
    startFlag = start;
    applyForce(force, aForce);
    update();
    display();
  }
  
  void applyForce(PVector force, float aForce) {
    acceleration.add(force);
    aAcceleration += aForce;
  }
  
  void update() {
    if (startFlag == true) {
      velocity.add(acceleration);
      location.add(velocity);
      lifespan -= 2.0;
      acceleration.mult(0);
      
      aVelocity += aAcceleration;
      angle += aVelocity;    
      aAcceleration = 0;
    }
  }
  
  void display() {
    stroke(0,lifespan);
    fill(0,lifespan);
    pushMatrix();
    translate(location.x,location.y);
    rotate(angle);
    rectMode(CENTER);
    rect(0,0, 8,8);
    popMatrix();
  }
  
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}