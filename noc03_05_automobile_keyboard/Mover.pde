class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
   
  float topSpeed;
  
  Mover() {
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    acceleration =new PVector(0,-1.0);    
    
    topSpeed = 4;
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
    
  void update(){
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
      velocity.x *= -1.0;
      acceleration.x *= -1.0;
    } else if (location.x < 0) {
      velocity.x *= -1.0;
      acceleration.x *= -1.0;
    }
    
    if (location.y > height) {
      velocity.y *= -1.0;
      acceleration.y *= -1.0;
      
    } else if (location.y < 0) {
      velocity.y *= -1.0;
      acceleration.y *= -1.0;
    }    
  }
    
}