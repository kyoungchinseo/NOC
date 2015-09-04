class Mover 
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float tx;
  float ty;
  
  Mover() {
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(-0.001, 0.01);
    tx = 0.1;
    ty = 10000;
  }
  
  void update(){
    tx += 0.001;
    ty += 0.001;
    
    // random acceleartion
    //acceleration = PVector.random2D();
    acceleration.x = map(noise(tx),0,1,-0.5,0.5)*10.0;
    acceleration.y = map(noise(ty),0,1,-0.5,0.5)*10.0;
    
    velocity.add(acceleration);
    velocity.limit(10);
    location.add(velocity);    
  }
  
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, 16,16);
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
  
  void increase() {
     velocity.mult(noise(tx)*10.0);
     //acceleration.mult(10.0);
     //acceleration.mult(random(10));
  }
  
  void decrease() {
    //acceleration.mult(1.0/random(10));
    velocity.mult(1.0/random(10));
  }
    
}