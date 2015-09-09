class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float wingAng;
  float mass;
  
  float area;
  
  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);    
    area = 4*PI*(mass*16)*(mass*16)/(100*100*4*PI);
    wingAng = random(0.1,0.3);
  }
  
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  boolean isInside() {     
    if (location.x > 0 && location.x <= width && location.y > 0 && location.y <= height) {
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
    drag.rotate(-HALF_PI/4-wingAng);  // same equation but direction is related to angle of wing
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
    pushMatrix();
      translate(location.x,location.y,0);
      rotateZ(wingAng);      
      box(mass*16,mass*4,mass*4);      
    popMatrix();
  }
  
  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0-100) {
      location.x = random(0+30,width-30);
      location.y = height/2;
      velocity.x *= -1;      
    }    
    
    if (location.y < 0-100) {
      location.x = width+random(0+30,width-30);
      location.y = height/2;
      velocity.x *= -1;
    }
    
  }  
    
}