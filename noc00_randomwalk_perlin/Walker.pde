import java.util.Random;

class Walker {
  float x,y;
  float tx,ty;
  
  Walker() {
    tx = 0;
    ty = 10000;
  }
   
  void step() {
    // noise() is perlin noise
    x = map(noise(tx),0,1,0,width);
    y = map(noise(ty),0,1,0,height);
  
    tx += 0.01;
    ty += 0.01;    
  }
  
  void display() {
    stroke(0);    
    fill(255,40);
    ellipse(x,y,10,10);
  }
}