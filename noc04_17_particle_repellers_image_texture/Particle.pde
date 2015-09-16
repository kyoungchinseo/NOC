class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float mass;
  
  float lifespan;
  
  PImage img;
  Particle(PVector l) {
    
    img = loadImage("feather-1.0.png");
    
    mass  = 1;
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
    
    acceleration.mult(0);
    lifespan-=1;
  }
  
  void display() {    
    imageMode(CENTER);
    tint(255,lifespan);
    image(img, location.x, location.y,16,16);
  }  
  
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }
  
  
  boolean isDead() {
    if (lifespan <= 0) {
      return true;
    } else {
      return false;
    }
  }
}