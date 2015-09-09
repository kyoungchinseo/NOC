class Attractor {
  float mass;  
  PVector location;
  float G;
  
  Attractor() {
    location = new PVector(width/2, height/2);
    mass = 20;
    G = 9;
  }
  
  void display() {
    stroke(0);
    fill(175,200);
    ellipse(location.x, location.y, mass*2, mass*2);
  }  
  
  PVector attract(Mover m) {
    location.x = mouseX;
    location.y = mouseY;
    
    PVector force = PVector.sub(location, m.location);
    
    float distance = force.mag();
    // 
    distance = constrain(distance,5,25);
     
    force.normalize();
    
    float strength = (G*mass*mass)/(distance*distance);
    
    force.mult(strength);
    
    return force;
  }
}