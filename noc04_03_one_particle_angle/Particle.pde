class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float angle;
  float aVelocity;
  float aAcceleration;
  
  float lifespan;  
  
  Particle(PVector l) {
    acceleration = new PVector(0,0.0);
    velocity = new PVector(random(-1,1), random(-2,0));
    
    location = l.get();
    
    angle = 0;
    aVelocity = 0.1;
    aAcceleration = 0.01;
        
    
    lifespan = 255.0;
  }
  
  void run(PVector force, float aForce) {
    applyForce(force, aForce);
    update();
    display();
  }
  
  void applyForce(PVector force, float aForce) {
    acceleration.add(force);
    aAcceleration += aForce;
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
    acceleration.mult(0);
    
    aVelocity += aAcceleration;
    angle += aVelocity;    
    aAcceleration = 0;
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