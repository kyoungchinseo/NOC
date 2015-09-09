class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float mass;
  
  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void update(){   
    
    velocity.add(acceleration);    
    location.add(velocity);
    
    acceleration.mult(0);    
  }
  
  void display() {
    stroke(0);
    fill(100);  
    ellipse(location.x,location.y, mass*2, mass*2);
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