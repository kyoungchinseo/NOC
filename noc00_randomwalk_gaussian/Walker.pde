import java.util.Random;

class Walker {
  int x;
  int y;
  float sdX;
  float sdY;
  Random generator;
  
  Walker() {
    x = width / 2;
    y = height/ 2;
    
    sdX = 6;
    sdY = 4;
     
    generator = new Random();
  }
  
  void step() {
  
    float xProb = (float)generator.nextGaussian();
    float yProb = (float)generator.nextGaussian();
    
    float stepX = xProb * sdX;
    float stepY = yProb * sdY;
    
    x += stepX;
    y += stepY;
  }
  
  void display() {
    stroke(0);
    //point(x,y);
    fill(255,40);
    ellipse(x,y,10,10);
  }
}