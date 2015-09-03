import java.util.Random;

class Walker {
  int x;
  int y;
  
  Walker() {
    x = width / 2;
    y = height/ 2;       
  }
   
  float exponentialDistribution() {
    float rd = 10;    
    while (true) {
      int r1 = int(random(0,10));
      float prob = (1/rd)*exp(-r1/rd);
      float r2 = random(0,1);
      if (r2 < prob) {
        return r1;
      }
    }
  }
  
  void step() { 
        
    float stepSize = exponentialDistribution();
    
    float stepX = random(-stepSize, stepSize);
    float stepY = random(-stepSize, stepSize);
        
    x += stepX;
    y += stepY;
  }
  
  void display() {
    stroke(0);    
    fill(255,40);
    ellipse(x,y,10,10);
  }
}