import java.util.Random;

class Walker {
  PVector pos;
  PVector t;  
  
  Walker() {
    pos = new PVector(width/2,height/2);
    t = new PVector(0,10000);    
  }
   
  void step() {
    // noise() is perlin noise
    pos.x = map(noise(t.x),0,1,0,width);
    pos.y = map(noise(t.y),0,1,0,height);
  
    t.x += 0.01;
    t.y += 0.01;    
  }
  
  void display() {
    stroke(0);    
    fill(255,40);
    ellipse(pos.x,pos.y,10,10);
  }
}