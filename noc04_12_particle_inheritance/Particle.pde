class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float lifespan;
  
  Particle(PVector l) {
    lifespan = 255;
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-1,1), random(-2,0));
    
    location = l.get();    
  }
  
  void run() {
    update();
    display();
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan--;
  }
  
  void display() {    
    fill(0);
    ellipse(location.x,location.y,8,8);
  }  
  
  boolean isDead() {
    if (lifespan <= 0) {
      return true;
    } else {
      return false;
    }
  }
}