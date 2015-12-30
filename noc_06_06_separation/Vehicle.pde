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

  // Separation  
  void separate (ArrayList<Vehicle> vehicles) {
    float desiredseparation = r*2;
    PVector sum = new PVector();
    int count = 0;    
    for (Vehicle other : vehicles) {
      float d = PVector.dist(location, other.location);
      if ((d > 0) && (d < desiredseparation)) {
        PVector diff = PVector.sub(location, other.location);
        diff.normalize();
        diff.div(d);        // Weight by distance
        sum.add(diff);
        count++;            // Keep track of how many
      }
    }
    
    if (count > 0) {
      sum.setMag(maxspeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxforce);
      applyForce(steer);
    }
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