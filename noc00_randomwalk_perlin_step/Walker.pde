import java.util.Random;

class Walker {
  float x,y;
  float tx,ty;
  
  Walker() {
    x = width/2;
    y = height/2;
    
    tx = 0;
    ty = 10000;
  }
   
  void step() {
    // noise() is perlin noise
    float stepSize = 3;
    float sx = map(noise(tx),0,1,-stepSize,stepSize);
    float sy = map(noise(ty),0,1,-stepSize,stepSize);
    
    x += sx;
    y += sy;
  
    tx += 0.01;
    ty += 0.01;    
  }
  
  void display() {
    stroke(0);    
    fill(255,40);
    ellipse(x,y,10,10);
  }
}