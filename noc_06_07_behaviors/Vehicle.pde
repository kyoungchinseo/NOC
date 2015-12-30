class Vehicle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;    
  float maxspeed;    

    
  Vehicle(float x, float y) {
    location = new PVector(x, y);
    r = 12;
    maxspeed = 3;
    maxforce = 0.2;
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
  }

  void applyForce(PVector force) {    
    acceleration.add(force);
  }
  
  void applyBehaviors(ArrayList<Vehicle> vehicles) {
    PVector seperate = separate(vehicles);
    PVector seek = seek(new PVector(mouseX, mouseY));
    seperate.mult(1.5);
    seek.mult(0.5);
    applyForce(seperate);
    applyForce(seek);
  }

  // Separation  
  PVector separate (ArrayList<Vehicle> vehicles) {
    float desiredseparation = r*2;
    PVector sum = new PVector();
    int count = 0;    
    for (Vehicle other : vehicles) {
      float d = PVector.dist(location, other.location);      
      if ((d > 0) && (d < desiredseparation)) {        
        PVector diff = PVector.sub(location, other.location);
        diff.normalize();
        diff.div(d);        
        sum.add(diff);
        count++;            
      }
    }
    
    if (count > 0) {
      sum.div(count);      
      sum.normalize();
      sum.mult(maxspeed);      
      sum.sub(velocity);
      sum.limit(maxforce);
    }
    return sum;
  }
  
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target,location);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    
    return steer;
  }



  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    fill(175);
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    ellipse(0, 0, r, r);
    popMatrix();
  }

  void borders() {
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;
  }
}