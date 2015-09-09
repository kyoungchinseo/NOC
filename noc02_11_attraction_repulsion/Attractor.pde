class Attractor {
  float mass;  
  PVector location;
  float G;
  
  Attractor(float x, float y) {
    location = new PVector(x, y);
    mass = 20;
    G = 1.0;
  }
  
  void display() {
    stroke(0);
    fill(200,0,0,200);
    ellipse(location.x, location.y, mass, mass);
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