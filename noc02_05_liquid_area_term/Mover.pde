class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float mass;
  
  float area;
  
  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    area = 4*PI*(mass*16)*(mass*16)/(100*100*4*PI);
    //area = 1.0;
  }
  
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  boolean isInside(Liquid l) {     
    if (location.x > l.x && location.x < l.x+l.w && location.y > l.y && location.y < l.y + l.h) {
      return true;
    } else {
      return false;
    }
  }
  
  void drag(Liquid l) {
    float speed = velocity.mag();
    
    float dragMagnitude = l.c * speed * speed;
    
    PVector drag = velocity.get();
    drag.mult(-1);
    
    drag.normalize();
    
    drag.mult(dragMagnitude);
    
    applyForce(drag);
  }
    
  void update(){   
    
    velocity.add(acceleration);    
    location.add(velocity);
    
    acceleration.mult(0);    
  }
  
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, mass*16,mass*16);
  }
  
  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1;      
    }
    
    if (location.y > height) {
      location.y = height;
      velocity.y *= -1;      
    }    
  }  
    
}