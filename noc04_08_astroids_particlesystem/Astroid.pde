class Astroid {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topSpeed = 4;
  float rotAngle  = 0;
  
  Astroid() {
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    acceleration =new PVector(0,0);    
  }
  
  
  void update() {
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    
    acceleration.mult(0.0);
  }
  
  void applyForce() {
    PVector force = new PVector(0,0);
    force.x = cos((rotAngle-90)*PI/180);
    force.y = sin((rotAngle-90)*PI/180);    
    force.normalize();
    force.mult(0.5);    
    
    acceleration.add(force);
  }
  
  void addLeftTurn() {
    rotAngle -= 5;
  }
  
  void addRightTurn() {
    rotAngle += 5;
  }
  
  void addLeftAccel() {
    
    float angle = 30;
    float x = cos(angle*PI/180)*acceleration.x + sin(angle*PI/180)*acceleration.y;
    float y = -sin(angle*PI/180)*acceleration.x + cos(angle*PI/180)*acceleration.y;
    acceleration.x = x;
    acceleration.y = y;
  }
  
  void addRightAccel() {
    float angle = -30;
    float x = cos(angle*PI/180)*acceleration.x + sin(angle*PI/180)*acceleration.y;
    float y = -sin(angle*PI/180)*acceleration.x + cos(angle*PI/180)*acceleration.y;
    acceleration.x = x;
    acceleration.y = y;
  }
  
  void display() {
    stroke(0);
    fill(175);
    pushMatrix();    
    translate(location.x+0, location.y+35);
    rotate(rotAngle*PI/180);
    translate(0,-35);
    triangle(0,0,-20,35,20,35);
    rectMode(CORNER);
    rect(-15,35,5,5);
    rect(10,35,5,5);
    
    popMatrix();
  }
    
  void checkEdges() {
    if (location.x > width) {
      velocity.x *= -1.0;
      //acceleration.x *= -1.0;
    } else if (location.x < 0) {
      velocity.x *= -1.0;
      //acceleration.x *= -1.0;
    }
    
    if (location.y > height) {
      velocity.y *= -1.0;
      //acceleration.y *= -1.0;
      
    } else if (location.y < 0) {
      velocity.y *= -1.0;
      //acceleration.y *= -1.0;
    }    
  }
  
}