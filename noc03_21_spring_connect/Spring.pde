class Spring {
  
  PVector anchor;
  
  float len;
  
  float k = 0.1;
  
  Spring(float x, float y, float l) {
    anchor = new PVector(x,y);
    len = l;
  }
  
  void connect(Ball b) {
    PVector force = PVector.sub(b.location, anchor);
    
    float d = force.mag();
    
    float stretch = d - len;
    
    force.normalize();
    force.mult(-1 * k * stretch);
    
    b.applyForce(force);
  }
  
  void display() {
    fill(100);
    rectMode(CENTER);
    rect(anchor.x,anchor.y, 10,10);    
  }
  
  void displayLine(Ball b) {
    stroke(155);
    fill(100);
    line(b.location.x, b.location.y, anchor.x, anchor.y);
  }
  
}