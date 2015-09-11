class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float topSpeed;
  
  Mover() {
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    topSpeed = 4;
  }
  
    
  void update(){
    
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = new PVector(mouse.x - location.x, mouse.y - location.y);
    
    dir.normalize();
    
    dir.mult(0.5);
    
    acceleration = dir;
    
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
  }
  
  void display() {
    
    float angle = atan(velocity.y / velocity.x);
    stroke(0);
    fill(175);
    pushMatrix();
    rectMode(CENTER);
    translate(location.x, location.y);
    rotate(angle);
    rect(0,0,30,10);
    popMatrix();   
    
    
  }
  
  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }
    
    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }    
  }  
    
}