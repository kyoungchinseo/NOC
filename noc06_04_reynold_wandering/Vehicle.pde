class Vehicle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float r;
  float maxforce;
  float maxspeed;

  float radius; // radius wandering
  float futureLocation;
  PVector wanderingTarget;
  
  Vehicle(float x, float y) {
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);
    location = new PVector(x,y);
    
    wanderingTarget = new PVector(0,0);
    
    r = 3.0;   
    
    radius = r*10;
    futureLocation = r*15;
    
    maxspeed = 4;
    maxforce = 0.1;
  }
  
  
  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void seek(PVector target) {
    //PVector desired = PVector.sub(target, location);
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(maxspeed);
    //PVector steer = PVector.sub(desired, velocity);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    applyForce(steer);
  } 
  
  void escape(PVector target) {
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(-1);
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, velocity);
    
    steer.limit(maxforce);
    applyForce(steer);
  }
  
  void arrive(PVector target) {    
    PVector desired = PVector.sub(target,location);
    
    float d = desired.mag();
    desired.normalize();
    
    if (d < 100) {
      float m = map(d,0,100,0,maxspeed);
      desired.mult(m);
    } else {
      desired.mult(maxspeed);
    }
    
    PVector steer = PVector.sub(desired, velocity);
    
    steer.limit(maxforce);
    applyForce(steer);   
    
  }
  
  void wander() {  
    
    if (checkBoundary() == false) {
    
      float angle = random(0,PI*2); // random angle    
      float theta = velocity.heading();
      
      wanderingTarget.x = radius * sin(angle) / 2;
      wanderingTarget.y = radius * cos(angle) / 2;
      
      PVector futureLoc = new PVector((futureLocation + r) * cos(theta), (futureLocation + r)* sin(theta));
         
      PVector target = new PVector(futureLoc.x + wanderingTarget.x+location.x, futureLoc.y + wanderingTarget.y+location.y);
               
      PVector desired = PVector.sub(target,location);
      
      float d = desired.mag();
      desired.normalize();
      
      desired.mult(maxspeed);
      
      PVector steer = PVector.sub(desired, velocity);
      
      steer.limit(maxforce);
      applyForce(steer);        
      
    }
  }
  
  boolean checkBoundary() {
    if (location.x  < 25) {
      PVector desired = new PVector(maxspeed, velocity.y);      
      PVector steer = PVector.sub(desired, velocity);
      steer.limit(maxforce);
      applyForce(steer);
      return true;
    } else if (location.x  > width - 25) {
      PVector desired = new PVector(-maxspeed, velocity.y);      
      PVector steer = PVector.sub(desired, velocity);
      steer.limit(maxforce);
      applyForce(steer);
      return true;
    } else if (location.y  < 25) {
      PVector desired = new PVector(velocity.x,maxspeed);      
      PVector steer = PVector.sub(desired, velocity);
      steer.limit(maxforce);
      applyForce(steer);
      return true;
    } else if (location.y  > height - 25) {
      PVector desired = new PVector(velocity.x,-maxspeed);      
      PVector steer = PVector.sub(desired, velocity);
      steer.limit(maxforce);
      applyForce(steer);
      return true;
    }
    return false;
  }
  
    
  
  void display() {
    float theta = velocity.heading() + PI/2;
    
    fill(175);
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    beginShape();
    vertex(0,-r*2);
    vertex(-r,r*2);
    vertex(r,r*2);
    endShape(CLOSE);    
    beginShape();
    vertex(0,-r*2);
    vertex(0,-futureLocation);
    endShape(CLOSE);    
    noFill();
    ellipse(0,-futureLocation,radius,radius);
    fill(0);
    ellipse(wanderingTarget.x,-futureLocation+wanderingTarget.y,r,r);   
    popMatrix();
    pushMatrix();    
    popMatrix();
  }
  
}