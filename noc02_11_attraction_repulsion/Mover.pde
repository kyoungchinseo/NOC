class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float mass;
  
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
  
  PVector repel(Mover m) {
    
    PVector force = PVector.sub(m.location, location); // direction is reversed
    
    float distance = force.mag();
    
    distance = constrain(distance,5,25);
     
    force.normalize();
    
    float strength = (G*mass*mass)/(distance*distance);
    
    force.mult(strength);    
    
    return force;
  }
  
  void update(){   
    
    velocity.add(acceleration);    
    location.add(velocity);
    
    acceleration.mult(0);    
  }
  
  void display() {
    stroke(0);
    fill(100);  
    ellipse(location.x,location.y, 20, 20);
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