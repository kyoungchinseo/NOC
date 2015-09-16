class Confetti extends Particle {
  
  
  
  Confetti(PVector l) {
    super(l); 
    
  }
  
  void display() {
    float theta = map(location.x, 0, width, 0 ,TWO_PI);
    
    rectMode(CENTER);
    fill(0,lifespan);
    stroke(0, lifespan);
    
    pushMatrix();
    translate(location.x,location.y);
    rotate(theta);
    rect(0,0,8,8);
    popMatrix();
  }
}